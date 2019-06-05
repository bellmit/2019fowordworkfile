package com.bjrun.mobile.entity.wxApp;

import java.util.Date;

public class WxAppInfo {
	 private Integer id;
	 private String appKey;//jsapi_ticket	access_token
	 private String appValue;
	 private Date expired_date;
	 private Date create_date;
	 private String appId;
	 
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getAppKey() {
		return appKey;
	}
	public void setAppKey(String appKey) {
		this.appKey = appKey;
	}
	public String getAppValue() {
		return appValue;
	}
	public void setAppValue(String appValue) {
		this.appValue = appValue;
	}
	public Date getExpired_date() {
		return expired_date;
	}
	public void setExpired_date(Date expired_date) {
		this.expired_date = expired_date;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public String getAppId() {
		return appId;
	}
	public void setAppId(String appId) {
		this.appId = appId;
	}
	 
	 
}
