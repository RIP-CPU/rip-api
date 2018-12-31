package id.co.cpu.security.configuration;

import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;

import id.co.cpu.common.utils.DateUtil;
import id.co.cpu.security.entity.UserEntity;
import id.co.cpu.security.service.FunctionImplService;

public class SecurityTokenEnhancer implements TokenEnhancer {
	
	@Value("${rip.client-id.web}")
	private String clientIdWeb;
	
	@Autowired
	@Qualifier("functionService")
	private FunctionImplService functionService;

	@Override
	public OAuth2AccessToken enhance(OAuth2AccessToken accessToken, OAuth2Authentication authentication) {			
        switch (authentication.getOAuth2Request().getGrantType()) {
			case "password":
		        UserEntity user = (UserEntity) authentication.getPrincipal();
		        Map<String, Object> additionalInfo = new TreeMap<String, Object>();
				if(authentication.getOAuth2Request().getClientId().equals(clientIdWeb) &&
						user.getRaw() == null) {
					try {
						additionalInfo.put("menus", functionService.loadMenuByRole(user.getAuthorityDefault(), user.getLocale()));
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
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
