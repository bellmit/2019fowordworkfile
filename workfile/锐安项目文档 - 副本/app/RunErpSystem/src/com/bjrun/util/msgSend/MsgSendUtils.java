package com.bjrun.util.msgSend;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.bjrun.mobile.service.wxApp.WxAppService;
import com.bjrun.util.verify.AppVerifyUtils;
import net.sf.json.JSONObject;

/**
 * @Desc   消息推送工具类
 * @author Administrator
 * @Date   2019-05-25 13：00
 */
public class MsgSendUtils {
	
	static WebApplicationContext context = ContextLoader.getCurrentWebApplicationContext();
	static WxAppService wxAppService = (WxAppService) context.getBean("wxAppService");
	
	/**
	 * 消息推送
	 * @param contentDesc
	 * @param userIds
	 * @param agentId
	 * @param msgtype
	 * @return result 【true：发送成功 false:发送失败】
	 * @throws Exception
	 */
	public static boolean sendMessage(String contentDesc,String userIds,String agentId,String msgtype) throws Exception {
		
		boolean result = false;
		//手机APP消息推送内容填充
		JSONObject obj = new JSONObject();
		obj.element("touser",userIds);
		obj.element("msgtype",msgtype);
      	obj.element("agentid",agentId);
      	obj.element(msgtype,contentDesc);
      	
      	String wxUrlAcceccToken = wxAppService.getUserByKey("WX_URL_ACCESS_TOKEN");
      	String secretMessage = wxAppService.getUserByKey(agentId);
      	StringBuffer sbStr = new StringBuffer();
      	sbStr.append(wxUrlAcceccToken);
      	sbStr.append("&corpsecret=");
      	sbStr.append(secretMessage);
      	
      	String access_token = AppVerifyUtils.getWXAccess_token(sbStr.toString());
      	StringBuffer msgSendAPIStr = new StringBuffer();
      	String msgSendAPI = wxAppService.getUserByKey("MESSAGE_SEND_API");
      	msgSendAPIStr.append(msgSendAPI);
      	msgSendAPIStr.append("access_token=");
      	msgSendAPIStr.append(access_token);
      	
		try {
			result = getMsgSendResult(msgSendAPIStr.toString(),access_token,obj);
		} catch (RuntimeException e) {
			result = false;
			e.printStackTrace();
		}
		return result;
	}
	
	
	/**
	 * 获取消息推送结果
	 * @param connUrl
	 * @param access_token
	 * @param obj
	 * @return true:发送成功 false:发送失败
	 */
	public static  boolean getMsgSendResult(String connUrl , String access_token ,JSONObject obj){
		
		URL postMsgUrl;
		HttpURLConnection postConnection;
		DataOutputStream out = null;
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
	        postConnection.connect(); 
	        
	        //POST请求
            out = new DataOutputStream(postConnection.getOutputStream());
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
            result = true;
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		} finally{
			try {
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
}
