package com.itwillbs.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.dao.StoreDAO;
import com.itwillbs.domain.StoreItemDTO;
import com.itwillbs.service.StoreService;

public class StoreController extends HttpServlet{
	RequestDispatcher dispatcher = null;
	StoreService storeService = new StoreService();
	
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
			request.setAttribute("storeItemListB", storeService.storeListB());
			request.setAttribute("storeItemListS", storeService.storeListS());
			request.setAttribute("storeItemListT", storeService.storeListT());
		
			dispatcher = request.getRequestDispatcher("_store/store.jsp");
			dispatcher.forward(request, response);
		} // store
		
		// storeitem 내용 표시
		if(sPath.equals("/viewstore.bo")) {
			
			storeService = new StoreService();
			storeService.viewstore(request);
			
			request.setAttribute("storeItemList", storeService.storeList());
			
			dispatcher = request.getRequestDispatcher("_store/viewstore.jsp");
			dispatcher.forward(request, response);
		}//
		
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
		// store_snacks1 페이지 이동
		if(sPath.equals("/store_snacks1.st")) {
					
			dispatcher = request.getRequestDispatcher("_store/store_snacks1.jsp");
			dispatcher.forward(request, response);
		} // store_snacks1
		
		// store_snacks2 페이지 이동
		if(sPath.equals("/store_snacks2.st")) {
					
			dispatcher = request.getRequestDispatcher("_store/store_snacks2.jsp");
			dispatcher.forward(request, response);
		} // store_snacks2
		
		// store_snacks3 페이지 이동
		if(sPath.equals("/store_snacks3.st")) {
					
			dispatcher = request.getRequestDispatcher("_store/store_snacks3.jsp");
			dispatcher.forward(request, response);
		} // store_snacks3
		
		// store_snacks4 페이지 이동
		if(sPath.equals("/store_snacks4.st")) {
					
			dispatcher = request.getRequestDispatcher("_store/store_snacks4.jsp");
			dispatcher.forward(request, response);
		} // store_snacks4
		
		// store_snacks5 페이지 이동
		if(sPath.equals("/store_snacks5.st")) {
					
			dispatcher = request.getRequestDispatcher("_store/store_snacks5.jsp");
			dispatcher.forward(request, response);
		} // store_snacks5
		
		// store_snacks6 페이지 이동
		if(sPath.equals("/store_snacks6.st")) {
					
			dispatcher = request.getRequestDispatcher("_store/store_snacks6.jsp");
			dispatcher.forward(request, response);
		} // store_snacks6
		
		// store_snacks7 페이지 이동
		if(sPath.equals("/store_snacks7.st")) {
					
			dispatcher = request.getRequestDispatcher("_store/store_snacks7.jsp");
			dispatcher.forward(request, response);
		} // store_snacks7
		
		// store_snacks8 페이지 이동
		if(sPath.equals("/store_snacks8.st")) {
					
			dispatcher = request.getRequestDispatcher("_store/store_snacks8.jsp");
			dispatcher.forward(request, response);
		} // store_snacks8
		
		// store_snacks9 페이지 이동
		if(sPath.equals("/store_snacks9.st")) {
					
			dispatcher = request.getRequestDispatcher("_store/store_snacks9.jsp");
			dispatcher.forward(request, response);
		} // store_snacks9
		
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
		
	} // doProcess
	
	
}
