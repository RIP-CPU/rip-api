package id.co.cpu.main.controller;

import id.co.cpu.pacs.entity.StudyDicomEntity;

public class AjaxStudy {

	private Boolean success;
	private StudyDicomEntity study;
	
	public AjaxStudy(Boolean success, StudyDicomEntity study){
		this.success = success;
		this.study = study;
	}
	
	public Boolean getSuccess() {
		return success;
	}

	public void setSuccess(Boolean success) {
		this.success = success;
	}

	public StudyDicomEntity getStudy() {
		return study;
	}

	public void setStudy(StudyDicomEntity study) {
		this.study = study;
	}	
}
