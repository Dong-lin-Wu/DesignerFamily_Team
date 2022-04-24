package tw.designerfamily.order.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.designerfamily.order.model.CartItem;
import tw.designerfamily.order.model.Order;
import tw.designerfamily.order.model.OrderService;
import tw.designerfamily.product.model.ProductBean;
import tw.designerfamily.product.model.ProductService;

@Controller
@RequestMapping("/order")
@SessionAttributes(names ={"carts","cartcount"})
public class OrderController {
	
	@Autowired
	private OrderService oserviece;
	
	@Autowired
	private ProductService pservice;
	
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
			@RequestParam("orderQty")int qty,@RequestParam("orderDate")String date,@RequestParam("orderPrice")int price,@RequestParam("orderOwner")String owner){
		Order od = oserviece.findById(id);
		od.setOrderDate(date);
		od.setOrderNumber(no);
		od.setOrderOwner(owner);
		od.setOrderPrice(price);
		od.setOrderQty(qty);
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
	
	@PutMapping("/cart/{id}")
	@ResponseBody
	public String processCart(@PathVariable("id")int id,Model m,@RequestParam("qty")int qty,HttpServletRequest request) {
		
		String count = request.getSession().getAttribute("cartcount").toString();
		Integer add =Integer.parseInt(count)+1;
		String cartqty= Integer.toString(add);
		m.addAttribute("cartcount", cartqty);
		
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
	

}
