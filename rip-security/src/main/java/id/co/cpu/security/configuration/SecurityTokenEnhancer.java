package id.co.cpu.security.configuration;

import java.util.Map;
import java.util.TreeMap;

import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;

import id.co.cpu.common.utils.DateUtil;
import id.co.cpu.security.entity.UserEntity;

public class SecurityTokenEnhancer implements TokenEnhancer {

	@Override
	public OAuth2AccessToken enhance(OAuth2AccessToken accessToken, OAuth2Authentication authentication) {			
        switch (authentication.getOAuth2Request().getGrantType()) {
			case "password":
		        Map<String, Object> additionalInfo = new TreeMap<String, Object>();
		        UserEntity user = (UserEntity) authentication.getPrincipal();
		        additionalInfo.put("authority", user.getAuthorityDefault());
		        additionalInfo.put("email", user.getEmail());
		        additionalInfo.put("name", user.getName());
		        additionalInfo.put("locale", user.getLocale());
		        additionalInfo.put("server_date", DateUtil.DATE_NOW);
		        
		        ((DefaultOAuth2AccessToken) accessToken).setAdditionalInformation(additionalInfo);
		        break;
			default:
				break;
        }
        return accessToken;
	}

}
