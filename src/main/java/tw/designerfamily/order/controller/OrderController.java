package tw.designerfamily.order.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;
import tw.designerfamily.order.model.CartItem;
import tw.designerfamily.order.model.Order;
import tw.designerfamily.order.model.OrderService;
import tw.designerfamily.product.model.ProductBean;
import tw.designerfamily.product.model.ProductService;

@Controller
@RequestMapping("/order")
@SessionAttributes(names ={"carts","info"})
public class OrderController {
	
	@Autowired
	private OrderService oserviece;
	
	@Autowired
	private ProductService pservice;
	
	@Autowired
	private CartItem car;
	
	@GetMapping
	public String processMain(Model m) {
		List<Order> list = oserviece.selectAll();
		m.addAttribute("orderlist", list);
		return "order/Orderlist";
	}
	
	@DeleteMapping("/orderlist/{id}")
	@ResponseBody
	public void processDelete(@PathVariable("id") int id) {
		oserviece.deleteById(id);
	}
	
	@GetMapping("/orderlist/{id}")
	@ResponseBody
	public Order searchById(@PathVariable("id")int id){
		Order select = oserviece.findById(id);
		return select;	
	}
	
	@PutMapping("/orderlist/{id}")
	@ResponseBody
	public List<Order> processUpdate(@PathVariable("id")int id,@RequestParam("orderStatus") String status,@RequestParam("orderNumber")String no,
			@RequestParam("orderDate")String date,@RequestParam("orderPrice")int price,@RequestParam("orderOwner")String owner){
		Order od = oserviece.findById(id);
		od.setOrderDate(date);
		od.setOrderNumber(no);
		od.setOrderOwner(owner);
		od.setOrderPrice(price);
		od.setOrderStatus(status);
		oserviece.update(od);
		List<Order> list = oserviece.selectAll();
		return list;
	}
	
	@GetMapping("/detail/{id}")
	public String processDetail(@PathVariable("id")int id,Model m){
		List<Order> list = oserviece.findyByOrderNo(id);
		m.addAttribute("list", list);
		return"order/OrderDetail";
	}
	
	@PostMapping("/mycart")
	@ResponseBody
	public String processCart(@RequestParam("id")int id,Model m,@RequestParam("qty")int qty,HttpServletRequest request) {
		ProductBean goods = pservice.selectById(id);
		CartItem od = new CartItem(goods, qty, goods.getCommPrice()*qty);
		if(request.getSession().getAttribute("carts")==null) {//判斷是否有carts這個session,若為空值 new一個Arraylist放入CartItem物件
			List<CartItem> list = new ArrayList<CartItem>();
			list.add(od);
			m.addAttribute("carts", list);
		}else {//若carts session不為 null
			@SuppressWarnings("unchecked")
			List<CartItem> list = (List<CartItem>)request.getSession().getAttribute("carts");//list抓取carts中的物件
			boolean found = false;
			Iterator<CartItem> it = list.iterator();//歷遍整個CartItem
			while(!found && it.hasNext()) {
				CartItem aod = it.next();
				if(aod.getProduct().getCommNo()==od.getProduct().getCommNo()) {
					aod.setQty(aod.getQty()+od.getQty());
					aod.setTotalprice(aod.getTotalprice()+od.getQty()*od.getProduct().getCommPrice());
					found = true;
				}
			}
			if(!found) {
				list.add(od);
			}
			}
			
	return "order/Cart";	
	}
	
	//轉址
	@GetMapping("/mycart")
	public String processCart() {
		return "order/Cart";
	}
	
	@DeleteMapping("/mycart/{id}")
	@ResponseBody
	public void processAction8(@PathVariable("id") int id,HttpServletRequest request,Model m) {
		@SuppressWarnings("unchecked")
		List<CartItem> list = (List<CartItem>)request.getSession().getAttribute("carts");
		Iterator<CartItem> it = list.iterator();
		while(it.hasNext()) {
			CartItem aod = it.next();
			if(aod.getProduct().getCommNo()==id) {
				it.remove();
			}
		}
		
	}
	
	@PutMapping("/mycart/{id}")
	@ResponseBody
	public String processCartChange(@PathVariable("id")int id,Model m,@RequestParam("qty")int qty,HttpServletRequest request) {
		ProductBean goods = pservice.selectById(id);
		@SuppressWarnings("unchecked")
		List<CartItem> list = (List<CartItem>)request.getSession().getAttribute("carts");
		Iterator<CartItem> it = list.iterator();
		while(it.hasNext()) {
			CartItem aod = it.next();
			if(aod.getProduct().getCommNo()==id) {
				aod.setQty(qty);
				aod.setTotalprice(goods.getCommPrice()*qty);
				m.addAttribute("carts", list);
		}
	}	
		return "order/Cart";	
	}
	
	@PostMapping("/checkout")
	public String processcheckout(HttpServletRequest request,@RequestParam("sum")String sum,Model m) {
		if(request.getSession().getAttribute("carts")==null) {
			return"redirect:/index";
		}else if(request.getSession().getAttribute("login")==null){
			
				return "redirect:/login";
				
			}else{
				m.addAttribute("sum", sum);
				return"/order/Checkout";
		}
	}
	
	@GetMapping("/info")
	public String processInfo(HttpServletRequest request) {
		return "/order/BuyerInfo";
	}
	
	@PostMapping("/info2")
	public String processInfo2(@RequestParam("buyername")String name,@RequestParam("buyerphone")String phone,@RequestParam("buyeraddress")String address,Model m,HttpServletRequest request) {
		Order info = new Order(address, phone, name);
		m.addAttribute("info", info);		
		return"/order/InfoSuccess";
	}
	
	@PostMapping("/pay")
	public String processAction10(HttpServletRequest request, HttpSession session,SessionStatus sessionStatus,@RequestParam("name")String name,@RequestParam("phone") String phone,@RequestParam("address") String address,@RequestParam("total")int total,Model m) {
		
		UUID uuid = UUID.randomUUID();
		String key=uuid.toString().replaceAll("-", "").substring(0,20);
		
			@SuppressWarnings("unchecked")
			List<CartItem> list = (List<CartItem>)request.getSession().getAttribute("carts");
			
			Iterator<CartItem> it = list.iterator();
			while(it.hasNext()) {
				CartItem aod = it.next();
				int commNo = aod.getProduct().getCommNo();
				int qty = aod.getQty();
				ProductBean product = pservice.selectById(commNo);
				int orgp = product.getCommQuantity();
				int sum= orgp-qty;
				product.setCommQuantity(sum);
				pservice.update(product);
		}	
			
			LinkedHashSet<CartItem> items = new LinkedHashSet<CartItem>(list);
			Timestamp time =new Timestamp(Instant.now().toEpochMilli());//使用java產生時間並轉成字串insert至db
			String orderdate=time.toString().replaceAll("-", "/").substring(0, 19);
			
			
			Order order = new Order(key, name, orderdate, total, "未付款", address, phone, name, items);
			for(CartItem item:list) {
				item.setOrder(order);
			}
		    oserviece.insert(order);
			session.removeAttribute("carts");
			session.removeAttribute("info");
			sessionStatus.setComplete();//清除session,讓購物車清空,當完成訂單時
			
			AioCheckOutOneTime obj = new AioCheckOutOneTime();
			String totalprice = Integer.toString(total);
			obj.setMerchantTradeNo(key);
			obj.setMerchantTradeDate(orderdate);
			obj.setTotalAmount(totalprice);
			obj.setTradeDesc("Mega");
			String temp="";
			for(CartItem item: list) {
				String commTitle = item.getProduct().getCommTitle();
				temp+=commTitle+"#";
			}
			obj.setItemName(temp);
			obj.setReturnURL("http://211.23.128.214:5000");
			obj.setOrderResultURL("http://localhost:8082/order/PaySuccess");//使用者付費完希望他看到的畫面
			obj.setNeedExtraPaidInfo("N");
			obj.setRedeem("Y");
			AllInOne all = new AllInOne("");
			String form = all.aioCheckOut(obj, null);
			session.setAttribute("form", form);
			return "/order/ECpage";
		}
			
	
	@GetMapping("/myecpage")
	public String easyin() {
		return "/order/ECpage";
	}
	
	@PostMapping("/PaySuccess")
	public String TestEC(HttpSession session,HttpServletRequest request,@RequestParam("RtnCode")String RtnCode,@RequestParam("MerchantTradeNo") String No) throws IOException{
		if(RtnCode.equals("1")) {
			Order id = oserviece.findByOrderNum(No);
			id.setOrderStatus("已付款");
			oserviece.update(id);

			return"/order/successpay";

		}else {

			return"/order/failpay";
		}

	}

	
}

