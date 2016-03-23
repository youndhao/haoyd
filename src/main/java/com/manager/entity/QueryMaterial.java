package com.manager.entity;

import com.manager.util.Page;

public class QueryMaterial {
private Page page;
	
	private String name;
	
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

	public float getCost() {
		return cost;
	}

	public void setCost(float cost) {
		this.cost = cost;
	}

}
