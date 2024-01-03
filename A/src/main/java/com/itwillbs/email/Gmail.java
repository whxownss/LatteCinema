package com.itwillbs.email;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {

	// 인증 정보 관리 javax.mail.PasswordAuthentication
	// 클래스 타입 변수 선언
	PasswordAuthentication passwordAuthentication;

	// 기본 생성자 정의
	public Gmail() {
		passwordAuthentication = new PasswordAuthentication("brisk7700@gmail.com","boioivfnhsuwraib" );
	}
	
	// 인증정보를 관리하는 PasswordAuthentication 객체를 외부로 리턴하는 Getter 메서드 오버라이딩
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return passwordAuthentication;
	}

	
	
}
