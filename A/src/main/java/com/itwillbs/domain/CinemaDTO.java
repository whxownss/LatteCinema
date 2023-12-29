package com.itwillbs.domain;

public class CinemaDTO {
	private String loIdx;
	private String ciIdx;
	private String ciName;
	private String ciOc;
	private String ciAddr;
	private String ciSNum;
	
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
	public String getCiName() {
		return ciName;
	}
	public void setCiName(String ciName) {
		this.ciName = ciName;
	}
	public String getCiOc() {
		return ciOc;
	}
	public void setCiOc(String ciOc) {
		this.ciOc = ciOc;
	}
	public String getCiAddr() {
		return ciAddr;
	}
	public void setCiAddr(String ciAddr) {
		this.ciAddr = ciAddr;
	}
	public String getCiSNum() {
		return ciSNum;
	}
	public void setCiSNum(String ciSNum) {
		this.ciSNum = ciSNum;
	}
	@Override
	public String toString() {
		return "CinemaDTO [loIdx=" + loIdx + ", ciIdx=" + ciIdx + ", ciName=" + ciName + ", ciOc=" + ciOc + ", ciAddr="
				+ ciAddr + ", ciSNum=" + ciSNum + "]";
	}
	
	
}
