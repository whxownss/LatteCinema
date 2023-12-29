package com.itwillbs.domain;

public class LocationDTO {
	private String loIdx; 
	private String loName;
	
	
	public String getLoIdx() {
		return loIdx;
	}
	public void setLoIdx(String loIdx) {
		this.loIdx = loIdx;
	}
	public String getLoName() {
		return loName;
	}
	public void setLoName(String loName) {
		this.loName = loName;
	}
	@Override
	public String toString() {
		return "LocationDTO [loIdx=" + loIdx + ", loName=" + loName + "]";
	}
}
