package tw.designerfamily.news.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.designerfamily.news.model.NewsBean;
import tw.designerfamily.news.model.NewsService;
//使用者端
@Controller
@RequestMapping("/campaign")
public class CampaignIndexController {

	@Autowired
	private NewsService nService;
	
	
	//首頁
	@GetMapping("/index")
	public String userquery(Model m) {
		List<NewsBean> list = nService.selectAll();	//全部活動
		List<NewsBean> type1 = nService.findType1();//強檔活動
		List<NewsBean> type2 = nService.findType2();//優惠活動
		List<NewsBean> type3 = nService.findType3();//期間限定
		List<NewsBean> type4 = nService.findType4();//實體活動
		m.addAttribute("newsinfo", list);	//分頁
		m.addAttribute("type1", type1);
		m.addAttribute("type2", type2);
		m.addAttribute("type3", type3);
		m.addAttribute("type4", type4);
		
		return "news/UserNewsIndex";
	}

	
	// 詳細-用id取值
	//@GetMapping("/{id}")
	@GetMapping("/newsdetail/{id}")
	public String userDetail(@PathVariable("id") int id, Model m) {
		NewsBean n = nService.selectById(id);
		m.addAttribute("n", n);
		
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
	


//	@GetMapping("newsinfo2")
//	public String usermain(Model m) {
//		List<NewsBean> list = nService.selectAll();
//		m.addAttribute("newsinfo1", list);
//		m.addAttribute("newsinfo2", list);
//		return "news/UserNewsIndex";
//	}
	

//	//帶出主頁所有商品
//	@GetMapping("/newsinfo")
//	public String processShow(Model m,HttpServletRequest request) {
//		List<NewsBean> list = nService.selectAll();	
//		m.addAttribute("list", list);
//				
//		return "news/UserNewsIndex";		
//	}
	
	
}
