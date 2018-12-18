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

import id.co.cpu.pacs.dao.EquipmentDao;
import id.co.cpu.pacs.dao.InstanceDao;
import id.co.cpu.pacs.entity.EquipmentDicomEntity;
import id.co.cpu.pacs.entity.InstanceDicomEntity;
import id.co.cpu.pacs.entity.PatientDicomEntity;
import id.co.cpu.pacs.entity.SeriesDicomEntity;
import id.co.cpu.pacs.entity.StudyDicomEntity;
import id.co.cpu.pacs.service.DBService;
import junit.framework.TestCase;

@Transactional
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = ApplicationTest.class)
@WebAppConfiguration
public class InstanceTest extends TestCase{
	
	private static final Logger LOG = LoggerFactory.getLogger(InstanceTest.class);
	
	@Autowired
	InstanceDao instanceDao;		
	
	@Autowired
	EquipmentDao equipmentDao;
	
	@Autowired
	DBService dbService;
	
	@Ignore
	@Test
	public void testList()
	{
		List<InstanceDicomEntity> instances = instanceDao.findAll(1,10);
		
		if(instances.size() <= 0){
			LOG.info("no instances found!");
		}else{			
			for(InstanceDicomEntity instance : instances){
				//print instance
				LOG.info("instance: {}", instance);				
				//get series
				SeriesDicomEntity series = instance.getSeries();				
				LOG.info("series: {}", series.toString());			
				//get study
				StudyDicomEntity study = series.getStudy();				
				LOG.info("study: {}", study.toString());
				//get patient
				PatientDicomEntity patient = study.getPatient();
				LOG.info("patient: {}", patient.toString());
			}
		}		
	}
	
	@Ignore
	@Test
	public void testfindBySopInstanceUID(){
		
		InstanceDicomEntity instance = instanceDao.findBySopInstanceUID("1.3.12.2.1107.5.1.4.55292.30000015032113073778100003751");
		assertNotNull(instance);
		LOG.info(instance.toString());
		instance = instanceDao.findBySopInstanceUID("1.3.12.2.1107.5.1.4.55292.3000001503211307377810000375188888888");
		assertNull(instance);
	}
	
	@Test
	@Ignore
	public void testFindByPKTBLSeriesID(){
		
		List<InstanceDicomEntity> instances = instanceDao.findBySeriesId("");
		
		for(InstanceDicomEntity instance : instances){
			//print instance
			LOG.info("instance: {}", instance);				
			//get series
			SeriesDicomEntity series = instance.getSeries();				
			LOG.info("series: {}", series.toString());			
			//get study
			StudyDicomEntity study = series.getStudy();				
			LOG.info("study: {}", study.toString());
			//get patient
			PatientDicomEntity patient = study.getPatient();
			LOG.info("patient: {}", patient.toString());
			
			LOG.info("-----------------------------------------------------------------------------------------------------------------");		
		}
	}
	
	@Ignore
	@Test
	@Rollback(false)
	public void testInstanceObject(){
		
		InstanceDicomEntity instance = new InstanceDicomEntity();
		instance.setKvp("8");
		instance.setPixelSpacing(2.56f);
		instance.setInstanceNumber(1);
		instance.setImageType("CT Image");
		
		SeriesDicomEntity series = new SeriesDicomEntity();		
		series.setOperatorsName("Elizabeth Uranus");
		series.setSeriesNumber(1);
		series.setSeriesDescription("CT Image with over 100 images");		
			
		
		StudyDicomEntity study = new StudyDicomEntity();
		study.setReferringPhysicianName("Anderson Yola");
		study.setStudyID("4593DB");
		study.setStudyDateTime(Calendar.getInstance().getTime());
		
		
		PatientDicomEntity patient = new PatientDicomEntity();
		patient.setPatientId("451123");
		patient.setPatientName("Nomine^Alerta");
		patient.setPatientAge("45F");
		patient.setPatientSex("F");
		patient.setPatientBirthday(Calendar.getInstance().getTime());

		study.setPatient(patient);
		series.setStudy(study);	
		instance.setSeries(series);
				
		//IDs start as null
		assertEquals((Long) null, instance.getId());
		assertEquals((Long) null, series.getId());
		assertEquals((Long) null, study.getId());
		assertEquals((Long) null, patient.getId());	
		
		
		testList();		
		instanceDao.save(instance);		
		
		assertNotNull(instance.getId());
		assertNotNull(series.getId());
		assertNotNull(study.getId());
		assertNotNull(patient.getId());
		
		//you need to test Equipment separately because it is one-To-One
		EquipmentDicomEntity equipment = new EquipmentDicomEntity();
		equipment.setInstitutionName("St. Vincent");
		equipment.setDeviceSerialNumber("897423587");
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
	public void testAllInstancesByPatientID(){
		
		List<InstanceDicomEntity> instances = instanceDao.findAllByPatientId("");
		assertEquals(0, instances.size());
		
		instances = instanceDao.findAllByPatientId("");
		assertTrue(instances.size() > 0);
		
		int i=0;
		for(InstanceDicomEntity instance : instances){
			//print instance
			LOG.info(++i + "- instance: {}", instance);				
			//get series
			SeriesDicomEntity series = instance.getSeries();				
			LOG.info("series: {}", series.toString());			
			//get study
			StudyDicomEntity study = series.getStudy();				
			LOG.info("study: {}", study.toString());
			//get patient
			PatientDicomEntity patient = study.getPatient();
			LOG.info("patient: {}", patient.toString());
		}
		
		if(i==0)
			LOG.info("No instance found!");
	}
	
}
