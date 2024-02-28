package com.itwillbs.service;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.google.gson.Gson;
import com.itwillbs.dao.AdminDAO;
import com.itwillbs.domain.AdmToolDTO;
import com.itwillbs.domain.CinemaDTO;
import com.itwillbs.domain.ScheduleDTO;
import com.itwillbs.domain.ScreenDTO;

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

	public String getSeatNum(HttpServletRequest request) {
		AdminDAO adminDAO = new AdminDAO();
		
		ScreenDTO screenDTO = new ScreenDTO();
		screenDTO.setLoIdx(request.getParameter("loIdx"));
		screenDTO.setCiIdx(request.getParameter("ciIdx"));
		screenDTO.setScrIdx(request.getParameter("scrIdx"));
		
		return adminDAO.getSeatNum(screenDTO);
	}

	public String updateSeat(HttpServletRequest request) {
		AdminDAO adminDAO = new AdminDAO();
		
		ScreenDTO screenDTO = new ScreenDTO();
		screenDTO.setLoIdx(request.getParameter("loIdx"));
		screenDTO.setCiIdx(request.getParameter("ciIdx"));
		screenDTO.setScrIdx(request.getParameter("scrIdx"));
		screenDTO.setScrSeat(request.getParameter("scrSeat"));
		
		return adminDAO.updateSeat(screenDTO);
	}

	public String insertScreen(HttpServletRequest request) {
		AdminDAO adminDAO = new AdminDAO();
		
		ScreenDTO screenDTO = new ScreenDTO();
		screenDTO.setLoIdx(request.getParameter("loIdx"));
		screenDTO.setCiIdx(request.getParameter("ciIdx"));
		
		return adminDAO.insertScreen(screenDTO);
	}

	public String deleteScreen(HttpServletRequest request) {
		AdminDAO adminDAO = new AdminDAO();
		
		ScreenDTO screenDTO = new ScreenDTO();
		screenDTO.setLoIdx(request.getParameter("loIdx"));
		screenDTO.setCiIdx(request.getParameter("ciIdx"));
		screenDTO.setScrIdx(request.getParameter("scrIdx"));
		
		return adminDAO.deleteScreen(screenDTO);
	}

	public String updateOC(HttpServletRequest request) {
		AdminDAO adminDAO = new AdminDAO();
		
		CinemaDTO cinemaDTO = new CinemaDTO();
		cinemaDTO.setLoIdx(request.getParameter("loIdx"));
		cinemaDTO.setCiIdx(request.getParameter("ciIdx"));
		cinemaDTO.setCiOc(request.getParameter("ciOC"));
		
		return adminDAO.updateOC(cinemaDTO);
	}

	public AdmToolDTO getAdmTool() {
		AdminDAO adminDAO = new AdminDAO();
		return adminDAO.getAdmTool();
	}

	public String updateAdmTool(HttpServletRequest request) {
		AdmToolDTO admToolDTO = new AdmToolDTO();
		
		System.out.println("===========================");
		System.out.println(request.getParameter("cancelTime"));
		System.out.println(request.getParameter("refundTime"));
		System.out.println(request.getParameter("p1Price"));
		System.out.println(request.getParameter("p2Price"));
		System.out.println(request.getParameter("p3Price"));
		System.out.println("===========================");
		
		
		admToolDTO.setCancelTime(request.getParameter("cancelTime"));
		admToolDTO.setRefundTime(request.getParameter("refundTime"));
		admToolDTO.setP1Price(request.getParameter("p1Price"));
		admToolDTO.setP2Price(request.getParameter("p2Price"));
		admToolDTO.setP3Price(request.getParameter("p3Price"));
		
		System.out.println(admToolDTO);
		
		AdminDAO adminDAO = new AdminDAO();
		
		return adminDAO.updateAdmTool(admToolDTO);
	}
	
	// 위험
	public void insertAllSchedule(HttpServletRequest request) {
//		String[] scrIdx = {"1", "2", "3", "4", "5"};
//		String[] movIdx1 = {"1", "2", "3", "1", "2", "3", "4", "5"};
//		String[] movIdx2 = {"1", "2", "3", "6", "7", "8", "9", "10"};
//		String[] schMovType = {"OLD", "NOW"};
//		String[] run1 = {"136", "132", "138", "134", "116", "141", "103", "131"};
//		String[] run2 = {"136", "132", "138", "114", "133", "84", "153", "122"};
		String[] oldRun = {"136", "132", "138"};
		String[] nowRun = {"134", "116", "141", "103", "131", "114", "133", "84", "153", "122"};
		
		String[][] sTime1 = {{"09:00:00", "11:30:00", "14:00:00", "16:30:00", "19:00:00", "21:30:00", "23:55:00"},
	 		 			     {"09:00:00", "11:25:00", "13:50:00", "16:15:00", "18:40:00", "21:10:00", "23:40:00"},
	 		 			     {"08:30:00", "11:05:00", "13:40:00", "16:15:00", "18:45:00", "21:15:00", "23:45:00"},
	 		 			     {"09:30:00", "12:00:00", "14:10:00", "16:40:00", "18:50:00", "21:15:00", "23:30:00"},
	 		 			     {"09:30:00", "12:05:00", "14:05:00", "16:30:00", "19:05:00", "21:05:00", "23:30:00"}};
		String[][] sTime2 = {{"09:00:00", "11:30:00", "14:00:00", "16:30:00", "19:00:00", "21:30:00", "23:55:00"},
	 		 			     {"09:00:00", "11:25:00", "13:50:00", "16:15:00", "18:40:00", "21:10:00", "23:40:00"},
	 		 			     {"08:30:00", "11:05:00", "13:40:00", "16:15:00", "18:45:00", "21:15:00", "23:45:00"},
	 		 			     {"09:30:00", "11:40:00", "14:10:00", "16:20:00", "18:50:00", "21:00:00", "23:35:00"},
	 		 			     {"10:00:00", "11:40:00", "14:30:00", "16:50:00", "18:30:00", "21:20:00", "23:40:00"}};
		
		LocalDate date = LocalDate.of(2024, 4, 27); // 24.04.27 2번 타입으로 까지 들어감 (24.02.28)
		int type = 2;
		int cnt = 0;
		while(true) {
			System.out.println(cnt);
			if(date.toString() == "2024-04-01") break;
			String[][] time = sTime1;
			if(type != 1) time = sTime2;
			
			for(int i = 0; i < time.length; i++) {
				for(int j = 0; j < time[i].length; j++) {
					ScheduleDTO scheduleDTO = new ScheduleDTO();
					scheduleDTO.setLoIdx("6");
					scheduleDTO.setCiIdx("7");
					scheduleDTO.setScrIdx((i + 1) + "");
					
					String movIdx = (i + 1) + "";
					if((time == sTime1) && i == 3) {
						switch (j) {
						case 0: case 2: case 4: movIdx = "1"; break;
						case 1: case 3: case 5: movIdx = "2"; break;
						case 6: 				movIdx = "4"; break;
						}
					}
					if((time == sTime1) && i == 4) {
						switch (j) {
						case 0: case 3:  		movIdx = "3"; break;
						case 1: case 4:  		movIdx = "4"; break;
						case 2: case 5: case 6: movIdx = "5"; break;
						}
					}
					if((time == sTime2) && i <= 2 && j == 6) {
						movIdx = (i + 6) + "";
					}
					if((time == sTime2) && i == 3) {
						switch (j) {
						case 0: case 2: case 4: movIdx = "6"; break;
						case 1: case 3: case 5: movIdx = "7"; break;
						case 6: 				movIdx = "9"; break;
						}
					}
					if((time == sTime2) && i == 4) {
						switch (j) {
						case 0: case 3:  		movIdx = "8"; break;
						case 1: case 4:  		movIdx = "9"; break;
						case 2: case 5: case 6: movIdx = "10"; break;
						}
					}
					scheduleDTO.setSchMovIdx(movIdx);
					
					String movType = "NOW";
					if((i >= 0 && i <= 2) && (j >= 0 && j <= 5))
						movType = "OLD";
					scheduleDTO.setSchMovType(movType);
					
					scheduleDTO.setSchRun((movType == "NOW") ? nowRun[Integer.parseInt(movIdx) - 1] : oldRun[Integer.parseInt(movIdx) - 1]);
					scheduleDTO.setSchDate(java.sql.Timestamp.valueOf(date.toString() + " 00:00:00"));   // 이부분 다시 확인
					scheduleDTO.setSchStime(time[i][j]);
					
					AdminDAO adminDAO = new AdminDAO();
					adminDAO.insertSchedule(scheduleDTO);
				}
			}
			
			if(type == 1) type = 2;
			else type = 1;
			date = date.plusDays(1);
			cnt++;
		} // while 끝
		
	}

}
