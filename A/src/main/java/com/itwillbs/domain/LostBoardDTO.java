package com.itwillbs.domain;

import java.sql.Timestamp;

public class LostBoardDTO {
	private String lostIdx;
	private String loIdx;
	private String ciIdx;
	private String lostSubject;
	private String lostContent;
	private String lostResponse;
	private String lostStatus;
	private String createUser;
	private Timestamp createDate;
	private String responseUser;
	private Timestamp responseDate;
	private String ciName;
	private int rn;
	public String getLostIdx() {
		return lostIdx;
	}
	public void setLostIdx(String lostIdx) {
		this.lostIdx = lostIdx;
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
	public String getLostSubject() {
		return lostSubject;
	}
	public void setLostSubject(String lostSubject) {
		this.lostSubject = lostSubject;
	}
	public String getLostContent() {
		return lostContent;
	}
	public void setLostContent(String lostContent) {
		this.lostContent = lostContent;
	}
	public String getLostResponse() {
		return lostResponse;
	}
	public void setLostResponse(String lostResponse) {
		this.lostResponse = lostResponse;
	}
	public String getLostStatus() {
		return lostStatus;
	}
	public void setLostStatus(String lostStatus) {
		this.lostStatus = lostStatus;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public Timestamp getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	public String getResponseUser() {
		return responseUser;
	}
	public void setResponseUser(String responseUser) {
		this.responseUser = responseUser;
	}
	public Timestamp getResponseDate() {
		return responseDate;
	}
	public void setResponseDate(Timestamp responseDate) {
		this.responseDate = responseDate;
	}
	public String getCiName() {
		return ciName;
	}
	public void setCiName(String ciName) {
		this.ciName = ciName;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	@Override
	public String toString() {
		return "LostBoardDTO [lostIdx=" + lostIdx + ", loIdx=" + loIdx + ", ciIdx=" + ciIdx + ", lostSubject="
				+ lostSubject + ", lostContent=" + lostContent + ", lostResponse=" + lostResponse + ", lostStatus="
				+ lostStatus + ", createUser=" + createUser + ", createDate=" + createDate + ", responseUser="
				+ responseUser + ", responseDate=" + responseDate + ", ciName=" + ciName + ", rn=" + rn + "]";
	}
	
	
}
