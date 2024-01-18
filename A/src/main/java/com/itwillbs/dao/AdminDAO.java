package com.itwillbs.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

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

}
