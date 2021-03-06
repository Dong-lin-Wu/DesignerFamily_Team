package tw.designerfamily.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.designerfamily.forum.model.ForumService;
import tw.designerfamily.member.model.Member;
import tw.designerfamily.member.model.MemberService;
import tw.designerfamily.news.model.CouponList;
import tw.designerfamily.news.model.CouponListService;
import tw.designerfamily.news.model.NewsBean;
import tw.designerfamily.news.model.NewsService;
import tw.designerfamily.order.model.CartItem;
import tw.designerfamily.order.model.Order;
import tw.designerfamily.order.model.OrderService;
import tw.designerfamily.product.model.ProductBean;
import tw.designerfamily.product.model.ProductService;
import tw.designerfamily.raise.model.RaiseService;

@Controller
@SessionAttributes(names = {"detail","cartcount","pdetail","shiporder","coupon"})
public class IndexController {
	@Autowired
	private OrderService oService;
	
	@Autowired
	private ProductService pService;
	
	@Autowired
	private RaiseService rService;
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private NewsService nservice;
	
	@Autowired
	private ForumService fservice;
	
	@Autowired
	private CouponListService cservice;
	
	//帶出主頁所有商品
	@GetMapping("/index")
	public String processShow(Model m,HttpServletRequest request) {
		if( request.getSession().getAttribute("login")==null) {
			
		}else{
			
			Member m1 =(Member) request.getSession().getAttribute("login");
			List<Order> orderdetail = oService.findByOrderOwner(m1.getAccount());
			List<ProductBean> productdetail = pService.findDesigner(m1.getAccount());
			List<Order> shiporder = oService.selectAll();
			List<CouponList> mycoupon = cservice.findybyowner(m1.getAccount());
			m.addAttribute("coupon", mycoupon);
			m.addAttribute("shiporder", shiporder);
			m.addAttribute("detail", orderdetail);
			m.addAttribute("pdetail", productdetail);
			
		}
		
		if (request.getSession().getAttribute("cartcount")==null) {
			m.addAttribute("cartcount", 0);
		}
		
		List<NewsBean> news = nservice.selectAll();
		List<ProductBean> list = pService.selectAll();
		List<ProductBean> cate1 = pService.findcate1();//配件飾品
		List<ProductBean> cate2 = pService.findcate2();//包包提袋
		List<ProductBean> cate3 = pService.findcate3();//居家生活
		List<ProductBean> cate4 = pService.findcate4();//創意科技
		List<ProductBean> cate5 = pService.findcate5();//文具
		List<ProductBean> cate6 = pService.findcate6();//衣著
		List<ProductBean> cate7 = pService.findcate7();//其他
		m.addAttribute("list", list);
		m.addAttribute("cate1", cate1);
		m.addAttribute("cate2", cate2);
		m.addAttribute("cate3", cate3);
		m.addAttribute("cate4", cate4);
		m.addAttribute("cate5", cate5);
		m.addAttribute("cate6", cate6);
		m.addAttribute("cate7", cate7);
		m.addAttribute("news", news);
		return "index";
		
	}
	
	
}
