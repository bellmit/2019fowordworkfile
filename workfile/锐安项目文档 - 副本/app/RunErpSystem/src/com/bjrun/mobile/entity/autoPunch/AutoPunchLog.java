package com.bjrun.mobile.entity.autoPunch;

import java.util.Date;

public class AutoPunchLog {
	
	private Integer id;
	private Integer run_id;
	private String user_name;
	private String descript;
	private Date update_time;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getRun_id() {
		return run_id;
	}
	public void setRun_id(Integer run_id) {
		this.run_id = run_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public Date getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}
	

}
