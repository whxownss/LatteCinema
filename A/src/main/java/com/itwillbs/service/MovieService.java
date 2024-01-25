package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
		
	
		
		
		public MovieDTO getMovieDetail(HttpServletRequest request) {
			
			System.out.println("movieDetail 서비스");
			MovieDTO detail = null;	
			movieDTO = new MovieDTO();
			
			try {
				
				movieDAO = new MovieDAO();
				movieDTO.setMovieCode(request.getParameter("movieCode"));
				
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
			System.out.println(map);
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
				   
				movieDAO.updateMovie(movieDTO);
				
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

		
		// 내가 해당영화에 쓴 댓글 가져오기
		public ReviewDTO myReview(HttpServletRequest request) {
			System.out.println("movieService myReview");
			ReviewDTO reviewDTO = new ReviewDTO();
			try {
				HttpSession session = request.getSession();
				String id = session.getAttribute("sId").toString();
				System.out.println("sid: " + id);
				String movieCode = request.getParameter("movieCode");
				System.out.println("sid: " + movieCode);
				movieDAO = new MovieDAO();
				reviewDTO.setMemId(id);
				reviewDTO.setMovCode(movieCode);
				
				reviewDTO = movieDAO.myReview(reviewDTO);
				
				
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			return reviewDTO;
		}
		
		// 한줄평 수정하기
		public String reviewUpdate(HttpServletRequest request) {
			ReviewDTO reviewDTO = new ReviewDTO();
			reviewDTO.setMemId(request.getParameter("memId"));
			reviewDTO.setRevComment(request.getParameter("reComment"));
			reviewDTO.setMovCode(request.getParameter("movCode"));

			movieDAO = new MovieDAO();
			String result = movieDAO.reviewUpdate(reviewDTO);
			
			return result;
		}

		// 한줄평 삭제하기
		public String reviewDelete(HttpServletRequest request) {
			ReviewDTO reviewDTO = new ReviewDTO();
			reviewDTO.setMemId(request.getParameter("memId"));
			
			movieDAO = new MovieDAO();
			String result = movieDAO.reviewDelete(reviewDTO);
			return result;
		}
	}
