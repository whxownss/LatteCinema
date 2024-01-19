package com.itwillbs.dao;



import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.itwillbs.domain.MovieDTO;
import com.itwillbs.domain.ReviewDTO;
import com.itwillbs.sql.SqlMapClient;

public class MovieDAO {

	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSession();
	SqlSession session = null;
	 public void insertMovie(MovieDTO movieDTO) {
			SqlSession session = sqlSessionFactory.openSession();
	            int result = session.insert("Movie.insertMovie", movieDTO);
	            session.commit();
	            session.close();
	        }
	 
	 
	 public ArrayList<MovieDTO> getLattePoster(MovieDTO movieDTO) {
		    SqlSession session = sqlSessionFactory.openSession();
		    ArrayList<MovieDTO> resultDTOList = null;
		   
		        // 매퍼 파일에 정의한 쿼리 호출
		    	 resultDTOList = new ArrayList<MovieDTO>(session.selectList("Movie.getLattePoster",movieDTO));
		    	 
		        
		        session.close();
		    return resultDTOList;
		}


	 public MovieDTO getMovieDetail(MovieDTO movieDTO) {
		 SqlSession session = sqlSessionFactory.openSession();
		 MovieDTO resultDTO = null;

		 // 매퍼 파일에 정의한 쿼리 호출
		 resultDTO = session.selectOne("Movie.getMovieDetail", movieDTO);

		 session.close();
		 return resultDTO;

	 }


	public ArrayList<MovieDTO> getNowPoster(MovieDTO movieDTO) {
		SqlSession session = sqlSessionFactory.openSession();
		ArrayList<MovieDTO> resultDTOList = null;

		// 매퍼 파일에 정의한 쿼리 호출
		resultDTOList = new ArrayList<MovieDTO>(session.selectList("Movie.getNowPoster",movieDTO));

		session.close();
		return resultDTOList;
	}


	public ArrayList<MovieDTO> getMovieList() {

		SqlSession session = sqlSessionFactory.openSession();
		ArrayList<MovieDTO> resultDTOList = null;
		

		// 매퍼 파일에 정의한 쿼리 호출
		resultDTOList = new ArrayList<MovieDTO>(session.selectList("Movie.getMovieList"));

		session.close();
		return resultDTOList;
	}

	// 한줄평 작성 가능 유무 
	public int checkWrite(Map<String, String> map) {
		SqlSession session = sqlSessionFactory.openSession();
		int result = session.selectOne("Movie.checkWrite", map);
		session.close();
		
		return result;
		
	}

	// 한줄평 리뷰테이블 insert
	public int reviewInsert(ReviewDTO reviewDTO) {
		SqlSession session = sqlSessionFactory.openSession();
		int result = session.insert("Movie.reviewInsert", reviewDTO);
		session.commit();
		session.close();
		
		return result;
	}
	
	public void updateMovie(MovieDTO movieDTO) {
		SqlSession session = sqlSessionFactory.openSession();
            int result = session.update("Movie.updateMovie", movieDTO);
            session.commit();
            session.close();
        }


	public int deleteMovie(MovieDTO movieDTO) {
		System.out.println("deleteMovie()");
		int deleteSuccess = 0;
		try {
			System.out.println("movie 딜리트 dao");
			session = sqlSessionFactory.openSession();
			deleteSuccess = session.delete("Movie.deleteMovie", movieDTO);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
	            session.close();
	        }
		}
		return deleteSuccess;
	}

	// 한줄평 가져오기
	public ArrayList<ReviewDTO> getReview(String movieCode) {
		System.out.println("MovieDAO.getReview()");
		SqlSession session = sqlSessionFactory.openSession();
		ArrayList<ReviewDTO> reviewList = null;
		reviewList = new ArrayList<ReviewDTO>(session.selectList("Movie.getReview", movieCode)); 
		
		session.close();
		
		return reviewList;
	}

	// 내가 해당영화에 쓴 댓글 가져오기
	public ReviewDTO myReview(ReviewDTO reviewDTO) {
		System.out.println("MovieDAO.myReview()");
		SqlSession session = sqlSessionFactory.openSession();
		// reviewDTO = 	
		reviewDTO = session.selectOne("Movie.myReview", reviewDTO);
		session.close();
		System.out.println("12312312asdsd");
		System.out.println(reviewDTO);
		
		return reviewDTO;
	}


	public String reviewUpdate(ReviewDTO reviewDTO) {
		SqlSession session = sqlSessionFactory.openSession();
		int updateCnt = session.update("Movie.reviewUpdate", reviewDTO);
		session.commit();
		session.close();
		
		return updateCnt > 0 ? "true" : "false";
	}
	 
}


