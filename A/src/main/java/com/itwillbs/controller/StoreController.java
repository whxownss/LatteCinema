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
		if(sPath.equals("/storeList.st")) {
			
			String idx = request.getParameter("itemIdx");
			
			storeService = new StoreService();
			
			String storeItemJson = storeService.getItemInfo(idx);
//			StoreItemDTO storeItemDTO = storeService.getItemInfo(idx);
			
			request.setAttribute("storeItemJson", storeItemJson);
			dispatcher = request.getRequestDispatcher("_store/storeList.jsp");
			dispatcher.forward(request, response);
		}//
		
	} // doProcess
	
	
}
