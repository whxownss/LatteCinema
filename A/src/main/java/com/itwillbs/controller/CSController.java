package com.itwillbs.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.itwillbs.domain.CenterBoardDTO;
import com.itwillbs.domain.CinemaDTO;
import com.itwillbs.domain.ExqBoardDTO;
import com.itwillbs.domain.LocationDTO;
import com.itwillbs.domain.LostBoardDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.QnaBoardDTO;
import com.itwillbs.domain.RecommendDTO;
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
			response.sendRedirect("adm_cs_center.ad"); //ajax를 써서 굳이 주소 적을 필요 없다.
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
			response.sendRedirect("adm_cs_center.ad");
		}
		
		// 공지사항 글쓰기 페이지 이동
		if(sPath.equals("/cs_center_write.cs")) {
			System.out.println("주소비교 /cs_center_write.cs 일치");
//			HttpSession session = request.getSession();
//			String memId = (String) session.getAttribute("sId");
//			if(memId == null) {
//				response.sendRedirect("main.me");
//				return;
//			}
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
			
//			response.sendRedirect("cs_center.cs");
			response.sendRedirect("adm_cs_center.ad");
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
		// 자주 찾는 질문 카테고리로 검색하기.
		if(sPath.equals("/cs_exq_search.cs")) {
			System.out.println("주소비교 /cs_exq_search.cs 일치");
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

			ArrayList<ExqBoardDTO> exqBoardList = csBoardService.getExqBoardList(pageDTO,request);
			// 페이징 작업
			// int 리턴할 형 getBoardCount() 메서드 정의
			// int count = getBoardCount() 메서드 호출
			int count = csBoardService.getExqBoardCount(request);
			// 한 화면에 보여줄 페이지 개수 설정. 테스트를 위해 3으로 잠깐 변경. 테스트 성공
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
			
//			System.out.println("@@@@@");
//			System.out.println(pageDTO);
//			System.out.println(exqBoardList);
			 // 리스트와 PageDTO를 모두 포함할 Map 또는 사용자 정의 객체 생성
		    Map<String, Object> responseData = new HashMap<>();
		    responseData.put("exqBoardList", exqBoardList);
		    responseData.put("pageDTO", pageDTO);

		    // Map 또는 사용자 정의 객체 직렬화
		    String json = new Gson().toJson(responseData);

		    // 컨텐츠 타입과 인코딩 설정
		    response.setContentType("application/json");
		    response.setCharacterEncoding("utf-8");
		    
		    // JSON 문자열을 응답으로 작성
		    response.getWriter().write(json);
		}
		// 자주 찾는 질문 수정
		if(sPath.equals("/cs_exqueUpdate.cs")) {
			System.out.println("주소비교 /cs_exqueUpdate.cs 일치");
			request.setCharacterEncoding("utf-8");
			
			csBoardService = new CSBoardService();
			String msg = "exq update fail";
			if(csBoardService.updateExqBoard(request)) {
				msg = "exq update success";
			}
			System.out.println(msg);
			
			response.sendRedirect("adm_cs_exque.ad");
		}
		// 자주 찾는 질문 삭제
		if(sPath.equals("/cs_deleteExqBoard.cs")) {
			System.out.println("주소비교 /cs_deleteExqBoard.cs 일치");
			request.setCharacterEncoding("utf-8");
			
			csBoardService = new CSBoardService();
			String msg = "exq delete fail";
			if(csBoardService.deleteExqBoard(request)) {
				msg = "exq delete success";
			}
			System.out.println(msg);
			
			response.sendRedirect("adm_cs_exque.ad");
		}
		// 자주 찾는 질문 추가
		if(sPath.equals("/cs_insertExqBoard.cs")) {
			System.out.println("주소비교 /cs_insertExqBoard.cs 일치");
			request.setCharacterEncoding("utf-8");
			
			csBoardService = new CSBoardService();
			String msg = "exq insert fail";
			if(csBoardService.exqBoardInsert(request)) {
				msg = "exq insert success";
				response.sendRedirect("adm_cs_exque.ad");
			}
			System.out.println(msg);
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
			System.out.println("@@@@->" + qnaCategory);
			if(qnaCategory == null) {
				qnaCategory = "";
			}
			int count = 0;
			ArrayList<QnaBoardDTO> qnaBoardList = null;
			//int count = csBoardService.getQnaBoardCount();
			//ArrayList<QnaBoardDTO> qnaBoardList = csBoardService.getQnaBoardList(pageDTO);
			//select 2번 안하려고 if else로 한다.
			if(!qnaCategory.equals("")) {
				System.out.println("@@@@@@@@@@ cs_qna서치페이징");
				qnaBoardList = csBoardService.getQnaBoardList(pageDTO,qnaCategory);
				count = csBoardService.getQnaBoardCount(qnaCategory);
			} else {
				count = csBoardService.getQnaBoardCount();
				qnaBoardList = csBoardService.getQnaBoardList(pageDTO);
			}
			//추가한 부분

//			ArrayList<QnaBoardDTO> qnaBoardList = csBoardService.getQnaBoardList(pageDTO);
			// 페이징 작업
			// int 리턴할 형 getBoardCount() 메서드 정의
			// int count = getBoardCount() 메서드 호출
//			int count = csBoardService.getQnaBoardCount();
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
				
			    // 리스트와 PageDTO를 모두 포함할 Map 또는 사용자 정의 객체 생성
			    Map<String, Object> responseData = new HashMap<>();
			    responseData.put("qnaBoardList", qnaBoardList);
			    responseData.put("pageDTO", pageDTO);

			    // Map 또는 사용자 정의 객체 직렬화
			    String json = new Gson().toJson(responseData);

			    // 컨텐츠 타입과 인코딩 설정
			    response.setContentType("application/json");
			    response.setCharacterEncoding("utf-8");
			    
			    // JSON 문자열을 응답으로 작성
			    response.getWriter().write(json);
			    return;
			}
			dispatcher = request.getRequestDispatcher("_cs/cs_qna.jsp");
			dispatcher.forward(request, response);
		}
		// 1:1문의 글 검색 이거 너무 막 만들었음
		if(sPath.equals("/cs_qnaSearch.cs")) {
			System.out.println("주소비교 /cs_qnaSearch.cs 일치");
			String pageNum = request.getParameter("pageNum");
			String qnaCategory = request.getParameter("qnaCategory");
			// cs_exque.cs
			// cs_exque.cs?pageNum=2
			// 한 화면에 보여줄 글개수 설정
			int pageSize = 10;
			// 현 페이지 번호
//			String pageNum = request.getParameter("pageNum");
			
			// pageNum => 정수형 변경
			int currentPage = Integer.parseInt(pageNum);
			
			// PageDTO 객체생성 
			PageDTO pageDTO = new PageDTO();
			// set메서드 호출해서 값을 저장
			pageDTO.setPageSize(pageSize);
			pageDTO.setPageNum(pageNum);
			pageDTO.setCurrentPage(currentPage);
			
			CSBoardService csBoardService = new CSBoardService();
			
			System.out.println("@@@@->" + qnaCategory);
			
			int count = 0;
			ArrayList<QnaBoardDTO> qnaBoardList = null;
			if(!qnaCategory.equals("")) {
				System.out.println("@@@@@@@@@@ cs_qna서치페이징");
				qnaBoardList = csBoardService.getQnaBoardList(pageDTO,qnaCategory);
				count = csBoardService.getQnaBoardCount(qnaCategory);
			}
//						ArrayList<QnaBoardDTO> qnaBoardList = csBoardService.getQnaBoardList(pageDTO);
			// 페이징 작업
			// int 리턴할 형 getBoardCount() 메서드 정의
			// int count = getBoardCount() 메서드 호출
//						int count = csBoardService.getQnaBoardCount();
			// 한 화면에 보여줄 페이지 개수 설정. 테스트를 위한 값3을 주고 이전 다음 링크 확인 중. 테스트 성공 이전 다음 링크 완료.
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
			
			if(!qnaCategory.equals("")) {
			    // 리스트와 PageDTO를 모두 포함할 Map 또는 사용자 정의 객체 생성
			    Map<String, Object> responseData = new HashMap<>();
			    responseData.put("qnaBoardList", qnaBoardList);
			    responseData.put("pageDTO", pageDTO);

			    // Map 또는 사용자 정의 객체 직렬화
			    String json = new Gson().toJson(responseData);

			    // 컨텐츠 타입과 인코딩 설정
			    response.setContentType("application/json");
			    response.setCharacterEncoding("utf-8");
			    
			    // JSON 문자열을 응답으로 작성
			    response.getWriter().write(json);
			    return;
			}
//			request.setAttribute("pageDTO", pageDTO);			
//			request.setAttribute("qnaBoardList",qnaBoardList);
			dispatcher = request.getRequestDispatcher("_cs/cs_qna.jsp");
			dispatcher.forward(request, response);
		}//
		// 1:1문의 글내용 페이지 이동
		if(sPath.equals("/cs_qna_content.cs")) {
			System.out.println("주소비교 /cs_qna_content.cs 일치");
			String createUser = request.getParameter("createUser");
			String createDate = request.getParameter("createDate");
			
//			HttpSession session = request.getSession();
//			String memId = (String) session.getAttribute("sId");
//			if(memId == null) {
//				memId = "";
//			}
//			if(!memId.equalsIgnoreCase("admin")) {
//				if(!memId.equalsIgnoreCase(createUser)) {
//					response.sendRedirect("login.me");
//					return;
//				}
//			}
			
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
		// 1:1문의 글 업데이트 하기2
		if(sPath.equals("/updateQnaBoard2.cs")) {
			System.out.println("주소비교 /updateQnaBoard2.cs 일치");
			request.setCharacterEncoding("utf-8");
			
			csBoardService = new CSBoardService();
			String msg = "qna update fail";
			if(csBoardService.updateQnaBoard2(request)) {
				msg = "qna update success";
			}
			System.out.println(msg);
			response.sendRedirect("adm_cs_qna.ad");
		}
		// 1:1문의 글쓰기 페이지 이동
		if(sPath.equals("/cs_qna_write.cs")) {
			System.out.println("주소비교 /cs_qna_write.cs 일치");
			
//			HttpSession session = request.getSession();
//			String memId = (String) session.getAttribute("sId");
//			if(memId == null) {
//				response.sendRedirect("main.me");
//				return;
//			}
			
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
		// 1:1문의 글삭제
		if(sPath.equals("/deleteQnaBoard.cs")) {
			System.out.println("주소비교 /deleteQnaBoard.cs 일치");
			request.setCharacterEncoding("utf-8");
			
			csBoardService = new CSBoardService();
			String msg = "delete fail";
			if(csBoardService.deleteQnaBoard(request)) {
				msg = "delete success";
			}
			System.out.println(msg);
			response.sendRedirect("adm_cs_qna.ad");
		}//

		// 분실물 페이지 이동
		if(sPath.equals("/cs_lost.cs")) {
			System.out.println("주소비교 /cs_lost.cs 일치");
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

			ArrayList<LostBoardDTO> lostBoardList = csBoardService.getLostBoardList(pageDTO);
			// 페이징 작업
			// int 리턴할 형 getBoardCount() 메서드 정의
			// int count = getBoardCount() 메서드 호출
			int count = csBoardService.getLostBoardCount();
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
			System.out.println(lostBoardList);
			
			request.setAttribute("pageDTO", pageDTO);			
			request.setAttribute("lostBoardList",lostBoardList);
			dispatcher = request.getRequestDispatcher("_cs/cs_lost.jsp");
			dispatcher.forward(request, response);
		}
		// 분실물 글쓰기 페이지 이동
		if(sPath.equals("/cs_lost_write.cs")) {
			System.out.println("주소비교 /cs_lost_write.cs 일치");
			
//			HttpSession session = request.getSession();
//			String memId = (String) session.getAttribute("sId");
//			if(memId == null) {
//				response.sendRedirect("main.me");
//				return;
//			}
			
			dispatcher = request.getRequestDispatcher("_cs/cs_lost_write.jsp");
			dispatcher.forward(request, response);
		}
		// 분실물 글내용 페이지 이동
		if(sPath.equals("/cs_lost_content.cs")) {
			System.out.println("주소비교 /cs_lost_content.cs 일치");
			request.setCharacterEncoding("utf-8");
			String createUser = request.getParameter("createUser");
			String createDate = request.getParameter("createDate");
			
			csBoardService = new CSBoardService();
			LostBoardDTO lostBoardDTO = csBoardService.getLostBoard(createUser,createDate);
			request.setAttribute("lostBoardDTO", lostBoardDTO);
			
			dispatcher = request.getRequestDispatcher("_cs/cs_lost_content.jsp");
			dispatcher.forward(request, response);
		}
		// 분실물 글내용 페이지 관리자 답변 수정
		if(sPath.equals("/updateLostBoard.cs")) {
			System.out.println("주소비교 /updateLostBoard.cs 일치");
			request.setCharacterEncoding("utf-8");
			
			csBoardService = new CSBoardService();
			String msg = "lost update fail";
			if(csBoardService.updateLostBoard(request)) {
				msg = "lost update success";
			}
			System.out.println(msg);
		}
		// 분실물 글내용 페이지 관리자 답변 수정2
		if(sPath.equals("/updateLostBoard2.cs")) {
			System.out.println("주소비교 /updateLostBoard2.cs 일치");
			request.setCharacterEncoding("utf-8");
			
			csBoardService = new CSBoardService();
			String msg = "lost update fail";
			if(csBoardService.updateLostBoard2(request)) {
				msg = "lost update success";
			}
			System.out.println(msg);
			response.sendRedirect("adm_cs_lost.ad");
		}
		// 분실물 글쓰기
		if(sPath.equals("/insertCsLost.cs")) {
			System.out.println("주소비교 /insertCsLost.cs 일치");
			request.setCharacterEncoding("utf-8");
			
			csBoardService = new CSBoardService();
			String msg = "insert fail";
			if(csBoardService.insertCsLost(request)) {
				msg = "insert success";
			}
			System.out.println(msg);
			
			response.sendRedirect("cs_lost.cs");
		}
		// 분실물 글 검색하기
		if(sPath.equals("/cs_lost_search.cs")) {
			System.out.println("주소비교 /cs_lost_search.cs 일치");
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

			ArrayList<LostBoardDTO> lostBoardList = csBoardService.getLostBoardList(pageDTO,request);
			// 페이징 작업
			// int 리턴할 형 getBoardCount() 메서드 정의
			// int count = getBoardCount() 메서드 호출
			int count = csBoardService.getLostBoardCount(request);
			// 한 화면에 보여줄 페이지 개수 설정. 테스트를 위해서 3으로 한다. 3으로 해서 확인하니 잘 돌아간다.
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
			System.out.println(lostBoardList);
			System.out.println(pageDTO);
			 // 리스트와 PageDTO를 모두 포함할 Map 또는 사용자 정의 객체 생성
		    Map<String, Object> responseData = new HashMap<>();
		    responseData.put("lostBoardList", lostBoardList);
		    responseData.put("pageDTO", pageDTO);

		    // Map 또는 사용자 정의 객체 직렬화
		    String json = new Gson().toJson(responseData);

		    // 컨텐츠 타입과 인코딩 설정
		    response.setContentType("application/json");
		    response.setCharacterEncoding("utf-8");
		    
		    // JSON 문자열을 응답으로 작성
		    response.getWriter().write(json);
			
//			request.setAttribute("pageDTO", pageDTO);			
//			request.setAttribute("lostBoardList",lostBoardList);
//			dispatcher = request.getRequestDispatcher("_cs/cs_lost_search.jsp");
//			dispatcher.forward(request, response);
		}//
		// 분실물 글 삭제
		if(sPath.equals("/deleteLostBoard.cs")) {
			System.out.println("주소비교 /deleteLostBoard.cs 일치");
			request.setCharacterEncoding("utf-8");
			
			csBoardService = new CSBoardService();
			String msg = "delete fail";
			if(csBoardService.deleteLostBoard(request)) {
				msg = "delete success";
			}
			System.out.println(msg);
			//response.sendRedirect("cs_center.cs");
			response.sendRedirect("adm_cs_lost.ad");
		}//  
		
		// 추천 게시판
		if(sPath.equals("/cs_recommend.cs")) {
			System.out.println("주소비교 /cs_recommend.cs 일치");
			request.setCharacterEncoding("utf-8");
			String movieName = request.getParameter("movieName");
			if(movieName == null) {
				movieName = "";
			}
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

			ArrayList<RecommendDTO> recommendList = csBoardService.getRecommendList(pageDTO);
			// 페이징 작업
			// int 리턴할 형 getBoardCount() 메서드 정의
			// int count = getBoardCount() 메서드 호출
			int count = csBoardService.getRecoBoardCount();
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
			request.setAttribute("recommendList",recommendList);
			request.setAttribute("movieName", movieName);
			dispatcher = request.getRequestDispatcher("_cs/cs_recommend.jsp");
			dispatcher.forward(request, response);
		}
		// 추천 게시판 영화 신청 페이지로 가기
		if(sPath.equals("/cs_recoSubscribe.cs")) {
//			HttpSession session = request.getSession();
//			String memId = (String) session.getAttribute("sId");
//			if(memId == null) {
//				response.sendRedirect("main.me");
//				return;
//			}
			dispatcher = request.getRequestDispatcher("_cs/cs_recoSubscribe.jsp");
			dispatcher.forward(request, response);
		}
		// 추천 영화 신청
		if(sPath.equals("/insertRecommend.cs")) {
			System.out.println("주소비교 /insertRecommend.cs 일치");
			request.setCharacterEncoding("utf-8");
			
			csBoardService = new CSBoardService();
			String msg = "insert fail";
			if(csBoardService.insertRecommend(request)) {
				msg = "insert success";
			}
			System.out.println(msg);
			response.sendRedirect("cs_recommend.cs");
		}
		// 추천 버튼 눌렀을 때
		if(sPath.equals("/doRecommend.cs")) {
			System.out.println("주소비교 /doRecommend.cs 일치");
			request.setCharacterEncoding("utf-8");
//			String createUser = request.getParameter("createUser");
//			String recommendIdx = request.getParameter("recommendIdx");
			csBoardService = new CSBoardService();
			String msg = "recommendcount update fail";
			if(csBoardService.plusRecoCount(request)) {
				msg = "recommendcount update success";
				 // 리스트와 PageDTO를 모두 포함할 Map 또는 사용자 정의 객체 생성
			    Map<String, Object> responseData = new HashMap<>();
			    String recoSuccess = "1";
			    responseData.put("recoSuccess", recoSuccess);
			    System.out.println("@@@@@@@@@@@@");
			    System.out.println(responseData);
			    // Map 또는 사용자 정의 객체 직렬화
			    String json = new Gson().toJson(responseData);

			    // 컨텐츠 타입과 인코딩 설정
			    response.setContentType("application/json");
			    response.setCharacterEncoding("utf-8");
			    
			    // JSON 문자열을 응답으로 작성
			    response.getWriter().write(json);
			}
			System.out.println(msg);
		}
		// 추천 글 삭제
		if(sPath.equals("/deleteRecoData.cs")) {
			System.out.println("주소비교 /deleteRecoData.cs 일치");
			request.setCharacterEncoding("utf-8");
			int recommendIdx = Integer.parseInt(request.getParameter("recommendIdx"));
			csBoardService = new CSBoardService();
			String msg = "delete fail";
			if(csBoardService.deleteRecoData(recommendIdx)) {
				msg = "delete success";
			}
			System.out.println(msg);
			response.sendRedirect("cs_recommend.cs");
		}
		// 추천 글 검색
		if(sPath.equals("/searchReco.cs")) {
			System.out.println("주소비교 /searchReco.cs 일치");
			request.setCharacterEncoding("utf-8");
			String movieName = request.getParameter("movieName");
			if(movieName == null) {
				movieName = "";
			}
//			movieName = "%" + movieName + "%";
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

			ArrayList<RecommendDTO> recommendList = csBoardService.getRecommendList(pageDTO,movieName);
			// 페이징 작업
			// int 리턴할 형 getBoardCount() 메서드 정의
			// int count = getBoardCount() 메서드 호출
			int count = csBoardService.getRecoBoardCount(movieName);
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
			request.setAttribute("recommendList",recommendList);
			request.setAttribute("movieName", movieName);
			System.out.println("@@@@@@@@@@@@@@@@@@");
			System.out.println(movieName);
			dispatcher = request.getRequestDispatcher("_cs/cs_recommend.jsp");
			dispatcher.forward(request, response);
		}
		// 추천글 추천수 정렬
		if(sPath.equals("/arrangeRecoCount.cs")) {
			System.out.println("주소비교 /arrangeRecoCount.cs 일치");
			request.setCharacterEncoding("utf-8");
			String movieName = request.getParameter("movieName");
			if(movieName == null) {
				movieName = "";
			}
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
			pageDTO.setSearch("arrange");
			
			CSBoardService csBoardService = new CSBoardService();

			ArrayList<RecommendDTO> recommendList = csBoardService.getRecommendList(pageDTO);
			// 페이징 작업
			// int 리턴할 형 getBoardCount() 메서드 정의
			// int count = getBoardCount() 메서드 호출
			int count = csBoardService.getRecoBoardCount();
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
			request.setAttribute("recommendList",recommendList);
			request.setAttribute("movieName", movieName);
			dispatcher = request.getRequestDispatcher("_cs/cs_recommend.jsp");
			dispatcher.forward(request, response);
		}
		
	}//doProcess()
}
