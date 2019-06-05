package com.bjrun.util;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.CharArrayBuffer;
import org.apache.http.util.EntityUtils;

public class HttpRobot {
	/**
	 * post请求，参数为json字符串
	 * @param url 请求地址
	 * @param jsonString json字符串
	 * @return 响应
	 */
	public static String postJson(String url, String jsonString) {
 
		String result = null;
		CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpPost post = new HttpPost(url);
		CloseableHttpResponse response = null;
 
		try {
			post.setEntity(new ByteArrayEntity(jsonString.getBytes("UTF-8")));
			response = httpClient.execute(post);
			if (response != null && response.getStatusLine().getStatusCode() == 200) {
				HttpEntity entity = response.getEntity();
				result = entityToString(entity);
				JSONObject jsonObject = JSONObject.fromObject(result); // 将字符串转化为JSONObject类型
 
				/*
				 * 分析 JSON的中的数据的格式，提取出来 System.out.println("jsonObject --->" + jsonObject);
				 * jsonObject ---> {"intent":{"actionName":"","code":7110,"intentName":""},
				 * "results":[{"groupType":0,"resultType":"text","values":{"text":"你的小可爱做错了什么吗？"
				 * }}]}
				 * 
				 */
				JSONArray ja = jsonObject.getJSONArray("results");
				System.out.println("ja ---> " + ja);
				JSONObject jo = ja.getJSONObject(ja.size() - 1); // 提取出最后一个 text类型的数据-
				jsonObject = jo.getJSONObject("values");
				result = jsonObject.getString("text"); // 去除 value 中的 text数据
			}
 
			return result;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				httpClient.close();
				if (response != null) {
					response.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
 
	private static String entityToString(HttpEntity entity) throws IOException {
		String result = null;
		if (entity != null) {
			long lenth = entity.getContentLength();
			if (lenth != -1 && lenth < 2048) {
				result = EntityUtils.toString(entity, "UTF-8");
			} else {
				InputStreamReader reader1 = new InputStreamReader(entity.getContent(), "UTF-8");
				CharArrayBuffer buffer = new CharArrayBuffer(2048);
				char[] tmp = new char[1024];
				int l;
				while ((l = reader1.read(tmp)) != -1) {
					buffer.append(tmp, 0, l);
				}
				result = buffer.toString();
			}
		}
		return result;
	}
 
	public static JSONObject transJosn(String text) { // 构造JSON请求参数
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("reqType", "0");
 
		JSONObject perception = new JSONObject();
		JSONObject inputText = new JSONObject();
		inputText.put("text", text);
		perception.put("inputText", inputText);
		jsonObject.put("perception", perception);
 
		JSONObject userInfo = new JSONObject();
		userInfo.put("apiKey", "588d96ab3ae744d18dbf8db5c0e71510");
		userInfo.put("userId", "441708");
		jsonObject.put("userInfo", userInfo);
 
		return jsonObject;
	}

}
