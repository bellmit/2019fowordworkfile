package com.bjrun.message.entity;

import java.util.Date;

/**
 * @Desc   消息实体
 * @author Administrator
 * @Date   2019-05-25 13：00
 */
public class Message {
	private Integer id;
	private String agent_id;//APP agentId
	private String to_user_name;//接收人
	private String to_wx_user_id;//接收人政务微信ID
	private String to_telephone;//手机号
	private String from_user_name;//发送人
	private Integer status;//消息状态：0是未发送 1：已发送
	private String title;//消息标题
	private String content;//消息内容
	private String from_platform;//消息所属平台
	private String module;//功能模块
	private String wx_msg_type;//微信消息类型：
	private String type;//消息类型：1 短信 2 消息
	private Date create_time;//消息创建时间
	private Date update_time;//消息状态更新时间
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAgent_id() {
		return agent_id;
	}
	public void setAgent_id(String agent_id) {
		this.agent_id = agent_id;
	}
	public String getTo_user_name() {
		return to_user_name;
	}
	public void setTo_user_name(String to_user_name) {
		this.to_user_name = to_user_name;
	}
	public String getTo_wx_user_id() {
		return to_wx_user_id;
	}
	public void setTo_wx_user_id(String to_wx_user_id) {
		this.to_wx_user_id = to_wx_user_id;
	}
	public String getTo_telephone() {
		return to_telephone;
	}
	public void setTo_telephone(String to_telephone) {
		this.to_telephone = to_telephone;
	}
	public String getFrom_user_name() {
		return from_user_name;
	}
	public void setFrom_user_name(String from_user_name) {
		this.from_user_name = from_user_name;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getModule() {
		return module;
	}
	public void setModule(String module) {
		this.module = module;
	}
	public String getFrom_platform() {
		return from_platform;
	}
	public void setFrom_platform(String from_platform) {
		this.from_platform = from_platform;
	}
	public String getWx_msg_type() {
		return wx_msg_type;
	}
	public void setWx_msg_type(String wx_msg_type) {
		this.wx_msg_type = wx_msg_type;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public Date getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}
	
}
