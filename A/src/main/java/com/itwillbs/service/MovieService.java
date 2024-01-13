package com.itwillbs.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.dao.MovieDAO;
import com.itwillbs.domain.CenterBoardDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.MovieDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MovieService {
	
	MovieDAO movieDAO = null;
	MovieDTO movieDTO = null;

	public MovieDTO insertMovie(HttpServletRequest request) {
			
		System.out.println("insertMovie() 서비스");
			
		try {
			request.setCharacterEncoding("UTF-8");
				
				
			movieDAO = new MovieDAO();
			movieDTO = new MovieDTO();
				
			movieDTO.setMovieCode(request.getParameter("movieCode"));
			movieDTO.setTitle(request.getParameter("title"));
			movieDTO.setRating(request.getParameter("rating"));
			movieDTO.setRunTime(request.getParameter("runTime"));
			movieDTO.setFilmMade(request.getParameter("filmMade"));
			movieDTO.setNation(request.getParameter("nation"));
			movieDTO.setSynopsis(request.getParameter("synopsis"));
			movieDTO.setOpenDate(request.getParameter("openDate"));
			movieDTO.setDirector(request.getParameter("director"));
			movieDTO.setGenre(request.getParameter("genre"));
			movieDTO.setPoster(request.getParameter("poster"));
			movieDTO.setStartDate(request.getParameter("startDate"));
			movieDTO.setMovieCategory(request.getParameter("movieCategory"));
			
			
			System.out.println("!@#!@#!@#");
			System.out.println(movieDTO);
			   
			movieDAO.insertMovie(movieDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null; 
				
	}
	
		public List<MovieDTO> getLattePoster(MovieDTO movieDTO) {
			ArrayList<MovieDTO> LattePosterList = null;
		    try {
		        movieDAO = new MovieDAO();
		        LattePosterList = movieDAO.getLattePoster(movieDTO);
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return LattePosterList;
		}
		
	
		
		
		public List<MovieDTO> getMovieDetail(MovieDTO movieDTO) {
			
			System.out.println("movieDetail 서비스");
			ArrayList<MovieDTO> detailList = null;	
			
			try {
				movieDAO = new MovieDAO();
				detailList = movieDAO.getMovieDetail(movieDTO);

		        System.out.println("!@#!@#!@#");
		        System.out.println(movieDTO);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return detailList; 
					
		}

		public List<MovieDTO> getNowPoster(MovieDTO movieDTO) {
			
			System.out.println("MovieService getNowPoster()");
			ArrayList<MovieDTO> posterNowList = null;
		    try {
		        movieDAO = new MovieDAO();
		        posterNowList = movieDAO.getNowPoster(movieDTO);
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return posterNowList;
			
		}
		
		
		
		
		
	}
