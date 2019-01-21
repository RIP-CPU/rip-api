package id.co.cpu.pacs.service;

import java.io.File;

import id.co.cpu.pacs.entity.EquipmentDicomEntity;
import id.co.cpu.pacs.entity.InstanceDicomEntity;
import id.co.cpu.pacs.entity.PatientDicomEntity;
import id.co.cpu.pacs.entity.SeriesDicomEntity;
import id.co.cpu.pacs.entity.StudyDicomEntity;
import id.co.cpu.pacs.server.DicomReader;


public interface DicomBuilderService {

	public void buildEntities(DicomReader reader, File file);
	
	public PatientDicomEntity buildPatient(DicomReader reader);
	
	public StudyDicomEntity buildStudy(DicomReader reader,PatientDicomEntity patient);
	
	public SeriesDicomEntity buildSeries(DicomReader reader, StudyDicomEntity study);
	
	public EquipmentDicomEntity buildEquipment(DicomReader reader, SeriesDicomEntity series);
	
	public InstanceDicomEntity buildInstance(DicomReader reader, SeriesDicomEntity series);
	
}
