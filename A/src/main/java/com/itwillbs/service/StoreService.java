package com.itwillbs.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.itwillbs.dao.StoreDAO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.StoreItemDTO;
import com.itwillbs.domain.StorePayDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class StoreService {
	StoreDAO storeDAO = new StoreDAO();

	public List<StoreItemDTO> storeListB() {
		
		return storeDAO.selectStoreItemB();
	}//
	
	public List<StoreItemDTO> storeListS() {
		
		return storeDAO.selectStoreItemS();
	}//
	
	public List<StoreItemDTO> storeListC() {
		
		return storeDAO.selectStoreItemC();
	}//

	public String getItemInfo(String idx) {
		
		StoreItemDTO storeItemDTO = storeDAO.getItemInfo(idx);
		Gson gson = new Gson();
		String storeItemJson = gson.toJson(storeItemDTO);
		
		return storeItemJson;
	}//
	
	public int checkPhone(HttpServletRequest request) {
		MemberDTO memberDTO = new MemberDTO();
		int result = 0;
		
		try {
			String phone = request.getParameter("memPhone");
			storeDAO = new StoreDAO();
			result = storeDAO.checkPhone(phone);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result; 
	}//

	public String buyerInfo(String rsp) {
		storeDAO = new StoreDAO();
		Gson gson = new GsonBuilder().setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES).create();
		StorePayDTO storePayDTO = gson.fromJson(rsp, StorePayDTO.class);
		
		return storeDAO.buyerInfo(storePayDTO);
	}//

	public ArrayList<StorePayDTO> getStoreBuyList() {
		ArrayList<StorePayDTO> storeList = null;
		try {
			storeDAO = new StoreDAO();
			storeList = storeDAO.getStoreBuyList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return storeList;
	}//
	
	// 관리자 스토어 상품 추가
	public void insertStore(HttpServletRequest request) {
		try {
			//업로드 물리적 경로
			String uploadPath = request.getRealPath("/_assets/img");
			System.out.println(uploadPath);
			//파일 최대크기 10M
			int maxSize = 10*1024*1024;
			//파일 이름 같을시 파일이름 변경 DefaultFileRenamePolicy()
			MultipartRequest multi = 
new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
			System.out.println(multi);
			String itemIdx = multi.getParameter("itemIdx");
			String itemName = multi.getParameter("itemName");
			String itemDetail = multi.getParameter("itemDetail");
			String itemPrice = multi.getParameter("itemPrice");
			String itemImage = multi.getFilesystemName("itemImage");
			
			StoreItemDTO storeItemDTO = new StoreItemDTO();
			storeItemDTO.setItemIdx(itemIdx);
			storeItemDTO.setItemName(itemName);
			storeItemDTO.setItemDetail(itemDetail);
			storeItemDTO.setItemPrice(itemPrice);
			storeItemDTO.setItemImage(itemImage);
			
			storeDAO = new StoreDAO();
			storeDAO.insertStore(storeItemDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}//
	
	// 스토어상품 이름 리스트
	public List<StoreItemDTO> itemNameList() {
		List<StoreItemDTO> itemNameList = null;
		storeDAO = new StoreDAO();
		itemNameList = storeDAO.itemNameList();
		return itemNameList;
	}//
		
	// 관리자 스토어 상품 삭제
	public void deleteItem(String name) {
		storeDAO = new StoreDAO();
		storeDAO.deleteItem(name);
	}//

	public ArrayList<StorePayDTO> getstoreGiftList(String sId) {
		ArrayList<StorePayDTO> storeGift = null;
		try {
			storeDAO = new StoreDAO();
			storeGift = storeDAO.getstoreGiftList(sId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return storeGift;
	}
	
}//StoreService
