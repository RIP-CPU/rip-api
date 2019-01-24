package id.co.cpu.feign.configuration;

import org.springframework.security.oauth2.client.OAuth2ClientContext;

import feign.RequestInterceptor;
import feign.RequestTemplate;

public class BearerRequestInterceptor implements RequestInterceptor {

	private OAuth2ClientContext oauth2ClientContext;
	
    public BearerRequestInterceptor(OAuth2ClientContext oauth2ClientContext) {
		this.oauth2ClientContext = oauth2ClientContext;
	}

	@Override
    public void apply(RequestTemplate requestTemplate) {
        requestTemplate.header("Authorization",
				String.format("%s %s",
				(oauth2ClientContext.getAccessToken()!=null?oauth2ClientContext.getAccessToken().getTokenType():""),
				(oauth2ClientContext.getAccessToken()!=null?oauth2ClientContext.getAccessToken().getValue():"")));
    }

}