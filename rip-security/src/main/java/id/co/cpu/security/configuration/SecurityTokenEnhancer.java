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
import id.co.cpu.security.service.MenuImplService;

public class SecurityTokenEnhancer implements TokenEnhancer {
	
	@Value("${rip.client-id.web}")
	private String clientIdWeb;
	
	@Autowired
	@Qualifier("menuService")
	private MenuImplService menuService;
	
	@Value("${rip.signature.public-key}")
	private String publicKey;

	@Override
	public OAuth2AccessToken enhance(OAuth2AccessToken accessToken, OAuth2Authentication authentication) {
        UserEntity user = (UserEntity) authentication.getPrincipal();
        Map<String, Object> additionalInfo = new TreeMap<String, Object>();		
        switch (authentication.getOAuth2Request().getGrantType()) {
			case "password":
				if(authentication.getOAuth2Request().getClientId().equals(clientIdWeb) &&
						user.getRaw() == null) {
					try {
						additionalInfo.put("menus", menuService.loadMenuByRole(user.getAuthorityDefault(), user.getLocale()));
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
		        
		        break;
			default:
				break;
        }
        additionalInfo.put("authority", user.getAuthorityDefault());
        additionalInfo.put("email", user.getEmail());
        additionalInfo.put("name", user.getName());
        additionalInfo.put("locale", user.getLocale());
        additionalInfo.put("server_date", DateUtil.DATE_NOW);
        additionalInfo.put("xrip_key", publicKey);
        ((DefaultOAuth2AccessToken) accessToken).setAdditionalInformation(additionalInfo);
        return accessToken;
	}

}
