package id.co.cpu.master.service;

import id.co.cpu.master.entity.EquipmentDicomEntity;
import id.co.cpu.master.entity.InstanceDicomEntity;
import id.co.cpu.master.entity.PatientDicomEntity;
import id.co.cpu.master.entity.SeriesDicomEntity;
import id.co.cpu.master.entity.StudyDicomEntity;
import id.co.cpu.pacs.server.DicomReader;


public interface DBService {

	public void buildEntities(DicomReader reader);
	PatientDicomEntity buildPatient(DicomReader reader);
	StudyDicomEntity buildStudy(DicomReader reader,PatientDicomEntity patient);
	SeriesDicomEntity buildSeries(DicomReader reader, StudyDicomEntity study);
	EquipmentDicomEntity buildEquipment(DicomReader reader, SeriesDicomEntity series);
	InstanceDicomEntity buildInstance(DicomReader reader, SeriesDicomEntity series);
}
