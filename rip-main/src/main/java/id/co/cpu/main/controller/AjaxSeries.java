package id.co.cpu.main.controller;

import id.co.cpu.pacs.entity.SeriesDicomEntity;

public class AjaxSeries {

	private Boolean success;
	private SeriesDicomEntity series;
	
	public AjaxSeries(Boolean success, SeriesDicomEntity series){
		this.success = success;
		this.series = series;
	}

	public Boolean getSuccess() {
		return success;
	}

	public void setSuccess(Boolean success) {
		this.success = success;
	}

	public SeriesDicomEntity getSeries() {
		return series;
	}

	public void setSeries(SeriesDicomEntity series) {
		this.series = series;
	}
}
