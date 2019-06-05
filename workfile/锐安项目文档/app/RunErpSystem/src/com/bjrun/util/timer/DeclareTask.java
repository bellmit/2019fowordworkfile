package com.bjrun.util.timer;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.transaction.annotation.Transactional;

import com.bjrun.mobile.dao.user.UserDao;
import com.bjrun.mobile.entity.declare.Declare;
import com.bjrun.mobile.entity.user.User;

@Transactional
public class DeclareTask{

	private UserDao userDao;
	
	
	public UserDao getUserDao() {
		return userDao;
	}


	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}


	public void sendDeclareMsg(){
		List<User> userList = userDao.getUserList();//查询所有用户
		Map<String,String> userMap = new HashMap<String,String>();
		List<Declare> decList = userDao.getDeclareList();//查询已签署协议的用户
		Map<String,String> decMap = new HashMap<String,String>();
		String userIds = "";
		if(userList != null && userList.size() > 0){
			for(User user : userList){
				userMap.put(user.getUserName(), user.getWxUserId());
			}
		}
		if(decList != null && decList.size() > 0){
			for(Declare dec : decList){
				decMap.put(dec.getUserName(), dec.getWxUserId());
			}
		}
		if(userMap!=null && !userMap.isEmpty()){
			if(decMap!=null && !decMap.isEmpty()){
				for(String key : decMap.keySet()){
					if(userMap.containsKey(key)){
						userMap.remove(key);
					}
				}
			}
			if(userMap!=null && !userMap.isEmpty()){
				for(String key : userMap.keySet()){
					userIds += userMap.get(key)+"|";
				}
			}
		}
		if(userIds.length()>0){
			userIds = userIds.substring(0,userIds.length()-1);
			System.out.println(userIds);
			StringBuffer sb = new StringBuffer();
			sb.append("{\"articles\":[{\"title\":\"锐安科技政务微信服务协议\",\"description\":\"请点击阅读全文签署政务微信服务协议\",\"url\":\"http://wechat.bjrun.com:8000/connect/oauth2/authorize?appid=wla377739e7a&redirect_uri=https://app.bjrun.com:8180/RunErpSystem/declare/responsbility.html&response_type=code&scope=snsapi_privateinfo&agentid=1000012&state=STATE#wechat_redirect\",\"picurl\":\"https://app.bjrun.com:8180/RunErpSystem/kaoqin/images/logo.jpg\"}]}");
			/**
			 * 手机APP消息推送内容填充
			 */
			JSONObject obj = new JSONObject();
//			obj.element("touser",userIds);
			
			obj.element("touser","wanglin");
			obj.element("msgtype","news");
	      	obj.element("agentid","1000012");
	      	obj.element("news",sb.toString());
	  		String access_token = getWXAccess_token("http://10.200.200.35:8000/cgi-bin/gettoken?corpid=wla377739e7a&corpsecret=_Rg39lDvZnnk4WkizwplL_QeEncm4lrI0ZhTLFtrVcY");
	  		boolean tt = getMsgSendResult("http://10.200.200.35:8000/cgi-bin/message/send?access_token="+access_token,access_token,obj);
		}
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
