package com.manager.entity;

import java.util.List;

import com.manager.entity.SaleHistory;

public class Products {
    private int type;
	
	private List<SaleHistory> salehist;

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public List<SaleHistory> getSalehist() {
		return salehist;
	}

	public void setSalehist(List<SaleHistory> salehist) {
		this.salehist = salehist;
	}
    
}
