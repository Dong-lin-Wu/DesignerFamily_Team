package tw.designerfamily.raise.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import tw.designerfamily.member.model.Member;
import tw.designerfamily.raise.model.RaiseBean;
import tw.designerfamily.raise.model.RaisePlanBean;
import tw.designerfamily.raise.model.RaiseRepository;
import tw.designerfamily.raise.model.RaiseService;

@Controller
//@RequestMapping("raise")
@SessionAttributes({ "raiseList", "login", "raiseBean", "donext", "raiseNo" }) // sessionscope
public class RaiseController {

	@Autowired
	private RaiseService rService;

	// 日期格式轉換
	@InitBinder
	public void init(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	// Raise首頁:raiseindex.controller
	@GetMapping("/raiseindex.controller")
	public String processAction0(Model model) {
		redirectToRaiseIndex(model);
		return "/raise/raise";
	}
	
	@GetMapping("/raiseindex") 
	public String processAction1(Model model) {
		return "/raise/raise";
	}
	
	@GetMapping("/raiseadd.checklogin")
	public String processAction2(Model model) {
		return "/raise/raiseAdd";
	}
	
	@GetMapping("/raiseupdate")
	public String processAction3(Model model) {
		return "/raise/raiseUpdate";
	}
	
	// 導回Raise首頁時查詢全部放入session
	public void redirectToRaiseIndex(Model model) {
		List<RaiseBean> rlist = rService.selectAll();
		model.addAttribute("raiseList", rlist);
	}

	// 於首頁按下CRUD導去相關頁面
	@PostMapping("/raiseindexdonext.controller")
	public String processToNext(@RequestParam("donext") String donext, @RequestParam("rID") int id, Model model) {
		if (donext == null) {
			redirectToRaiseIndex(model);
			return "redirect:raiseindex";
		} else if (donext.equals("RaiseAdd")) {
			return "redirect:raiseadd.checklogin";
		} else if (donext.equals("RaiseReview")) {
			model.addAttribute("donext", "RaiseReview");
			RaiseBean raiseBean = rService.selectById(id);
			model.addAttribute("raiseBean", raiseBean);
			return "redirect:raiseupdate";
		} else if (donext.equals("RaiseUpdate")) {
			model.addAttribute("donext", "RaiseUpdate");
			RaiseBean raiseBean = rService.selectById(id);
			model.addAttribute("raiseBean", raiseBean);
			return "redirect:raiseupdate";
		} else if (donext.equals("RaiseDelete")) {
			rService.deleteById(id);
			redirectToRaiseIndex(model);
			return "redirect:raiseindex";
		}
		redirectToRaiseIndex(model);
		return "redirect:raiseindex";
	}

//	// 於新增頁面按下送出並導回首頁
//	@PostMapping("/raiseinsert.controller")
//	public String processInsert(@RequestParam("Raise_Title") String pTitle, @RequestParam("Raise_Brief") String pBrief,
//			@RequestParam("Raise_Category") String pCategory, @RequestParam("Raise_PicName") String pPicName,
//			@RequestParam("Raise_PicBase64") String pPicBase64, @RequestParam("Raise_Target") int pTarget,
//			@RequestParam("Raise_SDate") String pSDate, @RequestParam("Raise_ExpDate") String pExpDate,
//			@RequestParam("Raise_Describe") String pDescribe,
//			// 回饋項目
//			@RequestParam("RaisePlan_Amount_1") int pAmount1, @RequestParam("RaisePlan_PicName_1") String pPicName1,
//			@RequestParam("RaisePlan_PicBase64_1") String pPicBase64_1,
//			@RequestParam("RaisePlan_ADate_1") String pADate1, @RequestParam("RaisePlan_Describe_1") String pDescribe1,
//			@RequestParam("RaisePlan_Amount_2") int pAmount2, @RequestParam("RaisePlan_PicName_2") String pPicName2,
//			@RequestParam("RaisePlan_PicBase64_2") String pPicBase64_2,
//			@RequestParam("RaisePlan_ADate_2") String pADate2, @RequestParam("RaisePlan_Describe_2") String pDescribe2,
//			Model model) {
//
//		Member m = (Member) model.getAttribute("login");
//		String pName;
//		if (m != null) {
//			pName = m.getAccount();
//		} else {
//			pName = "Donglin";
//		}
//
//		RaiseBean rBean = new RaiseBean(pName, pTitle, pBrief, pCategory, pPicName, pPicBase64, pTarget, pSDate,
//				pExpDate, pDescribe);
//		RaisePlanBean rPBean1 = new RaisePlanBean(pPicName1, pPicBase64_1, pAmount1, pADate1, pDescribe1);
//		rPBean1.setRaiseBean(rBean);
//		RaisePlanBean rPBean2 = new RaisePlanBean(pPicName2, pPicBase64_2, pAmount2, pADate2, pDescribe2);
//		rPBean2.setRaiseBean(rBean);
//
//		Set<RaisePlanBean> rpBeans = new LinkedHashSet<RaisePlanBean>();
//		rpBeans.add(rPBean1);
//		rpBeans.add(rPBean2);
//
//		rBean.setRaisePlanBeanSet(rpBeans);
//
//		rService.insert(rBean);
//		redirectToRaiseIndex(model);
//		return "redirect:raiseindex";
//	}

	// 於修改頁面按下送出並導回首頁
	@PostMapping("/raiseupdate.controller")
	public String processUpdate(@RequestParam("rID") int pId, @RequestParam("Raise_Title") String pTitle,
			@RequestParam("Raise_Brief") String pBrief, @RequestParam("Raise_Category") String pCategory,
			@RequestParam("Raise_PicName_default") String pPicName, @RequestParam("Raise_PicBase64") String pPicBase64,
			@RequestParam("Raise_Target") int pTarget, @RequestParam("Raise_SDate") String pSDate,
			@RequestParam("Raise_ExpDate") String pExpDate, @RequestParam("Raise_Describe") String pDescribe,
			// 回饋項目
			@RequestParam("rpId1") int pId1, @RequestParam("RaisePlan_Amount_1") int pAmount1,
			@RequestParam("RaisePlan_PicName_default_1") String pPicName1,
			@RequestParam("RaisePlan_PicBase64_1") String pPicBase64_1,
			@RequestParam("RaisePlan_ADate_1") String pADate1, @RequestParam("RaisePlan_Describe_1") String pDescribe1,
			@RequestParam("rpId2") int pId2, @RequestParam("RaisePlan_Amount_2") int pAmount2,
			@RequestParam("RaisePlan_PicName_default_2") String pPicName2,
			@RequestParam("RaisePlan_PicBase64_2") String pPicBase64_2,
			@RequestParam("RaisePlan_ADate_2") String pADate2, @RequestParam("RaisePlan_Describe_2") String pDescribe2,
			Model model) {

		Member m = (Member) model.getAttribute("login");
		String pName;
		if (m != null) {
			pName = m.getAccount();
		} else {
			pName = "Donglin";
		}
		RaiseBean oBean = rService.selectById(pId);
		String pStatus = oBean.getRaiseStatus();

		RaiseBean rBean = new RaiseBean(pId, pName, pTitle, pBrief, pCategory, pPicName, pPicBase64, pTarget, pSDate,
				pExpDate, pDescribe, pStatus);

		RaisePlanBean rPBean1 = new RaisePlanBean(pId1, pPicName1, pPicBase64_1, pAmount1, pADate1, pDescribe1);
		rPBean1.setRaiseBean(rBean);
		RaisePlanBean rPBean2 = new RaisePlanBean(pId2, pPicName2, pPicBase64_2, pAmount2, pADate2, pDescribe2);
		rPBean2.setRaiseBean(rBean);

		Set<RaisePlanBean> rpBeans = new LinkedHashSet<RaisePlanBean>();
		rpBeans.add(rPBean1);
		rpBeans.add(rPBean2);

		rBean.setRaisePlanBeanSet(rpBeans);
		rService.update(rBean);
		redirectToRaiseIndex(model);
		return "redirect:raiseindex";
	}

	// 於審核頁面按下送出並導回首頁
	@PostMapping("/raisereview.controller")
	public String processReview(@RequestParam("rComment") String rComment, @RequestParam("rID") int id, Model model) {
		rService.updateStatus(id, rComment);
		redirectToRaiseIndex(model);
		return "redirect:raiseindex";
	}
	
	//於首頁依照關鍵字搜尋
	@PostMapping("/raiseindexsearch.controller")
	public String processSearch(@RequestParam("keyword") String key, Model model) {
	    List<RaiseBean> rlist = rService.searchByKey(key);
	    model.addAttribute("raiseList", rlist);
	    return "redirect:raiseindex";
	}
	
	//------------------------------------------------------------------------------------------------------------------------
	//使用者端:
	
	// Front_Raise首頁:front_raiseindex.controller
	@GetMapping("/front_raiseindex.controller")
	public String processAction00() {
		return "/raise/front_raise";
	}
	
	@GetMapping("/front_raisedetail/{raiseNo}")
	public String processAction01(@PathVariable("raiseNo") int raiseNo,Model m ) {
		m.addAttribute("raiseNo", raiseNo);
		return "/raise/front_raiseDetail";
	}
	
	@GetMapping("/front_myraise")
	public String processAction02() {
		return "/raise/front_myRaise";
	}
	
	//查詢全部
	@GetMapping("/raise")
	@ResponseBody
	public List<RaiseBean> processSelectAll0() {
		List<RaiseBean> rlist = rService.selectAll();
		return rlist;
	}
	
	//查詢單筆
	@GetMapping("/raise/{raiseNo}")
	@ResponseBody
	public RaiseBean processSelectById0(@PathVariable("raiseNo") int raiseNo) {
		RaiseBean rBean = rService.selectById(raiseNo);
		return rBean;
	}
	
	//查詢某會員的for使用者端
	@GetMapping("/raisebyname.checklogin")
	@ResponseBody
	public List<RaiseBean> processSelectByName0(@RequestParam("raiseName") String name) {
		List<RaiseBean> rlist = rService.selectByName(name);
		return rlist;
	}
	
	//查詢審核通過的for使用者端首頁
	@GetMapping("/raisebystatus")
	@ResponseBody
	public List<RaiseBean> processSelectByStatus0() {
		List<RaiseBean> rlist = rService.selectByStatus("Approved");
		return rlist;
	}
	
	//新增
	@PostMapping("/raise")
	@ResponseBody
	public RaiseBean processInsert0(@RequestBody RaiseBean rBean,Model model) throws JSONException, JsonMappingException, JsonProcessingException {
		Member m = (Member) model.getAttribute("login");
		String pName;
		if (m != null) {
			pName = m.getAccount();
		} else {
			pName = "Donglin";
		}
		rBean.setRaiseName(pName);
		((RaisePlanBean)rBean.getRaisePlanBeanSet().toArray()[0]).setRaiseBean(rBean);
		((RaisePlanBean)rBean.getRaisePlanBeanSet().toArray()[1]).setRaiseBean(rBean);

		rService.insert(rBean);
		redirectToRaiseIndex(model);
		return rBean;
	}
}