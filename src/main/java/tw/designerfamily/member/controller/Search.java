package tw.designerfamily.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.designerfamily.member.model.Member;
import tw.designerfamily.member.model.MemberService;

@Controller
@RequestMapping("/admin")
public class Search {

	@Autowired
	private MemberService mService;

	@PostMapping("/search")
	public String processMainAction() {
		return "redirect:/admin";
	}

	@PostMapping("/search.members")
	public String processMembersAction(@RequestParam("keyword") String keyword, Model m) {
		List<Member> list = mService.selectByPhoneAccountEmail(keyword);
		m.addAttribute("members", list);
		return "member/member_admin";
	}

}
