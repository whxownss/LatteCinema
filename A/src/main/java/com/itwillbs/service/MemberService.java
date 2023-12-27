package com.itwillbs.service;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;

public class MemberService {

	MemberDAO memberDAO = null;
	
	public void insertMember(HttpServletRequest request) {
		
		try {
			request.setCharacterEncoding("UTF-8");
			String idx = request.getParameter("idx");
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String address = request.getParameter("postcode") + request.getParameter("address1") + request.getParameter("address2");
			String birth = request.getParameter("birth");
			String email = request.getParameter("email");
			Timestamp date = new Timestamp(System.currentTimeMillis());
			
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setMemIdx(idx);
			memberDTO.setMemId(id);
			memberDTO.setMemPass(pass);
			memberDTO.setMemName(name);
			memberDTO.setMemPhone(phone);
			memberDTO.setMemAddress(address);
			memberDTO.setMemBirthD(birth);
			memberDTO.setMemEmail(email);
			memberDTO.setMemJoinD(date);
			
			System.out.println(memberDTO);
			
			memberDAO = new MemberDAO();
			
			memberDAO.insertMember(memberDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}// insertMember()

	public boolean userCheck(HttpServletRequest request) {
		MemberDTO memberDTO = null;
		boolean userCheckResult = false;
		try {
			// request에서 id,pass 값을 가져와서 변수 저장
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
			// MemberDAO 객체생성
			memberDAO = new MemberDAO();
			
			memberDTO = new MemberDTO();
			memberDTO.setMemId(id);
			memberDTO.setMemPass(pass);
			
			// memberDTO = userCheck(id,pass) 메서드 호출
			userCheckResult = memberDAO.userCheck(memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userCheckResult;
		
	}// usercheck()

	
	
}
