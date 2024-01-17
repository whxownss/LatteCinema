package com.itwillbs.domain;

import java.sql.Timestamp;

public class ReviewDTO {
	private String revNum;
	private String revComment;
	private Timestamp revDate;
	private String title;
	private String memId;
	private String movType;
	private String movIdx;
	
	@Override
	public String toString() {
		return "ReviewDTO [revNum=" + revNum + ", revComment=" + revComment + ", revDate=" + revDate + ", title="
				+ title + ", memId=" + memId + ", movType=" + movType + ", movIdx=" + movIdx + "]";
	}

	public String getRevNum() {
		return revNum;
	}

	public void setRevNum(String revNum) {
		this.revNum = revNum;
	}

	public String getRevComment() {
		return revComment;
	}

	public void setRevComment(String revComment) {
		this.revComment = revComment;
	}

	public Timestamp getRevDate() {
		return revDate;
	}

	public void setRevDate(Timestamp revDate) {
		this.revDate = revDate;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
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
	
	
	

	
	
}
