package com.itwillbs.domain;

import java.sql.Timestamp;

public class MemberDTO {
	private String idx;
	private String id;
	private String pass;
	private String name;
	private String phone;
	private String address;
	private String birth;
	private String eMail;
	private Timestamp date;
	
	
	
	
	
	
	@Override
	public String toString() {
		return "MemberDTO [idx=" + idx + ", id=" + id + ", pass=" + pass + ", name=" + name + ", phone=" + phone
				+ ", address=" + address + ", birth=" + birth + ", eMail=" + eMail + ", date=" + date + "]";
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}


	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String geteMail() {
		return eMail;
	}

	public void seteMail(String eMail) {
		this.eMail = eMail;
	}


	
		
	
}
