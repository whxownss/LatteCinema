package com.itwillbs.domain;

import java.sql.Timestamp;

public class ScheduleDTO {
	private String loIdx; 
	private String ciIdx;
	private String schIdx;
	private Timestamp schDate;
	private String schMovType;
	private String schMovIdx;
	private String schStime;
	private String schRun;
	private String schEtime;
	private String scrIdx;
	private String scrSeatAvail;
	
	private String title;
	private String scrSeat;
	private String rating;
	
	private String poster;
	private String pSum;
	
	private String loName;
	private String ciName;
	
	
	
	
	
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
	public Timestamp getSchDate() {
		return schDate;
	}
	public void setSchDate(Timestamp schDate) {
		this.schDate = schDate;
	}
	public String getSchMovType() {
		return schMovType;
	}
	public void setSchMovType(String schMovType) {
		this.schMovType = schMovType;
	}
	public String getSchMovIdx() {
		return schMovIdx;
	}
	public void setSchMovIdx(String schMovIdx) {
		this.schMovIdx = schMovIdx;
	}
	public String getSchStime() {
		return schStime;
	}
	public void setSchStime(String schStime) {
		this.schStime = schStime;
	}
	public String getSchRun() {
		return schRun;
	}
	public void setSchRun(String schRun) {
		this.schRun = schRun;
	}
	public String getSchEtime() {
		return schEtime;
	}
	public void setSchEtime(String schEtime) {
		this.schEtime = schEtime;
	}
	public String getScrIdx() {
		return scrIdx;
	}
	public void setScrIdx(String scrIdx) {
		this.scrIdx = scrIdx;
	}
	public String getScrSeatAvail() {
		return scrSeatAvail;
	}
	public void setScrSeatAvail(String scrSeatAvail) {
		this.scrSeatAvail = scrSeatAvail;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getScrSeat() {
		return scrSeat;
	}
	public void setScrSeat(String scrSeat) {
		this.scrSeat = scrSeat;
	}
	
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	
	public String getpSum() {
		return pSum;
	}
	public void setpSum(String pSum) {
		this.pSum = pSum;
	}
	
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	
	public String getLoName() {
		return loName;
	}
	public void setLoName(String loName) {
		this.loName = loName;
	}
	public String getCiName() {
		return ciName;
	}
	public void setCiName(String ciName) {
		this.ciName = ciName;
	}
	@Override
	public String toString() {
		return "ScheduleDTO [loIdx=" + loIdx + ", ciIdx=" + ciIdx + ", schIdx=" + schIdx + ", schDate=" + schDate
				+ ", schMovType=" + schMovType + ", schMovIdx=" + schMovIdx + ", schStime=" + schStime + ", schRun="
				+ schRun + ", schEtime=" + schEtime + ", scrIdx=" + scrIdx + ", scrSeatAvail=" + scrSeatAvail
				+ ", title=" + title + ", scrSeat=" + scrSeat + ", rating=" + rating + ", poster=" + poster + ", pSum="
				+ pSum + ", loName=" + loName + ", ciName=" + ciName + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
