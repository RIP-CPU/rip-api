package id.co.cpu.security.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configurers.ResourceServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.token.TokenStore;

import id.co.cpu.common.utils.ResourceCode;

@Configuration("resourceServerSecurity")
@EnableResourceServer
public class ResourceServerSecurityConfiguration extends ResourceServerConfigurerAdapter {

    @Autowired
    private TokenStore tokenStore;
    
    private String resourceId = ResourceCode.SECURITY.getResourceId();

    @Override
    public void configure(ResourceServerSecurityConfigurer resources) {
        // @formatter:off
        resources.resourceId(resourceId).tokenStore(tokenStore);
        // @formatter:on
    }

    @Override
    public void configure(HttpSecurity http) throws Exception {
        http
        .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and()
        .csrf().disable()
        .authorizeRequests()
        /*.antMatchers(HttpMethod.GET,"/api/" 	+resourceId+ "/vw/get/**")
    		.access("#oauth2.hasScope('read')")
        .antMatchers(HttpMethod.GET,"/api/" 	+resourceId+ "/vw/param/**")
    		.access("#oauth2.hasScope('read')")
        .antMatchers(HttpMethod.POST,"/api/"	+resourceId+ "/vw/post/**")
        	.access("#oauth2.hasScope('read')")
        .antMatchers(HttpMethod.POST,"/api/"	+resourceId+ "/vw/param/**")
        	.access("#oauth2.hasScope('read')")
        .antMatchers(HttpMethod.POST,"/api/"	+resourceId+ "/trx/add/**")
        	.access("#oauth2.hasScope('write')")
        .antMatchers(HttpMethod.POST,"/api/"	+resourceId+ "/trx/post/**")
        	.access("#oauth2.hasScope('write')")
        .antMatchers(HttpMethod.PUT,"/api/"		+resourceId+ "/trx/put/**")
        	.access("#oauth2.hasScope('write')")
        .antMatchers(HttpMethod.GET,"/api/" 	+resourceId+ "/vw/auth/**")
        	.access("#oauth2.hasScope('trust') and not(hasRole('END'))")
        .antMatchers(HttpMethod.POST,"/api/"	+resourceId+ "/vw/auth/**")
        	.access("#oauth2.hasScope('trust') and not(hasRole('END'))")
        .antMatchers(HttpMethod.POST,"/api/"	+resourceId+ "/trx/auth/**")
        	.access("#oauth2.hasScope('trust') and not(hasRole('END'))")
        .antMatchers(HttpMethod.DELETE,"/api/"	+resourceId+ "/trx/auth/**")
        	.access("#oauth2.hasScope('trust') and not(hasRole('END'))")*/
        .antMatchers("/api/**").authenticated();
    }
}
