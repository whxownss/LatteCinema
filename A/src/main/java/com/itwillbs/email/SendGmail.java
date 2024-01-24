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

//JavaMail API
//SendGmail 클래스는 이메일을 보내는 데 책임이 있습니다. 발신자의 이메일 주소 (sender), 수신자의 이메일 주소 (receiver), 이메일 제목 (title), 및 이메일 내용 (content)에 대한 인스턴스 변수가 있습니다.
public class SendGmail {
	private String sender = "brisk7700@gmail.com";
	private String receiver ; //수신자
	private String title = "라떼시네마 회원가입 이메일 인증번호";
	private String content; //인증번호
	
	//SendGmail 클래스의 생성자는 수신자의 이메일 주소와 내용을 매개변수로 받아 인스턴스 변수를 초기화
	public SendGmail(String receiver, String content) {
		this.receiver = receiver;
		this.content = content;
	}
	
	
	
	
	
	
	// 실제 이메일을 보내는 역할 메일서버 속성설정 gmail클래스를 이용하여 Authenticator 생성 후 이메일메세지 만들고 구성 Transport.send(mailMessage)메서드로 이메일 전송
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
			Address receiver_address = new InternetAddress(receiver);
			
			mailMessage.setHeader("content-type", "text/html; charset=UTF-8");
			mailMessage.setFrom(receiver_address);
			mailMessage.addRecipient(RecipientType.TO, receiver_address);
			mailMessage.setSubject(title);
			
			mailMessage.setContent("인증번호 : " + content, "text/html; charset=UTF-8");	
			mailMessage.setSentDate(new Date());
			
			
			// 4. 메일 전송
			// javax.mail.Transport 클래스의 static 메서드 send() 호출 
			Transport.send(mailMessage);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}

// Gmail 클래스는 Authenticator를 확장하고 메일 서버에 인증 정보(사용자 이름과 비밀번호)를 제공하는 데 사용됩니다.

//Gmail 클래스의 getPasswordAuthentication 메서드는 해당 메서드를 제공하기 위해 Authenticator 클래스의 해당 메서드를 재정의하여 인증 정보를 제공합니다.

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

