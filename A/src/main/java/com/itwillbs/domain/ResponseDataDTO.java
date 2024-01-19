package com.itwillbs.domain;

public class ResponseDataDTO {
	private int resDataIdx;
	private String qnaIdx;
	private String lostIdx;
	private String createUser;
	private String createDate;
	private String subject;
	private String response;
	private String responseUser;
	private String responseDate;
	private String boardGB;
	public int getResDataIdx() {
		return resDataIdx;
	}
	public void setResDataIdx(int resDataIdx) {
		this.resDataIdx = resDataIdx;
	}
	public String getQnaIdx() {
		return qnaIdx;
	}
	public void setQnaIdx(String qnaIdx) {
		this.qnaIdx = qnaIdx;
	}
	public String getLostIdx() {
		return lostIdx;
	}
	public void setLostIdx(String lostIdx) {
		this.lostIdx = lostIdx;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getResponse() {
		return response;
	}
	public void setResponse(String response) {
		this.response = response;
	}
	public String getResponseUser() {
		return responseUser;
	}
	public void setResponseUser(String responseUser) {
		this.responseUser = responseUser;
	}
	public String getResponseDate() {
		return responseDate;
	}
	public void setResponseDate(String responseDate) {
		this.responseDate = responseDate;
	}
	public String getBoardGB() {
		return boardGB;
	}
	public void setBoardGB(String boardGB) {
		this.boardGB = boardGB;
	}
	@Override
	public String toString() {
		return "ResponseDataDTO [resDataIdx=" + resDataIdx + ", qnaIdx=" + qnaIdx + ", lostIdx=" + lostIdx
				+ ", createUser=" + createUser + ", createDate=" + createDate + ", subject=" + subject + ", response="
				+ response + ", responseUser=" + responseUser + ", responseDate=" + responseDate + ", boardGB="
				+ boardGB + "]";
	}
	
	
	
}
