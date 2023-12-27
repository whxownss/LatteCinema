	package com.itwillbs.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.domain.MemberDTO;
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
		
		//  로그인 loginPro.me 이동
		if(sPath.equals("/loginPro.me")) {
			memberService = new MemberService();
			MemberDTO memberDTO = new MemberDTO();
			boolean userCheckResult = memberService.userCheck(request);
			
			//리턴받은 값이 null 아니면 => 아이디 비밀번호 일치
			//리턴받은 값이 null 이면 => 아이디 비밀번호 틀림
			if(userCheckResult) {
				System.out.println("아이디 비밀번호 일치");
				// 로그인 표시 => 세션객체생성 => 세션 저장 (자바에서는 세션객체 먼저 생성 해야함)
				HttpSession session = request.getSession();
//				session.setAttribute("id", request.getParameter("id"));
				session.setAttribute("id", memberDTO.getId());
				// main.me 이동
				response.sendRedirect("main.me");
				
			}else {
				System.out.println("아이디 비밀번호 틀림");
				// 1. member/msg.jsp이동 (jsp이동)
			    dispatcher = request.getRequestDispatcher("member/msg.jsp");
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
		
		// 마이페이지 userInfo(정보수정 페이지) 이동
		if(sPath.equals("/userInfo.me")) {
			dispatcher = request.getRequestDispatcher("_mypage/userInfo.jsp");
			dispatcher.forward(request, response);
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
		
		// 마이페이지 비밀번호 변경(비밀번호변경) 이동 (userInfo > changepw.jsp)
		if(sPath.equals("/changepw.me")) {
			dispatcher = request.getRequestDispatcher("_mypage/changepw.jsp");
			dispatcher.forward(request, response);
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
