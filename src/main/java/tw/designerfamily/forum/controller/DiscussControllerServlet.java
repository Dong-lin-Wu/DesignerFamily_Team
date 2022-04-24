package tw.designerfamily.forum.controller;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import tw.designerfamily.forum.model.ForumBean;
import tw.designerfamily.forum.model.ForumService;
import tw.designerfamily.member.model.Member;

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
			
	//到首頁+顯示全部
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
		  
	//刪除討論
		@PostMapping("/forum_backend_delete.controller")
		public String processAction(@RequestParam("forumid") int forumid, Model m) {			
			fService.deleteById(forumid);
			System.out.println(forumid);
			redirectToForum(m);
		    return "redirect:/forum/forum_backend.controller";
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
		@PostMapping("/forum_backend_gotosearch.controller")
		public String processSearch(@RequestParam("keyword") String forum_search, Model m) {
			
			List<ForumBean> flist = fService.searchBySubject(forum_search);
			m.addAttribute("disList", flist);
			return "redirect:/forum/forum_backend_search.controller";
		}	
}      
	      