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

import tw.designerfamily.news.model.CouponBean;
import tw.designerfamily.news.model.CouponService;

@Controller
@RequestMapping("/coupon")
public class CouponController {

	@Autowired
	private CouponService cService;
	
	// 顯示全部(首頁)
		@RequestMapping
		public String showCouponIndex(Model m) {
			List<CouponBean> list = cService.selectAll();
			m.addAttribute("list", list);
			return "news/CouponIndex";
		}
	
		//刪除
		@DeleteMapping("/couponlist/{id}")
		@ResponseBody
		public void deleteCoupon(@PathVariable("id") int id, Model m) {
			cService.deleteById(id);
		}
		
		// 新增 
		@PostMapping(path = "/couponAdd")
		public String addCoupon(@RequestParam("newsId") int id,
				@RequestParam("couponName") String name,
				@RequestParam("couponCode") String code,
				@RequestParam("couponStDate") String stdate,
				@RequestParam("couponExpDate") String expdate,
				@RequestParam("couponContent") String content,
				@RequestParam("couponState") String state
//				@RequestParam("createAccount") String account
				) {

			cService.insert(new CouponBean(id,name,code,stdate,expdate,content,state));
			System.out.println("");
			return "redirect:/coupon";
		}
		
		// 詳細-用id取值
		@GetMapping("/detail/{id}")
		public String processDetail(@PathVariable("id") int id, Model m) {
			CouponBean c = cService.selectById(id);
			m.addAttribute("c", c);
			return "news/Coupondetail";
		}
		
		//修改(代改)
		@GetMapping(path = "/couponupdate/{id}")
		public String processActionUpdate(@PathVariable("id") int id, Model m) {
			CouponBean coupon = cService.selectById(id);
			m.addAttribute("couponList", coupon);
			return "news/CouponUpdateForm";
		}

		@PostMapping("/updateSucess")
		public String updateCoupon(
				@RequestParam("couponId") int couponid,
				@RequestParam("newsId") int newsid,
				@RequestParam("couponName") String name,
				@RequestParam("couponCode") String code,
				@RequestParam("couponStDate") String stdate,
				@RequestParam("couponExpDate") String expdate,
				@RequestParam("couponContent") String content,
				@RequestParam("couponState") String state
//				@RequestParam("createAccount") String account
				) {

			cService.update(new CouponBean(couponid,newsid,name,code,stdate,expdate,content,state));
			return "redirect:/coupon";
		}
		
		// 轉址
		@GetMapping(path = "/couponadd")
		public String processActionAdd() {
			return "news/CouponAddForm";
		}
		
		//發券
		
		
}
