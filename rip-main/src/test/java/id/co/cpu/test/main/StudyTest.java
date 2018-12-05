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

import id.co.cpu.master.dao.StudyDao;
import id.co.cpu.master.entity.PatientDicomEntity;
import id.co.cpu.master.entity.StudyDicomEntity;
import junit.framework.TestCase;


@Transactional
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = ApplicationTest.class)
@WebAppConfiguration
public class StudyTest extends TestCase{

	private static final Logger LOG = LoggerFactory.getLogger(StudyTest.class);
	
	@Autowired
	StudyDao studyDao;	
	
	@Ignore
	@Test	
	public void testList(){		
		
		List<StudyDicomEntity> studies = studyDao.findAll(1,10);
		
		for(StudyDicomEntity study : studies){
			PatientDicomEntity patient = study.getPatient();
			LOG.info("Patient: {}", patient.toString());
			LOG.info("Study: {}", study.toString());
			LOG.info("-----------------------------------------------------------------------------------------------------------------");
		}		
	}
	
	@Test	
	@Ignore
	@Rollback(false)
	public void testInsert(){
		
		StudyDicomEntity study = new StudyDicomEntity();
		study.setReferringPhysicianName("john doe");
		study.setStudyID("Zra12344");
		study.setStudyDateTime(Calendar.getInstance().getTime());

		PatientDicomEntity patient = new PatientDicomEntity();
		patient.setPatientId("RA299111");
		patient.setPatientName("Albert Doe");
		patient.setPatientAge("26M");
		patient.setPatientSex("M");
		patient.setPatientBirthday(Calendar.getInstance().getTime());

		study.setPatient(patient);

		//IDs start as null
		assertEquals((Long) null, study.getId());
		assertEquals((Long) null, patient.getId());		
		
		studyDao.save(study);
		
		testList();
	}
	
	
	@Test	
	@Ignore
	public void testFindByID(){
		//test a null study object that does not exist
		StudyDicomEntity study = studyDao.findById("");		
		LOG.info(study.toString());
		assertNotNull(study);
	}	
	
	@Ignore
	@Test
	public void testFindByStudyInstanceUID(){		
		StudyDicomEntity study = studyDao.findByStudyInstanceUID("2.16.840.1.114151.4.887.42082.8558.2202495");
		assertNotNull(study);
		LOG.info(study.toString());
	}
	
	@Test
	@Ignore
	public void testFindByPatientID(){
		List<StudyDicomEntity> studies = studyDao.findByPatientId("");
		for(StudyDicomEntity study : studies){
			PatientDicomEntity patient = study.getPatient();
			LOG.info("Patient: {}", patient.toString());
			LOG.info("Study: {}", study.toString());
			LOG.info("-----------------------------------------------------------------------------------------------------------------");
		}
	}
}
