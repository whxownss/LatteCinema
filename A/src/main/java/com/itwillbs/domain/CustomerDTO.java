package com.itwillbs.domain;

public class CustomerDTO {
	private String idx;
	private String name;
	private String age;
	private String eMail;
	private String jumin;
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String geteMail() {
		return eMail;
	}
	public void seteMail(String eMail) {
		this.eMail = eMail;
	}
	public String getJumin() {
		return jumin;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}
	@Override
	public String toString() {
		return "CustomerDTO [idx=" + idx + ", name=" + name + ", age=" + age + ", eMail=" + eMail + ", jumin=" + jumin
				+ "]";
	}
	
	
}
