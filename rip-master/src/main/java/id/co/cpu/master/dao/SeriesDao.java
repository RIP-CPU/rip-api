package id.co.cpu.master.dao;


import java.util.List;

import id.co.cpu.master.entity.Series;



public interface SeriesDao  {

	void save(Series series);
	Series update(Series series);
	List<Series> findAll(int firstResult, int maxResults);
	Long count();
	Series findById(long id);
	List<Series> findByStudyId(Long studyId);
	Series findBySeriesInstanceUID(String seriesInstanceUID);
	Series findBySeriesInstanceUID(String seriesInstanceUID, Integer seriesNumber);
	List<Series> findAllByPatientId(Long patientId);
}
