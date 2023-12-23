package com.itwillbs.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StoreController extends HttpServlet{
	RequestDispatcher dispatcher = null;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	} //

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	} //
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sPath = request.getServletPath();
		
		// store 페이지 이동
		if(sPath.equals("/store.st")) {
			
			dispatcher = request.getRequestDispatcher("_store/store.jsp");
			dispatcher.forward(request, response);
		} // store
		
		// 베스트
		// store_best1 페이지 이동
		if(sPath.equals("/store_best1.st")) {
					
			dispatcher = request.getRequestDispatcher("_store/store_best1.jsp");
			dispatcher.forward(request, response);
		} // store_best1
		
		// store_best2 페이지 이동
		if(sPath.equals("/store_best2.st")) {
					
			dispatcher = request.getRequestDispatcher("_store/store_best2.jsp");
			dispatcher.forward(request, response);
		} // store_best2
		
		// store_best3 페이지 이동
		if(sPath.equals("/store_best3.st")) {
					
			dispatcher = request.getRequestDispatcher("_store/store_best3.jsp");
			dispatcher.forward(request, response);
		} // store_best3
		
		// 스낵음료
		// store_snacks01 페이지 이동
		if(sPath.equals("/store_snacks01.st")) {
					
			dispatcher = request.getRequestDispatcher("_store/store_snacks01.jsp");
			dispatcher.forward(request, response);
		} // store_snacks01
		
		// store_snacks02 페이지 이동
		if(sPath.equals("/store_snacks02.st")) {
					
			dispatcher = request.getRequestDispatcher("_store/store_snacks02.jsp");
			dispatcher.forward(request, response);
		} // store_snacks02
		
		// store_snacks03 페이지 이동
		if(sPath.equals("/store_snacks03.st")) {
					
			dispatcher = request.getRequestDispatcher("_store/store_snacks03.jsp");
			dispatcher.forward(request, response);
		} // store_snacks03
		
		// store_snacks04 페이지 이동
		if(sPath.equals("/store_snacks04.st")) {
					
			dispatcher = request.getRequestDispatcher("_store/store_snacks04.jsp");
			dispatcher.forward(request, response);
		} // store_snacks04
		
		// store_snacks05 페이지 이동
		if(sPath.equals("/store_snacks05.st")) {
					
			dispatcher = request.getRequestDispatcher("_store/store_snacks05.jsp");
			dispatcher.forward(request, response);
		} // store_snacks05
		
		// store_snacks06 페이지 이동
		if(sPath.equals("/store_snacks06.st")) {
					
			dispatcher = request.getRequestDispatcher("_store/store_snacks06.jsp");
			dispatcher.forward(request, response);
		} // store_snacks06
		
		// store_snacks07 페이지 이동
		if(sPath.equals("/store_snacks07.st")) {
					
			dispatcher = request.getRequestDispatcher("_store/store_snacks07.jsp");
			dispatcher.forward(request, response);
		} // store_snacks07
		
		// store_snacks08 페이지 이동
		if(sPath.equals("/store_snacks08.st")) {
					
			dispatcher = request.getRequestDispatcher("_store/store_snacks08.jsp");
			dispatcher.forward(request, response);
		} // store_snacks08
		
		// store_snacks09 페이지 이동
		if(sPath.equals("/store_snacks09.st")) {
					
			dispatcher = request.getRequestDispatcher("_store/store_snacks09.jsp");
			dispatcher.forward(request, response);
		} // store_snacks09
		
		// store_snacks10 페이지 이동
		if(sPath.equals("/store_snacks10.st")) {
					
			dispatcher = request.getRequestDispatcher("_store/store_snacks10.jsp");
			dispatcher.forward(request, response);
		} // store_snacks10
		
		// store_snacks11 페이지 이동
		if(sPath.equals("/store_snacks11.st")) {
					
			dispatcher = request.getRequestDispatcher("_store/store_snacks11.jsp");
			dispatcher.forward(request, response);
		} // store_snacks11
		
		// 관람권
		// store_ticket1 페이지 이동
		if(sPath.equals("/store_ticket1.st")) {
					
			dispatcher = request.getRequestDispatcher("_store/store_ticket1.jsp");
			dispatcher.forward(request, response);
		} // store_ticket1
		
		// store_ticket2 페이지 이동
		if(sPath.equals("/store_ticket2.st")) {
					
			dispatcher = request.getRequestDispatcher("_store/store_ticket2.jsp");
			dispatcher.forward(request, response);
		} // store_ticket2
		
		// store_ticket3 페이지 이동
		if(sPath.equals("/store_ticket3.st")) {
					
			dispatcher = request.getRequestDispatcher("_store/store_ticket3.jsp");
			dispatcher.forward(request, response);
		} // store_ticket3
		
		// store_ticket4 페이지 이동
		if(sPath.equals("/store_ticket4.st")) {
					
			dispatcher = request.getRequestDispatcher("_store/store_ticket4.jsp");
			dispatcher.forward(request, response);
		} // store_ticket4
		
	} // doProcess
	
	
}
