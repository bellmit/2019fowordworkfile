package com.bjrun.clientQuestion.entity;

import java.util.Date;
/**
 * 保存数据日志
 * @author Administrator
 *
 */
public class AppMsdLog {
	private int id;
	private String agentId; //appId
	private String toUser;	//接收人
	private String wxUserId; //用户微信ID
	private String title; //标题
	private String content; //内容
	private Date sendTime; //发送时间
	private String type; //类型 1,接收到的；2,转为json的
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAgentId() {
		return agentId;
	}
	public void setAgentId(String agentId) {
		this.agentId = agentId;
	}
	public String getToUser() {
		return toUser;
	}
	public void setToUser(String toUser) {
		this.toUser = toUser;
	}
	public String getWxUserId() {
		return wxUserId;
	}
	public void setWxUserId(String wxUserId) {
		this.wxUserId = wxUserId;
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
	public Date getSendTime() {
		return sendTime;
	}
	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	

}
