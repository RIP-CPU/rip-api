package id.co.cpu.security.configuration;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import id.co.cpu.common.utils.DateUtil;
import id.co.cpu.security.entity.UserEntity;

public class SecurityTokenEnhancer implements TokenEnhancer {

	@Override
	public OAuth2AccessToken enhance(OAuth2AccessToken accessToken, OAuth2Authentication authentication) {			
        switch (authentication.getOAuth2Request().getGrantType()) {
			case "password":
		        Map<String, Object> additionalInfo = new HashMap<>();
		        UserEntity user = (UserEntity) authentication.getPrincipal();                
		        HttpServletRequest request = 
		        		  ((ServletRequestAttributes) RequestContextHolder.
		        		    currentRequestAttributes()).
		        		    getRequest();        
		        String ipAddress = request.getHeader("X-Forwarded-For");        
		        if(ipAddress==null)
		        	ipAddress=request.getRemoteHost();
		        List<String> authorities = new ArrayList<String>();
		        for (Iterator<GrantedAuthority> grantedAuthorities = user.getAuthorities().iterator(); grantedAuthorities.hasNext(); ) {
		        	authorities.add(grantedAuthorities.next().getAuthority());
		        }
		        additionalInfo.put("authorities", authorities);
		        additionalInfo.put("email", user.getEmail());
		        additionalInfo.put("name", user.getName());  
		        additionalInfo.put("ip_address", ipAddress);
		        additionalInfo.put("server_date", DateUtil.DATE_NOW);
		        
		        ((DefaultOAuth2AccessToken) accessToken).setAdditionalInformation(additionalInfo);
		        break;
			default:
				break;
        }
        return accessToken;
	}

}
