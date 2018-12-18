package id.co.cpu.main.controller;

import id.co.cpu.pacs.entity.InstanceDicomEntity;

public class AjaxInstance {

	private Boolean success;
	private InstanceDicomEntity instance;
	
	public AjaxInstance(Boolean success, InstanceDicomEntity instance){
		this.success = success;
		this.instance = instance;
	}
	
	public Boolean getSuccess() {
		return success;
	}

	public void setSuccess(Boolean success) {
		this.success = success;
	}
	
	public InstanceDicomEntity getInstance() {
		return instance;
	}

	public void setInstance(InstanceDicomEntity instance) {
		this.instance = instance;
	}

	
}
