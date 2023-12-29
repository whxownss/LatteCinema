package com.itwillbs.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

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
	
	
}
