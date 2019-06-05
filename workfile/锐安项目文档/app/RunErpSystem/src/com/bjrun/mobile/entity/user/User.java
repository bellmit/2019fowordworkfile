package com.bjrun.mobile.entity.user;

public class User{
  private String id;
  private Integer runId;
  private String userName;
  private String passWord;
  private String muserId;
  private String wxUserId;
  private String auto_punch;
  
  public String getId()
  {
    return this.id;
  }
  
  public void setId(String id)
  {
    this.id = id;
  }
  
  public Integer getRunId()
  {
    return this.runId;
  }
  
  public void setRunId(Integer runId)
  {
    this.runId = runId;
  }
  
  public String getUserName()
  {
    return this.userName;
  }
  
  public void setUserName(String userName)
  {
    this.userName = userName;
  }
  
  public String getPassWord()
  {
    return this.passWord;
  }
  
  public void setPassWord(String passWord)
  {
    this.passWord = passWord;
  }
  public String getMuserId() {
	return muserId;
  }
  public void setMuserId(String muserId) {
	this.muserId = muserId;
  }
  public String getWxUserId() {
	return wxUserId;
  }
  public void setWxUserId(String wxUserId) {
	this.wxUserId = wxUserId;
  }
  public String getAuto_punch() {
	return auto_punch;
  }
  public void setAuto_punch(String auto_punch) {
	this.auto_punch = auto_punch;
  }
			
						 
}



