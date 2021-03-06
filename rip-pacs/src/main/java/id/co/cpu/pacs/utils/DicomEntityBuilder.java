package id.co.cpu.pacs.utils;

import java.util.Date;

import id.co.cpu.pacs.entity.EquipmentDicomEntity;
import id.co.cpu.pacs.entity.InstanceDicomEntity;
import id.co.cpu.pacs.entity.PatientDicomEntity;
import id.co.cpu.pacs.entity.SeriesDicomEntity;
import id.co.cpu.pacs.entity.StudyDicomEntity;

public class DicomEntityBuilder {
	
	public static PatientDicomEntity newPatient(String patientAge, Date patientBirthday, String patientID, String patientName, String patientSex){
		
		PatientDicomEntity patient = new PatientDicomEntity();
		patient.setPatientAge(patientAge);
		patient.setPatientBirthday(patientBirthday);
		patient.setPatientId(patientID);
		patient.setPatientName(patientName);
		patient.setPatientSex(patientSex);
		
		return patient;
	}
	
	public static StudyDicomEntity newStudy(String accessionNumber, String additionalPatientHistory, String admittingDiagnosesDescription, 
			String referringPhysicianName, Date studyDateTime, String studyID, String studyDescription, String studyInstanceUID,	String studyPriorityID, 
			String studyStatusID){
		
		StudyDicomEntity study = new StudyDicomEntity();
		study.setAccessionNumber(accessionNumber);
		study.setAdditionalPatientHistory(additionalPatientHistory);
		study.setAdmittingDiagnosesDescription(admittingDiagnosesDescription);		
		study.setReferringPhysicianName(referringPhysicianName);
		study.setStudyDateTime(studyDateTime);
		study.setStudyId(studyID);
		study.setStudyDescription(studyDescription);
		study.setStudyInstanceUID(studyInstanceUID);
		study.setStudyPriorityID(studyPriorityID);
		study.setStudyStatusID(studyStatusID);
		
		return study;
	}
	
	public static SeriesDicomEntity newSeries(String bodyPartExamined, String laterality, String operatorsName, String patientPosition, String protocolName, 
			Date seriesDateTime, String seriesDescription, String seriesInstanceUID, Integer seriesNumber){
		
		SeriesDicomEntity series = new SeriesDicomEntity();
		series.setBodyPartExamined(bodyPartExamined);		
		series.setLaterality(laterality);
		series.setOperatorsName(operatorsName);
		series.setPatientPosition(patientPosition);
		series.setProtocolName(protocolName);
		series.setSeriesDateTime(seriesDateTime);
		series.setSeriesDescription(seriesDescription);
		series.setSeriesInstanceUID(seriesInstanceUID);
		series.setSeriesNumber(seriesNumber);
		
		return series;
	}
	
	public static EquipmentDicomEntity newEquipment(String conversionType, String deviceSerialNumber, String institutionAddress, String institutionName, 
			String institutionalDepartmentName, String manufacturer, String manufacturerModelName, String modality, String softwareVersion, 
			String stationName){
		
		EquipmentDicomEntity equipment = new EquipmentDicomEntity();
		equipment.setConversionType(conversionType);
		equipment.setDeviceSerialNumber(deviceSerialNumber);
		equipment.setInstitutionAddress(institutionAddress);
		equipment.setInstitutionName(institutionName);
		equipment.setInstitutionalDepartmentName(institutionalDepartmentName);
		equipment.setManufacturer(manufacturer);
		equipment.setManufacturerModelName(manufacturerModelName);
		equipment.setModality(modality);
		equipment.setSoftwareVersion(softwareVersion);
		equipment.setStationName(stationName);
		
		return equipment;
	}
	
	public static InstanceDicomEntity newInstance(Date acquisitionDateTime, Date contentDateTime, Integer exposureTime, String imageOrientation, String imagePosition,
			String imageType, Integer instanceNumber, String kvp, String mediaStorageSopInstanceUID, String patientOrientation, Float pixelSpacing,
			Float sliceLocation, Float sliceThickness, String sopClassUID, String sopInstanceUID, String transferSyntaxUID, String windowCenter, 
			String windowWidth, Integer xrayTubeCurrent){
		
		InstanceDicomEntity instance = new InstanceDicomEntity();
		instance.setAcquisitionDateTime(acquisitionDateTime);
		instance.setContentDateTime(contentDateTime);
		instance.setExposureTime(exposureTime);
		instance.setImageOrientation(imageOrientation);
		instance.setImagePosition(imagePosition);
		instance.setImageType(imageType);
		instance.setInstanceNumber(instanceNumber);
		instance.setKvp(kvp);
		instance.setMediaStorageSopInstanceUID(mediaStorageSopInstanceUID);
		instance.setPatientOrientation(patientOrientation);
		instance.setPixelSpacing(pixelSpacing);
		instance.setSliceLocation(sliceLocation);
		instance.setSliceThickness(sliceThickness);
		instance.setSopClassUID(sopClassUID);
		instance.setSopInstanceUID(sopInstanceUID);
		instance.setTransferSyntaxUID(transferSyntaxUID);
		instance.setWindowCenter(windowCenter);
		instance.setWindowWidth(windowWidth);
		instance.setXrayTubeCurrent(xrayTubeCurrent);
		
		return instance;
	}
	
	
}
