package com.itwillbs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.itwillbs.domain.StoreItemDTO;
import com.itwillbs.sql.SqlMapClient;

public class StoreDAO {
	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSession();

	public boolean insert(StoreItemDTO sidto) {
		SqlSession session = sqlSessionFactory.openSession();
		int insertCnt = session.insert("StoreItem.insert", sidto);
		session.commit();
		session.close();
		
		return insertCnt > 0 ? true : false;
	}//

	public List<StoreItemDTO> selectStoreItem() {
		SqlSession session = sqlSessionFactory.openSession();
		
		List<StoreItemDTO> storeItemList = session.selectList("StoreItem.selectStoreItem");
		session.close();
		return storeItemList;
	}//
	
	public List<StoreItemDTO> selectStoreItemB() {
		SqlSession session = sqlSessionFactory.openSession();
		
		List<StoreItemDTO> storeItemListB = session.selectList("StoreItem.selectStoreItemB");
		session.close();
		
		for(StoreItemDTO b : storeItemListB) {
			System.out.println(b);
		}
		
		return storeItemListB;
	}//
	
	public List<StoreItemDTO> selectStoreItemS() {
		SqlSession session = sqlSessionFactory.openSession();
		
		List<StoreItemDTO> storeItemListS = session.selectList("StoreItem.selectStoreItemS");
		session.close();
		
		for(StoreItemDTO s : storeItemListS) {
			System.out.println(s);
		}
		
		return storeItemListS;
	}//
	
	public List<StoreItemDTO> selectStoreItemT() {
		SqlSession session = sqlSessionFactory.openSession();
		
		List<StoreItemDTO> storeItemListT = session.selectList("StoreItem.selectStoreItemT");
		session.close();
		
		for(StoreItemDTO t : storeItemListT) {
			System.out.println(t);
		}
		
		return storeItemListT;
	}//
	
}
