package id.co.cpu.common.utils;

import java.lang.reflect.Type;

import org.apache.log4j.Logger;
import org.modelmapper.Conditions;
import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.stereotype.Component;

@Component
public class ObjectMapperUtils {
	private ModelMapper modelMapper;
	Logger log = Logger.getLogger(ObjectMapperUtils.class);

	public ObjectMapperUtils() {
		this.modelMapper = new ModelMapper();
		this.modelMapper.getConfiguration().setPropertyCondition(Conditions.isNotNull())
		.setMatchingStrategy(MatchingStrategies.STRICT);
	}

	/**
	 * Use for Object transform to another Object/Helper/DTO example :
	 * transforms(staff, StaffHelper.class);</br>
	 * 
	 * @param object
	 * @param cls
	 * @return <T> Object
	 */
	public <T> Object transforms(Object object, Class<T> cls) {
		return modelMapper.map(object, cls);
	}

	/**
	 * @param object
	 * @param type
	 * @return {@link Object}
	 */
	public Object transforms(Object object, Type type) {
		return modelMapper.map(object, type);
	}
}
