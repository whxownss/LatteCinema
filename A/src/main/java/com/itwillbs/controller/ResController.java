package com.itwillbs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.itwillbs.domain.LocationDTO;
import com.itwillbs.domain.MovieDTO;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.MovieService;
import com.itwillbs.service.ResService;
import com.itwillbs.utill.Pay;
import com.itwillbs.utill.Token;

public class ResController extends HttpServlet {
	RequestDispatcher dispatcher = null;
	ResService resService = null;

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
		
		// 예약1 페이지 이동
		if(sPath.equals("/res1.re")) {
			resService = new ResService();
			List<LocationDTO> locationList = resService.getLocations();
			String cinemaListJson = resService.getCinemas();
//			String scheduleListJson = resService.getSchedules();
			
			request.setAttribute("locationList", locationList);
			request.setAttribute("cinemaListJson", cinemaListJson);
//			request.setAttribute("scheduleListJson", scheduleListJson);
			
			dispatcher = request.getRequestDispatcher("_reservation/res1.jsp");
			dispatcher.forward(request, response);
		}
		// cinemaList 가져오기 (js 파일에서 jstl 사용이 안 돼서 이렇게 수정)
		if(sPath.equals("/res1ProGC.re")) {
			resService = new ResService();
			String cinemaListJson = resService.getCinemas();
			
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(cinemaListJson);
		}
		// 스케줄 정보 비동기로 가져오기
		if(sPath.equals("/res1Pro.re")) {
			resService = new ResService();
			String cinema = request.getParameter("cinema");
			String param = request.getParameter("param");
			String date = request.getParameter("date");
			String scheduleListJson = resService.getSchedules(cinema, param, date);
			
			System.out.println(scheduleListJson);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(scheduleListJson);
		}
		// 영업중인 지점 가져오기
		if(sPath.equals("/res1ProOc.re")) {
			resService = new ResService();
			String openCinemaListJson = resService.getOpenCinemas();
			
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(openCinemaListJson);
		}
		// 영화관에서 상영중인 영화 목록 가져오기
		if(sPath.equals("/res1ProML.re")) {
			resService = new ResService();
			String cinema = request.getParameter("cinema");
			String date = request.getParameter("date");
//			String movType = request.getParameter("movType");
//			String movieListJson = resService.getMovieList(cinema, movType);
			String movieListJson = resService.getMovieList(cinema, date);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(movieListJson);
		}
		// movieCode 들고왔을 때 정보 가져오기
		if(sPath.equals("/res1ProGM.re")) {
			MovieService movieService = new MovieService();
			MovieDTO detail = movieService.getMovieDetail(request);
			// 어쩔 수 없이 데이터 작업 여기서 해야됨
			Gson gson = new Gson();
			String detailJson = gson.toJson(detail);
			
			System.out.println(detail);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(detailJson);
		}
		
		
		
		
		
		// 예약2 페이지 이동
		if(sPath.equals("/res2.re")) {
			dispatcher = request.getRequestDispatcher("_reservation/res2.jsp");
			dispatcher.forward(request, response);
		}
		// 좌석 체크
		if(sPath.equals("/res2Pro.re")) {
			resService = new ResService();
			String schDTO = request.getParameter("schDTO");
			String seatList = resService.checkSeat(schDTO);
			
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(seatList);
		}
		// 같은 자리 선택 했는지
		if(sPath.equals("/res2ProCS.re")) {
			System.out.println("???????????????????????????");
			resService = new ResService();
			String result = resService.isSameSeat(request.getParameter("schDTO"));
			System.out.println("~~~~~~~~~~~~~~~~~~");
			System.out.println(result);
			System.out.println("~~~~~~~~~~~~~~~~~~");
			
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(result); // 같은자리면 null, 아니면 "noSameSeat"
		}
		// 선택한 자리에 대해 insert (결제전)
		if(sPath.equals("/res2ProIS.re")) {
			resService = new ResService();
			String schDTO = request.getParameter("schDTO");
			HttpSession session = request.getSession();
			String sId = (String)session.getAttribute("sId");
			String result = resService.setSeatInfo(schDTO, sId);
			
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(result);
		}
		// SEAT테이블에 내 자리가 결제 내역에 없을 때 delete
		if(sPath.equals("/res2ProRS.re")) {
			resService = new ResService();
//			String memId = request.getParameter("memId");
			HttpSession session = request.getSession();
			String memId = (String)session.getAttribute("sId");
			
			System.out.println("=123=1231=23");
			System.out.println(memId);
			System.out.println("=123=1231=23");
			
			String result = resService.isPaidSeat(memId);
			
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(result);
		}
		
		// 예약3 페이지 이동
		if(sPath.equals("/res3.re")) {
			resService = new ResService();
			resService.startPayTimer();
			
			// 회원 포인트 가져오기 위해
			HttpSession session = request.getSession();
			MemberService memberService = new MemberService();
			String memPoint = memberService.getMemPoint((String)session.getAttribute("sId"));
			
			request.setAttribute("memPoint", memPoint);
			
			dispatcher = request.getRequestDispatcher("_reservation/res3.jsp");
			dispatcher.forward(request, response);
		}
		// 결제정보 저장, 포인트처리
		if(sPath.equals("/res3Pro.re")) {
			String rsp = request.getParameter("rsp");
			System.out.println("rsp : " + rsp);
			resService = new ResService();
			HttpSession session = request.getSession();
			String sId = (String)session.getAttribute("sId");
			String sName = (String)session.getAttribute("sName");
			String msg = resService.setResInfo(rsp, sId, sName);
			
			// 포인트
			MemberService memberService = new MemberService();
			System.out.println("1231231323");
			System.out.println(request.getParameter("minusPoint"));
			System.out.println(request.getParameter("plusPoint"));
			System.out.println("1231231323");
			memberService.setPoint(rsp, sId, request);         
			
			
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(msg);
		}

		// 결제전 시간이 지났는지 확인 (지났으면 결제 취소, 안지났으면 스케줄러 shutdown)
		if(sPath.equals("/res3ProSE.re")) {
			resService = new ResService();
			String result = resService.isTimeOver(request.getParameter("schDTO"));	
			
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(result);
		}

		// 예약4 페이지 이동
		if(sPath.equals("/res4.re")) {
			dispatcher = request.getRequestDispatcher("_reservation/res4.jsp");
			dispatcher.forward(request, response);
		}
		// 환불 (포트원 작업가기전에 DB에서 시간 먼저 확인 후 DELETE -> 포트원에서 실제 환불)
		if(sPath.equals("/res4Pro.re")) {
			resService = new ResService();
			String mid = request.getParameter("mid"); 
			String result = resService.refund(mid);   // 환불 시간 지났는지 확인후 db 작업
			
			String msg = "상영 시간 30분 전까지만 환불이 가능합니다.";
			if(result.equals("true")) {
				msg = "환불 성공";
				Pay pay = new Pay();
				String token = pay.getImportToken();  
				
				int result_delete = pay.cancelPay(token, mid);  // 포트원 환불
				if(result_delete == -1) msg = "환불 실패";
				
				
				
				// 포인트 환불
				HttpSession session = request.getSession();
				String sId = (String)session.getAttribute("sId");
				resService.refundPoint(sId, mid);
				
				
				
			}
	        
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(msg);
		}
		// 환불 DB 
//		if(sPath.equals("/res4ProRF.re")) {
//			resService = new ResService();
//			String mid = request.getParameter("mid");
//			resService.refund(mid);
//	        
//			response.setCharacterEncoding("utf-8");
//			response.getWriter().write(msg);
//		}
		
	}
}
