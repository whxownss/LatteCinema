package com.itwillbs.service;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;

public class MemberService {

	MemberDAO memberDAO = null;
	
	//회원가입
	public void insertMember(HttpServletRequest request) {
		
		try {
			request.setCharacterEncoding("UTF-8");
			String idx = request.getParameter("idx");
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String address = request.getParameter("postcode") + "/" + request.getParameter("address1") + "/" + request.getParameter("address2");
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

	// 유저체크
	public MemberDTO userCheck(HttpServletRequest request) {
		System.out.println("MemberService userCheck()");
		MemberDTO memberDTO = new MemberDTO();
		try {
			String id = request.getParameter("id");
			String pass = request.getParameter("pass");
//			String name = request.getParameter("name");
//			String phone = request.getParameter("phone");
//			String address = request.getParameter("postcode") + "/" + request.getParameter("address1") + "/" + request.getParameter("address2");
//			String birth = request.getParameter("birth");
//			String email = request.getParameter("email");
			
			
			memberDAO = new MemberDAO();
			memberDTO.setMemId(id);
			memberDTO.setMemPass(pass);
//			memberDTO.setMemName(name);
//			memberDTO.setMemPhone(phone);
//			memberDTO.setMemAddress(address);
//			memberDTO.setMemBirthD(birth);
//			memberDTO.setMemEmail(email);
			memberDTO = memberDAO.userCheck(memberDTO);
			
			} catch (Exception e) {
			e.printStackTrace();
		}
		
		return memberDTO;
	}// userCheck()

	//회원탈퇴
	public void deleteMember(HttpServletRequest request) {
		System.out.println("MemberService deleteMember()");
		try {
			request.setCharacterEncoding("UTF-8");
			
			// requset 값을 가져와서 변수에 저장
			String id = request.getParameter("id");
			
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setMemId(id);
			
			// MemberDAO 객체 생성
			memberDAO = new MemberDAO();
			// deleteMember() 호출
			memberDAO.deleteMember(memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// deleteMember()	
	
	//회원정보수정
	public void updateMember(HttpServletRequest request) {
		System.out.println("MemberService updateMember()");
		try {
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setMemId(request.getParameter("id"));
			memberDTO.setMemPass(request.getParameter("pass"));
			memberDTO.setMemName(request.getParameter("name"));
			memberDTO.setMemPhone(request.getParameter("phone"));
			memberDTO.setMemAddress(request.getParameter("postcode") + "/" + request.getParameter("addr1") + "/" + request.getParameter("addr2"));
			memberDTO.setMemEmail(request.getParameter("email"));
			
			System.out.println(memberDTO);
			memberDAO = new MemberDAO();
			
			memberDAO.updateMember(memberDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}// updateMember()
	
	public MemberDTO getMember(String id) {
		System.out.println("MemberService getMember()");
		MemberDTO memberDTO = null;
		try {
			
			memberDAO = new MemberDAO();
			
			memberDTO = memberDAO.getMember(id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberDTO;
	}// getMember()

	// 아이디 중복체크
	public int checkId(HttpServletRequest request) {
		System.out.println("MemberService checkId()");
		MemberDTO memberDTO = new MemberDTO();
		int result = 0;
		try {
			String id = request.getParameter("memId");
			memberDAO = new MemberDAO();
			result = memberDAO.checkId(id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result; 
		
	}//checkId()

	// 이메일 인증
	public int checkEmail(HttpServletRequest request) {
		System.out.println("MemberService checkEmail()");
		MemberDTO memberDTO = new MemberDTO();
		int result = 0;
		try {
			String email = request.getParameter("memEmail");
			memberDAO = new MemberDAO();
			result = memberDAO.checkEmail(email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}//checkEmail()
	
	// 비밀번호 변경
	public void updatePasswd(HttpServletRequest request) {
		System.out.println("MemberService updatePasswd()");
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}//updatePasswd()

//	public void sendGmail(HttpServletRequest request) {
//		System.out.println("MemberService sendGmail()");	
//		
//	}//sendGmail()
	
	
}
