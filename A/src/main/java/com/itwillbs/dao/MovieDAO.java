package com.itwillbs.dao;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.itwillbs.domain.MovieDTO;
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
	 
}


