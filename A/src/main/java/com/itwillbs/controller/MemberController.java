	package com.itwillbs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.users.SparseUserDatabase;

import com.google.gson.Gson;
import com.itwillbs.domain.CenterBoardDTO;
import com.itwillbs.domain.LostBoardDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.MovieDTO;
import com.itwillbs.email.SendGmail;
import com.itwillbs.email.EmailCode;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PointDTO;
import com.itwillbs.domain.QnaBoardDTO;
import com.itwillbs.domain.ReservationDTO;
import com.itwillbs.domain.StorePayDTO;
import com.itwillbs.service.CSBoardService;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.MovieService;
import com.itwillbs.service.StoreService;
import com.itwillbs.sms.SendSms;


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
			
			// 영화 old 포스터 넣는 부분 
			MovieService movieService = new MovieService();
		    MovieDTO movieDTO = new MovieDTO();
			List<MovieDTO> posterList = movieService.getLattePoster(movieDTO);
			request.setAttribute("lattePosterList", posterList);
			
			
			// 영화 now 포스터 넣는 부분 
			List<MovieDTO> posterNowList = movieService.getNowPoster(movieDTO);
			request.setAttribute("posterNowList", posterNowList);
			
			
			
			dispatcher = request.getRequestDispatcher("_a/main.jsp");
			dispatcher.forward(request, response);
		}//
		
		// 로그인 페이지 이동
		if(sPath.equals("/login.me")) {
			MovieService movieService = new MovieService();
			MovieDTO movieDTO = new MovieDTO();
			List<MovieDTO> posterList = movieService.getLattePoster(movieDTO);
			
			//posterList의 포스터중 랜덤으로 1개이 이미지 뽑기
			Random random = new Random();
			int moviePosterNum = random.nextInt(posterList.size());
			
			System.out.println(posterList.get(moviePosterNum));
//			System.out.println(movieDTO.getPoster());
			request.setAttribute("moviePoster", posterList.get(moviePosterNum).getPoster());
			request.setAttribute("movieCode", posterList.get(moviePosterNum).getMovieCode());
			System.out.println(posterList.get(moviePosterNum).getMovieCode());
//			System.out.println(posterList.get(1).getPoster());
//			System.out.println(posterList.get(2));
//			System.out.println(posterList.get(3));
			dispatcher = request.getRequestDispatcher("_member/login.jsp");
			dispatcher.forward(request, response);
		}//
		
		
		
//		// 로그인 페이지 이동
//		if(sPath.equals("/login.me")) {
//			MovieService movieService = new MovieService();
//			MovieDTO movieDTO = new MovieDTO();
//			List<MovieDTO> posterList = movieService.getLattePoster(movieDTO);
//			
//			//posterList의 포스터중 랜덤으로 1개이 이미지 뽑기
//			Random random = new Random();
//			int moviePosterNum = random.nextInt(posterList.size());
//			
//			System.out.println(posterList.get(moviePosterNum));
////			System.out.println(movieDTO.getPoster());
//			request.setAttribute("moviePoster", posterList.get(moviePosterNum).getPoster());
////			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@");
////			System.out.println(posterList.get(1).getPoster());
////			System.out.println(posterList.get(2));
////			System.out.println(posterList.get(3));
//			dispatcher = request.getRequestDispatcher("_member/login.jsp");
//			dispatcher.forward(request, response);
//		}//
		
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
		
		// 회원가입 연락처 중복체크 checkPhone.me
		if(sPath.equals("/checkPhone.me")) {
			memberService = new MemberService();
			
			int result = memberService.checkPhone(request);
			
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(result + "");
		}//
		
		// 회원가입 이메일 인증번호 보내기 checkemail.me
		if(sPath.equals("/emailCode.me")) {
			response.setCharacterEncoding("utf-8");
			String receiver = request.getParameter("email");
			
			// 이메일 인증난수 생성 객체생성
			EmailCode emailcode = new EmailCode();
			// 난수생성메서드 content에 저장
			String content = emailcode.randomizeCode();
			System.out.println(receiver);
//			System.out.println("--------------------"+content);
			// Gamail 보내는 받는사람 인증번호 객체생성
			SendGmail sendgmail = new SendGmail(receiver, content);
			// 메일 보내기 실행
			sendgmail.sendMail();
			
			response.getWriter().write(content + "");
		}//
		
		//  로그인 loginPro.me 이동
		if(sPath.equals("/loginPro.me")) {
			memberService = new MemberService();
			MemberDTO memberDTO = memberService.userCheck(request);
			
			// 회원 정지
			if(memberDTO != null && memberDTO.getMemStatus().equals("1")) {
				String memStopD = memberDTO.getMemStopD();
				System.out.println("정지된날: "+memStopD);
				request.setAttribute("memStopD", memStopD);
				dispatcher = request.getRequestDispatcher("_member/msg2.jsp");
				dispatcher.forward(request, response);
				return;
			}
			
			// 회원 탈퇴
			if(memberDTO != null) {
			    String memDeleteD = memberDTO.getMemDeleteD();
			    if(memDeleteD != null) {
			        System.out.println("탈퇴한날: " + memDeleteD);
			        request.setAttribute("memDeleteD", memDeleteD);
			        dispatcher = request.getRequestDispatcher("_member/msg3.jsp");
			        dispatcher.forward(request, response);
			        return;
			    } else {
			    	memDeleteD = "";
			    }
			}

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
		if(sPath.equals("/simplelogin.me")) {
			System.out.println("/simplelogin.me/ controller");
			memberService = new MemberService();
			//이메일 중복체크?
			int result = memberService.checkEmail(request);
			System.out.println(result);
			HttpSession session = request.getSession();
			if(result == 1) {
				session.setAttribute("sId", memberService.getSimpleId(request));
				session.setAttribute("sName", request.getParameter("memName"));
			}
			// result 가 0일 때 중복된 email이 없으므로 가입가능 
//			memberService.insertSimpleMember(request);
//			session.setAttribute("sId", );
			
			
			
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
			
			String result= "0";
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
			StoreService storeService = new StoreService();
			HttpSession session = request.getSession();
			
			String sId = (String)session.getAttribute("sId");
			System.out.println(sId);
			
			ArrayList<StorePayDTO> storeGiftList = storeService.getstoreGiftList(sId);
			request.setAttribute("storeGiftList",storeGiftList);
			
			memberService = new MemberService();
			List<PointDTO> pointList = memberService.getPointList(sId);
			request.setAttribute("pointList",pointList);
			
			String memPoint =  memberService.getMemPoint(sId);
			request.setAttribute("memPoint",memPoint);
			
			
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
		
		// 휴대폰번호 변경 sms보내기 관련
		if(sPath.equals("/phoneSms.me")) {
			System.out.println("주소일치 : phonedSms.me");
			
			response.setCharacterEncoding("utf-8");
			String receiver = request.getParameter("newPhone");
			
			//인증번호 숫자 4자리 생성코드
			Random code = new Random();
			String content ="";
			for(int i=0; i<4; i++) {
				String num = Integer.toString(code.nextInt(10));
				content += num;
			}
			System.out.println(receiver);
			System.out.println(content);
			//sms이메일 보내는 SendSms객체생성 (문자 받는이, 인증번호)
			SendSms sendsms = new SendSms(receiver, content);
			
			// sms인증번호 보내기 makeMsg()메서드 호출
			sendsms.makeMsg();
			response.getWriter().write(content + "");
			
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
		
		// 현재 비밀번호 확인작업 changePassCheck.me
		if(sPath.equals("/changePassCheck.me")) {
			memberService =  new MemberService();
			
			int result = memberService.changePassCheck(request);
			
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(result + "");
			
		}
		
		
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
			System.out.println("주소비교 /myinquiry.me 일치");
			request.setCharacterEncoding("utf-8");
			CSBoardService csBoardService = new CSBoardService();
			HttpSession session = request.getSession();
			String createUser = (String) session.getAttribute("sId");
			String check = "checkCount";
			// cs_center.cs
			// cs_center.cs?pageNum=2
			// 한 화면에 보여줄 글개수 설정
			int pageSize = 10;
			// 현 페이지 번호
			String pageNum = request.getParameter("pageNum");
			//페이지 번호가 없으면 1로 페이지 설정
			if(pageNum == null) {
				pageNum = "1";
			}
			// pageNum => 정수형 변경
			int currentPage = Integer.parseInt(pageNum);
			// PageDTO 객체생성 
			PageDTO pageDTO = new PageDTO();
			// set메서드 호출해서 값을 저장
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			
			ArrayList<QnaBoardDTO> qnaBoardList = csBoardService.getQnaBoardList(createUser,pageDTO);
			
			// 페이징 작업
			// int 리턴할 형 getBoardCount() 메서드 정의
			// int count = getBoardCount() 메서드 호출
			int count = csBoardService.getQnaBoardCount(createUser,check);
			// 한 화면에 보여줄 페이지 개수 설정
			int pageBlock = 10;
			// 시작하는 페이지 번호 구하기
			int startPage = (currentPage-1)/pageBlock*pageBlock+1;
			// 끝나는 페이지 번호 구하기
			int endPage = startPage + pageBlock -1;
			// 전체 페이지 수 구하기
			int pageCount = count / pageSize + (count % pageSize == 0?0:1);
			if(endPage > pageCount) {
				endPage = pageCount;
			}
			
			//pageDTO에 페이징 관련값 저장
			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			
			request.setAttribute("qnaBoardList",qnaBoardList);
			request.setAttribute("pageDTO", pageDTO);
			dispatcher = request.getRequestDispatcher("_mypage/myinquiry.jsp");
			dispatcher.forward(request, response);
		}//
		//mypage에 lostboard 불러오기.
		if(sPath.equals("/myinquiry2.me")) {
			System.out.println("주소비교 /myinquiry2.me 일치");
			request.setCharacterEncoding("utf-8");
			CSBoardService csBoardService = new CSBoardService();
			HttpSession session = request.getSession();
			String createUser = (String) session.getAttribute("sId");
			String check = "checkCount";
			// cs_center.cs
			// cs_center.cs?pageNum=2
			// 한 화면에 보여줄 글개수 설정
			int pageSize = 10;
			// 현 페이지 번호
			String pageNum = request.getParameter("pageNum");
			//페이지 번호가 없으면 1로 페이지 설정
			if(pageNum == null) {
				pageNum = "1";
			}
			// pageNum => 정수형 변경
			int currentPage = Integer.parseInt(pageNum);
			// PageDTO 객체생성 
			PageDTO pageDTO = new PageDTO();
			// set메서드 호출해서 값을 저장
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			
			ArrayList<LostBoardDTO> lostBoardList = csBoardService.getLostBoardList(createUser,pageDTO);
			
			// 페이징 작업
			// int 리턴할 형 getBoardCount() 메서드 정의
			// int count = getBoardCount() 메서드 호출
			int count = csBoardService.getLostBoardCount(createUser,check);
			// 한 화면에 보여줄 페이지 개수 설정
			int pageBlock = 10;
			// 시작하는 페이지 번호 구하기
			int startPage = (currentPage-1)/pageBlock*pageBlock+1;
			// 끝나는 페이지 번호 구하기
			int endPage = startPage + pageBlock -1;
			// 전체 페이지 수 구하기
			int pageCount = count / pageSize + (count % pageSize == 0?0:1);
			if(endPage > pageCount) {
				endPage = pageCount;
			}
			
			//pageDTO에 페이징 관련값 저장
			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			
			request.setAttribute("lostBoardList",lostBoardList);
			request.setAttribute("pageDTO", pageDTO);
			dispatcher = request.getRequestDispatcher("_mypage/myinquiry2.jsp");
			dispatcher.forward(request, response);
		}
		// 마이페이지 분실물 문의 답변 미답변 서치
		if(sPath.equals("/myLostStatus.me")) {
			request.setCharacterEncoding("utf-8");
			CSBoardService csBoardService = new CSBoardService();
			HttpSession session = request.getSession();
			String createUser = (String) session.getAttribute("sId");
			String check = "";
			String lostStatus = request.getParameter("lostStatus");
			// cs_center.cs
			// cs_center.cs?pageNum=2
			// 한 화면에 보여줄 글개수 설정
			int pageSize = 10;
			// 현 페이지 번호
			String pageNum = request.getParameter("pageNum");
			//페이지 번호가 없으면 1로 페이지 설정
			if(pageNum == null) {
				pageNum = "1";
			}
			// pageNum => 정수형 변경
			int currentPage = Integer.parseInt(pageNum);
			// PageDTO 객체생성 
			PageDTO pageDTO = new PageDTO();
			// set메서드 호출해서 값을 저장
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			
			ArrayList<LostBoardDTO> lostBoardList = csBoardService.getLostBoardList(createUser,pageDTO,lostStatus);
			
			// 페이징 작업
			// int 리턴할 형 getBoardCount() 메서드 정의
			// int count = getBoardCount() 메서드 호출
			int count = csBoardService.getLostBoardCount(createUser,lostStatus,check);
			// 한 화면에 보여줄 페이지 개수 설정
			int pageBlock = 10;
			// 시작하는 페이지 번호 구하기
			int startPage = (currentPage-1)/pageBlock*pageBlock+1;
			// 끝나는 페이지 번호 구하기
			int endPage = startPage + pageBlock -1;
			// 전체 페이지 수 구하기
			int pageCount = count / pageSize + (count % pageSize == 0?0:1);
			if(endPage > pageCount) {
				endPage = pageCount;
			}
			
			//pageDTO에 페이징 관련값 저장
			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			
			 // 리스트와 PageDTO를 모두 포함할 Map 또는 사용자 정의 객체 생성
		    Map<String, Object> responseData = new HashMap<>();
		    responseData.put("lostBoardList", lostBoardList);
		    responseData.put("pageDTO", pageDTO);

		    // Map 또는 사용자 정의 객체 직렬화
		    String json = new Gson().toJson(responseData);

		    // 컨텐츠 타입과 인코딩 설정
		    response.setContentType("application/json");
		    response.setCharacterEncoding("utf-8");
		    
		    // JSON 문자열을 응답으로 작성
		    response.getWriter().write(json);
//			request.setAttribute("lostBoardList",lostBoardList);
//			request.setAttribute("pageDTO", pageDTO);
//			dispatcher = request.getRequestDispatcher("_mypage/myinquiry2.jsp");
//			dispatcher.forward(request, response);
		}
		// 마이페이지 1대1문의 답변 미답변 서치
		if(sPath.equals("/myQnaStatus.me")) {
			request.setCharacterEncoding("utf-8");
			CSBoardService csBoardService = new CSBoardService();
			HttpSession session = request.getSession();
			String createUser = (String) session.getAttribute("sId");
			String check = "";
			String qnaResponse = request.getParameter("qnaResponse");
			//System.out.println("@@@@@@@@@@@@@@@@");
			//System.out.println(qnaResponse);
			// cs_center.cs
			// cs_center.cs?pageNum=2
			// 한 화면에 보여줄 글개수 설정
			int pageSize = 10;
			// 현 페이지 번호
			String pageNum = request.getParameter("pageNum");
			//페이지 번호가 없으면 1로 페이지 설정
			if(pageNum == null) {
				pageNum = "1";
			}
			// pageNum => 정수형 변경
			int currentPage = Integer.parseInt(pageNum);
			// PageDTO 객체생성 
			PageDTO pageDTO = new PageDTO();
			// set메서드 호출해서 값을 저장
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			
			ArrayList<QnaBoardDTO> qnaBoardList = csBoardService.getQnaBoardList(createUser,pageDTO,qnaResponse);
			
			// 페이징 작업
			// int 리턴할 형 getBoardCount() 메서드 정의
			// int count = getBoardCount() 메서드 호출
			int count = csBoardService.getQnaBoardCount(createUser,qnaResponse,check);
			// 한 화면에 보여줄 페이지 개수 설정
			int pageBlock = 10;
			// 시작하는 페이지 번호 구하기
			int startPage = (currentPage-1)/pageBlock*pageBlock+1;
			// 끝나는 페이지 번호 구하기
			int endPage = startPage + pageBlock -1;
			// 전체 페이지 수 구하기
			int pageCount = count / pageSize + (count % pageSize == 0?0:1);
			if(endPage > pageCount) {
				endPage = pageCount;
			}
			
			//pageDTO에 페이징 관련값 저장
			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			
			 // 리스트와 PageDTO를 모두 포함할 Map 또는 사용자 정의 객체 생성
		    Map<String, Object> responseData = new HashMap<>();
		    responseData.put("qnaBoardList", qnaBoardList);
		    responseData.put("pageDTO", pageDTO);

		    // Map 또는 사용자 정의 객체 직렬화
		    String json = new Gson().toJson(responseData);

		    // 컨텐츠 타입과 인코딩 설정
		    response.setContentType("application/json");
		    response.setCharacterEncoding("utf-8");
		    
		    // JSON 문자열을 응답으로 작성
		    response.getWriter().write(json);
//			request.setAttribute("lostBoardList",lostBoardList);
//			request.setAttribute("pageDTO", pageDTO);
//			dispatcher = request.getRequestDispatcher("_mypage/myinquiry2.jsp");
//			dispatcher.forward(request, response);
		}
		
		// 마이페이지 bookinglist(예매내역) 이동
		// 화면에 보여줄 글개수 설정
		if(sPath.equals("/bookinglist.me")) {
			
			request.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			String memId = (String) session.getAttribute("sId");
			
			int pageSize = 5;
			String pageNum = request.getParameter("pageNum");
			
			if(pageNum == null){
				pageNum = "1";
			}
			
			int currentPage= Integer.parseInt(pageNum);
			
			PageDTO pageDTO = new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			
			memberService = new MemberService();
			
			ArrayList<ReservationDTO> resBoardList = 
					memberService.getResBoardList(pageDTO,memId);
			ArrayList<ReservationDTO> resRefundList =
					memberService.getResRefundList(memId);
			
			// 예약구매 페이지 페이징 작업
			// int 리턴할형 getBoardCount() 메서드 정의
		   //  int count =  getBoardCount()메서드 호출
			int count = memberService.getResBoardCount(memId);
			// 한 화면에 보여줄 페이지 개수 설정
			int pageBlock = 5;
			// 시작하는 페이지 번호 구하기
			int startPage= (currentPage-1)/pageBlock*pageBlock+1;
			// 끝나는 페이지 번호 구하기
			int endPage= startPage + pageBlock -1;
			// 전체 페이지 수 구하기
			int pageCount = count / pageSize + (count % pageSize==0?0:1);
			if(endPage > pageCount){
			 	endPage = pageCount;
			}
			// pageDTO에 페이징 관련값 저장
			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			
			System.out.println(pageDTO);
			System.out.println(resBoardList);
			// request에 pageDTO 저장
			request.setAttribute("pageDTO", pageDTO);
			//request에 boardList 저장
			request.setAttribute("resBoardList", resBoardList);
			request.setAttribute("resRefundList", resRefundList);
			
			dispatcher = request.getRequestDispatcher("_mypage/bookinglist.jsp");
			dispatcher.forward(request, response);
		}//
		// 마이페이지 bookinglist(예매내역) 이동
		// 화면에 보여줄 글개수 설정
		if(sPath.equals("/bookinglist2.me")) {
			
			request.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			String memId = (String) session.getAttribute("sId");
			
			int pageSize = 5;
			String pageNum = request.getParameter("pageNum");
			
			if(pageNum == null){
				pageNum = "1";
			}
			
			int currentPage= Integer.parseInt(pageNum);
			
			PageDTO pageDTO = new PageDTO();
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			
			memberService = new MemberService();
			
			ArrayList<StorePayDTO> storeBoardList = 
					memberService.getStoreBoardList(pageDTO,memId);
			
			// 예약구매 페이지 페이징 작업
			// int 리턴할형 getBoardCount() 메서드 정의
		   //  int count =  getBoardCount()메서드 호출
			int count = memberService.getStoreBoardCount(memId);
			// 한 화면에 보여줄 페이지 개수 설정
			int pageBlock = 5;
			// 시작하는 페이지 번호 구하기
			int startPage= (currentPage-1)/pageBlock*pageBlock+1;
			// 끝나는 페이지 번호 구하기
			int endPage= startPage + pageBlock -1;
			// 전체 페이지 수 구하기
			int pageCount = count / pageSize + (count % pageSize==0?0:1);
			if(endPage > pageCount){
			 	endPage = pageCount;
			}
			// pageDTO에 페이징 관련값 저장
			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			
			System.out.println(pageDTO);
			System.out.println(storeBoardList);
			// request에 pageDTO 저장
			request.setAttribute("pageDTO", pageDTO);
			//request에 boardList 저장
			request.setAttribute("storeBoardList", storeBoardList);
			
			dispatcher = request.getRequestDispatcher("_mypage/bookinglist2.jsp");
			dispatcher.forward(request, response);
		}//
		
		
	}
}
