package com.manager.entity;

public class Time {
private String year;
	
	private String time;
	
	private String formattime;
	
	private String yeartime;

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

	public String getFormattime() {
		return this.year+"年 ：" +this.time+"季度";
	}

	public void setFormattime(String formattime) {
		this.formattime = formattime;
	}

	public String getYeartime() {
		return this.year+":"+this.time;
	}

	public void setYeartime(String yeartime) {
		this.yeartime = yeartime;
	}

}
