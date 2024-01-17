package com.itwillbs.dao;



import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.itwillbs.domain.MovieDTO;
import com.itwillbs.domain.ReviewDTO;
import com.itwillbs.sql.SqlMapClient;

public class MovieDAO {

	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSession();

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
	
	
	
	
}


