package com.itwillbs.domain;

public class AdmToolDTO {
	private String cancelTime;
	private String refundTime;
	private String p1Price;
	private String p2Price;
	private String p3Price;
	public String getCancelTime() {
		return cancelTime;
	}
	public void setCancelTime(String cancelTime) {
		this.cancelTime = cancelTime;
	}
	public String getRefundTime() {
		return refundTime;
	}
	public void setRefundTime(String refundTime) {
		this.refundTime = refundTime;
	}
	public String getP1Price() {
		return p1Price;
	}
	public void setP1Price(String p1Price) {
		this.p1Price = p1Price;
	}
	public String getP2Price() {
		return p2Price;
	}
	public void setP2Price(String p2Price) {
		this.p2Price = p2Price;
	}
	public String getP3Price() {
		return p3Price;
	}
	public void setP3Price(String p3Price) {
		this.p3Price = p3Price;
	}
	@Override
	public String toString() {
		return "AdmToolDTO [cancelTime=" + cancelTime + ", refundTime=" + refundTime + ", p1Price=" + p1Price
				+ ", p2Price=" + p2Price + ", p3Price=" + p3Price + "]";
	}
	
	
}
