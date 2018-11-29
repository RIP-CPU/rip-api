package id.co.cpu.test.main;

import java.util.Calendar;
import java.util.List;

import javax.transaction.Transactional;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import id.co.cpu.master.dao.EquipmentDao;
import id.co.cpu.master.dao.SeriesDao;
import id.co.cpu.master.entity.Equipment;
import id.co.cpu.master.entity.Patient;
import id.co.cpu.master.entity.Series;
import id.co.cpu.master.entity.Study;
import junit.framework.TestCase;


@Transactional
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = ApplicationTest.class)
@WebAppConfiguration
public class SeriesTest extends TestCase{

	private static final Logger LOG = LoggerFactory.getLogger(SeriesTest.class);
	
	@Autowired
	SeriesDao seriesDao;
	
	@Autowired
	EquipmentDao equipmentDao;
	
		
	@Ignore
	@Test
	public void testList(){
		
		List<Series> serieses = seriesDao.findAll(0,3);//show only the first 3 records
		
		if(serieses.size() <=0 ){
			LOG.info("No Series record found!");
		}else{		
			for(Series series : serieses){			
				Study study = series.getStudy();
				LOG.info("study: {}", study.toString());
				LOG.info("series: {}", series.toString());
				
				Equipment eqp = series.getEquipment();
				if(eqp != null){
					LOG.info("equipment: {}", eqp.toString());
				}else{
					LOG.info("no equipment defined");
				}
				
				LOG.info("-----------------------------------------------------------------------------------------------------------------");			
			}
		}
	}
	
	@Ignore
	@Test
	public void testCount(){
		
		Long count = seriesDao.count();
		LOG.info("count:{}",count);
	}
	
	@Ignore
	@Test
	@Rollback(false)
	public void testSeriesObject(){
		
		Series series = new Series();		
		series.setOperatorsName("Michelle Kaitlin Aust");
		series.setSeriesNumber(1);
		series.setSeriesDescription("Patient broke his leg");
		
			
		
		Study study = new Study();
		study.setReferringPhysicianName("Erin Zoela");
		study.setStudyID("E321WQ");
		study.setStudyDateTime(Calendar.getInstance().getTime());
		
		
		Patient patient = new Patient();
		patient.setPatientID("ABC98711");
		patient.setPatientName("Alisa Bateley");
		patient.setPatientAge("35F");
		patient.setPatientSex("F");
		patient.setPatientBirthday(Calendar.getInstance().getTime());

		study.setPatient(patient);
		series.setStudy(study);	
				
		//IDs start as null
		assertEquals((Long) null, series.getId());
		assertEquals((Long) null, study.getId());
		assertEquals((Long) null, patient.getId());	
		
		
		testList();		
		seriesDao.save(series);		
		
		assertNotNull(series.getId());
		assertNotNull(study.getId());
		assertNotNull(patient.getId());
		
		//you need to test Equipment separately because it is one-To-One
		Equipment equipment = new Equipment();
		equipment.setInstitutionName("UAMS");
		equipment.setDeviceSerialNumber("45093");
		equipment.setInstitutionalDepartmentName("Radiology Clinic");	
		equipment.setModality("CT");
		equipment.setSeries(series);//set the Series to Equipment because we now have the pkTBLSeriesID
		
		//ID starts as null
		assertEquals((Long) null, equipment.getId());		
		equipmentDao.save(equipment);//save Equipment here after you get the pkTBLSeriesID
		assertNotNull(equipment.getId());
		
		testList();
	}
	
	@Ignore
	@Test
	public void testfindBySeriesInstanceUID(){
		
		Series series = seriesDao.findBySeriesInstanceUID("1.3.12.2.1107.5.1.4.55292.30000015032113073778100003742");
		assertNotNull(series);
		series = seriesDao.findBySeriesInstanceUID("1.3.12.2.1107.5.1.4.55292.30000015032113073778100003742", 2);
		assertNotNull(series);
		LOG.info(series.toString());
	}
	
	@Ignore
	@Test
	public void testFindByID(){
		
		Series series = seriesDao.findById(1);
		assertNotNull(series);
		LOG.info(series.toString());
	}
	
	@Test
	@Ignore
	public void testFindByStudyID(){
		
		List<Series> serieses = seriesDao.findByStudyId(1L);
		if(serieses.size() <=0 ){
			LOG.info("No Series record found!");
		}else{		
			for(Series series : serieses){			
				Study study = series.getStudy();
				LOG.info("study: {}", study.toString());
				LOG.info("series: {}", series.toString());
				
				Equipment eqp = series.getEquipment();
				if(eqp != null){
					LOG.info("equipment: {}", eqp.toString());
				}else{
					LOG.info("no equipment defined");
				}
				
				LOG.info("-----------------------------------------------------------------------------------------------------------------");			
			}
		}
	}
	
	@Ignore
	@Test
	public void testAllByPkPatientID(){
		
		List<Series> serieses = seriesDao.findAllByPatientId(2L);
		assertEquals(0, serieses.size());
		
		serieses = seriesDao.findAllByPatientId(1L);
		assertTrue(serieses.size() > 0);
		
		int i=0;
		for(Series series : serieses){			
			Study study = series.getStudy();
			LOG.info("study: {}", study.toString());
			LOG.info(++i + "- Series: {}", series.toString());
				
			Equipment eqp = series.getEquipment();
			if(eqp != null){
				LOG.info("Equipment: {}", eqp.toString());
			}else{
				LOG.info("no equipment defined");
			}
			
			LOG.info("-----------------------------------------------------------------------------------------------------------------");			
		}
		
	}
}
