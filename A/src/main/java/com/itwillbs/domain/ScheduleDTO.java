package com.itwillbs.domain;

import java.sql.Time;
import java.sql.Timestamp;

public class ScheduleDTO {
	private String loIdx; 
	private String ciIdx;
	private String schIdx;
	private Timestamp schDate;
	private String schMovType;
	private String schMovIdx;
	private String schTime;
	private String schRun;
	private String scrIdx;
	private String scrSeatAvail;
	
	private String title;
	private String scrSeat;
	
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
	public String getSchTime() {
		return schTime;
	}
	public void setSchTime(String schTime) {
		this.schTime = schTime;
	}
	public String getSchRun() {
		return schRun;
	}
	public void setSchRun(String schRun) {
		this.schRun = schRun;
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
	@Override
	public String toString() {
		return "ScheduleDTO [loIdx=" + loIdx + ", ciIdx=" + ciIdx + ", schIdx=" + schIdx + ", schDate=" + schDate
				+ ", schMovType=" + schMovType + ", schMovIdx=" + schMovIdx + ", schTime=" + schTime + ", schRun="
				+ schRun + ", scrIdx=" + scrIdx + ", scrSeatAvail=" + scrSeatAvail + ", title=" + title + ", scrSeat="
				+ scrSeat + "]";
	}
	
	
	
	
	
	
}
