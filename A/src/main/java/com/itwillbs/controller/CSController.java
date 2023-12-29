package com.itwillbs.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.domain.ExqBoardDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.CSBoardService;

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
			System.out.println("주소비교 /cs_exque.cs 일치");
			request.setCharacterEncoding("utf-8");
			// cs_exque.cs
			// cs_exque.cs?pageNum=2
			// 한 화면에 보여줄 글개수 설정
			int pageSize = 10;
			// 현 페이지 번호
			String pageNum = request.getParameter("pageNum");
			//페이지 번호가 없으면 1로 페이지 설정
			if(pageNum == null) {
				pageNum = "1";
			}
			// pageNum => 정수형 변경
			int currentPage = Integer.parseInt(pageNum);
			
			// PageDTO 객체생성 
			PageDTO pageDTO = new PageDTO();
			// set메서드 호출해서 값을 저장
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			
			CSBoardService csBoardService = new CSBoardService();

			ArrayList<ExqBoardDTO> exqBoardList = csBoardService.getExqBoardList(pageDTO);
			// 페이징 작업
			// int 리턴할 형 getBoardCount() 메서드 정의
			// int count = getBoardCount() 메서드 호출
			int count = csBoardService.getExqBoardCount();
			// 한 화면에 보여줄 페이지 개수 설정
			int pageBlock = 10;
			// 시작하는 페이지 번호 구하기
			int startPage = (currentPage-1)/pageBlock*pageBlock+1;
			// 끝나는 페이지 번호 구하기
			int endPage = startPage + pageBlock -1;
			// 전체 페이지 수 구하기
			int pageCount = count / pageSize + (count % pageSize == 0?0:1);
			if(endPage > pageCount) {
				endPage = pageCount;
			}
			
			//pageDTO에 페이징 관련값 저장
			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			
			request.setAttribute("pageDTO", pageDTO);			
			request.setAttribute("exqBoardList",exqBoardList);
			
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
