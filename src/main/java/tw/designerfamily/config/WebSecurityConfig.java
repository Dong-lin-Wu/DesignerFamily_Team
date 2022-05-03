package tw.designerfamily.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import tw.designerfamily.member.model.AuthUserDetailsService;

@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private AuthUserDetailsService authUserDetailService;
	
	@Autowired
	private AuthSuccessHandler authSuccessHandler;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth
		.userDetailsService(authUserDetailService)
		.passwordEncoder(new BCryptPasswordEncoder());
	}

	@Override
	public void configure(WebSecurity web) throws Exception {

	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
		  .authorizeRequests()
//		  .antMatchers(HttpMethod.GET, "/admin/**").authenticated()
		  .antMatchers(HttpMethod.GET, "/admin/**").hasAuthority("管理員")
		  .antMatchers(HttpMethod.GET, "/member").hasAuthority("管理員")
		  .antMatchers(HttpMethod.GET, "/news").hasAuthority("管理員")
		  .antMatchers(HttpMethod.GET, "/order").hasAuthority("管理員")
		  .antMatchers(HttpMethod.GET, "/product").hasAuthority("管理員")
		  .antMatchers(HttpMethod.GET, "/forum/forum_backend.controller").hasAuthority("管理員")
		  .antMatchers(HttpMethod.GET, "/raiseindex.controller").hasAuthority("管理員")
		  .antMatchers(HttpMethod.GET, "/user/**").authenticated()
		  .antMatchers(HttpMethod.GET,"/*.checklogin").authenticated()
		  .antMatchers(HttpMethod.GET).permitAll()
		  .antMatchers(HttpMethod.POST, "/admin/**").hasAuthority("管理員")
		  .antMatchers(HttpMethod.POST, "/member/**").hasAuthority("管理員")
		  .antMatchers(HttpMethod.POST, "/news").hasAuthority("管理員")
		  .antMatchers(HttpMethod.POST, "/order").hasAuthority("管理員")
		  .antMatchers(HttpMethod.POST, "/product").hasAuthority("管理員")
		  .antMatchers(HttpMethod.POST, "/forum/forum_backend.controller").hasAuthority("管理員")
		  .antMatchers(HttpMethod.POST, "/raiseindex.controller").hasAuthority("管理員")
		  .antMatchers(HttpMethod.POST, "/user/**").authenticated()
		  .antMatchers(HttpMethod.POST).permitAll()
		  .anyRequest().authenticated()
		  .and()
		  .csrf().disable()
		  .headers().frameOptions().sameOrigin()
		  .and()
		  .rememberMe().tokenValiditySeconds(86400).key("rememberMe-key")
		  .and()
		  .formLogin().loginPage("/login")
		  .successHandler(authSuccessHandler)
		  .and()
		  .logout()
		  .invalidateHttpSession(true);
//		  .defaultSuccessUrl("/admin");
	}

}
