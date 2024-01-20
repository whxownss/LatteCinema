package com.itwillbs.domain;

import java.sql.Timestamp;

public class StorePayDTO {
	private String memId;
	private String payIdx;
	private String paidAmount;
	private String payMethod;
	private String cardName;
	private String cardNumber;
	private String buyerTel;
	private String success;
	private String status;
	private String buyerName;
	private String merchantUid;
	private String itemCnt;
	private String name;
	private String giftMsg;
	private String giftTel;
	//마이페이지 구매내역을 위한 추가 작업
	private String payTime;
	private String memName;
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getPayIdx() {
		return payIdx;
	}
	public void setPayIdx(String payIdx) {
		this.payIdx = payIdx;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
	public String getItemCnt() {
		return itemCnt;
	}
	public void setItemCnt(String itemCnt) {
		this.itemCnt = itemCnt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGiftMsg() {
		return giftMsg;
	}
	public void setGiftMsg(String giftMsg) {
		this.giftMsg = giftMsg;
	}
	public String getGiftTel() {
		return giftTel;
	}
	public void setGiftTel(String giftTel) {
		this.giftTel = giftTel;
	}
	public String getPayTime() {
		return payTime;
	}
	public void setPayTime(String payTime) {
		this.payTime = payTime;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	@Override
	public String toString() {
		return "StorePayDTO [memId=" + memId + ", payIdx=" + payIdx + ", paidAmount=" + paidAmount + ", payMethod="
				+ payMethod + ", cardName=" + cardName + ", cardNumber=" + cardNumber + ", buyerTel=" + buyerTel
				+ ", success=" + success + ", status=" + status + ", buyerName=" + buyerName + ", merchantUid="
				+ merchantUid + ", itemCnt=" + itemCnt + ", name=" + name + ", giftMsg=" + giftMsg + ", giftTel="
				+ giftTel + ", payTime=" + payTime + ", memName=" + memName + "]";
	}
	
		
	
}
