package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.itwillbs.domain.CinemaDTO;
import com.itwillbs.domain.LocationDTO;
import com.itwillbs.domain.ReservationDTO;
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

	public List<ScheduleDTO> selectSchedule(Map<String, String> map) {
		SqlSession session = sqlSessionFactory.openSession();
		List<ScheduleDTO> scheduleList = session.selectList("Schedule.select", map);
		session.close();

		return scheduleList;
	}

	public List<CinemaDTO> selectOpenCinema() {
		SqlSession session = sqlSessionFactory.openSession();
		List<CinemaDTO> openCinemaList = session.selectList("Cinema.selectOpenCinema");
		session.close();

		return openCinemaList;
	}

	public List<ScheduleDTO> selectMovieList(Map<String, String> map) {
		SqlSession session = sqlSessionFactory.openSession();
		List<ScheduleDTO> movieList = session.selectList("Schedule.selectMovieList", map);
		session.close();

		return movieList;
	}

	public boolean setResInfo(ReservationDTO reservationDTO) {
		SqlSession session = sqlSessionFactory.openSession();
		int insertCnt = session.insert("Reservation.insert", reservationDTO);
		session.commit();
		session.close();

		return insertCnt > 0 ? true : false;

	}

	public List<String> checkSeat(ReservationDTO reservationDTO) {
		SqlSession session = sqlSessionFactory.openSession();
		List<String> seatList = session.selectList("Reservation.select", reservationDTO);
		session.close();

		return seatList;
	}

	public void isSameSeat(String[] selectedSeat) {
		SqlSession session = sqlSessionFactory.openSession();
		session.selectList("Seat.select", selectedSeat);
		session.close();
		
	}

}
