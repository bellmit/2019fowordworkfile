package com.bjrun.mobile.action.declare;

import java.io.IOException;
import java.util.Date;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;

import com.bjrun.base.BaseAction;
import com.bjrun.mobile.entity.declare.Declare;
import com.bjrun.mobile.entity.user.User;
import com.bjrun.mobile.service.user.UserService;
/**
 * DES : 手机打卡代码更新V1.0
 * DATE: 2019-03-07
 * @author Administrator
 *
 */
public class AgreeDeclareAction extends BaseAction{
  private static final long serialVersionUID = -877232666472178596L;
  private static Logger logger = Logger.getLogger(AgreeDeclareAction.class);
  private UserService userService;

  private String result;
  
  public UserService getUserService(){
    return this.userService;
  }
  
  public void setUserService(UserService userService){
    this.userService = userService;
  }
  
  /**
   * 签署免责声明
   * @return
 * @throws IOException 
   */
  public String agreeDis() throws IOException{
    JSONObject json = new JSONObject();
    try{
    	String wxUserId = this.request.getParameter("wxUserId");
      	String isAgree = this.request.getParameter("isAgree");
      	String userName = this.request.getParameter("userName");
      	Declare declare = new Declare();
      	declare.setWxUserId(wxUserId);
      	declare.setIsAgree(isAgree);
      	declare.setUserName(userName);
      	declare.setCreateTime(new Date());
      	User user = this.userService.getUserByUserName(userName);
      	if(user!=null){
      		declare.setUserId(user.getId());
      	}
      	boolean isExsit = this.userService.isExsitDeclare(userName);
      	if(isExsit){
      		json.put("msg", "exist");
      	}else{
      		this.userService.saveDeclare(declare);
      		json.put("msg", "success");
      	}
    }catch (Exception e){
      json.put("msg", "出错，请联系管理员。");
      e.printStackTrace();
    }
    this.response.getWriter().write("flightHandler("+ json.toString() +")");
    return null;
  }
  

	
}
