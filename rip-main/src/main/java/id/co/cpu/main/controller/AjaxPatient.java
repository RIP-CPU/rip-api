package id.co.cpu.main.controller;

import id.co.cpu.pacs.entity.PatientDicomEntity;

public class AjaxPatient {

	private Boolean success;
	private PatientDicomEntity patient;
	
	public AjaxPatient(Boolean success, PatientDicomEntity patient){
		this.success = success;
		this.patient = patient;
	}
	
	public Boolean getSuccess() {
		return success;
	}

	public void setSuccess(Boolean success) {
		this.success = success;
	}

	public PatientDicomEntity getPatient() {
		return patient;
	}

	public void setPatient(PatientDicomEntity patient) {
		this.patient = patient;
	}
}
