package com.bjrun.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import net.sf.json.JSONObject;
import org.junit.Test;

public class AppMsgSendUtil {
	
	public String getAccess_token(String connUrl){
		
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
			String result = jsonObject.getString("result");
			JSONObject resultObject = JSONObject.fromObject(result);
			//获取access_token
			access_token = resultObject.getString("access_token");//access_token
			String expriedIn = resultObject.getString("expriedIn");//expriedIn
			System.out.println("access_token-----"+access_token);
			
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
	        postConnection.setRequestProperty("access-token",access_token);
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
		/**
		 * 手机APP消息推送内容填充
		 */
		JSONObject obj = new JSONObject();
      	obj.element("title", "今天晚上想吃什么水果");
      	obj.element("content", "您好！今天晚上想吃什么水果，请投票选择，详情请点击链接查看……");
      	obj.element("creator", "admin");
      	obj.element("detailUrl", "http://rtbgqf.v.vote8.cn/m?from=groupmessage&isappinstalled=0");
      	obj.element("titleBgColor","#87CEFA");
      	obj.element("titleColor","#FFFFF0");
      	obj.element("toUsers","4611686323395671509");
      	obj.element("type","1");
      	
      	
  		String access_token = getAccess_token(AppConstant.TEST_URL_ACCESS_TOKEN);
  		System.out.println(access_token);
		boolean tt = getMsgSendResult(AppConstant.URL_SEND_MESSAGE,access_token,obj);
		System.out.println(tt);
		
		
		
	}
	
}
