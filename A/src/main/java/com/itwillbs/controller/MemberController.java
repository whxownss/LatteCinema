	package com.itwillbs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.domain.CenterBoardDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.MovieDTO;
import com.itwillbs.email.SendGmail;
import com.itwillbs.email.EmailCode;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.CSBoardService;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.MovieService;


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
			// 메인화면 최근글 3개 가져오기
			CSBoardService csBoardService = new CSBoardService();
			
			// PageDTO 3개씩 잘라서 최근글 1페이지 설정
			PageDTO pageDTO = new PageDTO();
			pageDTO.setPageSize(3);
			pageDTO.setCurrentPage(1);
			// getBoardList(pageDTO) 메서드 호출
			ArrayList<CenterBoardDTO> centerBoardList = csBoardService.getCenterBoardList(pageDTO);
			// request에 boardList 저장
			request.setAttribute("centerBoardList", centerBoardList);
			
			// 영화 포스터 넣는 부분 
			MovieService movieService = new MovieService();
		    MovieDTO movieDTO = new MovieDTO();
			List<MovieDTO> posterList = movieService.getLattePoster(movieDTO);
			request.setAttribute("lattePosterList", posterList);
			
			
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
		
		// 회원가입 이메일 인증번호 보내기 checkemail.me
		if(sPath.equals("/emailCode.me")) {
			response.setCharacterEncoding("utf-8");
			String receiver = request.getParameter("email");
			
			EmailCode emailcode = new EmailCode();
			String content = emailcode.randomizeCode();
			System.out.println(receiver);
//			System.out.println("--------------------"+content);
			SendGmail sendgmail = new SendGmail(receiver, content);
			sendgmail.sendMail();
			
			response.getWriter().write(content + "");
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
		
		// 카카오로그인 
		if(sPath.equals("/kakaologin.me")) {
			System.out.println("/kakaologin.me/ controller");
			memberService = new MemberService();
			//이메일 중복체크?
			int result = memberService.checkEmail(request);
			System.out.println("@@@@@@@@@@");
			System.out.println(result);
			System.out.println("@@@@@@@@@@");
			// result 가 0일 때 중복된 email이 없으므로 가입가능 
			if(result == 0)  memberService.insertkakaoMember(request);
				
			HttpSession session = request.getSession();
//				session.setAttribute("sIdx", memberDTO.getMemIdx());
			session.setAttribute("sId", request.getParameter("memId"));
			session.setAttribute("sName", request.getParameter("memName"));
				//회원가입 o 로그인 o  세션값??? > main.jsp ( 로그아웃 버튼에 function kakaoLogout())?
//				response.sendRedirect("main.me");
				
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(result + "");
				
		}//
		
		// 아이디 찾기 페이지 이동
		if(sPath.equals("/userfind.me")) {
			dispatcher = request.getRequestDispatcher("_member/userfind.jsp");
			dispatcher.forward(request, response);
		}//
		
		// 아이디 찾기 userfind.jsp
		if(sPath.equals("/userFindId.me")) {
			response.setCharacterEncoding("utf-8");
			memberService = new MemberService();
			MemberDTO memberDTO = memberService.userFind(request);
			
			String result = "0";
			
			if (memberDTO != null) {
			    System.out.println(memberDTO);
			    System.out.println("입력한 정보 일치");
			    result = memberDTO.getMemId();
//			    request.setAttribute("memberDTO", memberDTO);
//			    response.sendRedirect("login.me");
			}
			System.out.println(result);
			response.getWriter().write(result);
			
		}//
		
		// 비밀번호 찾기 페이지 이동
		if(sPath.equals("/passfind.me")) {
			dispatcher = request.getRequestDispatcher("_member/passfind.jsp");
			dispatcher.forward(request, response);
		}//
		
		// 비밀번호 찾기 userFindPass.me  
		if(sPath.equals("/userFindPass.me")) {
			response.setCharacterEncoding("utf-8");
			memberService = new MemberService();
			MemberDTO memberDTO = memberService.userFind(request);	
			
			if(memberDTO != null) {
				System.out.println(memberDTO);
				System.out.println("입력한 회원 존재");
				
			}
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(memberDTO + "");
			
			// 
		}//
		
		// passfind > 새 비밀번호 
		if(sPath.equals("/passfindPro.me")) {
			response.setCharacterEncoding("utf-8");
			memberService = new MemberService();
			
			memberService.updatePasswd(request);
			
			response.sendRedirect("login.me");
			
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
				System.out.println("아이디 비밀번호 일치");
				memberService.deleteMember(request);
				HttpSession session = request.getSession();
				session.invalidate();
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
			
			memberService = new MemberService();
			MemberDTO memberDTO = memberService.userCheck(request);
			
			if(memberDTO != null) {
				System.out.println("비밀번호 일치 ");
				memberService.updatePasswd(request);
				//비밀번호 변경 후 세션값 제거 > main.me 로 이동 (변경된 비밀번호로 다시 로그인 하도록)
				// 세션객체생성
				HttpSession session = request.getSession();
				// 세션초기화
				session.invalidate();
				// main.me 이동
				response.sendRedirect("main.me");
				
			}else {
				System.out.println("비밀번호 틀림");
				response.sendRedirect("changepw.me");
			}
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
