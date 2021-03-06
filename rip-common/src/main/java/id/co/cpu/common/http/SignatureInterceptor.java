package id.co.cpu.common.http;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import id.co.cpu.common.exceptions.SystemErrorException;
import id.co.cpu.common.security.SignatureEncrypt;
import id.co.cpu.common.utils.DateUtil;

/**
 * @author S201403171
 * @see <a href="https://jsfiddle.net/ridlafadilah/3azd042u/">Generate Signature Header</a>
 */

@Component
@Order(Ordered.HIGHEST_PRECEDENCE)
public class SignatureInterceptor implements Filter {
	
	@Value("${rip.signature.private-key}")
	private String privateKey;
	
	@Value("${rip.signature.public-key}")
	private String publicKey;

	private String message;

	private String datenow;

	private ObjectMapper objectMapper;

	@Autowired
	public void setObjectMapper( ObjectMapper objectMapper ) {
		this.objectMapper = objectMapper;
	}

    public SignatureInterceptor() {}

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        
        if (!"OPTIONS".equalsIgnoreCase(request.getMethod()) &&
    		StringUtils.containsIgnoreCase(request.getHeader("Authorization"), "bearer")) {
        	try {
        		if(request.getHeader("X-RIP-Key") == null
        				&& request.getHeader("X-RIP-Timestamp") == null
        				&& request.getHeader("X-RIP-Signature") == null)
    				throw new SystemErrorException("Unauthorized");
            	if(!request.getHeader("X-RIP-Key").equals(publicKey))
    				throw new SystemErrorException("Invalid X-RIP-Key");
            	try {
            		datenow = DateUtil.formatDate(new Date(new Long(request.getHeader("X-RIP-Timestamp")) * 1000), DateUtil.DEFAULT_FORMAT_DATE);
            		if(!datenow.equals(DateUtil.DATE_NOW))
        				throw new SystemErrorException("Invalid X-RIP-Timestamp");
    			} catch (Exception e) {
    				throw new SystemErrorException("Invalid X-RIP-Timestamp");
    			}
        		message = 	request.getHeader("X-RIP-Key") + ":" + 
							request.getHeader("X-RIP-Timestamp") + ":" +
							datenow  + ":" +
							request.getRequestURI()  + ":" +
							request.getHeader("Authorization").replaceAll("(?i)bearer ", "");
        		if(!SignatureEncrypt.getInstance().hash(this.privateKey, message)
        				.equals(request.getHeader("X-RIP-Signature")))
    				throw new SystemErrorException("Invalid X-RIP-Signature");
        		chain.doFilter(req, res);
			} catch (SystemErrorException e) {
				response.getWriter().write(unauthorized("invalid_signature",e.getMessage()));
				response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			} catch (Exception e) {
				response.getWriter().write(unauthorized("invalid_signature",e.getMessage()));
				response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			}
        }else
        	chain.doFilter(req, res);
    }

    @Override
    public void init(FilterConfig filterConfig) {}

    @Override
    public void destroy() {}
    
    private String unauthorized(String err, String errDesc) throws JsonProcessingException {
		Map<String, String> body = new HashMap<String, String>();
		body.put("error", err);
		body.put("error_description", errDesc);
		return objectMapper.writeValueAsString(body);
    }

}
