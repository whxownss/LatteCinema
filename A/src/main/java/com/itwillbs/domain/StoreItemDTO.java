package com.itwillbs.domain;

import java.sql.Timestamp;

public class StoreItemDTO {
	private String itemIdx;
	private String itemName;
	private String itemDatail;
	private String itemPrice;
	private String itemImage;
	private String itemNumber;
	private Timestamp itemDate;
	private String createUser;
	private Timestamp createDate;
	private String updateUser;
	private Timestamp updateDate;
	
	public String getItemIdx() {
		return itemIdx;
	}
	public void setItemIdx(String itemIdx) {
		this.itemIdx = itemIdx;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemDatail() {
		return itemDatail;
	}
	public void setItemDatail(String itemDatail) {
		this.itemDatail = itemDatail;
	}
	public String getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(String itemPrice) {
		this.itemPrice = itemPrice;
	}
	public String getItemImage() {
		return itemImage;
	}
	public void setItemImage(String itemImage) {
		this.itemImage = itemImage;
	}
	public String getItemNumber() {
		return itemNumber;
	}
	public void setItemNumber(String itemNumber) {
		this.itemNumber = itemNumber;
	}
	public Timestamp getItemDate() {
		return itemDate;
	}
	public void setItemDate(Timestamp itemDate) {
		this.itemDate = itemDate;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public Timestamp getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	public String getUpdateUser() {
		return updateUser;
	}
	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}
	public Timestamp getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}
	@Override
	public String toString() {
		return "StoreItemDTO [itemIdx=" + itemIdx + ", itemName=" + itemName + ", itemDatail=" + itemDatail
				+ ", itemPrice=" + itemPrice + ", itemImage=" + itemImage + ", itemNumber=" + itemNumber + ", itemDate="
				+ itemDate + ", createUser=" + createUser + ", createDate=" + createDate + ", updateUser=" + updateUser
				+ ", updateDate=" + updateDate + "]";
	}
	
}
