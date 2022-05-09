package tw.designerfamily.news.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.designerfamily.member.model.Member;
import tw.designerfamily.news.model.CouponBean;
import tw.designerfamily.news.model.CouponList;
import tw.designerfamily.news.model.CouponListService;
import tw.designerfamily.news.model.CouponService;
import tw.designerfamily.news.model.NewsBean;
import tw.designerfamily.news.model.NewsService;

//使用者端
@Controller
@RequestMapping("/campaign")
@SessionAttributes("coupon")
public class CampaignIndexController {

	@Autowired
	private NewsService nService;
	@Autowired
	private CouponService cService;
	@Autowired
	private CouponListService cLService;
	
	//mycoupon即時更新
	@RequestMapping
	public String processMainAction(HttpServletRequest request, Model m) {
		Member m2 = (Member) request.getSession().getAttribute("login");
		List<CouponList> coupon = cLService.findybyowner(m2.getAccount());		
		m.addAttribute("coupon", coupon);
		return "news/mycoupon";
	}
	
	
	
	//首頁
	@GetMapping("/index")
	public String userquery(Model m) {
		List<NewsBean> list = nService.selectAll();	//全部活動
		List<NewsBean> type1 = nService.findType1();//強檔活動
		List<NewsBean> type2 = nService.findType2();//優惠活動
		List<NewsBean> type3 = nService.findType3();//期間限定
		m.addAttribute("newsinfo", list);	//分頁
		m.addAttribute("type1", type1);
		m.addAttribute("type2", type2);
		m.addAttribute("type3", type3);
		
		return "news/UserNewsIndex";
	}

	
	// 詳細-用id取值
	//@GetMapping("/{id}")
	@GetMapping("/newsdetail/{id}")
	public String userDetail(@PathVariable("id") int id, Model m) {
		NewsBean n = nService.selectById(id);
		CouponBean c = cService.selectByNewsId(id);		
		System.out.println(c);
		m.addAttribute("n", n);
		m.addAttribute("c", c);		
		return "news/UserNewsdetail";
	}
	
	//輪播
	@GetMapping("newsmain/query")
	public String userquery(@RequestParam("keyword") String keyword,Model m) {
		List<NewsBean> list1 = nService.selectAll();
		List<NewsBean> list2 = nService.searchByKey(keyword);
		m.addAttribute("newsinfo1", list1);//輪播
		m.addAttribute("newsinfo2", list2);	//搜尋
		
		return "news/UserNewsIndex";
	}
	

}
