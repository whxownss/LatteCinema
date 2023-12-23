package com.itwillbs.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CSController extends HttpServlet  {
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
		
		// 멤버십 페이지 이동
		if(sPath.equals("/cs_member.cs")) {
			dispatcher = request.getRequestDispatcher("_cs/cs_member.jsp");
			dispatcher.forward(request, response);
		}
		// 단체관람 대관문의 페이지 이동
		if(sPath.equals("/cs_rent.cs")) {
			dispatcher = request.getRequestDispatcher("_cs/cs_rent.jsp");
			dispatcher.forward(request, response);
		}
				
		// 공지사항 페이지 이동(고객센터 쪽에서 제일 먼저 보이는 페이지)
		if(sPath.equals("/cs_center.cs")) {
			dispatcher = request.getRequestDispatcher("_cs/cs_center.jsp");
			dispatcher.forward(request, response);
		}
		// 공지사항 글내용 페이지 이동
		if(sPath.equals("/cs_center_content.cs")) {
			dispatcher = request.getRequestDispatcher("_cs/cs_center_content.jsp");
			dispatcher.forward(request, response);
		}
		// 공지사항 글쓰기 페이지 이동
		if(sPath.equals("/cs_center_write.cs")) {
			dispatcher = request.getRequestDispatcher("_cs/cs_center_write.jsp");
			dispatcher.forward(request, response);
		}	
		
		// 자주찾는질문 페이지 이동
		if(sPath.equals("/cs_exque.cs")) {
			dispatcher = request.getRequestDispatcher("_cs/cs_exque.jsp");
			dispatcher.forward(request, response);
		}		
		
		// 1:1문의 페이지 이동
		if(sPath.equals("/cs_qna.cs")) {
			dispatcher = request.getRequestDispatcher("_cs/cs_qna.jsp");
			dispatcher.forward(request, response);
		}	
		// 1:1문의 글쓰기 페이지 이동
		if(sPath.equals("/cs_qna_write.cs")) {
			dispatcher = request.getRequestDispatcher("_cs/cs_qna_write.jsp");
			dispatcher.forward(request, response);
		}
		// 1:1문의 글내용 페이지 이동
		if(sPath.equals("/cs_qna_content.cs")) {
			dispatcher = request.getRequestDispatcher("_cs/cs_qna_content.jsp");
			dispatcher.forward(request, response);
		}		

		// 분실물 페이지 이동
		if(sPath.equals("/cs_lost.cs")) {
			dispatcher = request.getRequestDispatcher("_cs/cs_lost.jsp");
			dispatcher.forward(request, response);
		}
		// 분실물 글쓰기 페이지 이동
		if(sPath.equals("/cs_lost_write.cs")) {
			dispatcher = request.getRequestDispatcher("_cs/cs_lost_write.jsp");
			dispatcher.forward(request, response);
		}
		// 분실물 글내용 페이지 이동
		if(sPath.equals("/cs_lost_content.cs")) {
			dispatcher = request.getRequestDispatcher("_cs/cs_lost_content.jsp");
			dispatcher.forward(request, response);
		}		
		
		
		
		
	}//doProcess()
}
