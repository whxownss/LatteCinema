package com.itwillbs.service;

import java.util.List;

import com.google.gson.Gson;
import com.itwillbs.dao.ResDAO;
import com.itwillbs.domain.CinemaDTO;
import com.itwillbs.domain.LocationDTO;
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

	public String getSchedules() {
		resDAO = new ResDAO();
		List<ScheduleDTO> scheduleList = resDAO.selectSchedule();
		
		Gson gson = new Gson();
		String scheduleListJson = gson.toJson(scheduleList);
		
		return scheduleListJson;
	}

}
