package com.itwillbs.email;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class randomize {

	public static String randomizeCode(){
		Random r = new Random();
		List<Character> list = new ArrayList<Character>();

		char ch = 'A' - 1;
		for(int i = 0; i < 26; i++) {
			list.add(ch += 1);
		}
		
		ch = 'a' - 1;
		for(int i = 0; i < 26; i++) {
			list.add(ch += 1);
		}
		
		ch = '0' - 1;
		for(int i = 0; i < 10; i++) {
			list.add(ch += 1);
		}

		
		String code = "";
		int codeLength = 20;
		
		// StringBuffer 활용하기 메모리때문에
		// 원하는 코드 길이만큼 for문을 사용하여 반복문으로 처리
		for(int i = 0; i < codeLength; i++) {
			int index = r.nextInt(list.size());
			code += list.get(index);
		}
		
		System.out.println("인증코드: " + code);
		
		return code.toString();
	}

}
