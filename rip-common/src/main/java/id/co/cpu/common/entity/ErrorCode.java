package id.co.cpu.common.entity;

import org.springframework.http.HttpStatus;

public enum ErrorCode {

	ERR_SYS0001(HttpStatus.NOT_FOUND),
	ERR_SYS0500(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_SYS0002(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_SYS0003(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_SYS0004(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_SYS0005(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_SYS0006(HttpStatus.INTERNAL_SERVER_ERROR),
	
	ERR_UDW0001(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_UDW0002(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_UDW0003(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_UDW0004(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_UDW0005(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_UDW0006(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_UDW0007(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_UDW0008(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_UDW0009(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_UDW0010(HttpStatus.INTERNAL_SERVER_ERROR),

	ERR_CLM0001(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_CLM0002(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_CLM0003(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_CLM0004(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_CLM0005(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_CLM0006(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_CLM0007(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_CLM0008(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_CLM0009(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_CLM0010(HttpStatus.INTERNAL_SERVER_ERROR),
	
	ERR_SCR0001(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_SCR0002(HttpStatus.INTERNAL_SERVER_ERROR),
	
	ERR_FMS001(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_FMS002(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_FMS003(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_FMS004(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_FMS005(HttpStatus.INTERNAL_SERVER_ERROR),
	
	ERR_REA001(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_REA002(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_REA003(HttpStatus.INTERNAL_SERVER_ERROR),
	ERR_REA004(HttpStatus.INTERNAL_SERVER_ERROR), 
	
	ERR_WFL011(HttpStatus.INTERNAL_SERVER_ERROR);

	private final HttpStatus status;

	ErrorCode(HttpStatus status) {
		this.status = status;
	}
	
	public HttpStatus getStatus() {
		return this.status;
	}
	
}