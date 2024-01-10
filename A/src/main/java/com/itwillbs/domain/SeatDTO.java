package com.itwillbs.domain;

public class SeatDTO {
	private String memId;
	private String loIdx;
	private String ciIdx;
	private String movType;
	private String schIdx;
	private String seatC;
	private String dateC;
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
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
	public String getMovType() {
		return movType;
	}
	public void setMovType(String movType) {
		this.movType = movType;
	}
	public String getSchIdx() {
		return schIdx;
	}
	public void setSchIdx(String schIdx) {
		this.schIdx = schIdx;
	}
	public String getSeatC() {
		return seatC;
	}
	public void setSeatC(String seatC) {
		this.seatC = seatC;
	}
	
	public String getDate() {
		return dateC;
	}
	public void setDate(String dateC) {
		this.dateC = dateC;
	}
	@Override
	public String toString() {
		return "SeatDTO [memId=" + memId + ", loIdx=" + loIdx + ", ciIdx=" + ciIdx + ", movType=" + movType
				+ ", schIdx=" + schIdx + ", seatC=" + seatC + ", dateC=" + dateC + "]";
	}
	
	
	
	
	
}
