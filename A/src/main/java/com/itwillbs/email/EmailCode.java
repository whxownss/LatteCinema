package com.itwillbs.email;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class EmailCode {

	public static String randomizeCode(){
		Random r = new Random();
//		List<Character> list = new ArrayList<Character>();
		StringBuffer list2 = new StringBuffer();
		char ch = 'A' - 1;
		for(int i = 0; i < 26; i++) {
//			list.add(ch += 1);
			list2.append(ch += 1);
		}
		
		ch = 'a' - 1;
		for(int i = 0; i < 26; i++) {
//			list.add(ch += 1);
			list2.append(ch+=1);
		}
		
		ch = '0' - 1;
		for(int i = 0; i < 10; i++) {
//			list.add(ch += 1);
			list2.append(ch+=1);
		}

		
		String code = "";
		String code2 = "";
		int codeLength = 6;
		
		// StringBuffer 활용하기
//		  String 클래스의 메서드
//		  	- 문자열 수정, 검색, 치환 등 다양한 작업을 수행하는 메서드를 제공
//		  	- String 객체는 불변 객체이므로 원본 문자열에 대한 수정이 불가능하며,
//		  	  수정, 치환 등 변경 작업 수행 시 원본 데이터가 아닌 변경된 문자열에 대한
//		  	  새로운 문자열을 생성하여 관리함
//		  	  => 따라서, 문자열 수정이 빈번할 경우 메모리 낭비가 심하므로
//		  		 StringBuilder 또는 StringBuffer 객체를 활용해야한다!
		 
		// 원하는 코드 길이만큼 for문을 사용하여 반복문으로 처리
		for(int i = 0; i < codeLength; i++) {
//			int index = r.nextInt(list.size());
			int index2 = r.nextInt(list2.length());
//			code += list.get(index);
			code2 += list2.charAt(index2);
		}
		
//		System.out.println("인증코드: " + code);
		System.out.println("인증코드2" + code2);
		
//		return code.toString();
		return code2.toString();
	}

}
