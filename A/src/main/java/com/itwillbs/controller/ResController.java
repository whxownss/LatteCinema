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
			String scheduleListJson = resService.getSchedules();
			
			request.setAttribute("locationList", locationList);
			request.setAttribute("cinemaListJson", cinemaListJson);
			request.setAttribute("scheduleListJson", scheduleListJson);
			
			dispatcher = request.getRequestDispatcher("_reservation/res1.jsp");
			dispatcher.forward(request, response);
		}
		

		// 예약2 페이지 이동
		if(sPath.equals("/res2.re")) {
			dispatcher = request.getRequestDispatcher("_reservation/res2.jsp");
			dispatcher.forward(request, response);
		}
		

		// 예약3 페이지 이동
		if(sPath.equals("/res3.re")) {
			dispatcher = request.getRequestDispatcher("_reservation/res3.jsp");
			dispatcher.forward(request, response);
		}
		

		// 예약4 페이지 이동
		if(sPath.equals("/res4.re")) {
			dispatcher = request.getRequestDispatcher("_reservation/res4.jsp");
			dispatcher.forward(request, response);
		}
		
		
	}
}
