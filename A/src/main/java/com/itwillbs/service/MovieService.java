package com.itwillbs.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.itwillbs.dao.CSBoardDAO;
import com.itwillbs.dao.MovieDAO;
import com.itwillbs.domain.MovieDTO;

public class MovieService {
	
	MovieDAO movieDAO = null;
	MovieDTO movieDTO = null;
	

	public MovieDTO insertMovie(HttpServletRequest request) {
		
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
			movieDTO.setEndDate(request.getParameter("endDate"));
			movieDTO.setDirector(request.getParameter("director"));
			movieDTO.setGenre(request.getParameter("genre"));
			movieDTO.setPoster(request.getParameter("poster"));
			movieDTO.setStartDate(request.getParameter("startDate"));
			movieDTO.setMovieCategory(request.getParameter("movieCategory"));
			movieDTO.setActor(request.getParameter("actor"));
			movieDTO.setStillcut(request.getParameter("stillcut"));
			   
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
		
	
		
		
		public MovieDTO getMovieDetail(MovieDTO movieDTO) {
			
			System.out.println("movieDetail 서비스");
			MovieDTO detail = null;	
			
			try {
				movieDAO = new MovieDAO();
				detail = movieDAO.getMovieDetail(movieDTO);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return detail; 
					
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
		
		
		public ArrayList<MovieDTO> getMovieList() {
				
				System.out.println("MovieService getMovieList()");
				ArrayList<MovieDTO> movieList = null;
			    try {
			        movieDAO = new MovieDAO();
			        movieList = movieDAO.getMovieList();
			    } catch (Exception e) {
			        e.printStackTrace();
			    }
			    return movieList;
				
			}

		public MovieDTO updateMovie(HttpServletRequest request) {
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
				movieDTO.setEndDate(request.getParameter("endDate"));
				movieDTO.setDirector(request.getParameter("director"));
				movieDTO.setGenre(request.getParameter("genre"));
				movieDTO.setPoster(request.getParameter("poster"));
				movieDTO.setStartDate(request.getParameter("startDate"));
				movieDTO.setMovieCategory(request.getParameter("movieCategory"));
				movieDTO.setActor(request.getParameter("actor"));
				movieDTO.setStillcut(request.getParameter("stillcut"));
				   
				movieDAO.insertMovie(movieDTO);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
				
			return null;
		}

		public boolean deleteMovie(HttpServletRequest request) {
			System.out.println("movieService deleteMovie()");
			int deleteSuccess = 0;
			try {
				System.out.println("deleteMovie 무비서비스");
				movieDTO = new MovieDTO();
				String movieCode = request.getParameter("movieCode");
				movieDTO.setMovieCode(movieCode);
				movieDAO = new MovieDAO();
		        deleteSuccess = movieDAO.deleteMovie(movieDTO);
		        
		        
		    } catch (Exception e) {
				e.printStackTrace();
			}
			return deleteSuccess > 0;
		}
	}
