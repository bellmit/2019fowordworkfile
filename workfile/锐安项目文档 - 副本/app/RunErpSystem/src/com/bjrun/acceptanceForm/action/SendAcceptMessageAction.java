package com.bjrun.acceptanceForm.action;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.util.Date;

import net.sf.json.JSONObject;

import com.bjrun.base.BaseAction;
import com.bjrun.clientQuestion.entity.AppMsdLog;
import com.bjrun.clientQuestion.service.AppMsdLogService;
import com.bjrun.mobile.entity.user.User;
import com.bjrun.mobile.service.user.UserService;
import com.bjrun.mobile.service.wxApp.WxAppService;
/**
 * @Desc   400推送手机消息
 * @author Administrator
 * @Date   2019-05-25 13：00
 */
public class SendAcceptMessageAction extends BaseAction{
	
	private static final long serialVersionUID = -6314167695406962542L;
	private UserService userService;
	
	private AppMsdLogService appMsdLogService;
	
	private WxAppService wxAppService;
	
	
 
	public WxAppService getWxAppService() {
		return wxAppService;
	}

	public void setWxAppService(WxAppService wxAppService) {
		this.wxAppService = wxAppService;
	}

	public AppMsdLogService getAppMsdLogService() {
		return appMsdLogService;
	}

	public void setAppMsdLogService(AppMsdLogService appMsdLogService) {
		this.appMsdLogService = appMsdLogService;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	/**
	 * 9999推送手机端消息
	 * @throws Exception
	 */
	public void sendMessage() throws Exception {
		//参数：接收人姓名、内容
		String userName = "";
		String desc = "";
		User user=null;
		userName = request.getParameter("userName");
		desc = request.getParameter("desc");
		//保存原始数据
		AppMsdLog oldLog = new AppMsdLog();
		oldLog.setToUser(userName);
		oldLog.setType("1");
		oldLog.setTitle("移动端9999");
		oldLog.setContent(desc);
		oldLog.setSendTime(new Date());
		if(!"".equals(userName) && userName != null){
			User oldUser=  userService.getUserByUserName(userName);
			if(oldUser!=null){
				oldLog.setWxUserId(oldUser.getWxUserId());
			}
		}
		appMsdLogService.saveOrUpdateAppMsdLog(oldLog);
		if(!"".equals(userName) && userName != null){
			userName = URLDecoder.decode(userName, "UTF-8");
			user=  userService.getUserByUserName(userName);
		}		
		
		if(!"".equals(desc) && desc != null){
			desc = URLDecoder.decode(desc, "UTF-8");
		}		
		//保存转换后的数据
		AppMsdLog newLog = new AppMsdLog();
		newLog.setToUser(userName);
		newLog.setType("2");
		newLog.setTitle("移动端9999");
		newLog.setContent(desc);
		newLog.setSendTime(new Date());
		if(!"".equals(userName) && userName != null){
			User newUser=  userService.getUserByUserName(userName);
			if(newUser!=null){
				newLog.setWxUserId(newUser.getWxUserId());
			}
		}
		appMsdLogService.saveOrUpdateAppMsdLog(newLog);
		
		String title = "移动端问题";
		String status = "待处理";
		
		StringBuffer sb = new StringBuffer();
		sb.append("{\"content\":\""+desc+"\"}");
		
		AppMsdLog log = new AppMsdLog();
		log.setContent(desc);
		log.setSendTime(new Date());
		log.setToUser(userName);
		log.setWxUserId(user.getWxUserId());
		log.setType("1");
		appMsdLogService.saveOrUpdateAppMsdLog(log);
		/**
		 * 手机APP消息推送内容填充
		 */
		JSONObject obj = new JSONObject();
//		obj.element("touser",userIds);
		obj.element("touser",user.getWxUserId());
		obj.element("msgtype","text");
      	obj.element("agentid","1000017");
      	obj.element("text",sb.toString());
      	String oldRunUrl = wxAppService.getUserByKey("WX_SENDMESSAGE");
  		String access_token = getWXAccess_token(oldRunUrl+"/cgi-bin/gettoken?corpid=wla377739e7a&corpsecret=V421xhPqmaVhtuVSTSFQpekhpSKsJ05DtdPEZnXFk24");
  		boolean tt = getMsgSendResult(oldRunUrl+"/cgi-bin/message/send?access_token="+access_token,access_token,obj);
	}
	
	public String getWXAccess_token(String connUrl){
		URL url;
		String access_token = "";
		HttpURLConnection connection;
		try {
		    url = new URL(connUrl);
		    connection = (HttpURLConnection) url.openConnection();
		    connection.setRequestMethod("GET");
		    connection.setDoOutput(true);
			connection.setDoInput(true);
			connection.connect();
			
			//获取返回的字符
			InputStream inputStream = connection.getInputStream();
			int size =inputStream.available();
			byte[] bs =new byte[size];
			inputStream.read(bs);
			
			String message=new String(bs,"UTF-8");
			JSONObject jsonObject = JSONObject.fromObject(message);
			//获取access_token
		     access_token = jsonObject.getString("access_token");
			//获取errcode
			String errcode = jsonObject.getString("errcode");
			//获取errmsg
			String errmsg = jsonObject.getString("errmsg");

			System.out.println("access_token-----"+access_token);
			System.out.println("errcode-----"+errcode);
			System.out.println("errmsg-----"+errmsg);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  access_token ;
	}
	
	/**
	 * 获取消息发送结果
	 * @param connUrl
	 * @param access_token
	 * @param obj
	 * @return true:发送成功 false:发送失败
	 */
	public  boolean getMsgSendResult(String connUrl , String access_token ,JSONObject obj){
		URL postMsgUrl;
		HttpURLConnection postConnection;
		boolean result = false;
		try {
		    postMsgUrl = new URL(connUrl);
		    postConnection = (HttpURLConnection) postMsgUrl.openConnection();
	        postConnection.setDoOutput(true);
	        postConnection.setDoInput(true);
	        postConnection.setRequestMethod("POST");
	        postConnection.setUseCaches(false);
	        postConnection.setInstanceFollowRedirects(true);
	        postConnection.setRequestProperty("Content-Type","application/json");
//	        postConnection.setRequestProperty("access_token",access_token);
	        postConnection.connect(); 
	        
	        //POST请求
            DataOutputStream out = new DataOutputStream(postConnection.getOutputStream());
            out.write(obj.toString().getBytes("UTF-8"));
            out.flush();
            out.close();
            
            //读取响应
            BufferedReader reader = new BufferedReader(new InputStreamReader(postConnection.getInputStream()));
            String lines;
            StringBuffer sb = new StringBuffer("");
            while ((lines = reader.readLine()) != null) {
                lines = new String(lines.getBytes(), "utf-8");
                sb.append(lines);
            }
            System.out.println(sb);
            reader.close();
            // 断开连接
            postConnection.disconnect();
            
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
