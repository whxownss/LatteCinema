package com.itwillbs.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.google.gson.Gson;
import com.itwillbs.dao.StoreDAO;
import com.itwillbs.domain.StoreItemDTO;

public class StoreService {
	StoreDAO storeDAO = new StoreDAO();

	public List<StoreItemDTO> storeListB() {
		
		return storeDAO.selectStoreItemB();
	}//
	
	public List<StoreItemDTO> storeListS() {
		
		return storeDAO.selectStoreItemS();
	}//
	
	public List<StoreItemDTO> storeListT() {
		
		return storeDAO.selectStoreItemT();
	}//

	public String getItemInfo(String idx) {
		StoreItemDTO dto = storeDAO.getItemInfo(idx);
		System.out.println(dto);
		Gson gson = new Gson();
		String itemInfoJson = gson.toJson(dto);
		System.out.println(itemInfoJson);
		return itemInfoJson;
	}//
	
}
