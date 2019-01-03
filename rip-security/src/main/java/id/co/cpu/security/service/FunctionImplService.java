package id.co.cpu.security.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import id.co.cpu.feign.dto.security.MenuDto;
import id.co.cpu.security.dao.FunctionRepo;
import id.co.cpu.security.entity.FunctionEntity;

@Service("functionService")
public class FunctionImplService {

	protected final Log LOGGER = LogFactory.getLog(getClass());

	@Autowired
	@Qualifier("functionRepo")
	private FunctionRepo functionRepo;
	
	@Value("${rip.locale}")
	private String locale;
	
	public List<MenuDto> loadMenuByRole(String role) throws Exception {
		List<FunctionEntity> functions = functionRepo.loadAllMenuByRole(role);
		List<MenuDto> menuDtos = new ArrayList<MenuDto>();
		functions.forEach(funct->{
			menuDtos.add(funct.getMenu().toObject());
		});
		return menuDtos;
	}
	
	public List<MenuDto> loadMenuByRole(String role, String locale) throws Exception {
		if(locale == null)
			return loadMenuByRole(role);
		locale = locale.split(",")[0];
		if(locale.equals(this.locale))
			return loadMenuByRole(role);
		List<FunctionEntity> functions = functionRepo.loadAllMenuByRoleI18n(role, locale);
		List<MenuDto> menuDtos = new ArrayList<MenuDto>();
		functions.forEach(funct->{
			funct.getMenu().getMenuI18n().forEach(menu->{
				menuDtos.add(funct.getMenu().toObject(menu.getTitle()));
			});
		});
		return menuDtos;
	}
	
	public List<MenuDto> loadMenuByRole(String role, Locale locale) throws Exception {
		return loadMenuByRole(role, locale.toLanguageTag());
	}
	
}