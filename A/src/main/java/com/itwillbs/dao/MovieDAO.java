package com.itwillbs.dao;



import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.itwillbs.domain.MovieDTO;
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
		    	 
		    	 System.out.println("DAO 확인 : ");
		        
		        session.close();
		    return resultDTOList;
		}


	public MovieDTO movieDetail(int movieIdx) {
		 MovieDTO movieDTO = new MovieDTO();
		 movieDTO.setMovieIdx(movieIdx);
		 movieDTO.setTitle("영화 제목");
		 movieDTO.setRating("영화 등급");
	}




		/*
		 * public MovieDTO getNowPoster(MovieDTO movieDTO) { SqlSession session =
		 * sqlSessionFactory.openSession(); try { // 매퍼 파일에 정의한 쿼리 호출 MovieDTO resultDTO
		 * = session.selectOne("Movie.selectNowPoster", movieDTO);
		 * 
		 * // 결과를 받아온 DTO에 설정 if (resultDTO != null) {
		 * movieDTO.setPoster(resultDTO.getPoster());
		 * movieDTO.setTitle(resultDTO.getTitle()); } } finally { session.close(); }
		 * 
		 * return movieDTO; }
		 * 
		 */
	 
}


