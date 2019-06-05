package com.bjrun.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import net.sf.json.JSONObject;
import org.junit.Test;

public class AppWXMsgSendUtil {
	

public String getWXAccess_token(String connUrl){
		System.out.println(connUrl);
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
		System.out.println("connUrl--------"+connUrl);
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
            if(sb.indexOf("成功")!=-1){
            	result =  true;
            	System.out.println("成功成功成功成功成功成功成功");
            }else{
            	result =  false;
            	System.out.println("失败失败失败失败失败失败失败");
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
	
	@Test
	public void test(){
		StringBuffer sb = new StringBuffer();
		
		sb.append("{\"articles\":[{\"title\":\"锐安科技政务微信服务协议\",\"description\":\"请点击阅读全文签署政务微信服务协议\",\"url\":\"http://wechat.bjrun.com:8000/connect/oauth2/authorize?appid=wla377739e7a&redirect_uri=http://111.204.211.208:8888/RunErpSystem/declare/responsbility.html&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect\",\"picurl\":\"http://111.204.211.208:8888/RunErpSystem/kaoqin/images/logo.jpg\"}]}");
		
//		sb.append("{\"content\":\"政务微信免责声明签署\"}");
		/**http://wechat.bjrun.com:8000/connect/oauth2/authorize?appid=wla377739e7a&redirect_uri=http://111.204.211.208:8888/RunErpSystem/declare/responsbility.html&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect
		 * 手机APP消息推送内容填充
		 */
		JSONObject obj = new JSONObject();
		obj.element("touser","wanglin|zhangluru");
		obj.element("msgtype","news");
//		obj.element("msgtype","text");
      	obj.element("agentid","1000012");
      	obj.element("news",sb.toString());
//      	obj.element("text",sb.toString());
      	System.out.println(obj);
  		String access_token = getWXAccess_token("http://10.200.200.24:8000/cgi-bin/gettoken?corpid=wla377739e7a&corpsecret=_Rg39lDvZnnk4WkizwplL_QeEncm4lrI0ZhTLFtrVcY");
  		System.out.println("access_token----"+access_token);
  		boolean tt = getMsgSendResult("http://10.200.200.24:8000/cgi-bin/message/send?access_token="+access_token,access_token,obj);
		System.out.println(tt);
		
		
		
	}
	
}
