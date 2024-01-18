package com.itwillbs.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.itwillbs.dao.StoreDAO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.StoreItemDTO;
import com.itwillbs.domain.StorePayDTO;
import com.itwillbs.service.CSBoardService;
import com.itwillbs.service.MemberService;
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
			
//			String idx = request.getParameter("itemIdx");
//			
//			storeService = new StoreService();
//			
//			String storeItemJson = storeService.getItemInfo(idx);
//			
//			request.setAttribute("storeItemJson", storeItemJson);
			
			dispatcher = request.getRequestDispatcher("_store/storeList.jsp");
			dispatcher.forward(request, response);
		}//
		// storeItemJson 가져오기
		if(sPath.equals("/storeListview.st")) {
			
			String idx = request.getParameter("itemIdx");
			storeService = new StoreService();
			
			String storeItemJson = "";
			storeItemJson = storeService.getItemInfo(idx);
			
			response.setContentType("application/json");
			response.setContentType("text/html; charset=utf-8");
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(storeItemJson);
		}//
		
		// store 선물하기 전화번호 유무 체크
		if(sPath.equals("/checkphone.st")) {
			
			storeService = new StoreService();
			
			int result = storeService.checkPhone(request);
			
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(result + "");

		}//
		
		// 결제완료
		if(sPath.equals("/storeListPro.st")){
			
			String rsp = request.getParameter("rsp");
			
			storeService = new StoreService();
			
			String buyerInfo = storeService.buyerInfo(rsp);
			
			request.setAttribute("buyerInfo", buyerInfo);
			
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(buyerInfo);
			
		}//
		
		// 관리자 스토어 AdminController에서 시작 111
		
	} // doProcess
	
}
