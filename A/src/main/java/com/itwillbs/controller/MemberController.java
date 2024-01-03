	package com.itwillbs.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.email.sendGmail;
import com.itwillbs.service.MemberService;


public class MemberController extends HttpServlet {
	RequestDispatcher dispatcher = null;
	MemberService memberService = null;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sPath = request.getServletPath();
		
		// 메인 페이지 이동
		if(sPath.equals("/main.me")) {
			dispatcher = request.getRequestDispatcher("_a/main.jsp");
			dispatcher.forward(request, response);
		}//
		
		// 로그인 페이지 이동
		if(sPath.equals("/login.me")) {
			dispatcher = request.getRequestDispatcher("_member/login.jsp");
			dispatcher.forward(request, response);
		}//
		
		// 로그아웃 session값 제거
		if(sPath.equals("/logout.me")) {
			System.out.println("주소비교 /logout.me 일치");
			// 세션객체생성
			HttpSession session = request.getSession();
			// 세션초기화
			session.invalidate();
			// main.me 이동
			response.sendRedirect("main.me");
		}//
		
		// 회원가입 페이지 이동
		if(sPath.equals("/join.me")) {
			dispatcher = request.getRequestDispatcher("_member/join.jsp");
			dispatcher.forward(request, response);
		}//
		
		// 회원가입 joinPro.me
		if(sPath.equals("/joinPro.me")) {
			memberService = new MemberService();
			
			memberService.insertMember(request);
			// 주소변경 login.me 이동
			response.sendRedirect("login.me");
		}//
		
		// 회원가입 아이디 중복체크  checkjoin.me
		if(sPath.equals("/checkjoin.me")) {
			memberService = new MemberService();
			
			int result = memberService.checkId(request);
			
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(result + "");

		}//
		
		// 회원가입 이메일 중복체크 checkemail.me
		if(sPath.equals("/checkemail.me")) {
			memberService = new MemberService();
			
			int result = memberService.checkEmail(request);
			
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(result + "");

		}//
		
		// 회원가입 이메일 인증번호 checkemail.me
		if(sPath.equals("/emailCode.me")) {
			response.setCharacterEncoding("utf-8");
			sendGmail sendgmail = new sendGmail();
		
//			memberService = new MemberService();
//			// sendGmail 메서드 호출
//			memberService.sendGmail(request);

		}//
		
		//  로그인 loginPro.me 이동
		if(sPath.equals("/loginPro.me")) {
			memberService = new MemberService();
			MemberDTO memberDTO = memberService.userCheck(request);
			
			//리턴받은 값이 null 아니면 => 아이디 비밀번호 일치
			//리턴받은 값이 null 이면 => 아이디 비밀번호 틀림
			if(memberDTO != null) {
				System.out.println("아이디 비밀번호 일치");
				// 로그인 표시 => 세션객체생성 => 세션 저장 (자바에서는 세션객체 먼저 생성 해야함)
				HttpSession session = request.getSession();
//				session.setAttribute("id", request.getParameter("id"));
				session.setAttribute("sIdx", memberDTO.getMemIdx());
				session.setAttribute("sId", memberDTO.getMemId());
				session.setAttribute("sName", memberDTO.getMemName());
				
				response.sendRedirect("main.me");
				
			}else {
				System.out.println("아이디 비밀번호 틀림");
				// 1. member/msg.jsp이동 (jsp이동)
			    dispatcher = request.getRequestDispatcher("_member/msg.jsp");
				dispatcher.forward(request, response);
			}
			
		}//
		
		// 아이디 찾기 페이지 이동
		if(sPath.equals("/userfind.me")) {
			dispatcher = request.getRequestDispatcher("_member/userfind.jsp");
			dispatcher.forward(request, response);
		}//
		
		// 비밀번호 찾기 페이지 이동
		if(sPath.equals("/passfind.me")) {
			dispatcher = request.getRequestDispatcher("_member/passfind.jsp");
			dispatcher.forward(request, response);
		}//
		
		////////////////////////////////////////////////////////////////////////////////////
		
		// 마이페이지 (마이페이지 기본메인화면) 이동
		if(sPath.equals("/myPage.me")) {
			dispatcher = request.getRequestDispatcher("_mypage/myPage.jsp");
			dispatcher.forward(request, response);
		}//
		
		// 마이페이지  myInfo(정보수정 전 비밀번호 인증페이지) 이동
		if(sPath.equals("/myInfo.me")) {
			dispatcher = request.getRequestDispatcher("_mypage/myInfo.jsp");
			dispatcher.forward(request, response);
		}//
		
		if(sPath.equals("/myInfoPro.me")) {
			memberService = new MemberService();
			MemberDTO memberDTO = memberService.userCheck(request);
			System.out.println("---------");
			System.out.println(memberDTO);
			System.out.println("---------");
			
			//리턴받은 값이 null 아니면 => 아이디 비밀번호 일치
			//리턴받은 값이 null 이면 => 아이디 비밀번호 틀림
			if(memberDTO != null) {
				System.out.println("비밀번호 일치");
				request.setAttribute("memberDTO", memberDTO);
				response.sendRedirect("userInfo.me");
				
			}else {
				System.out.println("비밀번호 틀림");
				dispatcher = request.getRequestDispatcher("_mypage/msg.jsp");
				dispatcher.forward(request, response);
			}
		}//
		
		
		// 마이페이지 userInfo(정보수정 페이지) 이동
		if(sPath.equals("/userInfo.me")) {
			
			HttpSession session = request.getSession();
			
			String id = (String)session.getAttribute("sId");
			
			memberService = new MemberService();
			MemberDTO memberDTO = memberService.getMember(id);
			
			request.setAttribute("memberDTO", memberDTO);
			
			dispatcher = request.getRequestDispatcher("_mypage/userInfo.jsp");
			dispatcher.forward(request, response);

		}//
		
		// 마이페이지 userInfoPro(정보수정)
		if(sPath.equals("/userInfoPro.me")) {
			
			request.setCharacterEncoding("utf-8");
			memberService = new MemberService();
			memberService.updateMember(request);
			response.sendRedirect("myPage.me");
		}//
		
		// 마이페이지 myMovie(무비스토리) 이동
		if(sPath.equals("/myMovie.me")) {
			dispatcher = request.getRequestDispatcher("_mypage/myMovie.jsp");
			dispatcher.forward(request, response);
		}//
		
		// 마이페이지 delete(회원탈퇴) 이동 (userInfo > delete.jsp)
		if(sPath.equals("/delete.me")) {
			dispatcher = request.getRequestDispatcher("_mypage/delete.jsp");
			dispatcher.forward(request, response);
		}//
		
		// 마이페이지 deletePro(회원탈퇴) 
		if(sPath.equals("/deletePro.me")) {
			
			memberService = new MemberService();
			MemberDTO memberDTO = memberService.userCheck(request);
			
			if(memberDTO != null) {
				//리턴받은 값이 null 아니면 => 아이디 비밀번호 일치
				System.out.println("아이디 비밀번호 일치");
			//  리턴값 없음 deleteMember(request) 메서드 호출
				memberService.deleteMember(request);
				//세션 초기화(전체기억장소 삭제)
				HttpSession session = request.getSession();
				session.invalidate();
//				주소변경하면서 main.me 이동
				response.sendRedirect("main.me");
			}else {
				System.out.println("아이디 비밀번호 틀림");
				dispatcher = request.getRequestDispatcher("_member/msg.jsp");
				dispatcher.forward(request, response);
			}
			
		}//
		
		
		// 마이페이지 비밀번호 변경(비밀번호변경) 이동 (userInfo > changepw.jsp)
		if(sPath.equals("/changepw.me")) {
			dispatcher = request.getRequestDispatcher("_mypage/changepw.jsp");
			dispatcher.forward(request, response);
		}//
		
		// 비밀번호 변경 changepwPro
		if(sPath.equals("/changepwPro.me")) {
			
			
			
			
			
			response.sendRedirect("myPage.me");
		}//
		
		
		// 마이페이지 myinquiry(문의내역) 이동
		if(sPath.equals("/myinquiry.me")) {
			dispatcher = request.getRequestDispatcher("_mypage/myinquiry.jsp");
			dispatcher.forward(request, response);
		}//
		
		// 마이페이지 bookinglist(예매내역) 이동
		if(sPath.equals("/bookinglist.me")) {
			dispatcher = request.getRequestDispatcher("_mypage/bookinglist.jsp");
			dispatcher.forward(request, response);
		}//
		

		
		
	}
	
}
