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
//<!doctype html>
//<html class="no-js" lang="zxx">
//<head>
//  <meta charset="utf-8">
//  <meta http-equiv="x-ua-compatible" content="ie=edge">
//  <title>RaiseDetail</title>
//  <meta name="description" content="">
//  <meta name="viewport" content="width=device-width, initial-scale=1">
//  <link rel="manifest" href="site.webmanifest">
//  <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
//
//  <!-- CSS here -->
//  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
//  <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
//  <link rel="stylesheet" href="assets/css/slicknav.css">
//  <link rel="stylesheet" href="assets/css/flaticon.css">
//  <link rel="stylesheet" href="assets/css/progressbar_barfiller.css">
//  <link rel="stylesheet" href="assets/css/lightslider.min.css">
//  <link rel="stylesheet" href="assets/css/price_rangs.css">
//  <link rel="stylesheet" href="assets/css/gijgo.css">
//  <link rel="stylesheet" href="assets/css/animate.min.css">
//  <link rel="stylesheet" href="assets/css/animated-headline.css">
//  <link rel="stylesheet" href="assets/css/magnific-popup.css">
//  <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
//  <link rel="stylesheet" href="assets/css/themify-icons.css">
//  <link rel="stylesheet" href="assets/css/slick.css">
//  <link rel="stylesheet" href="assets/css/nice-select.css">
//  <link rel="stylesheet" href="assets/css/style.css">
//  
//</head>
//<body class="full-wrapper">
//  <!-- ? Preloader Start -->
//  <div id="preloader-active">
//    <div class="preloader d-flex align-items-center justify-content-center">
//      <div class="preloader-inner position-relative">
//        <div class="preloader-circle"></div>
//        <div class="preloader-img pere-text">
//          <img src="assets/img/logo/loder.png" alt="">
//        </div>
//      </div>
//    </div>
//  </div>
//  <!-- Preloader Start-->
//  <header>
//    <!-- Header Start -->
//    <div class="header-area">
//      <div class="main-header header-sticky">
//        <div class="container-fluid">
//          <div class="row menu-wrapper align-items-center justify-content-between">
//            <div class="header-left d-flex align-items-center">
//              <!-- Logo -->
//              <div class="logo">
//                <a href="index.html"><img src="assets/img/logo/logo.png" alt=""></a>
//              </div>
//              <!-- Logo-2 -->
//              <div class="logo2">
//                <a href="index.html"><img src="assets/img/logo/logo2.png" alt=""></a>
//              </div>
//              <!-- Main-menu -->
//              <div class="main-menu  d-none d-lg-block">
//                <nav>
//                  <ul id="navigation">
//                    <li><a href="index.html">Home</a></li> 
//                    <li><a href="product.html">Product</a></li>
//                    <li><a href="about.html">About</a></li>
//                    <li><a href="#">Page</a>
//                      <ul class="submenu">
//                        <li><a href="login.html">Login</a></li>
//                        <li><a href="card.html">Card</a></li>
//                        <li><a href="categories.html">Categories</a></li>
//                        <li><a href="checkout.html">Checkout</a></li>
//                        <li><a href="product_details.html">Product Details</a></li>
//                      </ul>
//                    </li>
//                    <li><a href="blog.html">Blog</a>
//                      <ul class="submenu">
//                        <li><a href="blog.html">Blog</a></li>
//                        <li><a href="blog_details.html">Blog Details</a></li>
//                        <li><a href="elements.html">Elements</a></li>
//                      </ul>
//                    </li>
//                    <li><a href="contact.html">Contact</a></li>
//                  </ul>
//                </nav>
//              </div>   
//            </div>
//            <div class="header-right1 d-flex align-items-center">
//              <div class="search">
//                <ul class="d-flex align-items-center">
//                  <li>
//                    <!-- Search Box -->
//                    <form action="#" class="form-box f-right ">
//                      <input type="text" name="Search" placeholder="Search products">
//                      <div class="search-icon">
//                        <i class="ti-search"></i>
//                      </div>
//                    </form>
//                  </li>
//                  <li>
//                    <a href="login.html" class="account-btn" target="_blank">My Account</a>
//                  </li>
//                  <li>
//                    <div class="card-stor">
//                      <img src="assets/img/icon/card.svg" alt="">
//                      <span>0</span>
//                    </div>
//                  </li>
//                </ul>
//              </div>
//            </div>
//            <!-- Mobile Menu -->
//            <div class="col-12">
//              <div class="mobile_menu d-block d-lg-none"></div>
//            </div>
//          </div>
//        </div>
//      </div>
//    </div>
//    <!-- Header End -->
//  </header>
//  <!-- header end -->
//  <main>
//    <!--? slider Area Start-->
//    <div class="slider-area ">
//      <div class="slider-active">
//        <div class="single-slider hero-overly2  slider-height2 d-flex align-items-center slider-bg2">
//          <div class="container">
//            <div class="row">
//              <div class="col-xl-6 col-lg-8 col-md-8">
//                <div class="hero__caption hero__caption2">
//                  <h1 data-animation="fadeInUp" data-delay=".4s" >Product details</h1>
//                  <nav aria-label="breadcrumb">
//                    <ol class="breadcrumb">
//                      <li class="breadcrumb-item"><a href="index.html">Home</a></li>
//                      <li class="breadcrumb-item"><a href="#">Product details</a></li> 
//                    </ol>
//                  </nav>
//                </div>
//              </div>
//            </div>
//          </div>
//        </div>
//      </div>
//    </div>
//    <!-- slider Area End-->
//    <!--? Single Product Area Start-->
//    <div class="product_image_area section-padding40">
//      <div class="container">
//        <div class="row s_product_inner">
//          <div class="col-lg-5">
//            <div class="product_slider_img">
//              <div id="vertical">
//                <div data-thumb="assets/img/gallery/product-details1.png">
//                  <img src="assets/img/gallery/product-details1.png" / class="w-100">
//                </div>
//                <div data-thumb="assets/img/gallery/product-details2.png">
//                  <img src="assets/img/gallery/product-details2.png"/ class="w-100">
//                </div>
//                <div data-thumb="assets/img/gallery/product-details3.png">
//                  <img src="assets/img/gallery/product-details3.png" / class="w-100">
//                </div>
//                <div data-thumb="assets/img/gallery/product-details4.png">
//                  <img src="assets/img/gallery/product-details4.png" / class="w-100">
//                </div>
//              </div>
//            </div>
//          </div>
//          <div class="col-lg-5 offset-lg-1">
//            <div class="s_product_text">
//              <h3>Faded SkyBlu Denim Jeans</h3>
//              <h2>$149.99</h2>
//              <ul class="list">
//                <li>
//                  <a class="active" href="#">
//                    <span>Category</span> : Household</a>
//                  </li>
//                  <li>
//                    <a href="#"> <span>Availibility</span> : In Stock</a>
//                  </li>
//                </ul>
//                <p>
//                  Mill Oil is an innovative oil filled radiator with the most modern technology. If you are looking for something that can make your interior look awesome, and at the same time.
//                </p>
//                <div class="card_area">
//                  <div class="product_count d-inline-block">
//                    <span class="inumber-decrement"> <i class="ti-minus"></i></span>
//                    <input class="input-number" type="text" value="1" min="0" max="10">
//                    <span class="number-increment"> <i class="ti-plus"></i></span>
//                  </div>
//                  <div class="add_to_cart">
//                    <a href="#" class="btn">add to cart</a>
//                    <a href="#" class="like_us"> <i class="ti-heart"></i> </a>
//                  </div>
//                  <div class="social_icon">
//                    <a href="#" class="fb"><i class="ti-facebook"></i></a>
//                    <a href="#" class="tw"><i class="ti-twitter-alt"></i></a>
//                    <a href="#" class="li"><i class="ti-linkedin"></i></a>
//                  </div>
//                </div>
//              </div>
//            </div>
//          </div>
//        </div>
//      </div>
//      <!-- Single Product Area End-->
//      <!--? Product Description Area Start-->
//      <section class="product_description_area">
//        <div class="container">
//          <ul class="nav nav-tabs" id="myTab" role="tablist">
//            <li class="nav-item">
//              <a class="nav-link" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home"
//              aria-selected="true">Description</a>
//            </li>
//            <li class="nav-item">
//              <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
//              aria-selected="false">Specification</a>
//            </li>
//            <li class="nav-item">
//              <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
//              aria-selected="false">Comments</a>
//            </li>
//            <li class="nav-item">
//              <a class="nav-link active" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review"
//              aria-selected="false">Reviews</a>
//            </li>
//          </ul>
//          <div class="tab-content" id="myTabContent">
//            <div class="tab-pane fade" id="home" role="tabpanel" aria-labelledby="home-tab">
//              <p>
//                Beryl Cook is one of Britain’s most talented and amusing artists
//                .Beryl’s pictures feature women of all shapes and sizes enjoying
//                themselves .Born between the two world wars, Beryl Cook eventually
//                left Kendrick School in Reading at the age of 15, where she went
//                to secretarial school and then into an insurance office. After
//                moving to London and then Hampton, she eventually married her next
//                door neighbour from Reading, John Cook. He was an officer in the
//                Merchant Navy and after he left the sea in 1956, they bought a pub
//                for a year before John took a job in Southern Rhodesia with a
//                motor company. Beryl bought their young son a box of watercolours,
//                and when showing him how to use it, she decided that she herself
//                quite enjoyed painting. John subsequently bought her a child’s
//                painting set for her birthday and it was with this that she
//                produced her first significant work, a half-length portrait of a
//                dark-skinned lady with a vacant expression and large drooping
//                breasts. It was aptly named ‘Hangover’ by Beryl’s husband and
//              </p>
//              <p>
//                It is often frustrating to attempt to plan meals that are designed
//                for one. Despite this fact, we are seeing more and more recipe
//                books and Internet websites that are dedicated to the act of
//                cooking for one. Divorce and the death of spouses or grown
//                children leaving for college are all reasons that someone
//                accustomed to cooking for more than one would suddenly need to
//                learn how to adjust all the cooking practices utilized before into
//                a streamlined plan of cooking that is more efficient for one
//                person creating less
//              </p>
//            </div>
//            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
//              <div class="table-responsive">
//                <table class="table">
//                  <tbody>
//                    <tr>
//                      <td>
//                        <h5>Width</h5>
//                      </td>
//                      <td>
//                        <h5>128mm</h5>
//                      </td>
//                    </tr>
//                    <tr>
//                      <td>
//                        <h5>Height</h5>
//                      </td>
//                      <td>
//                        <h5>508mm</h5>
//                      </td>
//                    </tr>
//                    <tr>
//                      <td>
//                        <h5>Depth</h5>
//                      </td>
//                      <td>
//                        <h5>85mm</h5>
//                      </td>
//                    </tr>
//                    <tr>
//                      <td>
//                        <h5>Weight</h5>
//                      </td>
//                      <td>
//                        <h5>52gm</h5>
//                      </td>
//                    </tr>
//                    <tr>
//                      <td>
//                        <h5>Quality checking</h5>
//                      </td>
//                      <td>
//                        <h5>yes</h5>
//                      </td>
//                    </tr>
//                    <tr>
//                      <td>
//                        <h5>Freshness Duration</h5>
//                      </td>
//                      <td>
//                        <h5>03days</h5>
//                      </td>
//                    </tr>
//                    <tr>
//                      <td>
//                        <h5>When packeting</h5>
//                      </td>
//                      <td>
//                        <h5>Without touch of hand</h5>
//                      </td>
//                    </tr>
//                    <tr>
//                      <td>
//                        <h5>Each Box contains</h5>
//                      </td>
//                      <td>
//                        <h5>60pcs</h5>
//                      </td>
//                    </tr>
//                  </tbody>
//                </table>
//              </div>
//            </div>
//            <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
//              <div class="row">
//                <div class="col-lg-6">
//                  <div class="comment_list">
//                    <div class="review_item">
//                      <div class="media">
//                        <div class="d-flex">
//                          <img src="assets/img/gallery/review-1.png" alt="" />
//                        </div>
//                        <div class="media-body">
//                          <h4>Blake Ruiz</h4>
//                          <h5>12th Feb, 2017 at 05:56 pm</h5>
//                          <a class="reply_btn" href="#">Reply</a>
//                        </div>
//                      </div>
//                      <p>
//                        Lorem ipsum dolor sit amet, consectetur adipisicing elit,
//                        sed do eiusmod tempor incididunt ut labore et dolore magna
//                        aliqua. Ut enim ad minim veniam, quis nostrud exercitation
//                        ullamco laboris nisi ut aliquip ex ea commodo
//                      </p>
//                    </div>
//                    <div class="review_item reply">
//                      <div class="media">
//                        <div class="d-flex">
//                          <img src="assets/img/gallery/review-2.png" alt="" />
//                        </div>
//                        <div class="media-body">
//                          <h4>Blake Ruiz</h4>
//                          <h5>12th Feb, 2017 at 05:56 pm</h5>
//                          <a class="reply_btn" href="#">Reply</a>
//                        </div>
//                      </div>
//                      <p>
//                        Lorem ipsum dolor sit amet, consectetur adipisicing elit,
//                        sed do eiusmod tempor incididunt ut labore et dolore magna
//                        aliqua. Ut enim ad minim veniam, quis nostrud exercitation
//                        ullamco laboris nisi ut aliquip ex ea commodo
//                      </p>
//                    </div>
//                    <div class="review_item">
//                      <div class="media">
//                        <div class="d-flex">
//                          <img src="assets/img/gallery/review-3.png" alt="" />
//                        </div>
//                        <div class="media-body">
//                          <h4>Blake Ruiz</h4>
//                          <h5>12th Feb, 2017 at 05:56 pm</h5>
//                          <a class="reply_btn" href="#">Reply</a>
//                        </div>
//                      </div>
//                      <p>
//                        Lorem ipsum dolor sit amet, consectetur adipisicing elit,
//                        sed do eiusmod tempor incididunt ut labore et dolore magna
//                        aliqua. Ut enim ad minim veniam, quis nostrud exercitation
//                        ullamco laboris nisi ut aliquip ex ea commodo
//                      </p>
//                    </div>
//                  </div>
//                </div>
//                <div class="col-lg-6">
//                  <div class="review_box">
//                    <h4>Post a comment</h4>
//                    <form class="row contact_form" action="contact_process.php" method="post" id="contactForm"
//                    novalidate="novalidate">
//                    <div class="col-md-12">
//                      <div class="form-group">
//                        <input type="text" class="form-control" id="name" name="name" placeholder="Your Full name" />
//                      </div>
//                    </div>
//                    <div class="col-md-12">
//                      <div class="form-group">
//                        <input type="email" class="form-control" id="email" name="email" placeholder="Email Address" />
//                      </div>
//                    </div>
//                    <div class="col-md-12">
//                      <div class="form-group">
//                        <input type="text" class="form-control" id="number" name="number" placeholder="Phone Number" />
//                      </div>
//                    </div>
//                    <div class="col-md-12">
//                      <div class="form-group">
//                        <textarea class="form-control" name="message" id="message" rows="1"
//                        placeholder="Message"></textarea>
//                      </div>
//                    </div>
//                    <div class="col-md-12 text-right">
//                      <button type="submit" value="submit" class="btn">
//                        Submit Now
//                      </button>
//                    </div>
//                  </form>
//                </div>
//              </div>
//            </div>
//          </div>
//          <div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
//            <div class="row">
//              <div class="col-lg-6">
//                <div class="row total_rate">
//                  <div class="col-6">
//                    <div class="box_total">
//                      <h5>Overall</h5>
//                      <h4>4.0</h4>
//                      <h6>(03 Reviews)</h6>
//                    </div>
//                  </div>
//                  <div class="col-6">
//                    <div class="rating_list">
//                      <h3>Based on 3 Reviews</h3>
//                      <ul class="list">
//                        <li>
//                          <a href="#">5 Star
//                            <i class="fa fa-star"></i>
//                            <i class="fa fa-star"></i>
//                            <i class="fa fa-star"></i>
//                            <i class="fa fa-star"></i>
//                            <i class="fa fa-star"></i> 01</a>
//                          </li>
//                          <li>
//                            <a href="#">4 Star
//                              <i class="fa fa-star"></i>
//                              <i class="fa fa-star"></i>
//                              <i class="fa fa-star"></i>
//                              <i class="fa fa-star"></i>
//                              <i class="fa fa-star"></i> 01</a>
//                            </li>
//                            <li>
//                              <a href="#">3 Star
//                                <i class="fa fa-star"></i>
//                                <i class="fa fa-star"></i>
//                                <i class="fa fa-star"></i>
//                                <i class="fa fa-star"></i>
//                                <i class="fa fa-star"></i> 01</a>
//                              </li>
//                              <li>
//                                <a href="#">2 Star
//                                  <i class="fa fa-star"></i>
//                                  <i class="fa fa-star"></i>
//                                  <i class="fa fa-star"></i>
//                                  <i class="fa fa-star"></i>
//                                  <i class="fa fa-star"></i> 01</a>
//                                </li>
//                                <li>
//                                  <a href="#">1 Star
//                                    <i class="fa fa-star"></i>
//                                    <i class="fa fa-star"></i>
//                                    <i class="fa fa-star"></i>
//                                    <i class="fa fa-star"></i>
//                                    <i class="fa fa-star"></i> 01</a>
//                                  </li>
//                                </ul>
//                              </div>
//                            </div>
//                          </div>
//                          <div class="review_list">
//                            <div class="review_item">
//                              <div class="media">
//                                <div class="d-flex">
//                                  <img src="assets/img/gallery/review-1.png" alt="" />
//                                </div>
//                                <div class="media-body">
//                                  <h4>Blake Ruiz</h4>
//                                  <i class="fa fa-star"></i>
//                                  <i class="fa fa-star"></i>
//                                  <i class="fa fa-star"></i>
//                                  <i class="fa fa-star"></i>
//                                  <i class="fa fa-star"></i>
//                                </div>
//                              </div>
//                              <p>
//                                Lorem ipsum dolor sit amet, consectetur adipisicing elit,
//                                sed do eiusmod tempor incididunt ut labore et dolore magna
//                                aliqua. Ut enim ad minim veniam, quis nostrud exercitation
//                                ullamco laboris nisi ut aliquip ex ea commodo
//                              </p>
//                            </div>
//                            <div class="review_item">
//                              <div class="media">
//                                <div class="d-flex">
//                                  <img src="assets/img/gallery/review-2.png" alt="" />
//                                </div>
//                                <div class="media-body">
//                                  <h4>Blake Ruiz</h4>
//                                  <i class="fa fa-star"></i>
//                                  <i class="fa fa-star"></i>
//                                  <i class="fa fa-star"></i>
//                                  <i class="fa fa-star"></i>
//                                  <i class="fa fa-star"></i>
//                                </div>
//                              </div>
//                              <p>
//                                Lorem ipsum dolor sit amet, consectetur adipisicing elit,
//                                sed do eiusmod tempor incididunt ut labore et dolore magna
//                                aliqua. Ut enim ad minim veniam, quis nostrud exercitation
//                                ullamco laboris nisi ut aliquip ex ea commodo
//                              </p>
//                            </div>
//                            <div class="review_item">
//                              <div class="media">
//                                <div class="d-flex">
//                                  <img src="assets/img/gallery/review-3.png" alt="" />
//                                </div>
//                                <div class="media-body">
//                                  <h4>Blake Ruiz</h4>
//                                  <i class="fa fa-star"></i>
//                                  <i class="fa fa-star"></i>
//                                  <i class="fa fa-star"></i>
//                                  <i class="fa fa-star"></i>
//                                  <i class="fa fa-star"></i>
//                                </div>
//                              </div>
//                              <p>
//                                Lorem ipsum dolor sit amet, consectetur adipisicing elit,
//                                sed do eiusmod tempor incididunt ut labore et dolore magna
//                                aliqua. Ut enim ad minim veniam, quis nostrud exercitation
//                                ullamco laboris nisi ut aliquip ex ea commodo
//                              </p>
//                            </div>
//                          </div>
//                        </div>
//                        <div class="col-lg-6">
//                          <div class="review_box">
//                            <h4>Add a Review</h4>
//                            <p>Your Rating:</p>
//                            <ul class="list">
//                              <li>
//                                <a href="#">
//                                  <i class="fa fa-star"></i>
//                                </a>
//                              </li>
//                              <li>
//                                <a href="#">
//                                  <i class="fa fa-star"></i>
//                                </a>
//                              </li>
//                              <li>
//                                <a href="#">
//                                  <i class="fa fa-star"></i>
//                                </a>
//                              </li>
//                              <li>
//                                <a href="#">
//                                  <i class="fa fa-star"></i>
//                                </a>
//                              </li>
//                              <li>
//                                <a href="#">
//                                  <i class="fa fa-star"></i>
//                                </a>
//                              </li>
//                            </ul>
//                            <p>Outstanding</p>
//                            <form class="row contact_form" action="contact_process.php" method="post" novalidate="novalidate">
//                              <div class="col-md-12">
//                                <div class="form-group">
//                                  <input type="text" class="form-control" name="name" placeholder="Your Full name" />
//                                </div>
//                              </div>
//                              <div class="col-md-12">
//                                <div class="form-group">
//                                  <input type="email" class="form-control" name="email" placeholder="Email Address" />
//                                </div>
//                              </div>
//                              <div class="col-md-12">
//                                <div class="form-group">
//                                  <input type="text" class="form-control" name="number" placeholder="Phone Number" />
//                                </div>
//                              </div>
//                              <div class="col-md-12">
//                                <div class="form-group">
//                                  <textarea class="form-control" name="message" rows="1" placeholder="Review"></textarea>
//                                </div>
//                              </div>
//                              <div class="col-md-12 text-right">
//                                <button type="submit" value="submit" class="btn">
//                                  Submit Now
//                                </button>
//                              </div>
//                            </form>
//                          </div>
//                        </div>
//                      </div>
//                    </div>
//                  </div>
//                </div>
//              </section>
//              <!-- Product Description Area End-->
//              <!--? Services Area Start -->
//              <div class="categories-area section-padding40 gray-bg">
//                <div class="container">
//                  <div class="row">
//                    <div class="col-lg-3 col-md-6 col-sm-6">
//                      <div class="single-cat mb-50 wow fadeInUp" data-wow-duration="1s" data-wow-delay=".2s">
//                        <div class="cat-icon">
//                          <img src="assets/img/icon/services1.svg" alt="">
//                        </div>
//                        <div class="cat-cap">
//                          <h5>Fast & Free Delivery</h5>
//                          <p>Free delivery on all orders</p>
//                        </div>
//                      </div>
//                    </div>
//                    <div class="col-lg-3 col-md-6 col-sm-6">
//                      <div class="single-cat mb-50 wow fadeInUp" data-wow-duration="1s" data-wow-delay=".2s">
//                        <div class="cat-icon">
//                          <img src="assets/img/icon/services2.svg" alt="">
//                        </div>
//                        <div class="cat-cap">
//                          <h5>Secure Payment</h5>
//                          <p>Free delivery on all orders</p>
//                        </div>
//                      </div>
//                    </div>
//                    <div class="col-lg-3 col-md-6 col-sm-6">
//                      <div class="single-cat mb-50 wow fadeInUp" data-wow-duration="1s" data-wow-delay=".4s">
//                        <div class="cat-icon">
//                          <img src="assets/img/icon/services3.svg" alt="">
//                        </div>
//                        <div class="cat-cap">
//                          <h5>Money Back Guarantee</h5>
//                          <p>Free delivery on all orders</p>
//                        </div>
//                      </div>
//                    </div>
//                    <div class="col-lg-3 col-md-6 col-sm-6">
//                      <div class="single-cat mb-50 wow fadeInUp" data-wow-duration="1s" data-wow-delay=".5s">
//                        <div class="cat-icon">
//                          <img src="assets/img/icon/services4.svg" alt="">
//                        </div>
//                        <div class="cat-cap">
//                          <h5>Online Support</h5>
//                          <p>Free delivery on all orders</p>
//                        </div>
//                      </div>
//                    </div>
//                  </div>
//                </div>
//              </div>
//              <!--? Services Area End -->
//            </main>
//            <footer>
//              <div class="footer-wrapper">
//               <!-- Footer Start-->
//               <div class="footer-area footer-padding">
//                 <div class="container ">
//                   <div class="row justify-content-between">
//                     <div class="col-xl-4 col-lg-3 col-md-8 col-sm-8">
//                       <div class="single-footer-caption mb-50">
//                         <div class="single-footer-caption mb-30">
//                           <!-- logo -->
//                           <div class="footer-logo mb-35">
//                             <a href="index.html"><img src="assets/img/logo/logo2_footer.png" alt=""></a>
//                           </div>
//                           <div class="footer-tittle">
//                             <div class="footer-pera">
//                               <p>Suspendisse varius enim in eros elementum tristique. Duis cursus, mi quis viverra ornare, eros dolor interdum nulla.</p>
//                             </div>
//                           </div>
//                           <!-- social -->
//                           <div class="footer-social">
//                             <a href="#"><i class="fab fa-twitter"></i></a>
//                             <a href="https://bit.ly/sai4ull"><i class="fab fa-facebook-f"></i></a>
//                             <a href="#"><i class="fab fa-pinterest-p"></i></a>
//                           </div>
//                         </div>
//                       </div>
//                     </div>
//                     <div class="col-xl-2 col-lg-2 col-md-4 col-sm-4">
//                       <div class="single-footer-caption mb-50">
//                         <div class="footer-tittle">
//                           <h4>Quick links</h4>
//                           <ul>
//                             <li><a href="#">Image Licensin</a></li>
//                             <li><a href="#">Style Guide</a></li>
//                             <li><a href="#">Privacy Policy</a></li>
//                           </ul>
//                         </div>
//                       </div>
//                     </div>
//                     <div class="col-xl-2 col-lg-2 col-md-4 col-sm-4">
//                       <div class="single-footer-caption mb-50">
//                         <div class="footer-tittle">
//                           <h4>Shop Category</h4>
//                           <ul>
//                             <li><a href="#">Image Licensin</a></li>
//                             <li><a href="#">Style Guide</a></li>
//                             <li><a href="#">Privacy Policy</a></li>
//                           </ul>
//                         </div>
//                       </div>
//                     </div>
//                     <div class="col-xl-2 col-lg-2 col-md-4 col-sm-4">
//                       <div class="single-footer-caption mb-50">
//                         <div class="footer-tittle">
//                           <h4>Pertners</h4>
//                           <ul>
//                             <li><a href="#">Image Licensin</a></li>
//                             <li><a href="#">Style Guide</a></li>
//                             <li><a href="#">Privacy Policy</a></li>
//                           </ul>
//                         </div>
//                       </div>
//                     </div>
//                   </div>
//                 </div>
//               </div>
//               <!-- footer-bottom area -->
//               <div class="footer-bottom-area">
//                 <div class="container">
//                   <div class="footer-border">
//                     <div class="row d-flex align-items-center">
//                       <div class="col-xl-12 ">
//                         <div class="footer-copy-right text-center">
//                           <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
//                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
//                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
//                          </div>
//                        </div>
//                      </div>
//                    </div>
//                  </div>
//                </div>
//                <!-- Footer End-->
//              </div>
//            </footer>
//            <!-- Scroll Up -->
//            <div id="back-top" >
//              <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
//            </div>
//
//            <!-- JS here -->
//            <!-- Jquery, Popper, Bootstrap -->
//            <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
//            <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
//            <script src="./assets/js/popper.min.js"></script>
//            <script src="./assets/js/bootstrap.min.js"></script>
//
//            <!-- Slick-slider , Owl-Carousel ,slick-nav -->
//            <script src="./assets/js/owl.carousel.min.js"></script>
//            <script src="./assets/js/slick.min.js"></script>
//            <script src="./assets/js/jquery.slicknav.min.js"></script>
//
//            <!-- One Page, Animated-HeadLin, Date Picker -->
//            <script src="./assets/js/wow.min.js"></script>
//            <script src="./assets/js/animated.headline.js"></script>
//            <script src="./assets/js/jquery.magnific-popup.js"></script>
//            <script src="./assets/js/gijgo.min.js"></script>
//            <script src="./assets/js/lightslider.min.js"></script>
//
//            <!-- Nice-select, sticky,Progress -->
//            <script src="./assets/js/jquery.nice-select.min.js"></script>
//            <script src="./assets/js/jquery.sticky.js"></script>
//            <script src="./assets/js/jquery.barfiller.js"></script>
//            
//            <!-- counter , waypoint,Hover Direction -->
//            <script src="./assets/js/jquery.counterup.min.js"></script>
//            <script src="./assets/js/waypoints.min.js"></script>
//            <script src="./assets/js/jquery.countdown.min.js"></script>
//            <script src="./assets/js/hover-direction-snake.min.js"></script>
//
//            <!-- contact js -->
//            <script src="./assets/js/contact.js"></script>
//            <script src="./assets/js/jquery.form.js"></script>
//            <script src="./assets/js/jquery.validate.min.js"></script>
//            <script src="./assets/js/mail-script.js"></script>
//            <script src="./assets/js/jquery.ajaxchimp.min.js"></script>
//            
//            <!-- Jquery Plugins, main Jquery -->	
//            <script src="./assets/js/plugins.js"></script>
//            <script src="./assets/js/main.js"></script>
//            
//          </body>
//          </html>
