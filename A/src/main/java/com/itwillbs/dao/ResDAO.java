package com.itwillbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.itwillbs.domain.AdmToolDTO;
import com.itwillbs.domain.CinemaDTO;
import com.itwillbs.domain.LocationDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PointDTO;
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

	// 동시에 좌석 선택하고 넘어가는 경우
	public String setSeatInfo(SeatDTO seatDTO) {
		SqlSession session = sqlSessionFactory.openSession();
		int insertCnt = session.insert("Reservation.insertSeatInfo", seatDTO);
		
		session.commit();
		session.close();
		
		return insertCnt > 0 ? "true" : null;
	}

	public String deleteNonePaidSeat(String memId) {
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, String> map = new HashMap<String, String>();
		AdmToolDTO admToolDTO = session.selectOne("Admin.getAdmTool");
		map.put("memId", memId);
		map.put("cancelTime", admToolDTO.getCancelTime());
		int deleteCnt = session.delete("Reservation.delete", map);
		session.commit();
		session.close();
		
		return deleteCnt > 0 ? "true" : "";
	}

	public void startPayTimer() {
		SqlSession session = sqlSessionFactory.openSession();
		
		AdmToolDTO admToolDTO = session.selectOne("Admin.getAdmTool");
		int minutes = Integer.parseInt(admToolDTO.getCancelTime());
		
		String memId = null;
		scheduler = Executors.newScheduledThreadPool(1);
		System.out.println("이부분 오기는하나?이부분 오기는하나?이부분 오기는하나?이부분 오기는하나?");
		scheduledFuture = scheduler.schedule(() -> {
			System.out.println("DB 작업 실행");
			session.delete("Reservation.delete", memId);
			session.commit();
			session.close();
			System.out.println("DB 작업 종료");
		}, minutes, TimeUnit.MINUTES);
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
		System.out.println("??????????222222222");
		SqlSession session = sqlSessionFactory.openSession();
		Map<String, String> map = new HashMap<String, String>();
		AdmToolDTO admToolDTO = session.selectOne("Admin.getAdmTool");
		map.put("mid", mid);
		map.put("refundTime", admToolDTO.getRefundTime());
		int deleteCnt = session.update("Reservation.refundRes", map);
		System.out.println(deleteCnt);
		// 환불하고도 다른 사용자가 res2에서 그 자리 계속 남아 잇는거.
		System.out.println("??????????33333333333");
		if(deleteCnt > 0) {
			System.out.println("`3`3`3`3`3``3");
			session.delete("Reservation.deleteSeatInfo", mid);
			System.out.println("??????????44444444");
		}
		System.out.println("??????????55555555555555");
		session.commit();
		session.close();
		
		return deleteCnt > 0 ? "true" : "";
	}

	// 관리자꺼 
	public List<ScreenDTO> getScreen(Map<String, String> map) {
		SqlSession session = sqlSessionFactory.openSession();
		List<ScreenDTO> screenList = session.selectList("Screen.select", map); // res 와서 다른쪽 sql하는게 맞나?
		session.close();
		
		return screenList;
	}

	public List<ScheduleDTO> getAllSchedules() {
		SqlSession session = sqlSessionFactory.openSession();
		List<ScheduleDTO> allSchedules = session.selectList("Schedule.selectAll");
		session.close();
		
		return allSchedules;
	}

	
	// 이거 쿼리 구문 질문하기 (안되면 합치기)
	public void refundPoint(String sId, String mid) {
		SqlSession session = sqlSessionFactory.openSession();
		String pointPlus = session.selectOne("Member.selectPointPlus", mid);
		String pointMinus = session.selectOne("Member.selectPointMinus", mid);
		if(pointMinus == null) {
			pointMinus = "0";
		}
		
		
		int memPoint = Integer.parseInt(pointMinus) - Integer.parseInt(pointPlus);
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMemPoint(memPoint + "");
		memberDTO.setMemId(sId);
		session.update("Member.setPoint", memberDTO);
		
		PointDTO pointDTO = new PointDTO();
		pointDTO.setMemId(sId);
		System.out.println("sid :" + sId);
		pointDTO.setPointPlus(pointMinus);
		pointDTO.setPointMinus(pointPlus);
		pointDTO.setPointDetail("환불");
		session.insert("Member.setPointInfo", pointDTO);
		
		session.commit();
		session.close();
	}

	
}
