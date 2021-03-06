package id.co.cpu.security.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import id.co.cpu.common.exceptions.BaseControllerException;
import id.co.cpu.feign.dto.security.MenuDto;
import id.co.cpu.security.entity.UserEntity;
import id.co.cpu.security.service.MenuImplService;

@RestController
@RequestMapping("/api/security")
public class MenuController extends BaseControllerException {

	@Autowired
	private MenuImplService menuService;
	
	@RequestMapping(value = "/vw/get/menu/v.1", method = RequestMethod.GET, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<MenuDto>> getMenuI18n(Authentication authentication,
			@RequestHeader(name = "Accept-Language", required = false) String locale) throws Exception {
		UserEntity user = (UserEntity) authentication.getPrincipal();
		return new ResponseEntity<List<MenuDto>>(menuService.loadMenuByRole(user.getAuthorityDefault(), locale), HttpStatus.OK);
	}
	
}
