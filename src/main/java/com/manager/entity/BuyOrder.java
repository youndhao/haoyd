package com.manager.entity;

import com.manager.util.Page;

public class BuyOrder {

private String bid;
	
	private String year;
	
	private String time;
	
	private int ispass;
	
	private String advice;

	private Page page;

	public String getBid() {
		return bid;
	}

	public void setBid(String bid) {
		this.bid = bid;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getIspass() {
		return ispass;
	}

	public void setIspass(int ispass) {
		this.ispass = ispass;
	}

	public String getAdvice() {
		return advice;
	}

	public void setAdvice(String advice) {
		this.advice = advice;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}
}
