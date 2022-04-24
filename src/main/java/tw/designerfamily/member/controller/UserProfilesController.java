package tw.designerfamily.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import tw.designerfamily.member.model.Member;
import tw.designerfamily.member.model.MemberService;
import tw.designerfamily.member.model.Status;

@RestController
public class UserProfilesController {

	@Autowired
	private MemberService mService;

	@PostMapping("/createuserprofiles.controller")
	public Member processCreateUserAction(@RequestBody Member m) {
		String encodePwd = new BCryptPasswordEncoder().encode(m.getPassword());
		m.setPassword(encodePwd);
		Status s = mService.selectStatusById(m.getStatusId());
		m.setStatus(s);
		return mService.update(m);
	}

}
