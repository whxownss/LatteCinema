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
import com.itwillbs.domain.CenterBoardDTO;
import com.itwillbs.domain.ExqBoardDTO;
import com.itwillbs.domain.LocationDTO;
import com.itwillbs.domain.LostBoardDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.MovieDTO;
import com.itwillbs.domain.QnaBoardDTO;
import com.itwillbs.domain.ResponseDataDTO;
import com.itwillbs.domain.ScheduleDTO;
import com.itwillbs.domain.StoreItemDTO;
import com.itwillbs.domain.StorePayDTO;
import com.itwillbs.service.AdminService;
import com.itwillbs.service.CSBoardService;
import com.itwillbs.service.ResService;
import com.itwillbs.service.StoreService;
import com.itwillbs.service.MovieService;

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
			System.out.println("주소비교 /adm_home.ad 일치");
			request.setCharacterEncoding("utf-8");
			CSBoardService csBoardService = new CSBoardService();
			ArrayList<ResponseDataDTO> responseList = csBoardService.getResponseList();
			int memCount = csBoardService.getMemCount();
			
			request.setAttribute("responseList", responseList);
			request.setAttribute("memCount", memCount);
			dispatcher = request.getRequestDispatcher("_admin/production/adm_home.jsp");
			dispatcher.forward(request, response);
		}
		
		// 관리자 회원관리 페이지 이동
		if(sPath.equals("/adm_member.ad")) {
			System.out.println("주소비교 /adm_member.ad 일치");
			request.setCharacterEncoding("utf-8");
			CSBoardService csBoardService = new CSBoardService();
			ArrayList<MemberDTO> memberList = csBoardService.getMemberList();
			request.setAttribute("memberList",memberList);
			
			String memStatusText = request.getParameter("memStatusText");
			if(memStatusText == null) {
				memStatusText = "";
			}
			if(!memStatusText.equals("")) {
				// Gson 라이브러리를 사용하여 JSON으로 변환
			    String json = new Gson().toJson(memberList);
			    // 컨텐츠 타입 설정
			    response.setContentType("application/json");
			    response.setCharacterEncoding("utf-8");
			    // JSON 문자열을 응답으로 작성
			    response.getWriter().write(json);
			    return;
			}
			
			dispatcher = request.getRequestDispatcher("_admin/production/adm_member.jsp");
			dispatcher.forward(request, response);
		}
		// 관리자 회원 정지 상태 변경
		if(sPath.equals("/memStatusChange.ad")) {
			System.out.println("주소비교 /memStatusChange.cs 일치");
			request.setCharacterEncoding("utf-8");
			
			CSBoardService csBoardService = new CSBoardService();
			String msg = "update fail";
			if(csBoardService.updateMemStatus(request)) {
				msg = "update success";
			}
			System.out.println(msg);
			
		}
		
		// 관리자 영화 관리 페이지 이동
		if(sPath.equals("/adm_mv_inout.ad")) {
			dispatcher = request.getRequestDispatcher("_admin/production/adm_mv_inout.jsp");
			MovieService movieService = new MovieService();
			ArrayList<MovieDTO> movieList = movieService.getMovieList();
			request.setAttribute("movieList",movieList);
			dispatcher.forward(request, response);
		}	
		
		// 관리자 스토어 페이지 이동 
		if(sPath.equals("/adm_store.ad")) {
			request.setCharacterEncoding("utf-8");
			StoreService storeService = new StoreService();
			
			// 스토어상품 이름 리스트
			List<StoreItemDTO> itemNameList = storeService.itemNameList();
			
			// 구매내역
			ArrayList<StorePayDTO> storeList = storeService.getStoreBuyList();
			
			request.setAttribute("itemNameList",itemNameList);
			request.setAttribute("storeList",storeList);
			
			dispatcher = request.getRequestDispatcher("_admin/production/adm_store.jsp");
			dispatcher.forward(request, response);
		}//
		
		// 관리자 스토어 상품 추가
		if(sPath.equals("/adm_storeBuyList.ad")) {
			StoreService storeService = new StoreService();
			
			storeService.insertStore(request);
			
			response.sendRedirect("adm_store.ad");
		}//
		
		// 관리자 스토어 상품 삭제
		if(sPath.equals("/adm_storeDel.ad")) {
			String name = request.getParameter("name");
			
			StoreService storeService = new StoreService();
			
			storeService.deleteItem(name);
			
			response.sendRedirect("adm_store.ad");
		}//
		
		
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
			CSBoardService csBoardService = new CSBoardService();
			ArrayList<ExqBoardDTO> exqBoardList = csBoardService.getExqBoardList();
			request.setAttribute("exqBoardList",exqBoardList);
			
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
		
		// 관리자 영화관 관리 페이지 이동
		if(sPath.equals("/adm_cinema.ad")) {
			ResService resService = new ResService();
			MovieService movieServie = new MovieService();
			
			List<LocationDTO> locationList = resService.getLocations();
			String cinemaListJson = resService.getCinemas();
			List<ScheduleDTO> allSchedules = resService.getAllSchedules();
			ArrayList<MovieDTO> movieList = movieServie.getMovieList();
			
			request.setAttribute("locationList", locationList);
			request.setAttribute("cinemaListJson", cinemaListJson);
			request.setAttribute("allSchedules", allSchedules);
			request.setAttribute("movieList", movieList);
			
			dispatcher = request.getRequestDispatcher("_admin/production/adm_cinema.jsp");
			dispatcher.forward(request, response);
		}
		// 
		if(sPath.equals("/adm_cinemaPro.ad")) {
			ResService resService = new ResService();
			String screenListJson = resService.getScreen(request);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
		    response.getWriter().write(screenListJson);
		}
		if(sPath.equals("/adm_cinemaProIS.ad")) {
			AdminService adminService = new AdminService();
			adminService.insertSchedule(request);
			
			response.sendRedirect("adm_cinema.ad");
		}		
		
		
	}//doProcess()	
	
	
	
	
	
}//클래스 끝
