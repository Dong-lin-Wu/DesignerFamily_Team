package tw.designerfamily.config;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import tw.designerfamily.member.model.Member;
import tw.designerfamily.member.model.MemberService;

@Component
public class AuthSuccessHandler implements AuthenticationSuccessHandler {

	@Autowired
	private MemberService mService;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal != null && principal instanceof UserDetails) {
			UserDetails user = (UserDetails) principal;

			String account = user.getUsername();

			Member mSQL = mService.selectLogin(account);

			Member member = new Member(mSQL.getAccount(), mSQL.getEmail(), mSQL.getPhone(), mSQL.getGender(),
					mSQL.getBirthday(), mSQL.getRegisterTime(), mSQL.getStatus());

			request.getSession().setAttribute("login", member);

			Set<String> roles = AuthorityUtils.authorityListToSet(user.getAuthorities());

//			if (member.getStatus().getStatusId() == 9 || member.getStatus().getStatusId() == 8) {
//				response.sendRedirect("/admin");
//			} else {
//				response.sendRedirect("/index");
//			}

			if (roles.contains("管理員")) {
				response.sendRedirect("/admin");
			} else {
				response.sendRedirect("/index");
			}
		}
	}

}
