package com.itwillbs.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.itwillbs.domain.MovieDTO;
import com.itwillbs.service.MovieService;

public class MovieController extends HttpServlet {
	RequestDispatcher dispatcher = null;
	MovieService movieService = null;
	MovieDTO movieDTO = null;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sPath = request.getServletPath();
		
		// 영화홈 페이지 이동
		if(sPath.equals("/movie_home.mo")) {
			dispatcher = request.getRequestDispatcher("_a/movie_home.jsp");
			dispatcher.forward(request, response);
		}
		

		// 현재상영작 페이지 이동
		if(sPath.equals("/movie_now.mo")) {
			dispatcher = request.getRequestDispatcher("_a/movie_now.jsp");
			dispatcher.forward(request, response);
		}
		

		// 상영예정작 페이지 이동
		if(sPath.equals("/movie_will.mo")) {
			dispatcher = request.getRequestDispatcher("_a/movie_will.jsp");
			dispatcher.forward(request, response);
		}
		

		// 옛날영화 페이지 이동
		if(sPath.equals("/movie_latte.mo")) {
			dispatcher = request.getRequestDispatcher("_a/movie_latte.jsp");
			dispatcher.forward(request, response);
		}
			
		// 관리자 영화 추가 페이지에서 search버튼 누르면 뜨는 창
		if(sPath.equals("/movie_SearchPopUp.mo")) {
			dispatcher = request.getRequestDispatcher("_movie/movie_SearchPopUp.jsp");
			dispatcher.forward(request, response);	
			
		}
		
		// 영화 상세 페이지
		if(sPath.equals("/movie_view.mo")) {
			
			String movieCode = request.getParameter("movieCode");
			
			MovieDTO movieDTO = new MovieDTO();
			movieDTO.setMovieCode(movieCode);
			
			MovieService movieService = new MovieService();
			MovieDTO detail = movieService.getMovieDetail(movieDTO);
			
			request.setAttribute("detail", detail);
			
			System.out.println("detail"+detail);
		
			dispatcher = request.getRequestDispatcher("_movie/movie_view.jsp");
			dispatcher.forward(request, response);	
			
		}
		
		if(sPath.equals("/movie_insert.mo")) {
			
			System.out.println("movie_insert 오는지");
			
			movieService = new MovieService();
			MovieDTO movieDTO = movieService.insertMovie(request);
			
			response.sendRedirect("adm_mv_inout.ad");
		} // 인서트 페이지 
		
		
		
		if(sPath.equals("/movie_update.mo")) {
			System.out.println("movie_update 오는지");
			
			movieService = new MovieService();
			MovieDTO movieDTO = movieService.updateMovie(request);
			
			response.sendRedirect("adm_mv_inout.ad");
		} // update 
		
		if(sPath.equals("/movie_delete.mo")) {
			request.setCharacterEncoding("utf-8");
			System.out.println("movie_delete 오는지");
			movieService = new MovieService();
			System.out.println(request);
			String msg = "delete fail";
			if(movieService.deleteMovie(request)) {
				msg = "delete success";
			}
			System.out.println(msg);
			response.sendRedirect("adm_mv_inout.ad");
		} // delete
		
		
		// 한줄평 작성 가능 유무
		if(sPath.equals("/checkWrite.mo")) { 
			movieService = new MovieService();
			int result = movieService.checkWrite(request);

			System.out.println("@@@@@@@@@@@@@@@@@");
			System.out.println(result);
			System.out.println("@@@@@@@@@@@@@@@@@");
			response.setCharacterEncoding("utf-8");
			response.getWriter().write(result + "");
			
		}
		
		// 한줄평 데이터 넣기
		if(sPath.equals("/reviewInsert.mo")) {
			
			movieService = new MovieService();
			int result = movieService.reviewInsert(request);
			
		}//
			
	
		
	}	
}
