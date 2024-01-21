package com.itwillbs.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.google.gson.Gson;
import com.itwillbs.dao.AdminDAO;
import com.itwillbs.domain.CinemaDTO;
import com.itwillbs.domain.ScheduleDTO;

public class AdminService {

	public void insertSchedule(HttpServletRequest request) {
		String loIdx = request.getParameter("location");
		String ciIdx = request.getParameter("cinema");
		String scrIdx = request.getParameter("screen");
		String schMovIdx = request.getParameter("movie").split("/")[0].substring(3);
		String schMovType = request.getParameter("movie").split("/")[0].substring(0, 3);
		String schRun = request.getParameter("movie").split("/")[1];
		String schDate = request.getParameter("date");
		String schStime = request.getParameter("sTime");
		
		ScheduleDTO scheduleDTO = new ScheduleDTO();
		scheduleDTO.setLoIdx(loIdx);
		scheduleDTO.setCiIdx(ciIdx);
		scheduleDTO.setScrIdx(scrIdx);
		scheduleDTO.setSchMovIdx(schMovIdx);
		scheduleDTO.setSchMovType(schMovType);
		scheduleDTO.setSchRun(schRun);
		System.out.println(schDate + " , " + schDate);
		scheduleDTO.setSchDate(java.sql.Timestamp.valueOf(schDate + " 00:00:00"));   // 이부분 다시 확인
		scheduleDTO.setSchStime(schStime);
		
		System.out.println("!@#!@#");
		System.out.println(scheduleDTO);
		
		AdminDAO adminDAO = new AdminDAO();
		adminDAO.insertSchedule(scheduleDTO);
	}

	public String deleteSchedule(HttpServletRequest request) {
		ScheduleDTO scheduleDTO = new ScheduleDTO();
		scheduleDTO.setLoIdx(request.getParameter("loIdx"));
		scheduleDTO.setCiIdx(request.getParameter("ciIdx"));
		scheduleDTO.setSchMovType(request.getParameter("movType"));
		scheduleDTO.setSchIdx(request.getParameter("schIdx"));
		System.out.println("==================");
		System.out.println(scheduleDTO);
		System.out.println("==================");
		AdminDAO adminDAO = new AdminDAO();
		return adminDAO.deleteSchedule(scheduleDTO);
	}

	public List<CinemaDTO> getAllCinema() {
		AdminDAO adminDAO = new AdminDAO();
		
		return  adminDAO.getAllCinema();
	}

}
