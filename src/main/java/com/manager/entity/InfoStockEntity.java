package com.manager.entity;

import com.manager.util.Page;

public class InfoStockEntity {
	private String productNumber;
	private String productName;
	private float cost;
	private float retail;
	private String category;
	private String privider;
	private String stockAmount;
	private Page page;
	public String getProductNumber() {
		return productNumber;
	}
	public void setProductNumber(String productNumber) {
		this.productNumber = productNumber;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public float getCost() {
		return cost;
	}
	public void setCost(float cost) {
		this.cost = cost;
	}
	public float getRetail() {
		return retail;
	}
	public void setRetail(float retail) {
		this.retail = retail;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPrivider() {
		return privider;
	}
	public void setPrivider(String privider) {
		this.privider = privider;
	}
	public String getStockAmount() {
		return stockAmount;
	}
	public void setStockAmount(String stockAmount) {
		this.stockAmount = stockAmount;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	

}
