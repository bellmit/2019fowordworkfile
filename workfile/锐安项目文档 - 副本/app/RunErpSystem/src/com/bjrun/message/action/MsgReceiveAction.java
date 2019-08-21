package com.bjrun.message.action;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.StringReader;
import javax.servlet.ServletInputStream;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import com.bjrun.base.BaseAction;
import com.bjrun.mobile.entity.user.User;
import com.bjrun.mobile.service.user.UserService;
import com.bjrun.mobile.service.wxApp.WxAppService;
import com.bjrun.util.HttpRobot;
import com.bjrun.util.msgReceive.WXBizMsgCrypt;
import com.bjrun.util.msgSend.MsgSendUtils;
/**
 * @Desc   API接口接收消息
 * @author Administrator
 * @Date   2019-05-25 13：00
 */
public class MsgReceiveAction  extends BaseAction{
	 
	private UserService userService;
	private WxAppService wxAppService;
	
	public WxAppService getWxAppService() {
		return wxAppService;
	}
	public void setWxAppService(WxAppService wxAppService) {
		this.wxAppService = wxAppService;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	/**
	   * 消息接收
	   * @throws Exception
	   */
	  public void msgReceive() throws Exception{
		  
		  String Token = "kGXbauikDP";
		  String EncodingAESKey = "rvVKdrT6o8l6GPedziYD2uqVhPHGsuxrxROSPkr3Btw";
		  String CorpID = "wla377739e7a";
		  
		  WXBizMsgCrypt wxcpt = new WXBizMsgCrypt(Token,EncodingAESKey, CorpID);
		  String method = ServletActionContext.getRequest().getMethod();
		  String msg_signature = request.getParameter("msg_signature");
		  String timestamp = request.getParameter("timestamp");
		  String nonce = request.getParameter("nonce");
		  String echostr = request.getParameter("echostr");
		  
		  if(method.equals("GET")){
			  String sEchoStr; //需要返回的明文
			  sEchoStr = wxcpt.VerifyURL(msg_signature, timestamp,nonce, echostr);
			  System.out.println("verifyurl echostr: " + sEchoStr);
			  PrintWriter out = response.getWriter();
			  out.print(sEchoStr);
			  out.close();
		  }else{
			  BufferedReader br = new BufferedReader(new InputStreamReader((ServletInputStream)request.getInputStream())); 
			  String line = null; 
			  StringBuilder sb = new StringBuilder(); 
			  while((line = br.readLine())!=null){ 
			  sb.append(line); 
			  String sReqData = sb.toString();
			  String sMsg = wxcpt.DecryptMsg(msg_signature, timestamp, nonce, sReqData);
			  System.out.println("sReqData：" + sMsg);
				// TODO: 解析出明文xml标签的内容进行处理
				// For example:
				DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
				DocumentBuilder db = dbf.newDocumentBuilder();
				StringReader sr = new StringReader(sMsg);
				InputSource is = new InputSource(sr);
				Document document = db.parse(is);

				Element root = document.getDocumentElement();
				NodeList nodelist2 = root.getElementsByTagName("FromUserName");
				String FromUserName = nodelist2.item(0).getTextContent();
				NodeList nodelist3 = root.getElementsByTagName("MsgType");
				String MsgType = nodelist3.item(0).getTextContent();
				NodeList nodelist4 = root.getElementsByTagName("AgentID");
				String AgentID = nodelist4.item(0).getTextContent();
				NodeList nodelist6 = root.getElementsByTagName("CreateTime");	
				String CreateTime = nodelist6.item(0).getTextContent();
				
				User user = userService.getUserByWxUserId(FromUserName);
				String userName = user.getUserName();
				String Content = "";
				if("event".equals(MsgType)){
					NodeList nodelist7 = root.getElementsByTagName("Latitude");
					NodeList nodelist8 = root.getElementsByTagName("Longitude");
					NodeList nodelist9 = root.getElementsByTagName("Precision");
					String Latitude = nodelist7.item(0).getTextContent();
					String Longitude = nodelist8.item(0).getTextContent();
					String Precision = nodelist9.item(0).getTextContent();
					System.out.println("Latitude：" + Latitude);
					System.out.println("Longitude：" + Longitude);
					System.out.println("Precision：" + Precision);
//					Map<String, Object> resultMap = GetLocation.getLocation(Longitude,Latitude);
					
//					String address =  (String) resultMap.get("address");
//					System.out.println("==========-address=========-"+address);
//					MsgSendUtils.sendMessage("位置上报人： "+userName+"<br/>"+"当前经纬度:【"+ Longitude+" "+Latitude+"】"+"<br/>"+"当前位置：" + address,FromUserName);
				}else if("text".equals(MsgType)){
					NodeList nodelist1 = root.getElementsByTagName("Content");
					Content = nodelist1.item(0).getTextContent();
//					MsgSendUtils.sendMessage("消息发送人："+userName+"<br/>"+"消息内容：【"+ Content+"】",FromUserName);
				}
				
				if(!"".equals(Content) && Content != null){
					JSONObject jsonObject = HttpRobot.transJosn(Content); // content是文本消息
					String content = HttpRobot.postJson("http://openapi.tuling123.com/openapi/api/v2", jsonObject.toString());
					
					System.out.println("----------------js-----------------------：" + content);
//					String agentId = wxAppService.getUserByKey("BETA");
					MsgSendUtils.sendMessage("{\"content\":\""+content+"\"}",FromUserName,AgentID,"text");//"1000013"
					
				}
				
//				NodeList nodelist5 = root.getElementsByTagName("MsgId");
//				String MsgId = nodelist5.item(0).getTextContent();
//				System.out.println("Content：" + Content);
////			System.out.println("FromUserName：" + FromUserName);
//				System.out.println("MsgType：" + MsgType);
//				System.out.println("AgentID：" + AgentID);
//				System.out.println("MsgId：" + MsgId);
//				System.out.println("CreateTime：" + CreateTime);
				
//				sendMessage("Content：" + Content+"  "+"FromUserName：" + FromUserName+"  "+"MsgType：" + MsgType+"  "+"AgentID：" + AgentID,FromUserName);
		  }
		     
	  }
	  
 }
}
