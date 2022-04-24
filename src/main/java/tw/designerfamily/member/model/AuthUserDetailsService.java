package tw.designerfamily.member.model;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

@Service
public class AuthUserDetailsService implements UserDetailsService {

	@Autowired
	private MemberService mService;

	@Override
	public UserDetails loadUserByUsername(String account) {
		Member member = mService.selectLogin(account);
		Collection<? extends GrantedAuthority> authorities = AuthorityUtils.createAuthorityList(member.getStatus().getStatusName());
		return new User(member.getAccount(), member.getPassword(), authorities);
	}

}
