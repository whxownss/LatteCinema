package com.itwillbs.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.itwillbs.domain.CenterBoardDTO;
import com.itwillbs.domain.ExqBoardDTO;
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
		try {
			session = sqlSessionFactory.openSession();
			session.update("CsAdmin.saveCenterContent",centerBoardDTO);
			
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
	            session.close();
	        }
		}
		return session.update(null);
	}//updateCenterContent()
	
	
	
}//클래스
