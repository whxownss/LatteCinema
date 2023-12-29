package com.itwillbs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.itwillbs.domain.CinemaDTO;
import com.itwillbs.domain.LocationDTO;
import com.itwillbs.domain.ScheduleDTO;
import com.itwillbs.sql.SqlMapClient;

public class ResDAO {
	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSession();
	
	public List<LocationDTO> selectLocation() {
		SqlSession session = sqlSessionFactory.openSession();
		List<LocationDTO> locationList = session.selectList("Location.select");
		session.close();
		
		return locationList;
	}

	public List<CinemaDTO> selectCinema() {
		SqlSession session = sqlSessionFactory.openSession();
		List<CinemaDTO> cinemaList = session.selectList("Cinema.select");
		session.close();
		
		return cinemaList;
	}

	public List<ScheduleDTO> selectSchedule() {
		SqlSession session = sqlSessionFactory.openSession();
		List<ScheduleDTO> scheduleList = session.selectList("Schedule.select");
		session.close();
		
		return scheduleList;
	}
	
	

	
	

}
