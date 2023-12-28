package com.itwillbs.domain;

import java.sql.Timestamp;

public class CenterBoardDTO {
	private int centerIdx;
	private int loIdx;
	private int ciIdx;
	private String centerSubject;
	private String centerContent;
	private String createUser;
	private Timestamp createDate;
	private String updateUser;
	private Timestamp updateDate;
	private String ciName; //시네마 이름(영화관이름->부산본점, 서면 등등)
	private int rn;
	public int getCenterIdx() {
		return centerIdx;
	}
	public void setCenterIdx(int centerIdx) {
		this.centerIdx = centerIdx;
	}
	public int getLoIdx() {
		return loIdx;
	}
	public void setLoIdx(int loIdx) {
		this.loIdx = loIdx;
	}
	public int getCiIdx() {
		return ciIdx;
	}
	public void setCiIdx(int ciIdx) {
		this.ciIdx = ciIdx;
	}
	public String getCenterSubject() {
		return centerSubject;
	}
	public void setCenterSubject(String centerSubject) {
		this.centerSubject = centerSubject;
	}
	public String getCenterContent() {
		return centerContent;
	}
	public void setCenterContent(String centerContent) {
		this.centerContent = centerContent;
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
	public String getUpdateUser() {
		return updateUser;
	}
	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}
	public Timestamp getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
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
		return "CenterBoardDTO [centerIdx=" + centerIdx + ", loIdx=" + loIdx + ", ciIdx=" + ciIdx + ", centerSubject="
				+ centerSubject + ", centerContent=" + centerContent + ", createUser=" + createUser + ", createDate="
				+ createDate + ", updateUser=" + updateUser + ", updateDate=" + updateDate + ", ciName=" + ciName
				+ ", rn=" + rn + "]";
	}
	
	
	
}
