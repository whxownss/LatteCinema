package com.itwillbs.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.domain.MovieDTO;
import com.itwillbs.service.MovieService;

public class MovieController extends HttpServlet {
	RequestDispatcher dispatcher = null;
	MovieService movieService = null;
	
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
			
		if(sPath.equals("/movie_SearchPopUp.mo")) {
			dispatcher = request.getRequestDispatcher("_movie/movie_SearchPopUp.jsp");
			dispatcher.forward(request, response);	
			
		}
		
		if(sPath.equals("/movie_view.mo")) {
			dispatcher = request.getRequestDispatcher("_movie/movie_view.jsp");
			dispatcher.forward(request, response);	
			
		}
		
		if(sPath.equals("/movie_insert.mo")) {
			
			System.out.println("movie_insert 오는지");
			
			movieService = new MovieService();
			MovieDTO movieDTO = movieService.insertMovie(request);
			
			System.out.println(request);
			System.out.println("movieDTO : "+movieDTO);
			
			response.sendRedirect("/adm_mv_inout.ad");
		}
		
		
	}
}
