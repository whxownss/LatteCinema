package com.itwillbs.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ResController extends HttpServlet {
	RequestDispatcher dispatcher = null;

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
