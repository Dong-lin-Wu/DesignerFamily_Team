package tw.designerfamily.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{
	
//	@Autowired
//	private AuthUserDetailService authUserDetailService;
	
	//驗證密碼
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//		auth
//			.userDetailsService(authUserDetailService)
//			.passwordEncoder(new BCryptPasswordEncoder());
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
//			.authorizeRequests()
//			.antMatchers(HttpMethod.GET,"/users/**").authenticated()
//			.antMatchers(HttpMethod.GET).permitAll()
//			.antMatchers(HttpMethod.POST,"/users/**").authenticated()
//			.antMatchers(HttpMethod.POST).permitAll()
//			.anyRequest().authenticated()
//			.and()
			.csrf().disable()
//			.rememberMe().tokenValiditySeconds(86400).key("rememberMe-key")
//			.and()
//			.formLogin().loginPage("/login/page")
//			.defaultSuccessUrl("/login/welcome")
			;
	}
	
	
}
