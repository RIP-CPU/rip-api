package id.co.cpu.security.configuration;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import id.co.cpu.security.entity.UserEntity;

public class SecurityTokenEnhancer implements TokenEnhancer {

	@Override
	public OAuth2AccessToken enhance(OAuth2AccessToken accessToken, OAuth2Authentication authentication) {		
        Map<String, Object> additionalInfo = new HashMap<>();
        
        UserEntity user = (UserEntity) authentication.getPrincipal(); 
        additionalInfo.put("email", user.getEmail());
        additionalInfo.put("name", user.getName());  
                
        HttpServletRequest request = 
        		  ((ServletRequestAttributes) RequestContextHolder.
        		    currentRequestAttributes()).
        		    getRequest();
        
        String ipAddress = request.getHeader("X-Forwarded-For");
        
        if(ipAddress==null)
        	ipAddress=request.getRemoteHost();
        
        String device = request.getHeader("User-Agent");
        
        additionalInfo.put("ipAddress", ipAddress);       
        additionalInfo.put("device", device);
        
        ((DefaultOAuth2AccessToken) accessToken).setAdditionalInformation(additionalInfo);
        return accessToken;
	}

}
