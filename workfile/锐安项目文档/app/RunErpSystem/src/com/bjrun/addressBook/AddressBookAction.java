package com.bjrun.addressBook;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.StringReader;
import javax.servlet.ServletInputStream;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.apache.struts2.ServletActionContext;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import com.bjrun.base.BaseAction;
import com.bjrun.mobile.entity.user.User;
import com.bjrun.mobile.service.user.UserService;
import com.bjrun.util.msgReceive.WXBizMsgCrypt;
/**
 * @Desc   通讯录变更
 * @author Administrator
 * @Date   2019-05-25 13：00
 */
public class AddressBookAction extends BaseAction{

	private UserService userService;
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	/**
	   * 通讯录变更
	   * @throws Exception
	   */
	  public void addressBook() throws Exception{
		  
		  String Token = "fx7huZrzQfuCg";
		  String EncodingAESKey = "JiMoeVCMQennUbJTESJr4aNP31YeIjDyKpqWbfYkDPQ";
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
//				NodeList nodelist2 = root.getElementsByTagName("FromUserName");
//				String FromUserName = nodelist2.item(0).getTextContent();
				NodeList nodelist3 = root.getElementsByTagName("ChangeType");
				String ChangeType = nodelist3.item(0).getTextContent();
//				NodeList nodelist4 = root.getElementsByTagName("AgentID");
//				String AgentID = nodelist4.item(0).getTextContent();
//				NodeList nodelist6 = root.getElementsByTagName("CreateTime");	
//				String CreateTime = nodelist6.item(0).getTextContent();
				
//				User user = userService.getUserByWxUserId(FromUserName);
//				String userName = user.getUserName();
				if("create_user".equals(ChangeType)){//新增
					NodeList nodelist7 = root.getElementsByTagName("UserID");
					NodeList nodelist8 = root.getElementsByTagName("Name");
					String UserID = nodelist7.item(0).getTextContent();
					String Name = nodelist8.item(0).getTextContent();
					System.out.println("UserID：" + UserID);
					System.out.println("Name：" + Name);
					
					User user = new User();
					user.setUserName(Name);
					user.setWxUserId(UserID);
					user.setAuto_punch("0");
					userService.saveUserInfoAuto(user);
					
				}else{
					System.out.println("==============：");
				}
		  }
	  }
 }

}
