package tw.designerfamily.news.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import freemarker.core.ParseException;
import freemarker.template.MalformedTemplateNameException;
import freemarker.template.TemplateException;
import freemarker.template.TemplateNotFoundException;
import tw.designerfamily.member.model.Member;
import tw.designerfamily.news.model.CouponBean;
import tw.designerfamily.news.model.CouponList;
import tw.designerfamily.news.model.CouponListService;
import tw.designerfamily.news.model.CouponService;

@Controller
@RequestMapping("/coupon")
public class CouponController {

	@Autowired
	private CouponService cService;
	
	@Autowired
	private CouponListService cLService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	freemarker.template.Configuration freemarkerConfig;
	
		// 顯示全部優惠券(首頁)
		@RequestMapping
		public String showCouponIndex(Model m) {
			List<CouponBean> list = cService.selectAll();
			m.addAttribute("list", list);
			return "news/CouponIndex";
		}
		
		
		// 已發放優惠券清單
		@GetMapping(path = "/couponList")		
		public String showCouponList(Model m) {
			List<CouponList> couponlist = cLService.selectAll();
			m.addAttribute("couponlist", couponlist);
			return "news/CouponList";
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
				@RequestParam("couponAmount") int amount,
				@RequestParam("couponContent") String content,
				@RequestParam("couponState") String state
				) {

			CouponBean bean = new CouponBean(id,name,code,stdate,expdate,amount,content,state);
			bean.setCouponRemaining(amount);
			cService.insert(bean);
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
		
		
		//修改
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
				@RequestParam("couponAmount") int amount,
				@RequestParam("couponRemaining") int remaining,
				@RequestParam("couponContent") String content,
				@RequestParam("couponState") String state
				) {

			cService.update(new CouponBean(couponid,newsid,name,code,stdate,expdate,amount,remaining,content,state));
			return "redirect:/coupon";
		}
		
		
		// 轉址
		@GetMapping(path = "/couponadd")
		public String processActionAdd() {
			return "news/CouponAddForm";
		}
		
		
		
		
		//Email發券
		@PostMapping(path = "/couponmail/{id}")
		public String mailcoupon(HttpServletRequest request,@PathVariable("id") int id,@RequestParam("remain")int remain) throws MessagingException, TemplateNotFoundException, MalformedTemplateNameException, ParseException, IOException, TemplateException {
			
			Member m=(Member)request.getSession().getAttribute("login");
			String email = m.getEmail();
			String account = m.getAccount();//couponlist 代入帳號
			
			CouponBean bean = cService.selectById(id);
			bean.setCouponRemaining(remain);
			String code = bean.getCouponCode();
			
			CouponList couponList = new CouponList(account,"可使用");
			couponList.setCouponbean(bean);
			cService.insert(bean);
			cLService.insert(couponList);
			
						
			// 發件人的暱稱
			String name = MimeUtility.encodeText("Mega");
			// 發件人是誰
			InternetAddress from = new InternetAddress(name + "<ispanmega2022@gmail.com>");
			MimeMessage mimeMessage = mailSender.createMimeMessage();
			MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
			mimeMessageHelper.setFrom(from);
			mimeMessageHelper.setTo(email);
			mimeMessageHelper.setSubject("Mega|優惠券");

			HashMap<String, Object> params = new HashMap<>();
			// 使用模板生成html郵件內容
			params.put("account", account);
			params.put("couponCode", code);
			String result = FreeMarkerTemplateUtils
					.processTemplateIntoString(freemarkerConfig.getTemplate("couponcode.html"), params);
			mimeMessageHelper.setText(result, true);
			mailSender.send(mimeMessage);
			
			return "redirect:/campaign";
			
		}
		
}
