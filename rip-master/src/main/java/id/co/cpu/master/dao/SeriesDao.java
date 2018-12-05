package id.co.cpu.master.dao;


import java.util.List;

import id.co.cpu.master.entity.SeriesDicomEntity;



public interface SeriesDao  {

	void save(SeriesDicomEntity series);
	SeriesDicomEntity update(SeriesDicomEntity series);
	List<SeriesDicomEntity> findAll(int firstResult, int maxResults);
	Long count();
	SeriesDicomEntity findById(String id);
	List<SeriesDicomEntity> findByStudyId(String studyId);
	SeriesDicomEntity findBySeriesInstanceUID(String seriesInstanceUID);
	SeriesDicomEntity findBySeriesInstanceUID(String seriesInstanceUID, Integer seriesNumber);
	List<SeriesDicomEntity> findAllByPatientId(String patientId);
}
