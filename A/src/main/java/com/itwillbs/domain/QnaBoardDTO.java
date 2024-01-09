package com.itwillbs.domain;

public class QnaBoardDTO {
	private String qnaIdx;
	private String qnaCategory;
	private String qnaSubject;
	private String qnaContent;
	private String qnaResponse;
	private String createUser;
	private String createDate;
	private String responseUser;
	private String responseDate;
	private int rn;
	private String qnaSecret;
	public String getQnaSecret() {
		return qnaSecret;
	}
	public void setQnaSecret(String qnaSecret) {
		this.qnaSecret = qnaSecret;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	public String getQnaIdx() {
		return qnaIdx;
	}
	public void setQnaIdx(String qnaIdx) {
		this.qnaIdx = qnaIdx;
	}
	public String getQnaCategory() {
		return qnaCategory;
	}
	public void setQnaCategory(String qnaCategory) {
		this.qnaCategory = qnaCategory;
	}
	public String getQnaSubject() {
		return qnaSubject;
	}
	public void setQnaSubject(String qnaSubject) {
		this.qnaSubject = qnaSubject;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public String getQnaResponse() {
		return qnaResponse;
	}
	public void setQnaResponse(String qnaResponse) {
		this.qnaResponse = qnaResponse;
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
	@Override
	public String toString() {
		return "QnaBoardDTO [qnaIdx=" + qnaIdx + ", qnaCategory=" + qnaCategory + ", qnaSubject=" + qnaSubject
				+ ", qnaContent=" + qnaContent + ", qnaResponse=" + qnaResponse + ", createUser=" + createUser
				+ ", createDate=" + createDate + ", responseUser=" + responseUser + ", responseDate=" + responseDate
				+ ", rn=" + rn + ", qnaSecret=" + qnaSecret + "]";
	}
	
	
	
}
