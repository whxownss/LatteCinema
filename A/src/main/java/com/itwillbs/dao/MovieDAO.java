package com.itwillbs.dao;



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
	 
	 
}


