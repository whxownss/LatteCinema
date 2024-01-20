package com.itwillbs.domain;

public class PointDTO {
	private String memId;
	private String pointPlus;
	private String pointMinus;
	private String pointDetail;
	private String pointDate;
	private String merchantUid;
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getPointPlus() {
		return pointPlus;
	}
	public void setPointPlus(String pointPlus) {
		this.pointPlus = pointPlus;
	}
	public String getPointMinus() {
		return pointMinus;
	}
	public void setPointMinus(String pointMinus) {
		this.pointMinus = pointMinus;
	}
	public String getPointDetail() {
		return pointDetail;
	}
	public void setPointDetail(String pointDetail) {
		this.pointDetail = pointDetail;
	}
	public String getPointDate() {
		return pointDate;
	}
	public void setPointDate(String pointDate) {
		this.pointDate = pointDate;
	}
	
	public String getMerchantUid() {
		return merchantUid;
	}
	public void setMerchantUid(String merchantUid) {
		this.merchantUid = merchantUid;
	}
	@Override
	public String toString() {
		return "PointDTO [memId=" + memId + ", pointPlus=" + pointPlus + ", pointMinus=" + pointMinus + ", pointDetail="
				+ pointDetail + ", pointDate=" + pointDate + ", merchantUid=" + merchantUid + "]";
	}
	
	
	
}
