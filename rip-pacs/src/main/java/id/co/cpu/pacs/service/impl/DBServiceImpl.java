package id.co.cpu.pacs.service.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import id.co.cpu.pacs.component.ActiveDicoms;
import id.co.cpu.pacs.dao.EquipmentDao;
import id.co.cpu.pacs.dao.InstanceDao;
import id.co.cpu.pacs.dao.PatientDao;
import id.co.cpu.pacs.dao.SeriesDao;
import id.co.cpu.pacs.dao.StudyDao;
import id.co.cpu.pacs.entity.EquipmentDicomEntity;
import id.co.cpu.pacs.entity.InstanceDicomEntity;
import id.co.cpu.pacs.entity.PatientDicomEntity;
import id.co.cpu.pacs.entity.SeriesDicomEntity;
import id.co.cpu.pacs.entity.StudyDicomEntity;
import id.co.cpu.pacs.server.DicomReader;
import id.co.cpu.pacs.service.DBService;
import id.co.cpu.pacs.utils.DicomEntityBuilder;


@Service
public class DBServiceImpl implements DBService {

	private static final Logger LOG = LoggerFactory.getLogger(DBServiceImpl.class);
	
	@Autowired
	InstanceDao instanceDao;
	
	@Autowired
	SeriesDao seriesDao;
	
	@Autowired
	StudyDao studyDao;
	
	@Autowired
	PatientDao patientDao;
	
	@Autowired
	EquipmentDao equipmentDao;	
	
	@PersistenceContext(unitName = "rip")
	private EntityManager entityManager;
	
	@Autowired
	private ActiveDicoms activeDicoms;
	
	
	@Transactional
	@Override
	public PatientDicomEntity buildPatient(DicomReader reader){		
		
		LOG.info("In process; Patient Name: {}, Patient ID: {}", reader.getPatientName(), reader.getPatientID());
		//check if patient exists
		PatientDicomEntity patient = patientDao.findByPatientId(reader.getPatientID());
		if(patient == null){//let's create new patient
			patient = DicomEntityBuilder.newPatient(reader.getPatientAge(), reader.getPatientBirthDay(), reader.getPatientID(), reader.getPatientName(), reader.getPatientSex());				
			patientDao.save(patient);
			patient = patientDao.findByPatientId(reader.getPatientID());
		}else{
			//LOG.info("Patient already exists; Patient Name: {}, Patient ID: {} ", reader.getPatientName(), reader.getPatientID());
		}
		
		return patient;
	}
	
	
	@Transactional
	@Override
	public StudyDicomEntity buildStudy(DicomReader reader,PatientDicomEntity patient){
		
		//check if study exists
		StudyDicomEntity study = studyDao.findByStudyInstanceUID(reader.getStudyInstanceUID());
		if(study == null){//let's create new study
			study = DicomEntityBuilder.newStudy(reader.getAccessionNumber(), reader.getAdditionalPatientHistory(), reader.getAdmittingDiagnosesDescription(),
						reader.getReferringPhysicianName(), reader.getSeriesDateTime(), reader.getStudyID(), reader.getStudyDescription(), reader.getStudyInstanceUID(), reader.getStudyPriorityID(), 
						reader.getStudyStatusID());
			study.setPatient(patient);			
			studyDao.save(study);	
			study = studyDao.findByStudyInstanceUID(reader.getStudyInstanceUID());
		}else{
			//LOG.info("Study already exists; Study Instance UID:  {}", study.getStudyInstanceUID());
		}
		
		return study;
	}
	
	@Transactional
	@Override
	public SeriesDicomEntity buildSeries(DicomReader reader, StudyDicomEntity study){
		
		//check if series exists
		SeriesDicomEntity series = seriesDao.findBySeriesInstanceUID(reader.getSeriesInstanceUID(), reader.getSeriesNumber());			
		if(series == null){//let's create new series
			series = DicomEntityBuilder.newSeries(reader.getBodyPartExamined(), reader.getLaterality(), reader.getOperatorsName(), reader.getPatientPosition(),
						reader.getProtocolName(), reader.getSeriesDateTime(), reader.getSeriesDescription(), reader.getSeriesInstanceUID(), reader.getSeriesNumber());
			series.setStudy(study);			
			seriesDao.save(series);
			series = seriesDao.findBySeriesInstanceUID(reader.getSeriesInstanceUID(), reader.getSeriesNumber());
		}else{
			//LOG.info("Series already exists; Series Instance UID: {}", series.getSeriesInstanceUID());
		}
		
		return series;
	}
	
	@Transactional
	@Override
	public EquipmentDicomEntity buildEquipment(DicomReader reader, SeriesDicomEntity series){
		
		//check if equipment exists
		EquipmentDicomEntity equipment = equipmentDao.findBySeriesId(series.getId());
		if(equipment == null){
			equipment = DicomEntityBuilder.newEquipment(reader.getConversionType(), reader.getDeviceSerialNumber(), reader.getInstitutionAddress(),			
					reader.getInstitutionName(), reader.getInstitutionalDepartmentName(), reader.getManufacturer(), reader.getManufacturerModelName(), 
					reader.getModality(), reader.getSoftwareVersion(), reader.getStationName());
			equipment.setSeries(series);//set the Series to Equipment because we now have the pkTBLSeriesID		
			equipmentDao.save(equipment);
			equipment = equipmentDao.findBySeriesId(series.getId());
			
		}else{
			//LOG.info("Equipment already exists; Equipment Primary ID {}", equipment.getPkTBLEquipmentID());
		}
		
		return equipment;
	}
	
	@Transactional
	@Override
	public InstanceDicomEntity buildInstance(DicomReader reader, SeriesDicomEntity series){
		
		//check first if instance exists
		InstanceDicomEntity instance = instanceDao.findBySopInstanceUID(reader.getSOPInstanceUID());			
		if(instance == null){//let's create new instance along with dependent objects
			instance = DicomEntityBuilder.newInstance(  reader.getAcquisitionDateTime(), reader.getContentDateTime(), reader.getExposureTime(),
						reader.getImageOrientation(), reader.getImagePosition(), reader.getImageType(), reader.getInstanceNumber(), reader.getKvp(), 
						reader.getMediaStorageSopInstanceUID(), reader.getPatientOrientation(), reader.getPixelSpacing(), reader.getSliceLocation(),
						reader.getSliceThickness(), reader.getSopClassUID(), reader.getSOPInstanceUID(), reader.getTransferSyntaxUID(), 
						reader.getWindowCenter(), reader.getWindowWidth(), reader.getXrayTubeCurrent());				
			instance.setSeries(series);			
			instanceDao.save(instance);
			instance = instanceDao.findBySopInstanceUID(reader.getSOPInstanceUID());
			
		}else{
				LOG.info("Instance already exists; SOP Instance UID {}, Instance Number {}", instance.getInstanceNumber(), instance.getInstanceNumber());
		}
		
		return instance;
	}
	
	// apply dicom logic; patient -> Nxstudy -> Nxseries -> Nxinstance
	@Transactional
	@Override
	public void buildEntities(DicomReader reader){
		
		try
		{		
			LOG.info("=================================================================================================================================");
			printStats(reader.getPatientName() + " "+ reader.getPatientID() + " " + reader.getPatientAge() + " " + reader.getPatientSex() + " Started");
			PatientDicomEntity patient = buildPatient(reader);			
			activeDicoms.add(reader.getMediaStorageSopInstanceUID(), patient.toString());
			
			if(patient != null)
			{				
				StudyDicomEntity study = buildStudy(reader, patient);				
				if(study != null){
					SeriesDicomEntity series = buildSeries(reader, study);		
					if(series != null){
						EquipmentDicomEntity equipment = buildEquipment(reader, series);//one2one relationship with series						
						InstanceDicomEntity instance = buildInstance(reader, series);
						
						//update entity modification dates according to the instance creation
						series.setModifiedDate(instance.getCreatedDate());
						seriesDao.save(series);
						
						equipment.setModifiedDate(instance.getCreatedDate());
						equipmentDao.save(equipment);
						
						study.setModifiedDate(instance.getCreatedDate());
						studyDao.save(study);						
						
						patient.setModifiedDate(instance.getCreatedDate());
						patientDao.save(patient);						
						
						//try{ entityManager.getTransaction().commit(); }	catch(Exception e){}
						
						LOG.info("Dicom Instance saved successfully! {}", instance.toString());
					}
				}
			}	
			
			
			//LOG.info("Yes {} exists!", reader.getMediaStorageSopInstanceUID());
			activeDicoms.remove(reader.getMediaStorageSopInstanceUID());
			
			printStats(reader.getPatientName() + " "+ reader.getPatientID() + " " + reader.getPatientAge() + " " + reader.getPatientSex() + " Ended");
			LOG.info("=================================================================================================================================");
			LOG.info("");
			
		}catch(Exception e){
			LOG.error(e.getMessage());
		}
		
	}	
	
	public void printStats(String status) {
		//String str = Thread.currentThread().getName().split("@@")[0];
		//Thread.currentThread().setName(String.valueOf(Thread.currentThread().getId()));		
		LOG.info("{} {} {} [Active Threads: {}] ",Thread.currentThread().getId(), Thread.currentThread().getName(), status, Thread.activeCount());		
		
	}
	
}
