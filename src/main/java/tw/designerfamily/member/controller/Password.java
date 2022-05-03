package tw.designerfamily.member.controller;

import java.sql.SQLException;
import java.util.HashMap;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.designerfamily.member.model.Member;
import tw.designerfamily.member.model.MemberService;

@Controller
public class Password {

	@Autowired
	private MemberService mService;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	freemarker.template.Configuration freemarkerConfig;

	@GetMapping("/forgot-password")
	public String processMainAction() {
		return "forgot-password";
	}

	@PostMapping("/checkforgot-password")
	public String processCheckAction(@RequestParam("email") String email, Model m) {

		if (email != null && !email.isEmpty()) {
			Member mSQL = mService.selectByEmail(email);

			try {
				if (mSQL != null) {
					// 發件人的暱稱
					String name = MimeUtility.encodeText("Mega");
					// 發件人是誰
					InternetAddress from = new InternetAddress(name + "<ispanmega2022@gmail.com>");
					MimeMessage mimeMessage = mailSender.createMimeMessage();
					MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
					mimeMessageHelper.setFrom(from);
					mimeMessageHelper.setTo(email);
					mimeMessageHelper.setSubject("Mega|重設密碼認證信");

					HashMap<String, Object> params = new HashMap<>();
					// 使用模板生成html郵件內容
					params.put("account", mSQL.getAccount());
					String result = FreeMarkerTemplateUtils
							.processTemplateIntoString(freemarkerConfig.getTemplate("password-reset.html"), params);
					mimeMessageHelper.setText(result, true);
					mailSender.send(mimeMessage);

					return "success-password";
				} else {
					throw new SQLException();
				}
			} catch (Exception e) {
				m.addAttribute("error", "傳送郵件失敗，請確認此Email是否在Mega註冊過");
				return "forgot-password";
			}
		} else {
			m.addAttribute("error", "請輸入正確的Email以接收郵件");
			return "forgot-password";
		}
	}

	@GetMapping("/reset-password/{account}")
	public String processResetAction(@PathVariable("account") String account, Model m) {
		Member mSQL = mService.selectLogin(account);
		m.addAttribute("account", mSQL.getAccount());

		return "reset-password";
	}

	@PostMapping("/checkreset-password")
	public String processCheckResetAction(@RequestParam("account") String account,
			@RequestParam("password") String password, @RequestParam("passwordCheck") String passwordCheck) {

		if ((account != null && !account.isEmpty()) && (password != null && !password.isEmpty())
				&& (passwordCheck != null && !passwordCheck.isEmpty())) {
			String encodePwd = new BCryptPasswordEncoder().encode(password);
			Member mSQL = mService.selectLogin(account);

			if (mSQL != null && password.equals(passwordCheck)) {
				mSQL.setPassword(encodePwd);

				mService.update(mSQL);
			}
		}
		return "redirect:login";
	}

}
