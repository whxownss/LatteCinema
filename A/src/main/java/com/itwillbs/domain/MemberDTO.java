package com.itwillbs.domain;

import java.sql.Timestamp;

public class MemberDTO {
	private String memIdx;
	private String memId;
	private String memPass;
	private String memName;
	private String memPhone;
	private String memAddress;
	private String memBirthD;
	private String memEmail;
	private Timestamp memJoinD;
	private String memStatus;
	private String memStopD;
	private String memDeleteD;
	private String memPoint;
	private String memGift;
	
	public String getMemPoint() {
		return memPoint;
	}
	public void setMemPoint(String memPoint) {
		this.memPoint = memPoint;
	}
	public String getMemGift() {
		return memGift;
	}
	public void setMemGift(String memGift) {
		this.memGift = memGift;
	}
	public String getMemIdx() {
		return memIdx;
	}
	public void setMemIdx(String memIdx) {
		this.memIdx = memIdx;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPass() {
		return memPass;
	}
	public void setMemPass(String memPass) {
		this.memPass = memPass;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public String getMemAddress() {
		return memAddress;
	}
	public void setMemAddress(String memAddress) {
		this.memAddress = memAddress;
	}
	public String getMemBirthD() {
		return memBirthD;
	}
	public void setMemBirthD(String memBirthD) {
		this.memBirthD = memBirthD;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public Timestamp getMemJoinD() {
		return memJoinD;
	}
	public void setMemJoinD(Timestamp memJoinD) {
		this.memJoinD = memJoinD;
	}
	public String getMemStatus() {
		return memStatus;
	}
	public void setMemStatus(String memStatus) {
		this.memStatus = memStatus;
	}
	public String getMemStopD() {
		return memStopD;
	}
	public void setMemStopD(String memStopD) {
		this.memStopD = memStopD;
	}
	
	public String getMemDeleteD() {
		return memDeleteD;
	}
	public void setMemDeleteD(String memDeleteD) {
		this.memDeleteD = memDeleteD;
	}
	@Override
	public String toString() {
		return "MemberDTO [memIdx=" + memIdx + ", memId=" + memId + ", memPass=" + memPass + ", memName=" + memName
				+ ", memPhone=" + memPhone + ", memAddress=" + memAddress + ", memBirthD=" + memBirthD + ", memEmail="
				+ memEmail + ", memJoinD=" + memJoinD + ", memStatus=" + memStatus + ", memStopD=" + memStopD
				+ ", memDeleteD=" + memDeleteD + ", memPoint=" + memPoint + ", memGift=" + memGift + "]";
	}

	
	
		
	
}
