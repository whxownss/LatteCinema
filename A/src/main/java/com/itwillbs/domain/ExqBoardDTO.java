package com.itwillbs.domain;

import java.sql.Timestamp;

public class ExqBoardDTO {
	private int exqIdx;
	private String exqSubject;
	private String exqContent;
	private String exqSelect;
	private String createUser;
	private Timestamp createDate;
	private String updateUser;
	private Timestamp updateDate;
	private int rn;
	
	public int getExqIdx() {
		return exqIdx;
	}
	public void setExqIdx(int exqIdx) {
		this.exqIdx = exqIdx;
	}
	public String getExqSubject() {
		return exqSubject;
	}
	public void setExqSubject(String exqSubject) {
		this.exqSubject = exqSubject;
	}
	public String getExqContent() {
		return exqContent;
	}
	public void setExqContent(String exqContent) {
		this.exqContent = exqContent;
	}
	public String getExqSelect() {
		return exqSelect;
	}
	public void setExqSelect(String exqSelect) {
		this.exqSelect = exqSelect;
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
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		this.rn = rn;
	}
	@Override
	public String toString() {
		return "ExqBoardDTO [exqIdx=" + exqIdx + ", exqSubject=" + exqSubject + ", exqContent=" + exqContent
				+ ", exqSelect=" + exqSelect + ", createUser=" + createUser + ", createDate=" + createDate
				+ ", updateUser=" + updateUser + ", updateDate=" + updateDate + ", rn=" + rn + "]";
	}
	
	
}
