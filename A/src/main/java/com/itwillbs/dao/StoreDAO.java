package com.itwillbs.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.itwillbs.domain.StoreItemDTO;
import com.itwillbs.domain.StorePayDTO;
import com.itwillbs.sql.SqlMapClient;

public class StoreDAO {
	private SqlSessionFactory sqlSessionFactory = SqlMapClient.getSqlSession();
	SqlSession session = null;

	public boolean insert(StoreItemDTO sidto) {
		SqlSession session = sqlSessionFactory.openSession();
		int insertCnt = session.insert("StoreItem.insert", sidto);
		session.commit();
		session.close();
		
		return insertCnt > 0 ? true : false;
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
	
	public List<StoreItemDTO> selectStoreItemC() {
		SqlSession session = sqlSessionFactory.openSession();
		
		List<StoreItemDTO> storeItemListC = session.selectList("StoreItem.selectStoreItemC");
		session.close();
		
		for(StoreItemDTO c : storeItemListC) {
			System.out.println(c);
		}
		
		return storeItemListC;
	}//

	public StoreItemDTO getItemInfo(String idx) {
		SqlSession session = sqlSessionFactory.openSession();
		
		StoreItemDTO storeItem = session.selectOne("StoreItem.selectItemInfo", idx);
		
		session.close();
		return storeItem;
	}//

	public int checkPhone(String phone) {
		SqlSession session = sqlSessionFactory.openSession();
		int result = session.selectOne("StoreItem.checkPhone", phone);
		session.close();
		return result;
	}//

	public String buyerInfo(StorePayDTO storePayDTO) {
		SqlSession session = sqlSessionFactory.openSession();
		int insertinfo = session.insert("StoreItem.buyerInsert", storePayDTO);
		session.commit();
		session.close();
		
		return insertinfo > 0 ? "true" : "false";
	}//

	public ArrayList<StorePayDTO> getStoreBuyList() {
		ArrayList<StorePayDTO> storeList = null;
		try {
			session = sqlSessionFactory.openSession();
			storeList = new ArrayList<StorePayDTO>(session.selectList("StoreItem.getStoreBuyList"));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
	            session.close();
	        }
		}
		return storeList;
	}//

	public boolean insertStore(StoreItemDTO storeItemDTO) {
		SqlSession session = sqlSessionFactory.openSession();
		int insertitem = session.insert("StoreItem.insertStore", storeItemDTO);
		session.commit();
		session.close();
		return insertitem > 0 ? true : false;
	}//
	
	public List<StoreItemDTO> itemNameList() {
		SqlSession session = sqlSessionFactory.openSession();
		List<StoreItemDTO> itemNameList = session.selectList("StoreItem.itemNameList");
		session.close();
		return itemNameList;
	}//
	
	public boolean deleteItem(String name) {
		SqlSession session = sqlSessionFactory.openSession();
		int delete = session.delete("StoreItem.deleteItem", name);
		session.commit();
		session.close();
		return delete > 0 ? true : false;
	}//

	public ArrayList<StorePayDTO> getstoreGiftList(String sId) {
		ArrayList<StorePayDTO> storeGift = null;
		try {
			session = sqlSessionFactory.openSession();
			storeGift = new ArrayList<StorePayDTO>(session.selectList("StoreItem.getstoreGiftList", sId));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
	            session.close();
	        }
		}
		return storeGift;
	}

	public String refund(String mid) {
		session = sqlSessionFactory.openSession();
		int updateCnt = session.update("StoreItem.refund", mid);
		
		session.commit();
		session.close();
		
		return updateCnt > 0 ? "true" : "";
	}

}//StoreDAO
