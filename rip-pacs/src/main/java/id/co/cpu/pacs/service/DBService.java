package id.co.cpu.pacs.service;

import id.co.cpu.pacs.entity.Equipment;
import id.co.cpu.pacs.entity.Instance;
import id.co.cpu.pacs.entity.Patient;
import id.co.cpu.pacs.entity.Series;
import id.co.cpu.pacs.entity.Study;
import id.co.cpu.pacs.server.DicomReader;


public interface DBService {

	public void buildEntities(DicomReader reader);
	Patient buildPatient(DicomReader reader);
	Study buildStudy(DicomReader reader,Patient patient);
	Series buildSeries(DicomReader reader, Study study);
	Equipment buildEquipment(DicomReader reader, Series series);
	Instance buildInstance(DicomReader reader, Series series);
}
