package tw.designerfamily.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class Admin {

	@RequestMapping
	public String processMainAction() {
		return "index_admin";
	}

}
