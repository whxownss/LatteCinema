package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.itwillbs.dao.CSBoardDAO;
import com.itwillbs.dao.MovieDAO;
import com.itwillbs.domain.MovieDTO;
import com.itwillbs.domain.ReviewDTO;

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
		

		//한줄평 작성 가능 유무
		public int checkWrite(HttpServletRequest request) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("movIdx", request.getParameter("movIdx"));
			map.put("memId", request.getParameter("memId"));
			map.put("movType", request.getParameter("movType"));
			
			int result = 0;
			
			movieDAO = new MovieDAO();
			result = movieDAO.checkWrite(map);
			
			return result;
		}
		
		// 한줄평 데이터 넣기
		public int reviewInsert(HttpServletRequest request) {
			int result = 0;
			try {
				request.setCharacterEncoding("UTF-8");
				String revComment = request.getParameter("revComment");
				String memId = request.getParameter("memId");
				String movType = request.getParameter("movType");
				String movIdx = request.getParameter("movIdx");
				String title = request.getParameter("title");
				Timestamp date = new Timestamp(System.currentTimeMillis());
				

				ReviewDTO reviewDTO = new ReviewDTO();
				reviewDTO.setMovCode(request.getParameter("movCode"));
				reviewDTO.setRevComment(revComment);
				reviewDTO.setMemId(memId);
				reviewDTO.setMovType(movType);
				reviewDTO.setMovIdx(movIdx);
				reviewDTO.setTitle(title);
				reviewDTO.setRevDate(date);
				System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
				System.out.println(reviewDTO);
				movieDAO = new MovieDAO();
				
				result = movieDAO.reviewInsert(reviewDTO);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return result;
			
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

		// 한줄평 가져오기
		public ArrayList<ReviewDTO> getReview(String movieCode) {
			System.out.println("movieService getReview()");
			ArrayList<ReviewDTO> reviewList = null;
			try {
				reviewList = movieDAO.getReview(movieCode);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return reviewList;
		}
	}
