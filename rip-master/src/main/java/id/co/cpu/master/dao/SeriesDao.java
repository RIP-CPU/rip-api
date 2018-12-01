package id.co.cpu.master.dao;


import java.util.List;

import id.co.cpu.master.entity.Series;



public interface SeriesDao  {

	void save(Series series);
	Series update(Series series);
	List<Series> findAll(int firstResult, int maxResults);
	Long count();
	Series findById(String id);
	List<Series> findByStudyId(String studyId);
	Series findBySeriesInstanceUID(String seriesInstanceUID);
	Series findBySeriesInstanceUID(String seriesInstanceUID, Integer seriesNumber);
	List<Series> findAllByPatientId(String patientId);
}
