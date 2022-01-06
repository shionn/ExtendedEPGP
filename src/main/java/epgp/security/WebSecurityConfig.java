package epgp.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

/**
 * Code sous licence GPLv3 (http://www.gnu.org/licenses/gpl.html)
 *
 * @author <b>Shionn</b>, shionn@gmail.com <i>http://shionn.org</i><br>
 *         GCS d- s+:+ a+ C++ UL/M P L+ E--- W++ N K- w-- M+ t+ 5 X R+ !tv b+ D+ G- e+++ h+ r- y+
 */
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	private static final String REALM_NAME = "ExtendedEPGP";

	@Autowired
	private AuthenticationProvider provider;

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(provider);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		admin(http, "/admin/**");
		admin(http, "/armory/add/**");
		admin(http, "/raid/add/**");
		admin(http, "/raid/update/**");
		admin(http, "/raid/edit/**");
		admin(http, "/raid/loot/**");
	}

	private void admin(HttpSecurity http, String path) throws Exception {
		http.authorizeRequests().antMatchers(path).hasRole("ADMIN").and().httpBasic()
				.realmName(REALM_NAME);

	}
}