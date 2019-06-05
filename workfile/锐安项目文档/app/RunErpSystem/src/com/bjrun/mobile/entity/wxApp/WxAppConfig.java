package com.bjrun.mobile.entity.wxApp;
/**
 * 政务微信 APP应用 配置
 * @author Administrator
 *
 */
public class WxAppConfig {
	 private Integer id;
	 private String wx_app_key;//jsapi_ticket	access_token
	 private String wx_app_value;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getWx_app_key() {
		return wx_app_key;
	}
	public void setWx_app_key(String wx_app_key) {
		this.wx_app_key = wx_app_key;
	}
	public String getWx_app_value() {
		return wx_app_value;
	}
	public void setWx_app_value(String wx_app_value) {
		this.wx_app_value = wx_app_value;
	}
	 
}
