package com.itwillbs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.itwillbs.domain.CinemaDTO;
import com.itwillbs.domain.ScheduleDTO;
import com.itwillbs.sql.SqlMapClient;

public class AdminDAO {
	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSession();

	public void insertSchedule(ScheduleDTO scheduleDTO) {
		SqlSession session = sqlSessionFactory.openSession();
		session.insert("Schedule.insert", scheduleDTO);
		session.commit();
		session.close();
	}

	public String deleteSchedule(ScheduleDTO scheduleDTO) {
		SqlSession session = sqlSessionFactory.openSession();
		int deleteCnt = session.delete("Schedule.delete", scheduleDTO);
		session.commit();
		session.close();
		
		return deleteCnt > 0 ? "true" : "false";
	}

	public List<CinemaDTO> getAllCinema() {
		SqlSession session = sqlSessionFactory.openSession();
		List<CinemaDTO> cinemaList = session.selectList("Cinema.selectAllCinema");
		session.close();
		
		return cinemaList;
	}

}
