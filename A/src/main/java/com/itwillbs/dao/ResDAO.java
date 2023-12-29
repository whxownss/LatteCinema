package com.itwillbs.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.itwillbs.domain.CinemaDTO;
import com.itwillbs.domain.LocationDTO;
import com.itwillbs.sql.SqlMapClient;

public class ResDAO {
	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSession();
	
	public ArrayList<LocationDTO> selectLocation() {
		SqlSession session = sqlSessionFactory.openSession();
		ArrayList<LocationDTO> locationList = (ArrayList)session.selectList("Location.select");
		session.close();
		
		return locationList;
	}

	public ArrayList<CinemaDTO> selectCinema() {
		SqlSession session = sqlSessionFactory.openSession();
		ArrayList<CinemaDTO> cinemaList = (ArrayList)session.selectList("Cinema.select");
		session.close();
		
		return cinemaList;
	}
	
	

	
	

}
