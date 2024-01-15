package com.itwillbs.utill;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.hc.client5.http.classic.HttpClient;
import org.apache.hc.client5.http.classic.methods.HttpPost;
import org.apache.hc.client5.http.entity.UrlEncodedFormEntity;
import org.apache.hc.client5.http.impl.classic.HttpClientBuilder;
import org.apache.hc.core5.http.ClassicHttpResponse;
import org.apache.hc.core5.http.HttpResponse;
import org.apache.hc.core5.http.NameValuePair;
import org.apache.hc.core5.http.io.entity.EntityUtils;
import org.apache.hc.core5.http.message.BasicNameValuePair;
import org.apache.hc.core5.http2.*;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class Pay {
	public static final String IMPORT_CANCEL_URL = "https://api.iamport.kr/payments/cancel";
	public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";
	public static final String KEY = "7812428076724037";
	public static final String SECRET = "I9BWVecIIq9JQQfzIeYSoF9FhF8J7x72cpx8edqJuwr2Z7juF5x1wTaAOeeIzZeiDWW6kCrM72k73K8A";
	
	// 아임포트 인증(토큰)을 받아주는 함수 
    public String getImportToken() { 
        String result = ""; 
        HttpClient client = HttpClientBuilder.create().build();
        HttpPost post = new HttpPost(IMPORT_TOKEN_URL); 
        Map<String,String> m = new HashMap<String,String>(); 
        m.put("imp_key", KEY); 
        m.put("imp_secret", SECRET); 
        try { 
        	post.setEntity(new UrlEncodedFormEntity(convertParameter(m))); 
        	ClassicHttpResponse res = (ClassicHttpResponse)client.execute(post); 
            ObjectMapper mapper = new ObjectMapper(); 
            String body = EntityUtils.toString(res.getEntity()); 
            JsonNode rootNode = mapper.readTree(body);
            JsonNode resNode = rootNode.get("response"); 
            result = resNode.get("access_token").asText(); 
        } catch (Exception e) { 
            e.printStackTrace(); 
        } 
        
        return result;
    }
	
	public int cancelPay(String token, String mid) { 
        HttpClient client = (HttpClient)HttpClientBuilder.create().build(); 
        HttpPost post = new HttpPost(IMPORT_CANCEL_URL); 
        Map<String, String> map = new HashMap<String, String>(); 
        post.setHeader("Authorization", token); 
        map.put("merchant_uid", mid); 
        String asd = ""; 
        try { 
            post.setEntity(new UrlEncodedFormEntity(convertParameter(map))); 
            ClassicHttpResponse res = (ClassicHttpResponse)client.execute(post); 
            ObjectMapper mapper = new ObjectMapper(); 
            String enty = EntityUtils.toString(res.getEntity()); 
            JsonNode rootNode = mapper.readTree(enty); asd = rootNode.get("response").asText();
        } catch (Exception e) { 
            e.printStackTrace(); 
        } if (asd.equals("null")) { 
            System.err.println("환불실패"); return -1; 
        } else { 
            System.err.println("환불성공"); return 1; 
        }
    }
	
	private List<? extends NameValuePair> convertParameter(Map<String, String> m) {
		List<NameValuePair> parameters = new ArrayList<NameValuePair>();
		
		for (Map.Entry<String, String> entry : m.entrySet()) {
		    parameters.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
		}
		
		return parameters;
	} 
}
