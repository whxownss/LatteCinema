package com.itwillbs.service;

import java.util.ArrayList;

import com.itwillbs.dao.CSBoardDAO;
import com.itwillbs.domain.CenterBoardDTO;
import com.itwillbs.domain.ExqBoardDTO;
import com.itwillbs.domain.PageDTO;

public class CSBoardService {
	CSBoardDAO csBoardDAO = null;

	public ArrayList<ExqBoardDTO> getExqBoardList(PageDTO pageDTO) {
		System.out.println("CSBoardService getExqBoardList()");
		ArrayList<ExqBoardDTO> exqBoardList = null;
		
		try {
			// 시작하는 행번호 구하는 식
			int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
			// 끝나는 행번호 구하는 식
			int endRow = startRow + pageDTO.getPageSize() -1;			
			csBoardDAO = new CSBoardDAO();
			pageDTO.setStartRow(startRow-1);
			pageDTO.setPageSize(pageDTO.getPageSize());
			
			exqBoardList = csBoardDAO.getExqBoardList(pageDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return exqBoardList;
	}//getExqBoardList()	
	
	public int getExqBoardCount() {
		System.out.println("CSBoardService getExqBoardCount()");
		int count = 0;
		try {
			csBoardDAO = new CSBoardDAO();
			count = csBoardDAO.getExqBoardCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}//getExqBoardCount()	
	
	public ArrayList<CenterBoardDTO> getCenterBoardList(PageDTO pageDTO) {
		System.out.println("CSBoardService getCenterBoardList()");
		ArrayList<CenterBoardDTO> centerBoardList = null;
		try {
			// 시작하는 행번호 구하는 식
			int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
			// 끝나는 행번호 구하는 식
			int endRow = startRow + pageDTO.getPageSize() -1;	
			pageDTO.setStartRow(startRow-1);
			pageDTO.setPageSize(pageDTO.getPageSize());
			csBoardDAO = new CSBoardDAO();
			centerBoardList = csBoardDAO.getCenterBoardList(pageDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return centerBoardList;
	}//getCenterBoardList()

	public int getCenterBoardCount() {
		System.out.println("CSBoardService getCenterBoardCount()");
		int count = 0;
		try {
			csBoardDAO = new CSBoardDAO();
			count = csBoardDAO.getCenterBoardCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}//getCenterBoardCount()
	
}//클래스
