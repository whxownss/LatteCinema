package com.itwillbs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.domain.CinemaDTO;
import com.itwillbs.domain.LocationDTO;
import com.itwillbs.domain.ScheduleDTO;
import com.itwillbs.service.ResService;

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
		// 스케줄 정보 비동기로 가져오기
		if(sPath.equals("/res1Pro.re")) {
			resService = new ResService();
			String cinema = request.getParameter("cinema");
			String param = request.getParameter("param");
			String date = request.getParameter("date");
			String scheduleListJson = resService.getSchedules(cinema, param, date);
			
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
		

		// 예약3 페이지 이동
		if(sPath.equals("/res3.re")) {
			dispatcher = request.getRequestDispatcher("_reservation/res3.jsp");
			dispatcher.forward(request, response);
		}
		// 결제정보 저장
		if(sPath.equals("/res3Pro.re")) {
			String rsp = request.getParameter("rsp");
			resService = new ResService();
			String msg = resService.setResInfo(rsp);
			
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(msg);
		}
		

		// 예약4 페이지 이동
		if(sPath.equals("/res4.re")) {
			dispatcher = request.getRequestDispatcher("_reservation/res4.jsp");
			dispatcher.forward(request, response);
		}
		
		
	}
}
