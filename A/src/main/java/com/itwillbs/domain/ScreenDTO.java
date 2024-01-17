package com.itwillbs.domain;

public class ScreenDTO {
	private String loIdx;
	private String ciIdx;
	private String scrIdx;
	private String scrSeat;
	public String getLoIdx() {
		return loIdx;
	}
	public void setLoIdx(String loIdx) {
		this.loIdx = loIdx;
	}
	public String getCiIdx() {
		return ciIdx;
	}
	public void setCiIdx(String ciIdx) {
		this.ciIdx = ciIdx;
	}
	public String getScrIdx() {
		return scrIdx;
	}
	public void setScrIdx(String scrIdx) {
		this.scrIdx = scrIdx;
	}
	public String getScrSeat() {
		return scrSeat;
	}
	public void setScrSeat(String scrSeat) {
		this.scrSeat = scrSeat;
	}
	@Override
	public String toString() {
		return "ScreenDTO [loIdx=" + loIdx + ", ciIdx=" + ciIdx + ", scrIdx=" + scrIdx + ", scrSeat=" + scrSeat + "]";
	}
	
	
	
}
