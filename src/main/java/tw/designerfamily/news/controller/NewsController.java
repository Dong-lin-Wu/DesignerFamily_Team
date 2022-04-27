package tw.designerfamily.news.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.designerfamily.news.model.NewsBean;
import tw.designerfamily.news.model.NewsService;

@Controller
@RequestMapping("/news")
public class NewsController {

	@Autowired
	private NewsService nService;

	// 顯示全部(首頁)
	@RequestMapping
	public String showNewsIndex(Model m) {
		List<NewsBean> list = nService.selectAll();
		m.addAttribute("list", list);
		return "news/NewsIndex";
	}

	// 關鍵字查詢 
//	@GetMapping("/newslist/{id}")
//	@ResponseBody
//	public List<NewsBean> searchNewsByKey(@PathVariable("keyword") String key) {
//		List<NewsBean> search = nService.searchByKey(key);
//		List<NewsBean> list = nService.selectAll();
//		if (key == null || key.equals("")) {
//			return list;
//		}
//		return search;
//	}

	// 刪除
	@DeleteMapping("/newslist/{id}")
	@ResponseBody
	public void deleteNews(@PathVariable("id") int id, Model m) {
		nService.deleteById(id);
	}

	// 新增
	@PostMapping(path = "/newsAdd")
	public String addNews(@RequestParam("newsType") String type, @RequestParam("newsTitle") String title,
			@RequestParam(value = "newsSubtitle", required = false) String subtitle,
			@RequestParam("newsContent") String content,
			@RequestParam(value = "news_PicBase64", required = false) String picbase64,
			@RequestParam(value = "newsNote", required = false) String note) {

		nService.insert(new NewsBean(type, title, subtitle, content, picbase64, note));
		System.out.println("");
		return "redirect:/news";
	}

	// 詳細-用id取值
	@GetMapping("/detail/{id}")
	public String processDetail(@PathVariable("id") int id, Model m) {
		NewsBean n = nService.selectById(id);
		m.addAttribute("n", n);
		return "news/Newsdetail";
	}

	// 修改(待修改)
	@GetMapping(path = "/newsupdate/{id}")
	public String processActionUpdate(@PathVariable("id") int id, Model m) {
		NewsBean news = nService.selectById(id);
		m.addAttribute("newsList", news);
		return "news/NewsUpdateForm";
	}

	@PostMapping("/updateSucess")
	public String updateNews(@RequestParam("newsId") int id, @RequestParam("newsType") String type,
			@RequestParam("newsTitle") String title,
			@RequestParam(value = "newsSubtitle", required = false) String subtitle,
			@RequestParam("newsContent") String content,
			@RequestParam(value = "news_PicBase64", required = false) String picbase64,
			@RequestParam(value = "newsNote", required = false) String note) {

		nService.update(new NewsBean(id, type, title, subtitle, content, picbase64, note));
		return "redirect:/news";
	}

	// 轉址
	@GetMapping(path = "/newsadd")
	public String processActionAdd() {
		return "news/NewsAddForm";
	}

	// User端
	@GetMapping("newsinfo")
	public String usermain(Model m) {
		List<NewsBean> list = nService.selectAll();
		m.addAttribute("newsinfo1", list);
		m.addAttribute("newsinfo2", list);
		return "news/UserNewsIndex";
	}
	
	
	@GetMapping("newsinfo/query")
	public String userquery(@RequestParam("keyword") String keyword,Model m) {
		List<NewsBean> list1 = nService.selectAll();
		List<NewsBean> list2 = nService.searchByKey(keyword);
		m.addAttribute("newsinfo1", list1);
		m.addAttribute("newsinfo2", list2);	
		return "news/UserNewsIndex";
	}
	
	
	// 詳細-用id取值
	@GetMapping("/newsdetail/{id}")
	public String userDetail(@PathVariable("id") int id, Model m) {
		NewsBean n = nService.selectById(id);
		m.addAttribute("n", n);
		return "news/UserNewsdetail";
	}

}
