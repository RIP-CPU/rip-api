package id.co.cpu.pacs.service.impl;

import java.io.File;
import java.nio.file.Files;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import id.co.cpu.feign.service.file.FileMetadataService;
import id.co.cpu.pacs.component.ActiveDicoms;
import id.co.cpu.pacs.dao.DicomEquipmentRepo;
import id.co.cpu.pacs.dao.DicomInstanceRepo;
import id.co.cpu.pacs.dao.DicomPatientRepo;
import id.co.cpu.pacs.dao.DicomSeriesRepo;
import id.co.cpu.pacs.dao.DicomStudyRepo;
import id.co.cpu.pacs.entity.EquipmentDicomEntity;
import id.co.cpu.pacs.entity.InstanceDicomEntity;
import id.co.cpu.pacs.entity.PatientDicomEntity;
import id.co.cpu.pacs.entity.SeriesDicomEntity;
import id.co.cpu.pacs.entity.StudyDicomEntity;
import id.co.cpu.pacs.event.ImageStreamEvent;
import id.co.cpu.pacs.server.DicomReader;
import id.co.cpu.pacs.service.DicomBuilderService;
import id.co.cpu.pacs.utils.DicomEntityBuilder;


@Service
public class DicomBuilderServiceImpl implements DicomBuilderService {

	protected final Log LOGGER = LogFactory.getLog(getClass());
	
	@Autowired
	private DicomPatientRepo dicomPatientRepo;
	
	@Autowired
	private DicomStudyRepo dicomStudyRepo;
	
	@Autowired
	private DicomSeriesRepo dicomSeriesRepo;
	
	@Autowired
	private DicomEquipmentRepo dicomEquipmentRepo;	
	
	@Autowired
	private DicomInstanceRepo dicomInstanceRepo;
	
	@PersistenceContext(unitName = "rip")
	private EntityManager entityManager;
	
	@Autowired
	private ActiveDicoms activeDicoms;

	@Autowired
	@Qualifier("fileMetadataService")
	private FileMetadataService fileMetadataService;
	
	@Transactional
	@Override
	public PatientDicomEntity buildPatient(DicomReader reader) {
		LOGGER.info(String.format("In process; Patient Name: %s, Patient ID: %s", reader.getPatientName(), reader.getPatientID()));
		PatientDicomEntity patient = dicomPatientRepo.findByPatientId(reader.getPatientID());
		if(patient == null) {
			patient = DicomEntityBuilder.newPatient(reader.getPatientAge(), reader.getPatientBirthDay(), reader.getPatientID(), reader.getPatientName(), reader.getPatientSex());				
			dicomPatientRepo.save(patient);
			patient = dicomPatientRepo.findByPatientId(reader.getPatientID());
		}	
		return patient;
	}
	
	
	@Transactional
	@Override
	public StudyDicomEntity buildStudy(DicomReader reader,PatientDicomEntity patient) {
		StudyDicomEntity study = dicomStudyRepo.findByStudyInstanceUID(reader.getStudyInstanceUID());
		if(study == null) {
			study = DicomEntityBuilder.newStudy(reader.getAccessionNumber(), reader.getAdditionalPatientHistory(), reader.getAdmittingDiagnosesDescription(),
						reader.getReferringPhysicianName(), reader.getSeriesDateTime(), reader.getStudyID(), reader.getStudyDescription(), reader.getStudyInstanceUID(), reader.getStudyPriorityID(), 
						reader.getStudyStatusID());
			study.setPatient(patient);			
			dicomStudyRepo.save(study);	
			study = dicomStudyRepo.findByStudyInstanceUID(reader.getStudyInstanceUID());
		}	
		return study;
	}
	
	@Transactional
	@Override
	public SeriesDicomEntity buildSeries(DicomReader reader, StudyDicomEntity study) {
		SeriesDicomEntity series = dicomSeriesRepo.findBySeriesInstanceUIDAndSeriesNumber(reader.getSeriesInstanceUID(), reader.getSeriesNumber());			
		if(series == null) {
			series = DicomEntityBuilder.newSeries(reader.getBodyPartExamined(), reader.getLaterality(), reader.getOperatorsName(), reader.getPatientPosition(),
						reader.getProtocolName(), reader.getSeriesDateTime(), reader.getSeriesDescription(), reader.getSeriesInstanceUID(), reader.getSeriesNumber());
			series.setStudy(study);			
			dicomSeriesRepo.save(series);
			series = dicomSeriesRepo.findBySeriesInstanceUIDAndSeriesNumber(reader.getSeriesInstanceUID(), reader.getSeriesNumber());
		}		
		return series;
	}
	
	@Transactional
	@Override
	public EquipmentDicomEntity buildEquipment(DicomReader reader, SeriesDicomEntity series) {
		EquipmentDicomEntity equipment = dicomEquipmentRepo.findBySeries_Id(series.getId());
		if(equipment == null) {
			equipment = DicomEntityBuilder.newEquipment(reader.getConversionType(), reader.getDeviceSerialNumber(), reader.getInstitutionAddress(),			
					reader.getInstitutionName(), reader.getInstitutionalDepartmentName(), reader.getManufacturer(), reader.getManufacturerModelName(), 
					reader.getModality(), reader.getSoftwareVersion(), reader.getStationName());
			equipment.setSeries(series);		
			dicomEquipmentRepo.save(equipment);
			equipment = dicomEquipmentRepo.findBySeries_Id(series.getId());			
		}		
		return equipment;
	}
	
	@Transactional
	@Override
	public InstanceDicomEntity buildInstance(DicomReader reader, SeriesDicomEntity series) {
		InstanceDicomEntity instance = dicomInstanceRepo.findBySopInstanceUID(reader.getSOPInstanceUID());			
		if(instance == null){
			instance = DicomEntityBuilder.newInstance(  reader.getAcquisitionDateTime(), reader.getContentDateTime(), reader.getExposureTime(),
						reader.getImageOrientation(), reader.getImagePosition(), reader.getImageType(), reader.getInstanceNumber(), reader.getKvp(), 
						reader.getMediaStorageSopInstanceUID(), reader.getPatientOrientation(), reader.getPixelSpacing(), reader.getSliceLocation(),
						reader.getSliceThickness(), reader.getSopClassUID(), reader.getSOPInstanceUID(), reader.getTransferSyntaxUID(), 
						reader.getWindowCenter(), reader.getWindowWidth(), reader.getXrayTubeCurrent());				
			instance.setSeries(series);			
			dicomInstanceRepo.save(instance);
			instance = dicomInstanceRepo.findBySopInstanceUID(reader.getSOPInstanceUID());	
		} else {
			LOGGER.info(String.format("Instance already exists; SOP Instance UID %s, Instance Number %s", instance.getInstanceNumber(), instance.getInstanceNumber()));
		}		
		return instance;
	}
	
	@Transactional
	@Override
	public void buildEntities(DicomReader reader, ImageStreamEvent imageStream){
		try {
			System.err.println(imageStream.toString());
			PatientDicomEntity patient = buildPatient(reader);			
			activeDicoms.add(reader.getMediaStorageSopInstanceUID(), patient.toString());
			
			if(patient != null) {
				StudyDicomEntity study = buildStudy(reader, patient);				
				if(study != null){
					SeriesDicomEntity series = buildSeries(reader, study);		
					if(series != null){
						EquipmentDicomEntity equipment = buildEquipment(reader, series);						
						InstanceDicomEntity instance = buildInstance(reader, series);
						
						series.setModifiedDate(instance.getCreatedDate());
						dicomSeriesRepo.save(series);
						
						equipment.setModifiedDate(instance.getCreatedDate());
						dicomEquipmentRepo.save(equipment);
						
						study.setModifiedDate(instance.getCreatedDate());
						dicomStudyRepo.save(study);						
						
						patient.setModifiedDate(instance.getCreatedDate());
						dicomPatientRepo.save(patient);						
						
						LOGGER.info(String.format("Dicom Instance saved successfully! %s", instance.toString()));
					}
				}
			}
			activeDicoms.remove(reader.getMediaStorageSopInstanceUID());

			File file = imageStream.getFile();
			this.fileMetadataService.putFileDicomDcm(imageStream.getAePath(), file.getName(), Files.readAllBytes(file.toPath()));
			
			printStats(reader.getPatientName() + " "+ reader.getPatientID() + " " + reader.getPatientAge() + " " + reader.getPatientSex() + " Ended");
			
		} catch(Exception e) {
			e.printStackTrace();
			LOGGER.error(e.getMessage());
		} finally {
        	if(imageStream.getFile() != null)
        		imageStream.getFile().delete();
		}
		
	}	
	
	public void printStats(String status) {		
		LOGGER.info(String.format("%d %s %s [Active Threads: %d] ",Thread.currentThread().getId(), Thread.currentThread().getName(), status, Thread.activeCount()));
	}
	
}
