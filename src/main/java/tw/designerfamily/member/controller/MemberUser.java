package tw.designerfamily.member.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.designerfamily.member.model.Member;
import tw.designerfamily.member.model.MemberService;
import tw.designerfamily.member.model.Status;

@Controller
@RequestMapping("/user")
public class MemberUser {

	@Autowired
	private MemberService mService;

	@RequestMapping
	public String processMainAction(HttpServletRequest request, Model m) {
		Member mLogin = (Member) request.getSession().getAttribute("login");

		Member mSQL = mService.selectLogin(mLogin.getAccount());
		m.addAttribute("member", mSQL);

		Member member = new Member(mSQL.getAccount(), mSQL.getEmail(), mSQL.getPhone(), mSQL.getGender(),
				mSQL.getBirthday(), mSQL.getPhoto(), mSQL.getRegisterTime(), mSQL.getStatus());
		request.getSession().setAttribute("login", member);

		return "member/member_user";
	}

	@PostMapping("/user.update")
	public String processUpdateAction(HttpServletRequest request, Model m) {
		int id = Integer.parseInt(request.getParameter("id"));
		String account = request.getParameter("account");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String birthdayString = request.getParameter("birthday");
		String photo = request.getParameter("photoBase64");
		String statusString = request.getParameter("statusId");
		String statusName = request.getParameter("statusName");

		if ((account != null && !account.isEmpty()) && (email != null && !email.isEmpty())
				&& (phone != null && !phone.isEmpty())) {
			Member mSQL = mService.selectMemberById(id);

			String password = mSQL.getPassword();
			Timestamp birthday = null;
			if (birthdayString != null && !birthdayString.isEmpty()) {
				if (birthdayString.matches("^\\d{4}\\-\\d{2}\\-\\d{2}.*$")) {
					birthday = Timestamp.valueOf(birthdayString);
				} else {
					String[] birthdayArray = birthdayString.split(" ");
					birthdayString = birthdayArray[2] + "-" + birthdayArray[1] + "-" + birthdayArray[0];
					DateFormat dateFormat = new SimpleDateFormat("yyyy-MMMM-dd", Locale.US);
					Date date = null;
					try {
						date = dateFormat.parse(birthdayString);
						birthday = new Timestamp(date.getTime());
					} catch (ParseException e) {
					}
				}
			}
			if (photo == null || photo.isEmpty()) {
				photo = mSQL.getPhoto();
			}
			Timestamp registerTime = mSQL.getRegisterTime();
			int statusId = Integer.valueOf(statusString);

			Member m1 = new Member(id, account, password, name, email, phone, gender, birthday, photo, registerTime,
					statusId);
			Status s = new Status(statusId, statusName);

			m1.setStatus(s);

			mService.update(m1);
		}
		return "redirect:/user";
	}

	@GetMapping("/change-password")
	public String processChangeAction(HttpServletRequest request, Model m) {
		Member mLogin = (Member) request.getSession().getAttribute("login");

		Member mSQL = mService.selectLogin(mLogin.getAccount());
		m.addAttribute("account", mSQL.getAccount());

		return "member/member_password";
	}

	@PostMapping("/checkchange-password")
	public String processCheckChangeAction(@RequestParam("account") String account,
			@RequestParam("oldpassword") String oldpassword, @RequestParam("password") String password,
			@RequestParam("passwordCheck") String passwordCheck) {

		if ((account != null && !account.isEmpty()) && (oldpassword != null && !oldpassword.isEmpty())
				&& (password != null && !password.isEmpty()) && (passwordCheck != null && !passwordCheck.isEmpty())) {
			Member mSQL = mService.selectLogin(account);
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

			if (password.equals(passwordCheck)) {
				if (encoder.matches(oldpassword, mSQL.getPassword())) {
					String encodePwd = encoder.encode(password);

					mSQL.setPassword(encodePwd);

					mService.update(mSQL);
				}
			}
		}
		return "redirect:/logout";
	}

	@GetMapping("/apply.designer")
	public String processApplyAction(HttpServletRequest request, Model m) {
		Member mLogin = (Member) request.getSession().getAttribute("login");

		Member mSQL = mService.selectLogin(mLogin.getAccount());
		Status sSQL = mService.selectStatusById(1);

		mSQL.setStatus(sSQL);

		mService.update(mSQL);

		return "redirect:/user";
	}

}
