package com.itwillbs.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.domain.CenterBoardDTO;
import com.itwillbs.domain.LostBoardDTO;
import com.itwillbs.domain.QnaBoardDTO;
import com.itwillbs.service.CSBoardService;

public class AdminController extends HttpServlet {
	
	RequestDispatcher dispatcher = null;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}//doGet()

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}//doPost()
	
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sPath = request.getServletPath();
		
		// 관리자 홈 페이지 이동
		if(sPath.equals("/adm_home.ad")) {
			dispatcher = request.getRequestDispatcher("_admin/production/adm_home.jsp");
			dispatcher.forward(request, response);
		}
		
		// 관리자 회원관리 페이지 이동
		if(sPath.equals("/adm_member.ad")) {
			dispatcher = request.getRequestDispatcher("_admin/production/adm_member.jsp");
			dispatcher.forward(request, response);
		}		
		
		// 관리자 영화 및 영화관 관리 페이지 이동
		if(sPath.equals("/adm_mv_inout.ad")) {
			dispatcher = request.getRequestDispatcher("_admin/production/adm_mv_inout.jsp");
			dispatcher.forward(request, response);
		}	
		
		// 관리자 영화 및 영화관 관리 페이지 이동
		if(sPath.equals("/adm_store.ad")) {
			dispatcher = request.getRequestDispatcher("_admin/production/adm_store.jsp");
			dispatcher.forward(request, response);
		}		  

		// 관리자 공지사항 페이지 이동
		if(sPath.equals("/adm_cs_center.ad")) {
			CSBoardService csBoardService = new CSBoardService();
			ArrayList<CenterBoardDTO> centerBoardList = csBoardService.getCenterBoardList();
			request.setAttribute("centerBoardList", centerBoardList);
			
			dispatcher = request.getRequestDispatcher("_admin/production/adm_cs_center.jsp");
			dispatcher.forward(request, response);
		}	

		// 관리자 자주찾는질문 페이지 이동
		if(sPath.equals("/adm_cs_exque.ad")) {
			dispatcher = request.getRequestDispatcher("_admin/production/adm_cs_exque.jsp");
			dispatcher.forward(request, response);
		}	
	 
		// 관리자 1:1문의 페이지 이동
		if(sPath.equals("/adm_cs_qna.ad")) {
			CSBoardService csBoardService = new CSBoardService();
			ArrayList<QnaBoardDTO> qnaBoardList = csBoardService.getQnaBoardList();
			request.setAttribute("qnaBoardList", qnaBoardList);
			
			dispatcher = request.getRequestDispatcher("_admin/production/adm_cs_qna.jsp");
			dispatcher.forward(request, response);
		}
		
		// 관리자 분실물 페이지 이동
		if(sPath.equals("/adm_cs_lost.ad")) {
			CSBoardService csBoardService = new CSBoardService();
			ArrayList<LostBoardDTO> lostBoardList = csBoardService.getLostBoardList();
			request.setAttribute("lostBoardList",lostBoardList);
			
			dispatcher = request.getRequestDispatcher("_admin/production/adm_cs_lost.jsp");
			dispatcher.forward(request, response);
		}	
		
		
	}//doProcess()	
	
	
	
	
	
}//클래스 끝
