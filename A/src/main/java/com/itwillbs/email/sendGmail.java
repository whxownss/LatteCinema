package com.itwillbs.email;

import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

public class sendGmail {
	String sender = "brisk7700@gmail.com";
	String receiver = "";
	String title = "라떼시네마 회원가입 이메일 인증번호";
	String content ="인증번호 : " + "";
	
	try {
		// ----- 메일 전송에 필요한 설정 작업 -----

		
		// 시스템의 속성 정보를 관리하는 java.util.Properties 객체 리턴받기
		Properties properties = System.getProperties();
		
		// 메일 발송 프로토콜 정보 설정

		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
		
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.port", "587");

		// --------------------------------------------------
		// 메일 서버에 대한 인증 정보를 관리하는 사용자 정의 클래스 객체 생성	
		Authenticator authenticator = new Gmail();
		
		// 자바 메일의 기본 전송 단의를 javax.mail.Session 객체 단위로 처리
		// => Session 클래스 getDefaultInstance()메서드를 호출하여 파라미터로 서버정보와 인증정보를 객체 전달
		// => 주의! JSP 내장 객체인 HttpSession 객체 (변수명 session)와 별개의 객체이므로
		//	  변수명은 session이 아닌 다른이름 사용 필수!
		Session mailSession = Session.getDefaultInstance(properties, authenticator);
		
		
		// 메일 발송 정보를 관리할 javax.mail.internet.MimeMessage 객체 생성
		// => MimeMessage 객체를 사용하여 전송할 메일에 대한 발송 정보 설정 가능
		Message mailMessage = new MimeMessage(mailSession);
		
		// 1. 발신자 정보 설정 (발신자 정보를 주소 형태로 관리하는 InternetAddress 객체 생성)
		// => 파라미터: 발신자 메일 주소, 발신자 이름
		// => 단, 스팸메일방지정책으로 인해 상용메일 사이트 (구글, 네이버 등)에서는
		//	  발신자 주소 설정 불가능 (연동된 메일 주소 그대로 적용)
		Address sender_address = new InternetAddress(sender, "라떼시네마");
		// 2. 수신자 정보 설정
		Address receiver_address = new InternetAddress(receiver);
		
		// 3. 위에서 생성한 Message 객체를 활용하여 전송할 메일 정보 설정
		mailMessage.setHeader("content-type", "text/html; charset=UTF-8");
		mailMessage.setFrom(receiver_address);
		// 수진자 정보 설정 (파라미터로 RecipientType 클래스의 TO상수와 수신자주소 전달)
		// => 참조의 경우 CC, 숨은참조의 경우 BCC
		mailMessage.addRecipient(RecipientType.TO, receiver_address);
		mailMessage.setSubject(title);
		mailMessage.setContent(content, "text/html; charset=UTF-8");
		mailMessage.setSentDate(new Date());
		
		
		// 4. 메일 전송
		// javax.mail.Transport 클래스의 static 메서드 send() 호출 
		Transport.send(mailMessage);
		
	} catch (Exception e) {
		e.printStackTrace();
	}

}

