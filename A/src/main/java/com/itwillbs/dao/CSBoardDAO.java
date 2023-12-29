package com.itwillbs.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.itwillbs.domain.CenterBoardDTO;
import com.itwillbs.domain.CinemaDTO;
import com.itwillbs.domain.ExqBoardDTO;
import com.itwillbs.domain.LocationDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.sql.SqlMapClient;

public class CSBoardDAO {
	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSession();
	SqlSession session = null;
	
	public int getExqBoardCount() {
		System.out.println("CSBoardDAO getExqBoardCount()");
		int count = 0;
		try {
			session = sqlSessionFactory.openSession();
			count = session.selectOne("CsAdmin.exqBoardCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
	            session.close();
	        }
		}
		return count;
	}//getExqBoardCount()

	public ArrayList<ExqBoardDTO> getExqBoardList(PageDTO pageDTO) {
		System.out.println("CSBoardDAO getExqBoardList()");
		ArrayList<ExqBoardDTO> exqBoardList = null;
		try {
			session = sqlSessionFactory.openSession();
			exqBoardList = new ArrayList<ExqBoardDTO>(session.selectList("CsAdmin.getExqBoardList", pageDTO));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
	            session.close();
	        }
		}
		return exqBoardList;
	}//getExqBoardList()
	
	public int getCenterBoardCount() {
		System.out.println("CSBoardDAO getCenterBoardCount()");
		int count = 0;
		try {
			session = sqlSessionFactory.openSession();
			count = session.selectOne("CsAdmin.centerBoardCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
	            session.close();
	        }
		}
		return count;
	}//getCenterBoardCount()

	public ArrayList<CenterBoardDTO> getCenterBoardList(PageDTO pageDTO) {
		System.out.println("CSBoardDAO getCenterBoardList()");
		ArrayList<CenterBoardDTO> centerBoardList = null;
		try {
			session = sqlSessionFactory.openSession();
			centerBoardList = new ArrayList<CenterBoardDTO>(session.selectList("CsAdmin.getCenterBoardList", pageDTO));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
	            session.close();
	        }
		}
		return centerBoardList;
	}//getCenterBoardList()

	public CenterBoardDTO getCenterBoard(String createUser, String createDate) {
		System.out.println("CSBoardDAO getCenterBoard()");
		CenterBoardDTO centerBoardDTO = null;
		try {
			session = sqlSessionFactory.openSession();
			// 파라미터를 맵에 저장
	        Map<String, Object> params = new HashMap<>();
	        params.put("createUser", createUser);
	        params.put("createDate", createDate);
	        // selectOne 메소드 사용 및 파라미터 전달
	        centerBoardDTO = (CenterBoardDTO) session.selectOne("CsAdmin.getCenterBoard", params);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
	            session.close();
	        }
		}
		return centerBoardDTO;
	}//getCenterBoard()

	public int updateCenterContent(CenterBoardDTO centerBoardDTO) {
		System.out.println("CSBoardDAO updateCenterContent()");
		int updateSuccess = 0;
		try {
			session = sqlSessionFactory.openSession();
			updateSuccess = session.update("CsAdmin.saveCenterContent",centerBoardDTO);
			
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
	            session.close();
	        }
		}
		return updateSuccess;
	}//updateCenterContent()

	public int deleteCenterContent(CenterBoardDTO centerBoardDTO) {
		System.out.println("CSBoardDAO deleteCenterContent()");
		int deleteSuccess = 0;
		try {
			session = sqlSessionFactory.openSession();
			deleteSuccess = session.delete("CsAdmin.deleteCenterContent", centerBoardDTO);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
	            session.close();
	        }
		}
		
		return deleteSuccess;
	}//deleteCenterContent()

	public ArrayList<LocationDTO> getRegionList() {
		System.out.println("CSBoardDAO getRegionList()");
		ArrayList<LocationDTO> regionList = null;
		try {
			session = sqlSessionFactory.openSession();
			regionList = new ArrayList<LocationDTO>(session.selectList("CsAdmin.getRegionList"));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
	            session.close();
	        }
		}
		
		return regionList;
	}//getRegionList()

	public ArrayList<CinemaDTO> getCinemaList(String loIdx) {
		System.out.println("CSBoardDAO getCinemaList()");
		ArrayList<CinemaDTO> cinemaList = null;
		try {
			session = sqlSessionFactory.openSession();
			cinemaList = new ArrayList<CinemaDTO>(session.selectList("CsAdmin.getCinemaList", loIdx));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
	            session.close();
	        }
		}
		return cinemaList;
	}//getCinemaList()

	public int insertCenterWrite(CenterBoardDTO centerBoardDTO) {
		System.out.println("CSBoardDAO insertCenterWrite()");
		int insertSuccess = 0;
		try {
			session = sqlSessionFactory.openSession();
			insertSuccess = session.insert("CsAdmin.insertCenterWrite", centerBoardDTO);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
	            session.close();
	        }
		}
		return insertSuccess;
	}//insertCenterWrite()
	
	
	
}//클래스
