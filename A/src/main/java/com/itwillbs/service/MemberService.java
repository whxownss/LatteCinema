package com.itwillbs.service;

import java.nio.file.spi.FileSystemProvider;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;

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
			String phone = request.getParameter("phone").replaceAll("-", "");
			String address = request.getParameter("postcode") + "/" + request.getParameter("address1") + "/" + request.getParameter("address2");
			String birth = request.getParameter("birth");
			String email = request.getParameter("email");
			Timestamp date = new Timestamp(System.currentTimeMillis());
			
			System.out.println("@@@@@@@@@@@@@@@@@@");
			System.out.println(phone);
			System.out.println(birth);
			System.out.println(email);
			
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
	
	//카카오간편로그인 관련
	public void insertSimpleMember(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
			String idx = request.getParameter("idx");
			String id = request.getParameter("memId");
			String name = request.getParameter("memName");
			String phone = request.getParameter("memPhone");
			String birth = request.getParameter("memBirth");
			String email = request.getParameter("memEmail");
			Timestamp date = new Timestamp(System.currentTimeMillis());
			
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setMemIdx(idx);
			memberDTO.setMemId(id);
			memberDTO.setMemName(name);
			memberDTO.setMemPhone(phone);
			memberDTO.setMemBirthD(birth);
			memberDTO.setMemEmail(email);
			memberDTO.setMemJoinD(date);
			
			System.out.println(memberDTO);
			memberDAO = new MemberDAO();
			memberDAO.insertMember(memberDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//insertkakaoMember()

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
			System.out.println("@############3");
			System.out.println(id);
			System.out.println(pass);
			System.out.println("@############3");
			
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
			memberDTO.setMemName(request.getParameter("name"));
			memberDTO.setMemPhone(request.getParameter("phone").replaceAll("-", ""));
			
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
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setMemId(request.getParameter("id"));
			memberDTO.setMemPass(request.getParameter("newpasswd"));
			System.out.println(memberDTO);
			memberDAO = new MemberDAO();
			memberDAO.updatePasswd(memberDTO);			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}//updatePasswd()

	// 회원 아이디 찾기
	public MemberDTO userFind(HttpServletRequest request) {
		System.out.println("MemberService userFind()");
		MemberDTO memberDTO = new MemberDTO();
		try {
			String name = request.getParameter("memName");
			String birth = request.getParameter("memBirth");
			String phone = request.getParameter("memPhone");
			String id = request.getParameter("memId");
			String email = request.getParameter("memEmail");
			System.out.println("@@@@@@@@@@@@@@@@@@@@@");
			System.out.println(name);
			System.out.println(birth);
			System.out.println(phone);
			System.out.println(id);
			System.out.println(email);
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@");
			
			memberDTO.setMemName(name);
			memberDTO.setMemBirthD(birth);
			memberDTO.setMemPhone(phone);
			memberDTO.setMemEmail(email);
			memberDTO.setMemId(id);
			
			memberDAO = new MemberDAO();
			memberDTO = memberDAO.userFind(memberDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return memberDTO;
	}//userFind()
	
	// 마이페이지 예약구매 페이지 페이징 작업
	public ArrayList<MemberDTO> getBoardList(PageDTO pageDTO) {
		
		ArrayList<MemberDTO> memberList = null;
		try {
			// 시작하는 행번호 구하는 식 
			int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
			// 끝나는 행번호 구하는 식 
			int endRow = startRow + pageDTO.getPageSize()-1;
			
			pageDTO.setStartRow(startRow-1);
			pageDTO.setEndRow(pageDTO.getPageSize());
			
			// BoardDAO 객체생성
			memberDAO = new MemberDAO();
			// getBoardList(startRow,pageSize) 메서드 호출
			memberList = memberDAO.getBoardList(pageDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return memberList;
	}//getBoardList()

	public int getBoardCount() {
		int count = 0;
		try {
			memberDAO = new MemberDAO();
			count = memberDAO.getBoardCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}//getBoardCount()

	public String getSimpleId(HttpServletRequest request) {
		String sId = null;
		try {
//			MemberDTO memberDTO = new MemberDTO();
//			memberDTO.setMemEmail(request.getParameter("memEmail"));
			
			memberDAO = new MemberDAO();
			sId = memberDAO.getSimpleId(request.getParameter("memEmail"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sId;
	}



//	public MemberDTO kakaoCheck(HttpServletRequest request) {
//
//		
//		return null;
//	}//kakaoCheck

//	public void sendGmail(HttpServletRequest request) {
//		System.out.println("MemberService sendGmail()");	
//		
//	}//sendGmail()
	
	
}
