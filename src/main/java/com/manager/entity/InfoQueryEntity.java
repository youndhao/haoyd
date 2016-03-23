package com.manager.entity;

import com.manager.util.Page;

public class InfoQueryEntity {
 private Page page;
	 
	 private String fullName;

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
}
