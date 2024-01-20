package com.itwillbs.service;

import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.itwillbs.dao.ResDAO;
import com.itwillbs.domain.CinemaDTO;
import com.itwillbs.domain.LocationDTO;
import com.itwillbs.domain.ReservationDTO;
import com.itwillbs.domain.ScheduleDTO;
import com.itwillbs.domain.ScreenDTO;
import com.itwillbs.domain.SeatDTO;

public class ResService {
	ResDAO resDAO = null;
	
	public List<LocationDTO> getLocations() {
		resDAO = new ResDAO();
		List<LocationDTO> locationList = resDAO.selectLocation();
		
		return locationList;
	}

	public String getCinemas() {
		resDAO = new ResDAO();
		List<CinemaDTO> cinemaList = resDAO.selectCinema();
		
		Gson gson = new Gson();
		String cinemaListJson = gson.toJson(cinemaList);
		
		return cinemaListJson;
	}

	public String getSchedules(String cinema, String param, String date) {
		resDAO = new ResDAO();
		Map<String, String> map = new HashMap<String, String>();
		map.put("CINEMA", cinema);
		map.put("PARAM", param);
		map.put("DATE", date);
		List<ScheduleDTO> scheduleList = resDAO.selectSchedule(map);
		
		// 종료시간이 익일일 경우
		for(ScheduleDTO sch : scheduleList) {
			String t1 = sch.getSchStime();
			String t2 = sch.getSchEtime();
			
			int hour = Integer.parseInt(t1.split(":")[0]);
			int minute = Integer.parseInt(t1.split(":")[1]);
			int hour2 = Integer.parseInt(t2.split(":")[0]);
			int minute2 = Integer.parseInt(t2.split(":")[1]);
			
			LocalTime lt = LocalTime.of(hour, minute);
			LocalTime lt2 = LocalTime.of(hour2, minute2);
			
			if(lt2.compareTo(lt) == -1) 
				sch.setSchEtime("*" + sch.getSchEtime());
		}
		
		Gson gson = new Gson();
		String scheduleListJson = gson.toJson(scheduleList);
		
		// 영업 안 하는 지점꺼 가져오면 ajax에서 fail로 가기 위해 "" 리턴
		return (scheduleListJson.equals("[]") ? "" : scheduleListJson);
	}

	public String getOpenCinemas() {
		resDAO = new ResDAO();
		List<CinemaDTO> openCinemaList = resDAO.selectOpenCinema();
		
		Gson gson = new Gson();
		String openCinemaListJson = gson.toJson(openCinemaList);
		
		return (openCinemaListJson.equals("[]") ? "" : openCinemaListJson);
	}

	public String getMovieList(String cinema, String date) {
		resDAO = new ResDAO();
		Map<String, String> map = new HashMap<String, String>();
		map.put("CINEMA", cinema);
		map.put("DATE", date);
//		param.put("movType", movType);
		List<ScheduleDTO> movieList = resDAO.selectMovieList(map);
		
		Gson gson = new Gson();
		String movieListJson = gson.toJson(movieList);
		
		return movieListJson;
	}

	public String setResInfo(String rsp, String sId, String sName) {
		resDAO = new ResDAO();
		
//		Gson gson = new Gson();
		Gson gson = new GsonBuilder().setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES).create();
		ReservationDTO reservationDTO = gson.fromJson(rsp, ReservationDTO.class);
		reservationDTO.setMemId(sId);
		reservationDTO.setBuyerName(sName);
		System.out.println("@@@@@@@@@@@@@@@");
		System.out.println(rsp);
		System.out.println(reservationDTO);
		System.out.println("@@@@@@@@@@@@@@@");
		
		String msg = "실패";
		
		if(resDAO.setResInfo(reservationDTO)) 
			msg = "성공";
		
		return msg;
		
	}

	public String checkSeat(String schDTO) {
		resDAO = new ResDAO();
		Gson gson = new GsonBuilder().setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES).create();
		ReservationDTO reservationDTO = gson.fromJson(schDTO, ReservationDTO.class);
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%");
		System.out.println(reservationDTO);
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%");
		List<String> seatList = resDAO.checkSeat(reservationDTO);
		List<String> paidSeat = new ArrayList<String>();
		for(String s : seatList) {
//			System.out.println(s);
			for(String ss : s.split(", ")) {
				paidSeat.add(ss);
			}
		}
		
		System.out.println(String.join("/", paidSeat));
		return String.join("/", paidSeat);
	}

	public String isSameSeat(String schDTO) {
		resDAO = new ResDAO();
		Gson gson = new GsonBuilder().setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES).create();
		SeatDTO seatDTO = gson.fromJson(schDTO, SeatDTO.class);
		System.out.println(seatDTO);
		return resDAO.isSameSeat(seatDTO);
	}

	public String setSeatInfo(String schDTO, String sId) {
		resDAO = new ResDAO();
		Gson gson = new GsonBuilder().setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES).create();
		SeatDTO seatDTO = gson.fromJson(schDTO, SeatDTO.class);
		seatDTO.setMemId(sId);
		 
		return resDAO.setSeatInfo(seatDTO);
	}

	public String isPaidSeat(String memId) {
		resDAO = new ResDAO();
		
		return resDAO.deleteNonePaidSeat(memId);
	}

	public void startPayTimer() {
		resDAO = new ResDAO();
		resDAO.startPayTimer();
	}

	public String isTimeOver(String schDTO) {
		resDAO = new ResDAO();
		Gson gson = new GsonBuilder().setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES).create();
		SeatDTO seatDTO = gson.fromJson(schDTO, SeatDTO.class);
		
		return resDAO.isTimeOver(seatDTO);
	}

	public String refund(String mid) {
		resDAO = new ResDAO();
		
		return resDAO.refund(mid);
	}

	// 관리자 꺼
	public String getScreen(HttpServletRequest request) {
		resDAO = new ResDAO();
		String location = request.getParameter("location");
		String cinema = request.getParameter("cinema");
		Map<String, String> map = new HashMap<String, String>();
		map.put("location", location);
		map.put("cinema", cinema);
		
		Gson gson = new Gson();
		String screenListJson = gson.toJson(resDAO.getScreen(map));
		
		System.out.println();
		
		return screenListJson;
	}

	// 관리자 꺼
	public List<ScheduleDTO> getAllSchedules() {
		resDAO = new ResDAO();
		Gson gson = new Gson();
		String allSchedulesJson = gson.toJson(resDAO.getAllSchedules());
		
		return resDAO.getAllSchedules();
	}


}
