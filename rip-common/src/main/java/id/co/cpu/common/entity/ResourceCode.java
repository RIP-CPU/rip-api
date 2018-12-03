package id.co.cpu.common.entity;

public enum ResourceCode {

	PROFILE("profile"),
	SECURITY("security"),
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
