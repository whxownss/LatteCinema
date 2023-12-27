package com.itwillbs.dao;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.itwillbs.domain.CustomerDTO;
import com.itwillbs.sql.SqlMapClient;


public class CustomerDAO {
	
	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSession();

	public boolean insert(CustomerDTO dto) {
		SqlSession session = sqlSessionFactory.openSession();
		
		int insertCnt = session.insert("Customer.insert", dto);
		
		session.commit();
		session.close();
		
		return insertCnt > 0 ? true : false;
	}


	
}
