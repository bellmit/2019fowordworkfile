package com.bjrun.mobile.entity.workCalendar;


public class WorkCalendar {
	private Integer id;
	private double work_hour;
	private String period;
	private double multiple;
	private Integer work_type;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public double getWork_hour() {
		return work_hour;
	}
	public void setWork_hour(double work_hour) {
		this.work_hour = work_hour;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public double getMultiple() {
		return multiple;
	}
	public void setMultiple(double multiple) {
		this.multiple = multiple;
	}
	public Integer getWork_type() {
		return work_type;
	}
	public void setWork_type(Integer work_type) {
		this.work_type = work_type;
	}
	
}
