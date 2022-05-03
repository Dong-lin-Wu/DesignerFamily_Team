package tw.designerfamily.member.controller;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.designerfamily.member.model.Member;
import tw.designerfamily.member.model.MemberService;
import tw.designerfamily.member.model.Status;

@Controller
@RequestMapping("/member")
public class MemberAdmin {

	@Autowired
	private MemberService mService;

	@GetMapping("/members")
	public String processMainAction(Model m) {
		List<Member> list = mService.selectAll();
		m.addAttribute("members", list);
		return "member/member_admin";
	}

	@PostMapping("/members.select")
	public String processSelectAction(@RequestParam("keyword") String keyword, Model m) {
		List<Member> list = mService.selectByPhoneAccountEmail(keyword);
		m.addAttribute("members", list);
		return "member/member_admin";
	}

	@GetMapping("/members.insert")
	public String processInsertAction() {
		return "member/member_insert_admin";
	}

	@PostMapping("/members.checkinsert")
	public String processCheckInsertAction(HttpServletRequest request, Model m) {

		String account = request.getParameter("account");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String passwordCheck = request.getParameter("passwordCheck");
		String phone = request.getParameter("phone");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String birthdayString = request.getParameter("birthday");
		String photo = request.getParameter("photoBase64");
		Timestamp registerTime = new Timestamp(System.currentTimeMillis());
		String statusString = request.getParameter("statusId");
		String statusName = request.getParameter("statusName");

		if ((account != null && !account.isEmpty()) && (email != null && !email.isEmpty())
				&& (password != null && !password.isEmpty()) && (passwordCheck != null && !passwordCheck.isEmpty())
				&& (phone != null && !phone.isEmpty())) {
			try {
				String encodePwd = new BCryptPasswordEncoder().encode(password);
				Timestamp birthday = null;
				if (birthdayString != null && !birthdayString.isEmpty()) {
					String[] birthdayArray = birthdayString.split(" ");
					birthdayString = birthdayArray[2] + "-" + birthdayArray[1] + "-" + birthdayArray[0];
					DateFormat dateFormat = new SimpleDateFormat("yyyy-MMMM-dd", Locale.US);
					Date date = dateFormat.parse(birthdayString);
					birthday = new Timestamp(date.getTime());
				}
				int statusId = Integer.valueOf(statusString);

				Member mSQL = mService.selectRegister(phone, account, email);

				if (mSQL == null && phone.matches("^09\\d{8}$") && password.equals(passwordCheck)) {
					Member m1 = new Member(account, encodePwd, name, email, phone, gender, birthday, photo,
							registerTime, statusId);
					Status s = new Status(statusId, statusName);

					m1.setStatus(s);

					Set<Member> member = new HashSet<Member>();
					member.add(m1);
					s.setMember(member);

					mService.insert(m1);

					return "redirect:members";
				} else {
					throw new SQLException();
				}
			} catch (Exception e) {
				m.addAttribute("error", "新增失敗");
				return "member/member_insert_admin";
			}
		} else {
			m.addAttribute("error", "新增失敗");
			return "member/member_insert_admin";
		}
	}

	@GetMapping("/members.update/{id}")
	public String processUpdateAction(@PathVariable("id") int id, Model m) {
		Member mSQL = mService.selectMemberById(id);
		m.addAttribute("member", mSQL);

		return "member/member_update";
	}

	@PostMapping("/members.checkupdate")
	public String processCheckUpdateAction(HttpServletRequest request, Model m) {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String birthdayString = request.getParameter("birthday");
		String photo = request.getParameter("photoBase64");
		String[] statusString = request.getParameter("statusId").split(",");

		Member mSQL = mService.selectMemberById(id);

		String account = mSQL.getAccount();
		String email = mSQL.getEmail();
		String phone = mSQL.getPhone();
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
		int statusId = Integer.valueOf(statusString[0]);
		String statusName = statusString[1];

		Member m1 = new Member(id, account, password, name, email, phone, gender, birthday, photo, registerTime,
				statusId);
		Status s = new Status(statusId, statusName);

		m1.setStatus(s);

		mService.update(m1);

		return "redirect:/member/members.update/" + id;
	}

	@DeleteMapping("/members.delete/{id}")
	public void processDeleteAction(@PathVariable("id") int id) {
		mService.delete(id);
	}

	@GetMapping("/designers")
	public String processDesignersAction(Model m) {
		List<Member> list = mService.selectDesigners();
		m.addAttribute("members", list);
		return "member/member_designer";
	}

	@DeleteMapping("/designers.delete/{id}")
	public void processDeleteDesignersAction(@PathVariable("id") int id) {
		Member mSQL = mService.selectMemberById(id);
		Status sSQL = mService.selectStatusById(0);

		mSQL.setStatus(sSQL);

		mService.update(mSQL);
	}

}
