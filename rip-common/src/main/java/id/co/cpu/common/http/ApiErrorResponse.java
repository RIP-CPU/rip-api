package id.co.cpu.common.http;

import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;

import id.co.cpu.common.utils.ErrorCode;
import id.co.cpu.common.utils.JsonUtils;

@Component
public class ApiErrorResponse {
	
	@Autowired
	private MessageSource messageSource;

	@Autowired
	private JsonUtils jsonUtils;
	
	public String errorResponse(ErrorCode errorCode, Locale locale) {
		if(locale == null)
			locale = Locale.forLanguageTag("id-ID");
		Map<String, Object> response = new TreeMap<>();
		response.put("error", errorCode);
		response.put("error_description", messageSource.getMessage(errorCode.name(), null, locale));
		return jsonUtils.objToJson(response);
	}
	
	public String errorResponse(ErrorCode errorCode, Locale locale, Object[] params) {
		if(locale == null)
			locale = Locale.forLanguageTag("id-ID");
		Map<String, Object> response = new TreeMap<>();
		response.put("error", errorCode);
		response.put("error_description", messageSource.getMessage(errorCode.name(), params, locale));
		return jsonUtils.objToJson(response);
	}
	
	public String getErrorMessage(ErrorCode errorCode,Locale locale)
	{
		return messageSource.getMessage(errorCode.name(), null, locale);
	}
    
}
