package id.co.cpu.security.configuration;

import java.util.Arrays;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.client.JdbcClientDetailsService;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;
import org.springframework.security.oauth2.provider.token.TokenEnhancerChain;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;

import id.co.cpu.security.service.UserImplService;

@Configuration
public class OAuth2ServerConfiguration extends AuthorizationServerConfigurerAdapter{

    @Autowired
    private JwtAccessTokenConverter jwtAccessTokenConverter;

    @Autowired
    private TokenStore tokenStore;

    @Autowired
    @Qualifier("authenticationManagerBean")
    private AuthenticationManager authenticationManager;

    @Autowired
    private DataSource dataSource;
    
    @Autowired
    UserImplService userDetailsService;

    @Override
	public void configure(AuthorizationServerSecurityConfigurer security) throws Exception {		
		super.configure(security);
		security.checkTokenAccess("hasRole('check_token')");
	}

	@Override
    public void configure(AuthorizationServerEndpointsConfigurer endpoints) throws Exception {
        // @formatter:off
	    TokenEnhancerChain tokenEnhancerChain = new TokenEnhancerChain();
	    tokenEnhancerChain.setTokenEnhancers(Arrays.asList(tokenEnhancer(), jwtAccessTokenConverter));
		
        endpoints
                .tokenStore(tokenStore)
                .authenticationManager(authenticationManager)
                .tokenEnhancer(tokenEnhancerChain)
                .userDetailsService(userDetailsService);
        // @formatter:on
    }

    @Override
    public void configure(ClientDetailsServiceConfigurer clients) throws Exception {
        // @formatter:off
    	clients.jdbc(dataSource);
        // @formatter:on
    }
    
    @Bean
    public TokenEnhancer tokenEnhancer() {
        return new SecurityTokenEnhancer();
    }
    
    @Bean
    public JdbcClientDetailsService jdbcClientDetailService() {
    	return new JdbcClientDetailsService(dataSource);
    }
}