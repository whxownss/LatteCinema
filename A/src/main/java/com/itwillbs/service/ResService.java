package com.itwillbs.service;

import java.util.ArrayList;

import com.itwillbs.dao.ResDAO;
import com.itwillbs.domain.CinemaDTO;
import com.itwillbs.domain.LocationDTO;

public class ResService {
	ResDAO resDAO = null;
	
	public ArrayList<LocationDTO> getLocations() {
		resDAO = new ResDAO();
		ArrayList<LocationDTO> locationList = resDAO.selectLocation();
		
		return locationList;
	}

	public ArrayList<CinemaDTO> getCinemas() {
		resDAO = new ResDAO();
		ArrayList<CinemaDTO> cinemaList = resDAO.selectCinema();
		
		return cinemaList;
	}

}
