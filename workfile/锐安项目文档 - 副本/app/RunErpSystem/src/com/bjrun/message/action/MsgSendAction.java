package com.bjrun.message.action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Date;
import net.sf.json.JSONObject;
import com.bjrun.base.BaseAction;
import com.bjrun.message.entity.Message;
import com.bjrun.message.service.MessageService;
import com.bjrun.mobile.service.wxApp.WxAppService;
import com.bjrun.util.msgSend.MsgSendUtils;

/**
 * @Desc   消息推送对外接口
 * @author Administrator
 * @Date   2019-05-25 13：00
 */
public class MsgSendAction extends BaseAction{
	
	private WxAppService wxAppService;
	private MessageService msgService;
	private String result;
	public WxAppService getWxAppService() {
		return wxAppService;
	}
	public void setWxAppService(WxAppService wxAppService) {
		this.wxAppService = wxAppService;
	}
	
	public MessageService getMsgService() {
		return msgService;
	}
	public void setMsgService(MessageService msgService) {
		this.msgService = msgService;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	/**
	 * 消息推送公共接口【对外】
	 * @throws Exception 
	 */
	 public String msgSend() throws Exception{
		 
		// 读取请求内容
        BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream(),"UTF-8"));
        String line = null;
        StringBuilder sb = new StringBuilder();
        while((line = br.readLine())!=null){
            sb.append(line);
        }
        String reqBody = sb.toString();
        JSONObject jobj= JSONObject.fromObject(reqBody);
        String agentId = "";
        
        //获取json 参数
        String userIds = String.valueOf(jobj.get("toUserIds"));
        String msgtype = String.valueOf(jobj.get("msgType"));
        String agentIdCode = String.valueOf(jobj.get("agentIdCode"));
        String fromPlatform = String.valueOf(jobj.get("fromPlatform"));
        String module = String.valueOf(jobj.get("module"));
        
        String contentDesc = "";
        if(msgtype.equals("text")){
        	contentDesc = String.valueOf(jobj.get("text"));
        }else if(msgtype.equals("image")){
        	contentDesc = String.valueOf(jobj.get("image"));
        }else if(msgtype.equals("voice")){
        	contentDesc = String.valueOf(jobj.get("voice"));
        }else if(msgtype.equals("video")){
        	contentDesc = String.valueOf(jobj.get("video"));
        }else if(msgtype.equals("file")){
        	contentDesc = String.valueOf(jobj.get("file"));
        }else if(msgtype.equals("textcard")){
        	contentDesc = String.valueOf(jobj.get("textcard"));
        }else if(msgtype.equals("news")){
        	contentDesc = String.valueOf(jobj.get("news"));
        }
        
        //根据agentIdCode获取agentId
        if(agentIdCode != null && !"".equals(agentIdCode)){
        	agentId = wxAppService.getUserByKey(agentIdCode);
        }
		 boolean sendResult = false;
		 JSONObject json = new JSONObject();
		 if(userIds != null && !"".equals(userIds) && contentDesc != null && !"".equals(contentDesc) && agentId != null && !"".equals(agentId)){
			sendResult = MsgSendUtils.sendMessage(contentDesc,userIds,agentId,msgtype);
			//记录消息推送结果
			Message msg = new Message();
			
			if(!"".equals(agentId) && agentId != null){
				msg.setAgent_id(agentId);//APP agentId
			}
			if(!"".equals(userIds) && userIds != null){
				msg.setTo_wx_user_id(userIds);//接收人政务微信ID
			}
			if(!"".equals(contentDesc) && contentDesc != null){
				msg.setContent(contentDesc);//消息内容
			}
			if(!"".equals(msgtype) && msgtype != null){
				msg.setWx_msg_type(msgtype);//微信消息类型：
			}
			if(!"".equals(module) && module != null){
				msg.setModule(module);//功能模块
			}
			if(!"".equals(fromPlatform) && fromPlatform != null){
				msg.setFrom_platform(fromPlatform);//消息所属系统平台
			}
			if(sendResult){
				msg.setStatus(1);//消息状态：0是未发送 1：已发送
			}else{
				msg.setStatus(0);//消息状态：0是未发送 1：已发送
			}
			msg.setType("2");//消息类型：1 短信 2 消息
			msg.setCreate_time(new Date());//消息创建时间
			msgService.saveOrUpdateMessage(msg);
		 }else{
			 json.put("msg", "fail");
			 json.put("msgCode", "90002");//90002事务码代表参数为空
			 this.result = json.toString();
			 return "success";
		 }
		 
		 if(sendResult){//消息发送成功
			 json.put("msg", "success");
			 json.put("msgCode", "10001");//10001 事务码代表消息发送成功
		 }else{//消息发送失败
			 json.put("msg", "fail");
			 json.put("msgCode", "90001");//90001 事务码代表消息发送失败但参数不为空
		 }
		 
		 this.result = json.toString();
		 return "success";
	 }
}
