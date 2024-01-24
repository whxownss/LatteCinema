package com.itwillbs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.itwillbs.domain.CinemaDTO;
import com.itwillbs.domain.ScheduleDTO;
import com.itwillbs.domain.ScreenDTO;
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

	public String getSeatNum(ScreenDTO screenDTO) {
		SqlSession session = sqlSessionFactory.openSession();
		String seatNum = session.selectOne("Screen.getSeatNum", screenDTO);
		session.close();
		return seatNum;
	}

	public String updateSeat(ScreenDTO screenDTO) {
		SqlSession session = sqlSessionFactory.openSession();
		int updateCnt = session.update("Screen.updateSeat", screenDTO);
		session.commit();
		session.close();
		
		return updateCnt > 0 ? "true" : "false";
	}

	public String insertScreen(ScreenDTO screenDTO) {
		SqlSession session = sqlSessionFactory.openSession();
		int insertCnt = session.insert("Screen.insertScreen", screenDTO);
		
		int updateCnt = session.update("Cinema.updateCiSNum", screenDTO);
		
		session.commit();
		session.close();
		
		return insertCnt + updateCnt > 1 ? "true" : "false";
	}

	public String deleteScreen(ScreenDTO screenDTO) {
		SqlSession session = sqlSessionFactory.openSession();
		int deleteCnt = session.delete("Screen.deleteScreen", screenDTO);
		screenDTO.setScrIdx("forDelete");
		int updateCnt = session.update("Cinema.updateCiSNum", screenDTO);

		
		session.commit();
		session.close();
		
		return deleteCnt + updateCnt > 1 ? "true" : "false";
	}

	public String updateOC(CinemaDTO cinemaDTO) {
		SqlSession session = sqlSessionFactory.openSession();
		int updateCnt = session.update("Cinema.updateOC", cinemaDTO);
		session.commit();
		session.close();
		
		return updateCnt > 0 ? "true" : "false";
		
	}

}
