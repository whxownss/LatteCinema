package com.itwillbs.email;

import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

public class sendGmail {
	private String sender = "brisk7700@gmail.com";
	private String receiver ;
	private String title = "라떼시네마 회원가입 이메일 인증번호";
	private String content;
	
	public sendGmail(String receiver, String content) {
		this.receiver = receiver;
		this.content = content;
	}
	
	
	
	public void sendMail() {
	try {
		
		Properties properties = System.getProperties();

		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.port", "587");

		Authenticator authenticator = new Gmail();
		Session mailSession = Session.getDefaultInstance(properties, authenticator);
		
		
		Message mailMessage = new MimeMessage(mailSession);
		Address sender_address = new InternetAddress(sender, "라떼시네마");
		Address receiver_address = new InternetAddress("email");
		
		mailMessage.setHeader("content-type", "text/html; charset=UTF-8");
		mailMessage.setFrom(receiver_address);
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

class Gmail extends Authenticator {

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

