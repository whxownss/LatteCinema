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
import com.itwillbs.dao.MemberDAO;
import com.itwillbs.domain.CenterBoardDTO;
import com.itwillbs.domain.CinemaDTO;
import com.itwillbs.domain.ExqBoardDTO;
import com.itwillbs.domain.LocationDTO;
import com.itwillbs.domain.LostBoardDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.QnaBoardDTO;
import com.itwillbs.domain.RecommendDTO;
import com.itwillbs.domain.ReservationDTO;
import com.itwillbs.domain.ResponseDataDTO;

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
	        //0108 추가 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return qnaUpdateSuccess > 0;
	}//updateQnaBoard()
	public boolean updateQnaBoard2(HttpServletRequest request) {
		System.out.println("CSBoardService updateQnaBoard2()");
		int qnaUpdateSuccess = 0;
		try {
			csBoardDAO = new CSBoardDAO();
	        QnaBoardDTO qnaBoardDTO = new QnaBoardDTO();
//	        // 데이터 사용
	        String qnaResponse = request.getParameter("qnaResponse");
	        String responseUser = request.getParameter("responseUser");
	        String createUser = request.getParameter("createUser");
	        String createDate = request.getParameter("createDate");
	        //0108 추가
	        String qnaSubject = request.getParameter("qnaSubject");
	        qnaBoardDTO.setQnaSubject(qnaSubject);
	        
	        qnaBoardDTO.setCreateDate(createDate);
	        qnaBoardDTO.setCreateUser(createUser);
	        qnaBoardDTO.setResponseUser(responseUser);
	        qnaBoardDTO.setQnaResponse(qnaResponse);
	        
	        qnaUpdateSuccess = csBoardDAO.updateQnaBoard2(qnaBoardDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return qnaUpdateSuccess > 0;
	}//updateQnaBoard2()

	public boolean qnaBoardInsert(HttpServletRequest request) {
		System.out.println("CSBoardService qnaBoardInsert()");
		int insertSuccess = 0;
		try {
			String qnaCategory = request.getParameter("qnaCategory");
			String createUser = request.getParameter("createUser");
			String qnaContent = request.getParameter("qnaContent");
			String qnaSubject	= request.getParameter("qnaSubject");
			String qnaSecret = request.getParameter("qnaSecret");
			
			QnaBoardDTO qnaBoardDTO = new QnaBoardDTO();
			qnaBoardDTO.setQnaCategory(qnaCategory);
			qnaBoardDTO.setCreateUser(createUser);
			qnaBoardDTO.setQnaContent(qnaContent);
			qnaBoardDTO.setQnaSecret(qnaSecret);
			qnaBoardDTO.setQnaSubject(qnaSubject);
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
	public boolean updateLostBoard2(HttpServletRequest request) {
		System.out.println("CSBoardService updateLostBoard2()");
		int lostUpdateSuccess = 0;
		try {
			csBoardDAO = new CSBoardDAO();
			String lostSubject = request.getParameter("lostSubject");
	        String createUser = request.getParameter("createUser");
//	        String createDate = request.getParameter("createDate");
	        String lostResponse = request.getParameter("lostResponse");
	        String responseUser = request.getParameter("responseUser");
	        String createDate = preprocessDate(request.getParameter("createDate"));
	        
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
	        LocalDateTime dateTime = LocalDateTime.parse(createDate, formatter);
	        Timestamp createTime = Timestamp.valueOf(dateTime);
	        
	        LostBoardDTO lostBoardDTO = new LostBoardDTO();
	        lostBoardDTO.setCreateUser(createUser);
	        lostBoardDTO.setCreateDate(createTime);
	        lostBoardDTO.setLostResponse(lostResponse);
	        lostBoardDTO.setResponseUser(responseUser);
	        lostBoardDTO.setLostSubject(lostSubject);

	        lostUpdateSuccess = csBoardDAO.updateLostBoard2(lostBoardDTO);
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
			
			csBoardDAO = new CSBoardDAO();
			count = csBoardDAO.getLostBoardCount(lostBoardDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}//getLostBoardCount 검색버튼 사용

	public ArrayList<ExqBoardDTO> getExqBoardList(PageDTO pageDTO, HttpServletRequest request) {
		System.out.println("CSBoardService getExqBoardList() 검색");
		ArrayList<ExqBoardDTO> exqBoardList = null;
		try {
			String exqSelect = request.getParameter("exqSelect");
			// 시작하는 행번호 구하는 식
			int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
			// 끝나는 행번호 구하는 식
			int endRow = startRow + pageDTO.getPageSize() -1;			
			csBoardDAO = new CSBoardDAO();
			pageDTO.setStartRow(startRow-1);
			pageDTO.setPageSize(pageDTO.getPageSize());
			
			exqBoardList = csBoardDAO.getExqBoardList(pageDTO,exqSelect);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return exqBoardList;
	}//getExqBoardList 셀렉트박스로 검색

	public int getExqBoardCount(HttpServletRequest request) {
		System.out.println("CSBoardService getExqBoardCount() 검색");
		int count = 0;
		try {
			String exqSelect = request.getParameter("exqSelect");
			csBoardDAO = new CSBoardDAO();
			count = csBoardDAO.getExqBoardCount(exqSelect);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}//getExqBoardCount 셀렉트박스로 검색

	public ArrayList<CenterBoardDTO> getCenterBoardList() {
		ArrayList<CenterBoardDTO> centerBoardList = null;
		try {
			csBoardDAO = new CSBoardDAO();
			centerBoardList = csBoardDAO.getCenterBoardList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return centerBoardList;
	}//getCenterBoardList 조건없이 모두 부를 때.

	public ArrayList<QnaBoardDTO> getQnaBoardList() {
		ArrayList<QnaBoardDTO> qnaBoardList = null;
		try {
			csBoardDAO = new CSBoardDAO();
			qnaBoardList = csBoardDAO.getQnaBoardList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return qnaBoardList;
	}//getQnaBoardList() 조건없이 모두 부를 때.

	public ArrayList<LostBoardDTO> getLostBoardList() {
		ArrayList<LostBoardDTO> lostBoardList = null;
		try {
			csBoardDAO = new CSBoardDAO();
			lostBoardList = csBoardDAO.getLostBoardList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lostBoardList;
	}//getLostBoardList() 조건없이 모두 부를 때.

	public ArrayList<ExqBoardDTO> getExqBoardList() {
		ArrayList<ExqBoardDTO> exqBoardList = null;
		try {
			csBoardDAO = new CSBoardDAO();
			exqBoardList = csBoardDAO.getExqBoardList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return exqBoardList;
	}//getExqBoardList() 조건없이 모두 부를 때.

	public boolean updateExqBoard(HttpServletRequest request) {
		System.out.println("CSBoardService updateExqBoard()");
	    int updateSuccess = 0;
	    try {
	        ExqBoardDTO exqBoardDTO = new ExqBoardDTO();
	        String exqSubject = request.getParameter("exqSubject");
	        String exqContent = request.getParameter("exqContent");
	        String exqSelect = request.getParameter("exqSelect");
	        String createUser = request.getParameter("createUser"); 
	        String updateUser = request.getParameter("updateUser");
	        
	        String createDate = preprocessDate(request.getParameter("createDate"));
	        
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
	        LocalDateTime dateTime = LocalDateTime.parse(createDate, formatter);
	        Timestamp createTime = Timestamp.valueOf(dateTime);
	        
	        exqBoardDTO.setExqSubject(exqSubject);
	        exqBoardDTO.setExqContent(exqContent);
	        exqBoardDTO.setExqSelect(exqSelect);
	        exqBoardDTO.setCreateUser(createUser);
	        exqBoardDTO.setCreateDate(createTime);
	        exqBoardDTO.setUpdateUser(updateUser);
	        
	        csBoardDAO = new CSBoardDAO();
	        updateSuccess = csBoardDAO.updateExqBoard(exqBoardDTO);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return updateSuccess > 0;
	}//updateExqBoard()

	public boolean deleteExqBoard(HttpServletRequest request) {
		System.out.println("CSBoardService deleteCenterContent()");
		int deleteSuccess = 0;
		try {
			ExqBoardDTO exqBoardDTO = new ExqBoardDTO();
	        String createUser = request.getParameter("createUser");
	        String createDate = preprocessDate(request.getParameter("createDate"));
	        
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
	        LocalDateTime dateTime = LocalDateTime.parse(createDate, formatter);
	        Timestamp createTime = Timestamp.valueOf(dateTime);
	        
	        exqBoardDTO.setCreateUser(createUser);
	        exqBoardDTO.setCreateDate(createTime);
	        
	        csBoardDAO = new CSBoardDAO();
	        deleteSuccess = csBoardDAO.deleteExqBoard(exqBoardDTO);
	    } catch (DateTimeParseException dtpe) {
	        System.err.println("Date parsing failed: " + dtpe.getMessage());
	    } catch (Exception e) {
			e.printStackTrace();
		}
		return deleteSuccess > 0;
	}//deleteExqBoard

	public boolean exqBoardInsert(HttpServletRequest request) {
		System.out.println("CSBoardService exqBoardInsert()");
		int insertSuccess = 0;
		try {
			String exqSelect = request.getParameter("exqSelect");
			String exqSubject = request.getParameter("exqSubject");
			String exqContent = request.getParameter("exqContent");
			String createUser = request.getParameter("createUser");
			
			ExqBoardDTO exqBoardDTO = new ExqBoardDTO();
			exqBoardDTO.setExqSelect(exqSelect);
			exqBoardDTO.setExqSubject(exqSubject);
			exqBoardDTO.setExqContent(exqContent);
			exqBoardDTO.setCreateUser(createUser);
			
			csBoardDAO = new CSBoardDAO();
			insertSuccess = csBoardDAO.exqBoardInsert(exqBoardDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return insertSuccess > 0;
	}//exqBoardInsert()

	public boolean deleteQnaBoard(HttpServletRequest request) {
		System.out.println("CSBoardService deleteQnaBoard()");
		int deleteSuccess = 0;
		try {
			QnaBoardDTO qnaBoardDTO = new QnaBoardDTO();
	        String createUser = request.getParameter("createUser");
	        String createDate = request.getParameter("createDate");
//	        String createDate = preprocessDate(request.getParameter("createDate"));
	        
//	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
//	        LocalDateTime dateTime = LocalDateTime.parse(createDate, formatter);
//	        Timestamp createTime = Timestamp.valueOf(dateTime);
	        
	        qnaBoardDTO.setCreateUser(createUser);
	        qnaBoardDTO.setCreateDate(createDate);
	        
	        csBoardDAO = new CSBoardDAO();
	        deleteSuccess = csBoardDAO.deleteQnaBoard(qnaBoardDTO);
	    } catch (Exception e) {
			e.printStackTrace();
		}
		return deleteSuccess > 0;
	}//deleteQnaBoard()

	public boolean deleteLostBoard(HttpServletRequest request) {
		System.out.println("CSBoardService deleteLostBoard()");
		int deleteSuccess = 0;
		try {
			LostBoardDTO lostBoardDTO = new LostBoardDTO();
	        String createUser = request.getParameter("createUser");
	        String createDate = preprocessDate(request.getParameter("createDate"));
	        
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
	        LocalDateTime dateTime = LocalDateTime.parse(createDate, formatter);
	        Timestamp createTime = Timestamp.valueOf(dateTime);
	        
	        lostBoardDTO.setCreateUser(createUser);
	        lostBoardDTO.setCreateDate(createTime);
	        
	        csBoardDAO = new CSBoardDAO();
	        deleteSuccess = csBoardDAO.deleteLostBoard(lostBoardDTO);
	    } catch (Exception e) {
			e.printStackTrace();
		}
		return deleteSuccess > 0;
	}//deleteLostBoard()

	public ArrayList<MemberDTO> getMemberList() {
		System.out.println("CSBoardService getMemberList()");
		ArrayList<MemberDTO> memberList = null;
		try {
			csBoardDAO = new CSBoardDAO();
			memberList = csBoardDAO.getMemberList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberList;
	}//getMemberList()

	public ArrayList<ResponseDataDTO> getResponseList() {
		System.out.println("CSBoardService getResponseList()");
		ArrayList<ResponseDataDTO> responseList = null;
		try {
			csBoardDAO = new CSBoardDAO();
			responseList = csBoardDAO.getResponseList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return responseList;
	}//getResponseList()

	public boolean insertRecommend(HttpServletRequest request) {
		System.out.println("CSBoardService insertRecommend()");
		int insertSuccess = 0;
		try {
			String createUser = request.getParameter("createUser");
			String movieName = request.getParameter("movieName");
			String director	= request.getParameter("director");
			String poster = request.getParameter("poster");
			
			RecommendDTO recommendDTO = new RecommendDTO();
			recommendDTO.setCreateUser(createUser);
			recommendDTO.setMovieName(movieName);
			recommendDTO.setDirector(director);
			recommendDTO.setPoster(poster);
			
			csBoardDAO = new CSBoardDAO();
			insertSuccess = csBoardDAO.insertRecommend(recommendDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return insertSuccess > 0;
	}

	public ArrayList<RecommendDTO> getRecommendList(PageDTO pageDTO) {
		System.out.println("CSBoardService getRecommendList()");
		ArrayList<RecommendDTO> recommendList = null;
		try {
			// 시작하는 행번호 구하는 식
			int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
			// 끝나는 행번호 구하는 식
			int endRow = startRow + pageDTO.getPageSize() -1;			
			csBoardDAO = new CSBoardDAO();
			pageDTO.setStartRow(startRow-1);
			pageDTO.setPageSize(pageDTO.getPageSize());
			
			recommendList = csBoardDAO.getRecommendList(pageDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return recommendList;
	}//getRecommendList()

	public boolean plusRecoCount(HttpServletRequest request) {
		System.out.println("CSBoardService plusRecoCount()");
		 int updateSuccess = 0;
		 try {
			 String createUser = request.getParameter("createUser");
			 String recommendIdx = request.getParameter("recommendIdx");
			 String recoUser = request.getParameter("recoUser");
			csBoardDAO = new CSBoardDAO();
			updateSuccess = csBoardDAO.plusRecoCount(createUser,recommendIdx,recoUser);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return updateSuccess > 0;
	}

	public boolean deleteRecoData(int recommendIdx) {
		System.out.println("CSBoardService deleteRecoData()");
		int deleteSuccess = 0;
		try {
	        csBoardDAO = new CSBoardDAO();
	        deleteSuccess = csBoardDAO.deleteRecoData(recommendIdx);
	    } catch (Exception e) {
			e.printStackTrace();
		}
		return deleteSuccess > 0;
	}//

	public int getRecoBoardCount() {
		System.out.println("CSBoardService getRecoBoardCount()");
		int count = 0;
		try {
			csBoardDAO = new CSBoardDAO();
			count = csBoardDAO.getRecoBoardCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}//getRecoBoardCount()

	public ArrayList<RecommendDTO> getRecommendList(PageDTO pageDTO, String movieName) {
		System.out.println("CSBoardService getRecommendList() search");
		ArrayList<RecommendDTO> recommendList = null;
		try {
			// 시작하는 행번호 구하는 식
			int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
			// 끝나는 행번호 구하는 식
			int endRow = startRow + pageDTO.getPageSize() -1;			
			csBoardDAO = new CSBoardDAO();
			pageDTO.setStartRow(startRow-1);
			pageDTO.setPageSize(pageDTO.getPageSize());
			
			recommendList = csBoardDAO.getRecommendList(pageDTO,movieName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return recommendList;
	}//getRecommendList() search

	public int getRecoBoardCount(String movieName) {
		System.out.println("CSBoardService getRecoBoardCount() search");
		int count = 0;
		try {
			csBoardDAO = new CSBoardDAO();
			count = csBoardDAO.getRecoBoardCount(movieName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}//getRecoBoardCount() search

	public ArrayList<QnaBoardDTO> getQnaBoardList(String createUser, PageDTO pageDTO) {
		System.out.println("CSBoardService getQnaBoardList() mypage");
		ArrayList<QnaBoardDTO> qnaBoardList = null;
		try {
			// 시작하는 행번호 구하는 식
			int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
			// 끝나는 행번호 구하는 식
			int endRow = startRow + pageDTO.getPageSize() -1;			
			csBoardDAO = new CSBoardDAO();
			pageDTO.setStartRow(startRow-1);
			pageDTO.setPageSize(pageDTO.getPageSize());
			
			qnaBoardList = csBoardDAO.getQnaBoardList(createUser,pageDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return qnaBoardList;
	}//getQnaBoardList() mypage

	public int getQnaBoardCount(String createUser, String check) {
		System.out.println("CSBoardService getQnaBoardCount() mypage");
		int count = 0;
		try {
			csBoardDAO = new CSBoardDAO();
			count = csBoardDAO.getQnaBoardCount(createUser,check);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}//getQnaBoardCount() mypage

	public ArrayList<LostBoardDTO> getLostBoardList(String createUser, PageDTO pageDTO) {
		System.out.println("CSBoardService getLostBoardList() mypage");
		ArrayList<LostBoardDTO> lostBoardList = null;
		try {
			// 시작하는 행번호 구하는 식
			int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
			// 끝나는 행번호 구하는 식
			int endRow = startRow + pageDTO.getPageSize() -1;			
			csBoardDAO = new CSBoardDAO();
			pageDTO.setStartRow(startRow-1);
			pageDTO.setPageSize(pageDTO.getPageSize());
			
			lostBoardList = csBoardDAO.getLostBoardList(pageDTO,createUser);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lostBoardList;
	}//getLostBoardList() mypage

	public int getLostBoardCount(String createUser, String check) {
		System.out.println("CSBoardService getLostBoardCount() mypage");
		int count = 0;
		try {
			csBoardDAO = new CSBoardDAO();
			count = csBoardDAO.getLostBoardCount(createUser,check);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}//getLostBoardCount() mypage

	public ArrayList<LostBoardDTO> getLostBoardList(String createUser, PageDTO pageDTO, String lostStatus) {
		System.out.println("CSBoardService getLostBoardList() mypage lostStatus");
		ArrayList<LostBoardDTO> lostBoardList = null;
		try {
			// 시작하는 행번호 구하는 식
			int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
			// 끝나는 행번호 구하는 식
			int endRow = startRow + pageDTO.getPageSize() -1;			
			csBoardDAO = new CSBoardDAO();
			pageDTO.setStartRow(startRow-1);
			pageDTO.setPageSize(pageDTO.getPageSize());
			
			lostBoardList = csBoardDAO.getLostBoardList(pageDTO,createUser,lostStatus);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lostBoardList;
	}//getLostBoardList() mypage lostStatus

	public int getLostBoardCount(String createUser, String lostStatus, String check) {
		System.out.println("CSBoardService getLostBoardCount() mypage lostStatus");
		int count = 0;
		try {
			csBoardDAO = new CSBoardDAO();
			count = csBoardDAO.getLostBoardCount(createUser,check,lostStatus);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}//getLostBoardCount() mypage lostStatus

	public ArrayList<QnaBoardDTO> getQnaBoardList(String createUser, PageDTO pageDTO, String qnaResponse) {
		System.out.println("CSBoardService getQnaBoardList() mypage qnaResponse");
		ArrayList<QnaBoardDTO> qnaBoardList = null;
		try {
			// 시작하는 행번호 구하는 식
			int startRow = (pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
			// 끝나는 행번호 구하는 식
			int endRow = startRow + pageDTO.getPageSize() -1;			
			csBoardDAO = new CSBoardDAO();
			pageDTO.setStartRow(startRow-1);
			pageDTO.setPageSize(pageDTO.getPageSize());
			
			qnaBoardList = csBoardDAO.getQnaBoardList(createUser,pageDTO,qnaResponse);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return qnaBoardList;
	}//getQnaBoardList() mypage qnaResponse

	public int getQnaBoardCount(String createUser, String qnaResponse, String check) {
		System.out.println("CSBoardService getQnaBoardCount() mypage qnaResponse");
		int count = 0;
		try {
			csBoardDAO = new CSBoardDAO();
			count = csBoardDAO.getQnaBoardCount(createUser,qnaResponse,check);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}//getQnaBoardCount() mypage qnaResponse

	public boolean updateMemStatus(HttpServletRequest request) {
		System.out.println("CSBoardService updateMemStatus()");
	    int updateSuccess = 0;
	    try {
	        MemberDTO memberDTO = new MemberDTO();
	        String memId = request.getParameter("memId");
	        String memStatus = request.getParameter("memStatus");
	        
	        memberDTO.setMemId(memId);
	        memberDTO.setMemStatus(memStatus);
	        csBoardDAO = new CSBoardDAO();
	        updateSuccess = csBoardDAO.updateMemStatus(memberDTO);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return updateSuccess > 0;
	}//updateMemStatus()

	public int getMemCount() {
		System.out.println("CSBoardService getMemCount()");
		int count = 0;
		try {
			csBoardDAO = new CSBoardDAO();
			count = csBoardDAO.getMemCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}//getMemCount()

	public ArrayList<ReservationDTO> getResBoardList() {
		System.out.println("CSBoardService getResRefundList()");
		ArrayList<ReservationDTO> resBoardList = null;
		try {
			csBoardDAO = new CSBoardDAO();
			resBoardList = csBoardDAO.getResBoardList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resBoardList;
	}//getResBoardList()

	/**
	 * 추천순 5개 뽑아옴
	 * */
	public ArrayList<RecommendDTO> getRecommendListOrdered() {
		System.out.println("CSBoardService getRecommendListOrdered()");
		ArrayList<RecommendDTO> recommendList = null;
		try {
			csBoardDAO = new CSBoardDAO();
			recommendList = csBoardDAO.getRecommendListOrdered();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return recommendList;
	}
	
}//클래스
