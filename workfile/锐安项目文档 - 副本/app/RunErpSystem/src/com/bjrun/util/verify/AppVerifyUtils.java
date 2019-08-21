package com.bjrun.util.verify;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import net.sf.json.JSONObject;

public class AppVerifyUtils {
	
	 /**
	   * 根据请求路径获取 access_token 凭证
	   * @param connUrl
	   * @return
	   */
	  public static String getWXAccess_token(String connUrl){
			System.out.println(connUrl);
			URL url;
			String access_token = "";
			HttpURLConnection connection;
			InputStream inputStream = null;
			try {
			    url = new URL(connUrl);
			    connection = (HttpURLConnection) url.openConnection();
			    connection.setRequestMethod("GET");
			    connection.setDoOutput(true);
				connection.setDoInput(true);
				connection.connect();
				
				//获取返回的字符
				inputStream = connection.getInputStream();
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
			}finally{
				try {
					inputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			return  access_token ;
		}
	  
}
