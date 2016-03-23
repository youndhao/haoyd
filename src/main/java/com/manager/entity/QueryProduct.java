package com.manager.entity;

import com.manager.util.Page;

public class QueryProduct {
    private Page page;
	
	private String name;
	
	private float salemoney;
	
	private float cost;

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getSalemoney() {
		return salemoney;
	}

	public void setSalemoney(float salemoney) {
		this.salemoney = salemoney;
	}

	public float getCost() {
		return cost;
	}

	public void setCost(float cost) {
		this.cost = cost;
	}
	


}
