package id.co.cpu.common.exceptions;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;

import id.co.cpu.common.http.ApiErrorResponse;

public class BaseControllerException {

	protected Logger logger = Logger.getLogger(this.getClass());
	
	@Autowired
	protected ApiErrorResponse errorResponse;

	/**
	 * Handles all Exceptions not addressed by more specific
	 * <code>@ExceptionHandler</code> methods. Creates a response with the Exception
	 * Attributes in the response body as JSON and a HTTP status code of 500,
	 * internal server error.
	 *
	 * @param exception
	 *            An Exception instance.
	 * @param request
	 *            The HttpServletRequest in which the Exception was raised.
	 * @return A ResponseEntity containing the Exception Attributes in the body and
	 *         a HTTP status code 500.
	 */	
	@ExceptionHandler(Exception.class)
	public ResponseEntity<BaseResponse> handleException(HttpServletRequest request, Exception exception) {
		exception.printStackTrace();
		logger.error(stackTrace(exception));
		
		Locale locale = null;
		String acceptLanguage = request.getHeader("Accept-Language");
		if(acceptLanguage != null)
			locale = new Locale(acceptLanguage);
		Map<String, String> respStatusMessage = new HashMap<String, String>();
		respStatusMessage.put(ErrorCode.ERR_SYS0500.name(), errorResponse.errorResponse(ErrorCode.ERR_SYS0500, locale));
		BaseResponse baseResponse = new BaseResponse();
		baseResponse.setRespStatusData("failure");
		baseResponse.setRespStatusMessage(respStatusMessage);
		baseResponse.setError(respStatusMessage.get(ErrorCode.ERR_SYS0500.name()));
		return new ResponseEntity<BaseResponse>(baseResponse,
				ErrorCode.ERR_SYS0500.getStatus());
	}
	
	@ExceptionHandler(SystemErrorException.class)
	public ResponseEntity<BaseResponse> handleSystemException(HttpServletRequest request, SystemErrorException exception) {
		logger.error(stackTrace(exception));
		
		Locale locale = null;
		String acceptLanguage = request.getHeader("Accept-Language");
		if(acceptLanguage != null)
			locale = new Locale(acceptLanguage);	
		Map<String, String> respStatusMessage = new HashMap<String, String>();
		if(exception.getParams() != null) {
			String err = errorResponse.errorResponse(exception.getErrorCode(), locale, exception.getParams());
			respStatusMessage.put(exception.getErrorCode().name(), err);
		} else
			respStatusMessage.put(exception.getErrorCode().name(), errorResponse.errorResponse(exception.getErrorCode(), locale));
		BaseResponse baseResponse = new BaseResponse();
		baseResponse.setRespStatusData("failure");
		baseResponse.setRespStatusMessage(respStatusMessage);
		baseResponse.setError(respStatusMessage.get(exception.getErrorCode().name()));
		return new ResponseEntity<BaseResponse>(baseResponse,
				exception.getErrorCode().getStatus());
	}
	
	private String stackTrace(Exception exception) {
		StringWriter errors = new StringWriter();
		exception.printStackTrace(new PrintWriter(errors));
		return errors.toString();
	}
	
	private class BaseResponse {
		private String error;
		private String respStatusData = "success";
		private Map<String, String> respStatusMessage;

		@SuppressWarnings("unused")
		public String getError() {
			return error;
		}

		public void setError(String error) {
			this.error = error;
		}

		@SuppressWarnings("unused")
		public String getRespStatusData() {
			return respStatusData;
		}

		public void setRespStatusData(String respStatusData) {
			this.respStatusData = respStatusData;
		}

		@SuppressWarnings("unused")
		public Map<String, String> getRespStatusMessage() {
			return respStatusMessage;
		}

		public void setRespStatusMessage(Map<String, String> respStatusMessage) {
			this.respStatusMessage = respStatusMessage;
		}
	}
}
