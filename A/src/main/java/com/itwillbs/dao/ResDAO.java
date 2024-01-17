package com.itwillbs.dao;

import java.util.List;
import java.util.Map;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.itwillbs.domain.CinemaDTO;
import com.itwillbs.domain.LocationDTO;
import com.itwillbs.domain.ReservationDTO;
import com.itwillbs.domain.ScheduleDTO;
import com.itwillbs.domain.ScreenDTO;
import com.itwillbs.domain.SeatDTO;
import com.itwillbs.sql.SqlMapClient;

public class ResDAO {
	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSession();
	private ScheduledExecutorService scheduler = null;
	private static ScheduledFuture<?> scheduledFuture = null;

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

	public String isSameSeat(SeatDTO seatDTO) {
		SqlSession session = sqlSessionFactory.openSession();
		int seatCnt = session.selectOne("Reservation.selectSameSeat", seatDTO);
		session.close();
		
		return seatCnt > 0 ? null : "noSameSeat";
	}

	public String setSeatInfo(SeatDTO seatDTO) {
		SqlSession session = sqlSessionFactory.openSession();
		int insertCnt = session.insert("Reservation.insertSeatInfo", seatDTO);
		session.commit();
		session.close();
		
		return insertCnt > 0 ? "true" : null;
	}

	public String deleteNonePaidSeat(String memId) {
		SqlSession session = sqlSessionFactory.openSession();
		int deleteCnt = session.delete("Reservation.delete", memId);
		session.commit();
		session.close();
		
		return deleteCnt > 0 ? "true" : "";
	}

	public void startPayTimer() {
		SqlSession session = sqlSessionFactory.openSession();
		
		String memId = null;
		scheduler = Executors.newScheduledThreadPool(1);
		System.out.println("이부분 오기는하나?이부분 오기는하나?이부분 오기는하나?이부분 오기는하나?");
		scheduledFuture = scheduler.schedule(() -> {
			System.out.println("DB 작업 실행");
			session.delete("Reservation.delete", memId);
			session.commit();
			session.close();
			System.out.println("DB 작업 종료");
		}, 50, TimeUnit.SECONDS);
		System.out.println("널인지 확인1111 : " + scheduledFuture);
		scheduler.shutdown();
	}

	public String isTimeOver(SeatDTO seatDTO) {
		System.out.println("+++++++++++++++++++++");
		SqlSession session = sqlSessionFactory.openSession();
		int seatCnt = session.selectOne("Reservation.selectTimeOverSeat", seatDTO);
		session.close();
		System.out.println("+++++++++++" + seatCnt + "++++++++++");
		if(seatCnt > 0) {
			System.out.println("작업취소부분작업취소부분작업취소부분작업취소부분");
			System.out.println("널인지 확인22222 : " + scheduledFuture);
			scheduledFuture.cancel(true);
		}
		
		return seatCnt > 0 ? "false" : "true";
	}

	public String refund(String mid) {
		SqlSession session = sqlSessionFactory.openSession();
		int deleteCnt = session.delete("Reservation.deleteRes", mid);
		session.commit();
		session.close();
		
		return deleteCnt > 0 ? "true" : "";
	}

	// 관리자꺼
	public List<ScreenDTO> getScreen(Map<String, String> map) {
		SqlSession session = sqlSessionFactory.openSession();
		List<ScreenDTO> screenList = session.selectList("Screen.select", map);
		session.close();
		
		return screenList;
	}

	public List<ScheduleDTO> getAllSchedules() {
		SqlSession session = sqlSessionFactory.openSession();
		List<ScheduleDTO> allSchedules = session.selectList("Schedule.selectAll");
		session.close();
		
		return allSchedules;
	}
}
