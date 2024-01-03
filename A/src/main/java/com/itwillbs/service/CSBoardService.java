package com.itwillbs.service;

import java.io.BufferedReader;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.google.gson.Gson;
import com.itwillbs.dao.CSBoardDAO;
import com.itwillbs.domain.CenterBoardDTO;
import com.itwillbs.domain.CinemaDTO;
import com.itwillbs.domain.ExqBoardDTO;
import com.itwillbs.domain.LocationDTO;
import com.itwillbs.domain.LostBoardDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.QnaBoardDTO;

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

	public CenterBoardDTO getCenterBoard(String createUser, String createDate) {
		System.out.println("CSBoardService getCenterBoard()");
		CenterBoardDTO centerBoardDTO = null;
		try {
			csBoardDAO = new CSBoardDAO();
			centerBoardDTO = csBoardDAO.getCenterBoard(createUser,createDate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return centerBoardDTO;
	}//getCenterBoard()

	public boolean updateCenterContent(HttpServletRequest request) {
	    System.out.println("CSBoardService updateCenterContent()");
	    int updateSuccess = 0;
	    try {
	        CenterBoardDTO centerBoardDTO = new CenterBoardDTO();
	        String centerSubject = request.getParameter("centerSubject");
	        String centerContent = request.getParameter("centerContent");
	        String createUser = request.getParameter("createUser");
	        String updateUser = request.getParameter("updateUser");
	        String createDate = preprocessDate(request.getParameter("createDate"));
	        
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
	        LocalDateTime dateTime = LocalDateTime.parse(createDate, formatter);
	        Timestamp createTime = Timestamp.valueOf(dateTime);
	        
	        centerBoardDTO.setCenterSubject(centerSubject);
	        centerBoardDTO.setCenterContent(centerContent);
	        centerBoardDTO.setCreateUser(createUser);
	        centerBoardDTO.setCreateDate(createTime);
	        centerBoardDTO.setUpdateUser(updateUser);
	        
	        csBoardDAO = new CSBoardDAO();
	        updateSuccess = csBoardDAO.updateCenterContent(centerBoardDTO);
	    } catch (DateTimeParseException dtpe) {
	        System.err.println("Date parsing failed: " + dtpe.getMessage());
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return updateSuccess > 0;
	}//updateCenterContent()
	private String preprocessDate(String createDate) {
	    // 밀리초가 한 자리만 있는 경우 세 자리로 만들어줍니다.
	    if (createDate.matches(".+\\.\\d$")) {
	        return createDate + "00";
	    } else if (createDate.matches(".+\\.\\d\\d$")) {
	        return createDate + "0";
	    }
	    return createDate;
	}// 날짜 포맷 밀리초 변환

	public boolean deleteCenterContent(HttpServletRequest request) {
		System.out.println("CSBoardService deleteCenterContent()");
		int deleteSuccess = 0;
		try {
			CenterBoardDTO centerBoardDTO = new CenterBoardDTO();
	        String createUser = request.getParameter("createUser");
	        String createDate = preprocessDate(request.getParameter("createDate"));
	        
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
	        LocalDateTime dateTime = LocalDateTime.parse(createDate, formatter);
	        Timestamp createTime = Timestamp.valueOf(dateTime);
	        
	        centerBoardDTO.setCreateUser(createUser);
	        centerBoardDTO.setCreateDate(createTime);
	        
	        csBoardDAO = new CSBoardDAO();
	        deleteSuccess = csBoardDAO.deleteCenterContent(centerBoardDTO);
	    } catch (DateTimeParseException dtpe) {
	        System.err.println("Date parsing failed: " + dtpe.getMessage());
	    } catch (Exception e) {
			e.printStackTrace();
		}
		return deleteSuccess > 0;
	}//deleteCenterContent()

	public ArrayList<LocationDTO> getRegionList() {
		System.out.println("CSBoardService getRegionList()");
		ArrayList<LocationDTO> regionList = null;
		try {
			csBoardDAO = new CSBoardDAO();
			regionList = csBoardDAO.getRegionList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return regionList;
	}//getRegionList()

	public ArrayList<CinemaDTO> getCinemaList(String loIdx) {
		System.out.println("CSBoardService getCinemaList()");
		ArrayList<CinemaDTO> cinemaList = null;
		try {
			csBoardDAO = new CSBoardDAO();
			cinemaList = csBoardDAO.getCinemaList(loIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cinemaList;
	}//getCinemaList()

	public boolean insertCenterWrite(HttpServletRequest request) {
		System.out.println("CSBoardService insertCenterWrite()");
		int insertSuccess = 0;
		try {
			String centerSubject = request.getParameter("centerSubject");
			String centerContent = request.getParameter("centerContent");
			String createUser = request.getParameter("createUser");
			String loIdx = request.getParameter("loIdx");
			String ciIdx = request.getParameter("ciIdx");
			
			CenterBoardDTO centerBoardDTO = new CenterBoardDTO();
			centerBoardDTO.setLoIdx(Integer.parseInt(loIdx));
			centerBoardDTO.setCiIdx(Integer.parseInt(ciIdx));
			centerBoardDTO.setCenterSubject(centerSubject);
			centerBoardDTO.setCenterContent(centerContent);
			centerBoardDTO.setCreateUser(createUser);
			csBoardDAO = new CSBoardDAO();
			insertSuccess = csBoardDAO.insertCenterWrite(centerBoardDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return insertSuccess > 0;
	}//insertCenterWrite();

	public ArrayList<QnaBoardDTO> getQnaBoardList(PageDTO pageDTO) {
		System.out.println("CSBoardService getQnaBoardList()");
		ArrayList<QnaBoardDTO> qnaBoardList = null;
		
		try {
			// 시작하는 행번호 구하는 식
			int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
			// 끝나는 행번호 구하는 식
			int endRow = startRow + pageDTO.getPageSize() -1;			
			csBoardDAO = new CSBoardDAO();
			pageDTO.setStartRow(startRow-1);
			pageDTO.setPageSize(pageDTO.getPageSize());
			
			qnaBoardList = csBoardDAO.getQnaBoardList(pageDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return qnaBoardList;
	}//getQnaBoardList()

	public int getQnaBoardCount() {
		System.out.println("CSBoardService getQnaBoardCount()");
		int count = 0;
		try {
			csBoardDAO = new CSBoardDAO();
			count = csBoardDAO.getQnaBoardCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}//getQnaBoardCount()

	public QnaBoardDTO getQnaBoard(String createUser, String createDate) {
		System.out.println("CSBoardService getQnaBoard()");
		QnaBoardDTO qnaBoardDTO = null;
		try {
			csBoardDAO = new CSBoardDAO();
			qnaBoardDTO = csBoardDAO.getQnaBoard(createUser,createDate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return qnaBoardDTO;
	}//getQnaBoard()

	public boolean updateQnaBoard(HttpServletRequest request) {
		System.out.println("CSBoardService updateQnaBoard()");
		int qnaUpdateSuccess = 0;
		try {
			csBoardDAO = new CSBoardDAO();
	        // 요청으로부터 JSON 데이터 읽기
	        StringBuilder jsonBuffer = new StringBuilder();
	        String line;
	        BufferedReader reader = request.getReader();
	        while ((line = reader.readLine()) != null) {
	            jsonBuffer.append(line);
	        }
	        String jsonStr = jsonBuffer.toString();

	        // Gson 객체 생성
	        Gson gson = new Gson();

	        // JSON 문자열을 Java 객체로 변환
	        QnaBoardDTO qnaBoardDTO = gson.fromJson(jsonStr, QnaBoardDTO.class);

//	        // 데이터 사용
//	        String qnaResponse = qnaBoardDTO.getQnaResponse();
//	        String responseUser = qnaBoardDTO.getResponseUser();
//	        String createUser = qnaBoardDTO.getCreateUser();
//	        String createDate = qnaBoardDTO.getCreateDate();
	        qnaUpdateSuccess = csBoardDAO.updateQnaBoard(qnaBoardDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return qnaUpdateSuccess > 0;
	}//updateQnaBoard()

	public boolean qnaBoardInsert(HttpServletRequest request) {
		System.out.println("CSBoardService qnaBoardInsert()");
		int insertSuccess = 0;
		try {
			String qnaCategory = request.getParameter("qnaCategory");
			String createUser = request.getParameter("createUser");
			String qnaContent = request.getParameter("qnaContent");
			
			QnaBoardDTO qnaBoardDTO = new QnaBoardDTO();
			qnaBoardDTO.setQnaCategory(qnaCategory);
			qnaBoardDTO.setCreateUser(createUser);
			qnaBoardDTO.setQnaContent(qnaContent);
			csBoardDAO = new CSBoardDAO();
			insertSuccess = csBoardDAO.qnaBoardInsert(qnaBoardDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return insertSuccess > 0;
	}//qnaBoardInsert()

	public ArrayList<QnaBoardDTO> getQnaBoardList(PageDTO pageDTO, String qnaCategory) {
		System.out.println("CSBoardService getQnaBoardList() search");
		ArrayList<QnaBoardDTO> qnaBoardList = null;
		try {
			// 시작하는 행번호 구하는 식
			int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
			// 끝나는 행번호 구하는 식
			int endRow = startRow + pageDTO.getPageSize() -1;			
			csBoardDAO = new CSBoardDAO();
			pageDTO.setStartRow(startRow-1);
			pageDTO.setPageSize(pageDTO.getPageSize());
			
			qnaBoardList = csBoardDAO.getQnaBoardList(pageDTO,qnaCategory);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return qnaBoardList;
	}// qnaCategory로 검색

	public int getQnaBoardCount(String qnaCategory) {
		System.out.println("CSBoardService getQnaBoardCount() search");
		int count = 0;
		try {
			csBoardDAO = new CSBoardDAO();
			count = csBoardDAO.getQnaBoardCount(qnaCategory);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}// qnaCategory로 검색 페이징 처리를 위한 count

	public ArrayList<LostBoardDTO> getLostBoardList(PageDTO pageDTO) {
		System.out.println("CSBoardService getLostBoardList()");
		ArrayList<LostBoardDTO> lostBoardList = null;
		try {
			// 시작하는 행번호 구하는 식
			int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
			// 끝나는 행번호 구하는 식
			int endRow = startRow + pageDTO.getPageSize() -1;			
			csBoardDAO = new CSBoardDAO();
			pageDTO.setStartRow(startRow-1);
			pageDTO.setPageSize(pageDTO.getPageSize());
			
			lostBoardList = csBoardDAO.getLostBoardList(pageDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lostBoardList;
	}//getLostBoardList()

	public int getLostBoardCount() {
		System.out.println("CSBoardService getLostBoardCount()");
		int count = 0;
		try {
			csBoardDAO = new CSBoardDAO();
			count = csBoardDAO.getLostBoardCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}//getLostBoardCount()

	public LostBoardDTO getLostBoard(String createUser, String createDate) {
		System.out.println("CSBoardService getLostBoard()");
		LostBoardDTO lostBoardDTO = null;
		try {
			csBoardDAO = new CSBoardDAO();
			lostBoardDTO = csBoardDAO.getLostBoard(createUser,createDate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lostBoardDTO;
	}//getLostBoard()

	public boolean updateLostBoard(HttpServletRequest request) {
		System.out.println("CSBoardService updateLostBoard()");
		int lostUpdateSuccess = 0;
		try {
			csBoardDAO = new CSBoardDAO();
	        // 요청으로부터 JSON 데이터 읽기
	        StringBuilder jsonBuffer = new StringBuilder();
	        String line;
	        BufferedReader reader = request.getReader();
	        while ((line = reader.readLine()) != null) {
	            jsonBuffer.append(line);
	        }
	        String jsonStr = jsonBuffer.toString();

	        // Gson 객체 생성
	        Gson gson = new Gson();

	        // JSON 문자열을 Java 객체로 변환
	        LostBoardDTO lostBoardDTO = gson.fromJson(jsonStr, LostBoardDTO.class);

	        lostUpdateSuccess = csBoardDAO.updateLostBoard(lostBoardDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lostUpdateSuccess > 0;
	}//

	public boolean insertCsLost(HttpServletRequest request) {
		System.out.println("CSBoardService insertCsLost()");
		int lostInsertSuccess = 0;
		try {
			String lostSubject = request.getParameter("lostSubject");
			String lostContent = request.getParameter("lostContent");
			String createUser = request.getParameter("createUser");
			String loIdx = request.getParameter("loIdx");
			String ciIdx = request.getParameter("ciIdx");
			
			LostBoardDTO lostBoardDTO = new LostBoardDTO();
			lostBoardDTO.setLoIdx(loIdx);
			lostBoardDTO.setCiIdx(ciIdx);
			lostBoardDTO.setLostSubject(lostSubject);
			lostBoardDTO.setLostContent(lostContent);
			lostBoardDTO.setCreateUser(createUser);
			csBoardDAO = new CSBoardDAO();
			lostInsertSuccess = csBoardDAO.insertCsLost(lostBoardDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lostInsertSuccess > 0;
	}//insertCsLost()

	public ArrayList<LostBoardDTO> getLostBoardList(PageDTO pageDTO, HttpServletRequest request) {
		System.out.println("CSBoardService getLostBoardList()");
		ArrayList<LostBoardDTO> lostBoardList = null;
		try {
			String loIdx = request.getParameter("loIdx");
			String ciIdx = request.getParameter("ciIdx");
			String lostStatus = request.getParameter("lostStatus");
			String lostSubject = request.getParameter("lostSubject");
			
			System.out.println("loIdx: " + loIdx);
			System.out.println("ciIdx: " + ciIdx);
			System.out.println("lostStatus: " + lostStatus);
			System.out.println("lostSubject: " + lostSubject);
			
			LostBoardDTO lostBoardDTO = new LostBoardDTO();
			lostBoardDTO.setLoIdx(loIdx);
			lostBoardDTO.setCiIdx(ciIdx);
			lostBoardDTO.setLostStatus(lostStatus);
			lostBoardDTO.setLostSubject(lostSubject);
			// 시작하는 행번호 구하는 식
			int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
			// 끝나는 행번호 구하는 식
			int endRow = startRow + pageDTO.getPageSize() -1;			
			csBoardDAO = new CSBoardDAO();
			pageDTO.setStartRow(startRow-1);
			pageDTO.setPageSize(pageDTO.getPageSize());
			
			lostBoardList = csBoardDAO.getLostBoardList(pageDTO,lostBoardDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lostBoardList;
	}//getLostBoardList() 검색버튼 사용

	public int getLostBoardCount(HttpServletRequest request) {
		System.out.println("CSBoardService getLostBoardCount()");
		int count = 0;
		try {
			String loIdx = request.getParameter("locationSelect");
			String ciIdx = request.getParameter("cinemaSelect");
			String lostStatus = request.getParameter("lostStatus");
			String lostSubject = request.getParameter("lostSubject");
			
			System.out.println("loIdx: " + loIdx);
			System.out.println("ciIdx: " + ciIdx);
			System.out.println("lostStatus: " + lostStatus);
			System.out.println("lostSubject: " + lostSubject);
			
			LostBoardDTO lostBoardDTO = new LostBoardDTO();
			lostBoardDTO.setLoIdx(loIdx);
			lostBoardDTO.setCiIdx(ciIdx);
			lostBoardDTO.setLostStatus(lostStatus);
			lostBoardDTO.setLostSubject(lostSubject);
			
			csBoardDAO = new CSBoardDAO();
			count = csBoardDAO.getLostBoardCount(lostBoardDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}//getLostBoardCount 검색버튼 사용

	
}//클래스
