package id.co.cpu.test.main;

import javax.transaction.Transactional;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import id.co.cpu.master.dao.EquipmentDao;
import id.co.cpu.master.entity.Equipment;
import junit.framework.TestCase;

@Ignore
@Transactional
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = ApplicationTest.class)
@WebAppConfiguration
public class EquipmentTest extends TestCase{

	private static final Logger LOG = LoggerFactory.getLogger(EquipmentTest.class);
	
	@Autowired
	EquipmentDao equipmentDao;
	
	@Ignore
	@Test
	public void testfindByPKTBLSeriesID(){
		
		Equipment equipment = equipmentDao.findBySeriesId("");
		assertNotNull(equipment);
		LOG.info(equipment.toString());
	}
}
