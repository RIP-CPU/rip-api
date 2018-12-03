package id.co.cpu.common.utils;

public enum ResourceCode {

	PROFILE("profile"),
	SECURITY("security"),
	MASTER("master"),
	GENERAL("general"),
	REPORT("report");
	
	private final String resourceId;

	ResourceCode(String resourceId) {
		this.resourceId = resourceId;
	}
	
	public String getResourceId() {
		return this.resourceId;
	}
	
}
