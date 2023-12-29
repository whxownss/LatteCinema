package com.itwillbs.domain;

import java.sql.Timestamp;

public class ExqBoardDTO {
	private int exqIdx;
	private String exqSubject;
	private String exqContent;
	private String exqSelect;
	private String create_user;
	private Timestamp create_date;
	private String update_user;
	private Timestamp update_date;
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
	public String getCreate_user() {
		return create_user;
	}
	public void setCreate_user(String create_user) {
		this.create_user = create_user;
	}
	public Timestamp getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Timestamp create_date) {
		this.create_date = create_date;
	}
	public String getUpdate_user() {
		return update_user;
	}
	public void setUpdate_user(String update_user) {
		this.update_user = update_user;
	}
	public Timestamp getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Timestamp update_date) {
		this.update_date = update_date;
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
				+ ", exqSelect=" + exqSelect + ", create_user=" + create_user + ", create_date=" + create_date
				+ ", update_user=" + update_user + ", update_date=" + update_date + ", rn=" + rn + "]";
	}
	
	
}
