package com.itwillbs.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.itwillbs.domain.StoreItemDTO;
import com.itwillbs.sql.SqlMapClient;

public class StoreItemDAO {
	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSession();

	public boolean insert(StoreItemDTO sidto) {
		SqlSession session = sqlSessionFactory.openSession();
		int insertCnt = session.insert("StoreItem.insert", sidto);
		session.commit();
		session.close();
		
		return insertCnt > 0 ? true : false;
	}
	
}
