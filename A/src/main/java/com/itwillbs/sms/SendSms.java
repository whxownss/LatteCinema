package com.itwillbs.sms;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class SendSms {
	private String api_key = "NCSGE6VKNHAAP6MV";
	private String api_secret = "ZYSQWQ367JASODY5BYIZHECBJVTLLOM6";
	private String receiver; //받는사람
	private String content;	//인증번호
	
	
	public SendSms(String receiver, String content) {
		this.receiver = receiver;
		this.content = content;
	}

//	Random rand  = new Random();
//	String numStr = "";
//	
//	public String makeNum() {
//		for(int i=0; i < 4; i++) {
//	        String ran = Integer.toString(rand.nextInt(10));
//	        numStr+=ran;
//	    }
//		return numStr;
//	}
	
	public void makeMsg() {
		Message message = new Message(api_key, api_secret);
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", receiver);
		params.put("from", "01025747288");
		params.put("type", "SMS");
		params.put("text", content);
		params.put("app_version", "test app 1.2");
		
	    try {
	    	//send() 는 메시지를 보내는 함수  
	      JSONObject obj = (JSONObject) message.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	
	}
}
