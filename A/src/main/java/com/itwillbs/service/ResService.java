package com.itwillbs.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.itwillbs.dao.ResDAO;
import com.itwillbs.domain.CinemaDTO;
import com.itwillbs.domain.LocationDTO;
import com.itwillbs.domain.ReservationDTO;
import com.itwillbs.domain.ScheduleDTO;

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

	public String setResInfo(String rsp) {
		resDAO = new ResDAO();
		
//		Gson gson = new Gson();
		Gson gson = new GsonBuilder().setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES).create();
		ReservationDTO reservationDTO = gson.fromJson(rsp, ReservationDTO.class);
		System.out.println("@@@@@@@@@@@@@@@");
		System.out.println(rsp);
		System.out.println(reservationDTO);
		System.out.println("@@@@@@@@@@@@@@@");
		
		String msg = "실패";
		
		if(resDAO.setResInfo(reservationDTO)) 
			msg = "성공";
		
		return msg;
		
	}

}
