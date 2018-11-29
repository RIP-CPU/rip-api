package id.co.cpu.master.service;

import id.co.cpu.master.entity.Equipment;
import id.co.cpu.master.entity.Instance;
import id.co.cpu.master.entity.Patient;
import id.co.cpu.master.entity.Series;
import id.co.cpu.master.entity.Study;
import id.co.cpu.pacs.server.DicomReader;


public interface DBService {

	public void buildEntities(DicomReader reader);
	Patient buildPatient(DicomReader reader);
	Study buildStudy(DicomReader reader,Patient patient);
	Series buildSeries(DicomReader reader, Study study);
	Equipment buildEquipment(DicomReader reader, Series series);
	Instance buildInstance(DicomReader reader, Series series);
}
