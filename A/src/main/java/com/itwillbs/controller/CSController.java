package com.itwillbs.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.itwillbs.domain.CenterBoardDTO;
import com.itwillbs.domain.CinemaDTO;
import com.itwillbs.domain.ExqBoardDTO;
import com.itwillbs.domain.LocationDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.QnaBoardDTO;
import com.itwillbs.service.CSBoardService;

public class CSController extends HttpServlet  {
	RequestDispatcher dispatcher = null;
	CSBoardService csBoardService = null;
	
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
			System.out.println("주소비교 /cs_center.cs 일치");
			request.setCharacterEncoding("utf-8");
			// cs_center.cs
			// cs_center.cs?pageNum=2
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
			
			csBoardService = new CSBoardService();

			ArrayList<CenterBoardDTO> centerBoardList = csBoardService.getCenterBoardList(pageDTO);
			// 페이징 작업
			// int 리턴할 형 getBoardCount() 메서드 정의
			// int count = getBoardCount() 메서드 호출
			int count = csBoardService.getCenterBoardCount();
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
			
			System.out.println("!@#!@#");
			System.out.println(centerBoardList);
			
			request.setAttribute("pageDTO", pageDTO);			
			request.setAttribute("centerBoardList",centerBoardList);
		
			dispatcher = request.getRequestDispatcher("_cs/cs_center.jsp");
			dispatcher.forward(request, response);
		}
		// 공지사항 글내용 페이지 이동
		if(sPath.equals("/cs_center_content.cs")) {
			System.out.println("주소비교 /cs_center_content.cs 일치");
			String createUser = request.getParameter("createUser");
			String createDate = request.getParameter("createDate");
			
			csBoardService = new CSBoardService();
			CenterBoardDTO centerBoardDTO = csBoardService.getCenterBoard(createUser,createDate);
			request.setAttribute("centerBoardDTO", centerBoardDTO);
			
			dispatcher = request.getRequestDispatcher("_cs/cs_center_content.jsp");
			dispatcher.forward(request, response);
		}
		// 공지사항 글내용 페이지 업데이트 
		if(sPath.equals("/saveCenterContent.cs")) {
			System.out.println("주소비교 /saveCenterContent.cs 일치");
			request.setCharacterEncoding("utf-8");
			
			csBoardService = new CSBoardService();
			String msg = "update fail";
			if(csBoardService.updateCenterContent(request)) {
				msg = "update success";
			}
			System.out.println(msg);
//			response.sendRedirect(""); //ajax를 써서 굳이 주소 적을 필요 없다.
		}
		// 공지사항 삭제 하기
		if(sPath.equals("/deleteCenterContent.cs")) {
			System.out.println("주소비교 /deleteCenterContent.cs 일치");
			request.setCharacterEncoding("utf-8");
			
			csBoardService = new CSBoardService();
			String msg = "delete fail";
			if(csBoardService.deleteCenterContent(request)) {
				msg = "delete success";
			}
			System.out.println(msg);
			//response.sendRedirect("cs_center.cs");
		}
		
		// 공지사항 글쓰기 페이지 이동
		if(sPath.equals("/cs_center_write.cs")) {
			System.out.println("주소비교 /cs_center_write.cs 일치");
			dispatcher = request.getRequestDispatcher("_cs/cs_center_write.jsp");
			dispatcher.forward(request, response);
		}
		// 공지사항 글쓰기 페이지 지역 선택
		if(sPath.equals("/getRegionList.cs")) {
			System.out.println("주소비교 /getRegionList.cs 일치");
			request.setCharacterEncoding("utf-8");
			
			csBoardService = new CSBoardService();
			ArrayList<LocationDTO> regionList = csBoardService.getRegionList();
//			request.setAttribute("regionList",regionList);
			// Gson 라이브러리를 사용하여 JSON으로 변환
		    String json = new Gson().toJson(regionList);

		    // 컨텐츠 타입 설정
		    response.setContentType("application/json");
		    response.setCharacterEncoding("utf-8");

		    // JSON 문자열을 응답으로 작성
		    response.getWriter().write(json);
		}
		// 공지사항 글쓰기 페이지 지역 선택 후 영화관설정
		if(sPath.equals("/getCinemaList.cs")) {
			System.out.println("주소비교 /getCinemaList.cs 일치");
			request.setCharacterEncoding("utf-8");
			csBoardService = new CSBoardService();
			String loIdx = request.getParameter("loIdx");
			ArrayList<CinemaDTO> cinemaList = csBoardService.getCinemaList(loIdx);
			// Gson 라이브러리를 사용하여 JSON으로 변환
		    String json = new Gson().toJson(cinemaList);

		    // 컨텐츠 타입 설정
		    response.setContentType("application/json");
		    response.setCharacterEncoding("utf-8");

		    // JSON 문자열을 응답으로 작성
		    response.getWriter().write(json);
		}
		// 공지사항 글쓰기 하기
		if(sPath.equals("/insertCenterWrite.cs")) {
			System.out.println("주소비교 /insertCenterWrite.cs 일치");
			request.setCharacterEncoding("utf-8");
			
			csBoardService = new CSBoardService();
			String msg = "insert fail";
			if(csBoardService.insertCenterWrite(request)) {
				msg = "insert success";
			}
			System.out.println(msg);
			
			response.sendRedirect("cs_center.cs");
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
			System.out.println("주소비교 /cs_qna.cs 일치");
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
			
			//추가한 부분
			String qnaCategory = request.getParameter("qnaCategory");
			if(qnaCategory == null) {
				qnaCategory = "";
			}
			
			ArrayList<QnaBoardDTO> qnaBoardList = csBoardService.getQnaBoardList(pageDTO);
			if(!qnaCategory.equals("")) {
				qnaBoardList = csBoardService.getQnaBoardList(pageDTO,qnaCategory);
			}
			//추가한 부분

//			ArrayList<QnaBoardDTO> qnaBoardList = csBoardService.getQnaBoardList(pageDTO);
			// 페이징 작업
			// int 리턴할 형 getBoardCount() 메서드 정의
			// int count = getBoardCount() 메서드 호출
			int count = csBoardService.getQnaBoardCount();
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
			request.setAttribute("qnaBoardList",qnaBoardList);
			if(!qnaCategory.equals("")) {
//				System.out.println("@@@" + qnaBoardList.toString());
				// Gson 라이브러리를 사용하여 JSON으로 변환
				String json = new Gson().toJson(qnaBoardList);
//				System.out.println(json);
				// 컨텐츠 타입 설정
				response.setContentType("application/json");
				response.setCharacterEncoding("utf-8");
				
				// JSON 문자열을 응답으로 작성
				response.getWriter().write(json);
				return;
			}
//		    System.out.println("if문 넘어가나?");
			dispatcher = request.getRequestDispatcher("_cs/cs_qna.jsp");
			dispatcher.forward(request, response);
		}
		// 1:1문의 글 검색 이거 말고 다르게 해보자.
		if(sPath.equals("/cs_qnaSearch.cs")) {
			System.out.println("주소비교 /cs_qnaSearch.cs 일치");
		}
		// 1:1문의 글내용 페이지 이동
		if(sPath.equals("/cs_qna_content.cs")) {
			System.out.println("주소비교 /cs_qna_content.cs 일치");
			String createUser = request.getParameter("createUser");
			String createDate = request.getParameter("createDate");
			
			csBoardService = new CSBoardService();
			QnaBoardDTO qnaBoardDTO = csBoardService.getQnaBoard(createUser,createDate);
			request.setAttribute("qnaBoardDTO", qnaBoardDTO);

			dispatcher = request.getRequestDispatcher("_cs/cs_qna_content.jsp");
			dispatcher.forward(request, response);
		}
		// 1:1문의 글 업데이트 하기
		if(sPath.equals("/updateQnaBoard.cs")) {
			System.out.println("주소비교 /updateQnaBoard.cs 일치");
			request.setCharacterEncoding("utf-8");
			
			csBoardService = new CSBoardService();
			String msg = "qna update fail";
			if(csBoardService.updateQnaBoard(request)) {
				msg = "qna update success";
			}
			System.out.println(msg);
		}
		// 1:1문의 글쓰기 페이지 이동
		if(sPath.equals("/cs_qna_write.cs")) {
			System.out.println("주소비교 /cs_qna_write.cs 일치");
			dispatcher = request.getRequestDispatcher("_cs/cs_qna_write.jsp");
			dispatcher.forward(request, response);
		}
		// 1:1문의 글쓰기
		if(sPath.equals("/qnaBoardInsert.cs")) {
			System.out.println("주소비교 /qnaBoardInsert.cs 일치");
			request.setCharacterEncoding("utf-8");
			
			csBoardService = new CSBoardService();
			String msg = "qna insert fail";
			if(csBoardService.qnaBoardInsert(request)) {
				msg = "qna insert success";
				response.sendRedirect("cs_qna.cs");
			}
			System.out.println(msg);
			
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
