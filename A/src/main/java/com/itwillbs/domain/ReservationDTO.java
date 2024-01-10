package com.itwillbs.domain;

public class ReservationDTO {
	private String resIdx;
	private String memId;
	private String loIdx;
	private String ciIdx;
	private String schIdx;
	private String scrIdx;
	private String movType; 
	private String movIdx;      
	private String date;  
	private String sTime;
	private String title;    
	private String cinema;   
	private String seat;     
	private String p1;     
	private String p2;     
	private String p3;     
	private String pSum;   
	private String paidAmount;   
	private String payMethod;
	private String cardName;
	private String cardNumber;
	private String buyerTel;
	private String success;
	private String resPayDate;
	private String buyerName;  	// 구매자 이름
	private String merchantUid;	// 주문번호
	
	
	public String getResIdx() {
		return resIdx;
	}
	public void setResIdx(String resIdx) {
		this.resIdx = resIdx;
	}
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
	public String getSchIdx() {
		return schIdx;
	}
	public void setSchIdx(String schIdx) {
		this.schIdx = schIdx;
	}
	public String getScrIdx() {
		return scrIdx;
	}
	public void setScrIdx(String scrIdx) {
		this.scrIdx = scrIdx;
	}
	public String getMovType() {
		return movType;
	}
	public void setMovType(String movType) {
		this.movType = movType;
	}
	public String getMovIdx() {
		return movIdx;
	}
	public void setMovIdx(String movIdx) {
		this.movIdx = movIdx;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	public String getsTime() {
		return sTime;
	}
	public void setsTime(String sTime) {
		this.sTime = sTime;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCinema() {
		return cinema;
	}
	public void setCinema(String cinema) {
		this.cinema = cinema;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public String getP1() {
		return p1;
	}
	public void setP1(String p1) {
		this.p1 = p1;
	}
	public String getP2() {
		return p2;
	}
	public void setP2(String p2) {
		this.p2 = p2;
	}
	public String getP3() {
		return p3;
	}
	public void setP3(String p3) {
		this.p3 = p3;
	}
	public String getpSum() {
		return pSum;
	}
	public void setpSum(String pSum) {
		this.pSum = pSum;
	}
	public String getPaidAmount() {
		return paidAmount;
	}
	public void setPaidAmount(String paidAmount) {
		this.paidAmount = paidAmount;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getCardName() {
		return cardName;
	}
	public void setCardName(String cardName) {
		this.cardName = cardName;
	}
	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	public String getBuyerTel() {
		return buyerTel;
	}
	public void setBuyerTel(String buyerTel) {
		this.buyerTel = buyerTel;
	}
	public String getSuccess() {
		return success;
	}
	public void setSuccess(String success) {
		this.success = success;
	}
	public String getResPayDate() {
		return resPayDate;
	}
	public void setResPayDate(String resPayDate) {
		this.resPayDate = resPayDate;
	}
	public String getBuyerName() {
		return buyerName;
	}
	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}
	public String getMerchantUid() {
		return merchantUid;
	}
	public void setMerchantUid(String merchantUid) {
		this.merchantUid = merchantUid;
	}
	@Override
	public String toString() {
		return "ReservationDTO [resIdx=" + resIdx + ", memId=" + memId + ", loIdx=" + loIdx + ", ciIdx=" + ciIdx
				+ ", schIdx=" + schIdx + ", scrIdx=" + scrIdx + ", movType=" + movType + ", movIdx=" + movIdx
				+ ", date=" + date + ", sTime=" + sTime + ", title=" + title + ", cinema=" + cinema + ", seat=" + seat
				+ ", p1=" + p1 + ", p2=" + p2 + ", p3=" + p3 + ", pSum=" + pSum + ", paidAmount=" + paidAmount
				+ ", payMethod=" + payMethod + ", cardName=" + cardName + ", cardNumber=" + cardNumber + ", buyerTel="
				+ buyerTel + ", success=" + success + ", resPayDate=" + resPayDate + ", buyerName=" + buyerName
				+ ", merchantUid=" + merchantUid + "]";
	}
	
	
	
	
	
	
}
