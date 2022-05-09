package tw.designerfamily.forum.controller;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import tw.designerfamily.forum.model.CommentBean;
import tw.designerfamily.forum.model.ForumBean;
import tw.designerfamily.forum.model.ForumService;
import tw.designerfamily.member.model.Member;
import tw.designerfamily.product.model.ProductBean;
import tw.designerfamily.raise.model.RaiseBean;

@Controller
@RequestMapping("/forum")
@SessionAttributes({ "disList","login","commList"}) //設定@SessionAttributes可以跨多頁
public class DiscussControllerServlet {
	
	private String forumUpdate_time;
	
	@Autowired
		private ForumService fService;
	
	//討論區顯示所有 方法
		public void redirectToForum(Model m) {
		List<ForumBean> flist = fService.selectAll();
		m.addAttribute("disList", flist);
	}
		
//	//留言串顯示所有方法
//		public void redirectToComment(Model m) {
//		List<CommentBean> clist = fService.selectCommAll();
//		m.addAttribute("commList", clist);
//	}	
			
	//到管理者頁面首頁+顯示全部
		@GetMapping("/forum_backend.controller") 
		public String processMainAction(Model m) {
			redirectToForum(m);		
			return "forum/Forum";		
	}
	//到討論區新增頁面
		@PostMapping("/forum_backend_gotoinsert.controller") 
		public String processMainAction1(Model m) {	
			return "forum/ForumAdd";		
		}
		
	//到討論區修改頁面
		@PostMapping("/forum_backend_gotoedit.controller") 
		public String processMainAction2(Model m) {	
			return "forum/ForumEdit";		
		}
		
	//到討論區首頁+不顯示全部//查詢
		@GetMapping("/forum_backend_search.controller") 
		public String processMainAction3(Model m) {					
			return "forum/Forum";		
		}
		
	//到留言串頁面
		@PostMapping("/forum_backend_gotocommentindex.controller") 
		public String processMainAction4(@RequestParam("forumid") int forumid, Model m) {	
			ForumBean fBean = fService.findById(forumid);					
			m.addAttribute("fBean", fBean);
			return "forum/ForumComment";		
		}
			
	//新增討論
		@PostMapping("/forum_backend_insert.controller")
		public String processInsert(
				@RequestParam("Dis_Title") String Dis_Title,
				@RequestParam("Dis_Descri") String Dis_Descri,
				@RequestParam("Dis_Category") String Dis_Category,
				//								
				Model m)
	{
		System.out.println("Dis_Descri: "+Dis_Descri);
//	String paccount = (String) request.getSession(true).getAttribute("login.account"); 
//	String forumAccount = m.getAccount();	
//	String forumAccount = "qqq123"; 		
	    Member member = (Member) m.getAttribute("login");	
	    String forumAccount;
	    System.out.println("member:"+member);
		if (member != null) {
			forumAccount = member.getAccount();
		} else {
			forumAccount = "Guest";
		}
	   
	    ForumBean fBean =  new ForumBean(Dis_Title, Dis_Descri, forumAccount, Dis_Category); 

	    fService.insert(fBean);
	    redirectToForum(m);
	    return "redirect:/forum/forum_backend.controller"; //redirect可以避免refresh後重複執行
	}
		
	//詳細 用id取值
		@GetMapping("/detail/{id}")
		public String processDetail(@PathVariable("id") int id, Model m) {
			ForumBean fBean = fService.findById(id);
			m.addAttribute("n", fBean);
			return "forum/ForumDetail";
		}
		
		  
	//刪除討論
//		@PostMapping("/forum_backend_delete.controller")
//		public String processAction(@RequestParam("forumid") int forumid, Model m) {			
//			fService.deleteById(forumid);
//			System.out.println(forumid);
//			redirectToForum(m);
//		    return "redirect:/forum/forum_backend.controller";
//		}
		
		@DeleteMapping("/forumdelete/{id}")
		@ResponseBody
		public void processDelete(@PathVariable("id")int forumid,Model m) {
			fService.deleteById(forumid);
			
		}
		
		
	//刪除留言
		@PostMapping("/forum_backend_delete_comment.controller")
		public String processDeleteCommAction(@RequestParam("commentId") int commentId, Model m) {
			fService.deleteCommById(commentId);
			redirectToForum(m);
		    return "redirect:/forum/forum_backend.controller";
		}
		
		//修改討論
		@PostMapping("/forum_backend_edit.controller")
		public String processUpdate(	
				@RequestParam("edit") int forumid,
				@RequestParam("Dis_Subject") String Dis_Subject,
				@RequestParam("Dis_Descri") String Dis_Descri,
				@RequestParam("Dis_Category") String Dis_Category,
				Model m,
				SessionStatus status){
		   
		    ForumBean oBean = fService.findById(forumid);//先從原本的Bean取得ID，
		    String forumCreate_time = oBean.getForumCreate_time();//取得ForumCreate_time
		    String forumAccount = oBean.getForumAccount();//取得ForumAccount
		    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date now = new Date();
			String forumUpdate_time = simpleDateFormat.format(now);
			System.out.println(forumUpdate_time);		    
	//		status.setComplete();		    
		    ForumBean fBean = new ForumBean(forumid, Dis_Subject, Dis_Descri, forumCreate_time, forumUpdate_time, forumAccount, Dis_Category);
		    fService.update(fBean);
		    System.out.println("fBean:"+fBean.getForumid()+" "+fBean.getForumSubject());
		    redirectToForum(m);
		    return "redirect:/forum/forum_backend.controller";
		}
	
	//主題查詢
//		@PostMapping("/forum_backend_gotosearch.controller")
//		public String processSearch(@RequestParam("keyword") String forum_search, Model m) {
//			
//			List<ForumBean> flist = fService.searchBySubject(forum_search);
//			m.addAttribute("disList", flist);
//			return "redirect:/forum/forum_backend_search.controller";
//		}
		
		@PostMapping("/forum_backend_gotosearch.controller")
		public String processSearchByKey(@RequestParam("keyword") String key, Model m) {
		    List<ForumBean> flist = fService.searchByKey(key);
		    m.addAttribute("disList", flist);
		    return "redirect:/forum/forum_backend_search.controller";
		}
//		@PostMapping("/forum_backend_gotocommentsearch.controller")
//		public String processSearchByCommKey(@RequestParam("keyword") String key, Model m) {
//		    List<CommentBean> clist = fService.searchByCommKey(key);
//		    m.addAttribute("disList", clist);
//		    return "redirect:/forum/forum_backend_search.controller";
//		}
//--------------------------------------------------------------------------------------------------------------
		//使用者
		
		//到首頁+顯示全部
				
				@GetMapping("/forum_user_index") //使用者頁面路徑
				public String processMainActionFrontend(Model m) {
					redirectToForum(m);		
					return "forum/forumIndex";		
			}
		//到討論區新增頁面
				@GetMapping("/new_post") 
				public String processMainActionFrontend1(Model m) {	
					return "forum/userAddForum";		
				}
				
		//查詢全部
				@GetMapping("/forumfindall") 
				@ResponseBody
				public List<ForumBean> processMainActionFrontend2(Model m) {
					List<ForumBean> flist = fService.selectAll();							
					return flist;		
			}
				
		//新增討論
				@PostMapping("/addnewpost")
				public String processInsertFrontend(
						@RequestParam("Dis_Title") String Dis_Title,
						@RequestParam("Dis_Descri") String Dis_Descri,
						@RequestParam("Dis_Category") String Dis_Category,
						//								
						Model m)
			{ 		
			    Member member = (Member) m.getAttribute("login");	
			    String forumAccount;
			    System.out.println("member:"+member);
				if (member != null) {
					forumAccount = member.getAccount();
				} else {
					forumAccount = "Guest";
				}
			   
			    ForumBean fBean =  new ForumBean(Dis_Title, Dis_Descri, forumAccount, Dis_Category); 

			    fService.insert(fBean);
			    redirectToForum(m);
			    return "redirect:/forum/forum_user_index"; //redirect可以避免refresh後重複執行
			}
				
		//查詢單筆
		@GetMapping("/{forumid}")
		@ResponseBody
		public ForumBean processFindById(@PathVariable("forumid") int forumid,Model m) {
			ForumBean fBean= fService.findById(forumid);
			m.addAttribute("forumBean", fBean);
			return fBean;
		}
		//查詢某會員
				@GetMapping("/forumbyname.checklogin")
				@ResponseBody
				public List<ForumBean> processSelectByName0(@RequestParam("forumAccount") String name) {
					List<ForumBean> flist = fService.selectByName(name);
					return flist;
				}
		
		
//	-------------------------------------------以下為留言--------------------------------------------------
				
//				//新增留言
//				@GetMapping("/new_comment")
//				@ResponseBody
//				public String processnewcomment(@RequestParam("forumid") int forumid,Model m) {
//					fService.insertcomment(forumid);
//					m.addAttribute("forumBean", fBean);
//					return fBean;
//				}
				//新增留言
				@PostMapping(path ="/new_comment")
				@ResponseBody
				public void processnewcomment(@RequestParam("commentAccount")String commentAccount,@RequestParam("commentDescription") String commentDescription
						,@RequestParam("forumid") int forumid) {
					CommentBean cBean = new CommentBean(commentAccount, commentDescription);
					ForumBean fBean = fService.findById(forumid);
					cBean.setForumBean(fBean);
					fBean.getCommentBean().add(cBean);
					
					fService.update(fBean);
					
					//return "product";
				}
		
}      
	      