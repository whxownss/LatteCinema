package com.itwillbs.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.itwillbs.dao.StoreDAO;
import com.itwillbs.domain.StoreItemDTO;

public class StoreService {
	StoreDAO storeDAO = new StoreDAO();

	public List<StoreItemDTO> storeList() {
		
		return storeDAO.selectStoreItem();
	}//
	
	public List<StoreItemDTO> storeListB() {
		
		return storeDAO.selectStoreItemB();
	}//
	
	public List<StoreItemDTO> storeListS() {
		
		return storeDAO.selectStoreItemS();
	}//
	
	public List<StoreItemDTO> storeListT() {
		
		return storeDAO.selectStoreItemT();
	}//

	public void viewstore(HttpServletRequest request) {
		try {
			String itemidx = request.getParameter("itemIdx");
			String itemname = request.getParameter("itemName");
			String itemprice = request.getParameter("itemPrice");
			String itemdatail = request.getParameter("itemDatail");
			
			StoreItemDTO storeitemDTO = new StoreItemDTO();
			storeitemDTO.setItemIdx(itemidx);
			storeitemDTO.setItemName(itemname);
			storeitemDTO.setItemPrice(itemprice);
			storeitemDTO.setItemDatail(itemdatail);
			
			storeDAO = new StoreDAO();
			storeDAO.viewstore(storeitemDTO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
