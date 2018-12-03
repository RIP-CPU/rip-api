package id.co.cpu.common.entity;

public enum ResourceCode {

	PROFILE("profile"),
	MASTER("master"),
	REPORT("report");
	
	private final String resourceId;

	ResourceCode(String resourceId) {
		this.resourceId = resourceId;
	}
	
	public String getResourceId() {
		return this.resourceId;
	}
	
}
