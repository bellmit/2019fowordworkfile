package com.bjrun.mobile.action.user;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletInputStream;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import cn.com.img.service.AllFileService;

import com.bjrun.base.BaseAction;
import com.bjrun.clientQuestion.entity.AppMsdLog;
import com.bjrun.mobile.entity.autoPunch.AutoPunchLog;
import com.bjrun.mobile.entity.sign.SignInfo;
import com.bjrun.mobile.entity.user.User;
import com.bjrun.mobile.entity.wxApp.WxAppInfo;
import com.bjrun.mobile.service.sign.SignService;
import com.bjrun.mobile.service.user.UserService;
import com.bjrun.mobile.service.wxApp.WxAppService;
import com.bjrun.util.DateUtil;
import com.bjrun.util.MobileUtil;
/**
 * DES : 手机打卡代码更新V1.0
 * DATE: 2019-03-07
 * @author Administrator
 *
 */
public class UserManagerAction extends BaseAction{
  private static final long serialVersionUID = -877232666472178596L;
  private static Logger logger = Logger.getLogger(UserManagerAction.class);
  private WxAppService wxAppService;
  private UserService userService;
  private SignService signService;
  private AllFileService allFileService;
  private SignInfo signInfo;
  private String result;
  
  public WxAppService getWxAppService() {
	return wxAppService;
}

public void setWxAppService(WxAppService wxAppService) {
	this.wxAppService = wxAppService;
}

public UserService getUserService(){
    return this.userService;
  }
  
  public void setUserService(UserService userService){
    this.userService = userService;
  }
  
  public SignService getSignService(){
    return this.signService;
  }
  
  public void setSignService(SignService signService){
    this.signService = signService;
  }
  
  public SignInfo getSignInfo(){
    return this.signInfo;
  }
  
  public void setSignInfo(SignInfo signInfo){
    this.signInfo = signInfo;
  }
  
  public String getResult(){
    return this.result;
  }
  
  public void setResult(String result){
    this.result = result;
  }
  
  public String userLogin(){
    JSONObject json = new JSONObject();
    User loginUser = null;
    try{
      boolean fromMobile = "true".equals(this.request.getParameter("fromAndroid"));
      boolean fromRunApp = "true".equals(this.request.getParameter("fromRunApp"));
      if (fromMobile){
        String userName = this.request.getParameter("name");
        String passWord = this.request.getParameter("password");
        loginUser = this.userService.userLogin(userName, passWord);
        if (loginUser != null){
          this.request.getSession().setAttribute("SESSION_USER", loginUser);
          json.put("resultType", "login");
          json.put("userName", userName);
          json.put("msg", userName + "，欢迎回来!");
        }else{
          loginUser = this.userService.getUserByUserName(userName);
          json.put("userName", userName);
          json.put("resultType", "");
          if (loginUser == null) {
            json.put("msg", "用户“" + userName + "”不存在，请联系管理员!");
          } else {
            json.put("msg", "用户名或密码错误!");
          }
        }
      }else if (fromRunApp){
    	  /**
    	   * 考虑到代码的兼容性，不再tomcat中设置字符集，改为中文参数转码
    	   */
        String userName = new String(this.request.getParameter("name").getBytes("iso-8859-1"), "utf-8");
        String mUserId = this.request.getParameter("mUserId");

        loginUser = this.userService.userLoginApp(userName);
        if (loginUser != null){
          this.request.getSession().setAttribute("SESSION_USER", loginUser);
          json.put("resultType", "login");
          json.put("userName", userName);
          json.put("msg", userName + "，欢迎回来!");
        }else{
          loginUser = this.userService.getUserByUserName(userName); 
          json.put("userName", userName);
          json.put("resultType", "");
          if (loginUser == null) {
            json.put("msg", "用户“" + userName + "”不存在，请联系管理员!");
          } else {
            json.put("msg", "用户名或密码错误!");
          }
        }
      }
    }catch (Exception e){
      json.put("msg", "登录出错，请联系  管理员。");
      e.printStackTrace();
    }
    this.result = json.toString();
    return "success";
  }
  
  /**
   * 密码修改功能
   * @return
   */
  public String updateUserPassWord(){
    JSONObject json = new JSONObject();
    try{
      boolean fromMobile = "true".equals(this.request.getParameter("fromAndroid"));
      if (fromMobile){
        String userName = getLoginUser().getUserName();
        String oldPwd = this.request.getParameter("oldPwd");
        String newPwd = this.request.getParameter("newPwd");
        User updateUserPwd = this.userService.userLogin(userName, oldPwd);
        if (updateUserPwd != null){
          updateUserPwd.setPassWord(newPwd);  
          json.put("pwdValiFlag", "true");
          json.put("msg", "密码验证成功！");
          this.userService.saveUserInfo(updateUserPwd);
          json.put("msg", "密码修改成功！");
        }else{
          json.put("pwdValiFlag", "false");
          json.put("msg", "旧密码验证错误！");
        }
      }
    }catch (Exception e){
      json.put("msg", "密码修改出错，请联系管理员。");
      e.printStackTrace();
    }
    this.result = json.toString();
    return "success";
  }
  
  /**
   * 查询考勤打卡记录
   * @return
   * @throws Exception
   */
  public String querySignInfo()throws Exception{
    Date date = new Date();
    JSONObject json = new JSONObject();
    User loginUser = getLoginUser();
    boolean fromWXApp = "true".equals(this.request.getParameter("fromWXApp"));
    String userName = "";
//    if(fromWXApp){
//    	 userName = new String(this.request.getParameter("userName"));
//    }else{
    	 userName = new String(this.request.getParameter("userName").getBytes("iso-8859-1"), "utf-8");
//    }
    if ((!userName.isEmpty()) && (loginUser == null)) {
    	loginUser = this.userService.getUserByUserName(userName);
    }
    if (loginUser != null)
    {
      this.signInfo = this.signService.getSignInfoByUserNameAndDate(loginUser.getUserName(), DateUtil.format(date, "yyyy-MM-dd"));
      if (this.signInfo == null) {
        this.signInfo = this.signService.initSignInfoForUserAndDate(loginUser, date);
      }
      JsonConfig jsonConfig = MobileUtil.jsonConfig;
      json.put("signInfo", JSONObject.fromObject(this.signInfo, jsonConfig));
      json.put("userName", this.signInfo.getUserName());
      json.put("msg", "");
      this.result = json.toString();
    }else{
      json.put("msg", "您还没有登录，请登录！");
      this.result = json.toString();
    }
    return "success";
  }
  
  /**
   * 更新考勤打卡记录
   * @return
   * @throws Exception
   */
  public String userSign()throws Exception{
    String msg = "";
    JSONObject json = new JSONObject();
    User loginUser = getLoginUser();
    boolean fromRunApp = "true".equals(this.request.getParameter("fromRunApp"));
    boolean fromWXApp = "true".equals(this.request.getParameter("fromWXApp"));
    String loginUserName = "";
    String signType = "";
    String longitude = "";
    String latitude = "";
    String address = "";
    String deviceUuid = "";
    String osType = "";
    String province = "";
    String city = "";
    String district = "";
    String street = "";
    String streetNumber = "";
    System.out.println("111");
    int a=1/0;
    if (fromRunApp){
      String userName = this.request.getParameter("userName");
      if ((!"".equals(userName)) && (userName != null)) {
        userName = new String(userName.getBytes("iso-8859-1"), "utf-8");
      }
      if ((!"".equals(userName)) && (userName != null) && (loginUser == null)) {
        loginUser = this.userService.getUserByUserName(userName);
      }
      loginUserName = this.request.getParameter("loginUserName");
      if ((!"".equals(loginUserName)) && (loginUserName != null)) {
        loginUserName = new String(loginUserName.getBytes("iso-8859-1"), "utf-8");
      }
      signType = this.request.getParameter("signType");
      if ((!"".equals(signType)) && (signType != null)) {
        signType = new String(signType.getBytes("iso-8859-1"), "utf-8");
      }
      longitude = this.request.getParameter("longitude");
      if ((!"".equals(longitude)) && (longitude != null)) {
        longitude = new String(longitude.getBytes("iso-8859-1"), "utf-8");
      }
      latitude = this.request.getParameter("latitude");
      if ((!"".equals(latitude)) && (latitude != null)) {
        latitude = new String(latitude.getBytes("iso-8859-1"), "utf-8");
      }
      address = this.request.getParameter("address");
      if ((!"".equals(address)) && (address != null)) {
        address = new String(address.getBytes("iso-8859-1"), "utf-8");
      }
      deviceUuid = this.request.getParameter("deviceUuid");
      if ((!"".equals(deviceUuid)) && (deviceUuid != null)) {
        deviceUuid = new String(deviceUuid.getBytes("iso-8859-1"), "utf-8");
      }
      osType = this.request.getParameter("osType");
      if ((!"".equals(osType)) && (osType != null)) {
        osType = new String(osType.getBytes("iso-8859-1"), "utf-8");
      }
      province = this.request.getParameter("province");
      if ((!"".equals(province)) && (province != null)) {
        province = new String(province.getBytes("iso-8859-1"), "utf-8");
      }
      city = this.request.getParameter("city");
      if ((!"".equals(city)) && (city != null)) {
        city = new String(city.getBytes("iso-8859-1"), "utf-8");
      }
      district = this.request.getParameter("district");
      if ((!"".equals(district)) && (district != null)) {
        district = new String(district.getBytes("iso-8859-1"), "utf-8");
      }
      street = this.request.getParameter("street");
      if ((!"".equals(street)) && (street != null)) {
        street = new String(street.getBytes("iso-8859-1"), "utf-8");
      }
      streetNumber = this.request.getParameter("streetNumber");
      if ((!"".equals(streetNumber)) && (streetNumber != null)) {
        streetNumber = new String(streetNumber.getBytes("iso-8859-1"), "utf-8");
      }
    }else if(fromWXApp){
    	
    	String userName = this.request.getParameter("userName");
        
        if ((!"".equals(userName)) && (userName != null) && (loginUser == null)) {
          loginUser = this.userService.getUserByUserName(userName);
        }
	      loginUserName = this.request.getParameter("loginUserName");
	      signType = this.request.getParameter("signType");
	      longitude = this.request.getParameter("longitude");
	      latitude = this.request.getParameter("latitude");
	      address = this.request.getParameter("address");
	      deviceUuid = this.request.getParameter("deviceUuid");
	      osType = this.request.getParameter("osType");
	      province = this.request.getParameter("province");
	      city = this.request.getParameter("city");
	      district = this.request.getParameter("district");
	      street = this.request.getParameter("street");
	      streetNumber = this.request.getParameter("streetNumber");
    	
    	
    }else{
      loginUserName = this.request.getParameter("loginUserName");
      
      signType = this.request.getParameter("signType");
      longitude = this.request.getParameter("longitude");
      latitude = this.request.getParameter("latitude");
      address = this.request.getParameter("address");
      deviceUuid = this.request.getParameter("deviceUuid");
      osType = this.request.getParameter("osType");
      province = this.request.getParameter("province");
      city = this.request.getParameter("city");
      district = this.request.getParameter("district");
      street = this.request.getParameter("street");
      streetNumber = this.request.getParameter("streetNumber");
    }
    Date signTime = new Date();

    String status = "已打卡";
    if (loginUser != null){
      if ((loginUserName != null) && (!loginUserName.equals(loginUser.getUserName()))){
        logger.error("当前登录人（" + loginUserName + "）与Session登录人（" + loginUser.getUserName() + "）不一致！");
        loginUser = this.userService.getUserByUserName(loginUserName);
        if (loginUser == null){
          json.put("msg", "您的账号信息异常，请重新登录！");
          this.result = json.toString();
          return "success";
        }
      }
      if ((longitude == null) || (longitude == "") || ("0".equals(longitude))){
        json.put("msg", "本次打卡未正确获取经纬度，请重试！");
        this.result = json.toString();
        return "success";
      }
      if ((latitude == null) || (latitude == "") || ("0".equals(latitude))){
        json.put("msg", "本次打卡未正确获取经纬度，请重试！");
        this.result = json.toString();
        return "success";
      }
      if ((address == null) || (address == "")){
        json.put("msg", "本次打卡未正确获取地理位置，请重试！");
        this.result = json.toString();
        return "success";
      }
      this.signInfo = this.signService.getSignInfoByUserNameAndDate(loginUser.getUserName(), DateUtil.format(signTime, "yyyy-MM-dd"));
      if (this.signInfo == null) {
        this.signInfo = this.signService.initSignInfoForUserAndDate(loginUser, signTime);
      }
      if ("m-sign".equals(signType)){
        this.signInfo.setMsTime(signTime);
        this.signInfo.setMsLongitude(longitude);
        this.signInfo.setMsLatitude(latitude);
        this.signInfo.setMsAddress(address);
        this.signInfo.setMsStatus(status);
        this.signInfo.setMsdeviceUuid(deviceUuid);
        this.signInfo.setMsosType(osType);
        msg = "上午签到成功！";
      }else if ("m-sign-out".equals(signType)){
        this.signInfo.setMsoTime(signTime);
        this.signInfo.setMsoLongitude(longitude);
        this.signInfo.setMsoLatitude(latitude);
        this.signInfo.setMsoAddress(address);
        this.signInfo.setMsoStatus(status);
        this.signInfo.setMsodeviceUuid(deviceUuid);
        this.signInfo.setMsoosType(osType);
        msg = "上午签退成功！";
      }else if ("a-sign".equals(signType)){
        this.signInfo.setAsTime(signTime);
        this.signInfo.setAsLongitude(longitude);
        this.signInfo.setAsLatitude(latitude);
        this.signInfo.setAsAddress(address);
        this.signInfo.setAsStatus(status);
        this.signInfo.setAsdeviceUuid(deviceUuid);
        this.signInfo.setAsosType(osType);
        msg = "下午签到成功！";
      }else if ("a-sign-out".equals(signType)){
        this.signInfo.setAsoTime(signTime);
        this.signInfo.setAsoLongitude(longitude);
        this.signInfo.setAsoLatitude(latitude);
        this.signInfo.setAsoAddress(address);
        this.signInfo.setAsoStatus(status);
        this.signInfo.setAsodeviceUuid(deviceUuid);
        this.signInfo.setAsoosType(osType);
        msg = "下午签退成功！";
      }
      this.signService.saveOrUpdateSignInfo(this.signInfo);
      
      json.put("userName", this.signInfo.getUserName());
      json.put("msg", msg);
      
      JsonConfig jsonConfig = MobileUtil.jsonConfig;
      json.put("signInfo", JSONObject.fromObject(this.signInfo, jsonConfig));
      json.put("userName", this.signInfo.getUserName());
      
      this.result = json.toString();
    }else{
      json.put("msg", "您还没有登录，请登录！");
      this.result = json.toString();
    }
    return "success";
  }
  
  public void handAllFile(){
    String date = this.request.getParameter("date");
    this.allFileService.handAllFile(date);
  }
  
  public AllFileService getAllFileService(){
    return this.allFileService;
  }
  
  public void setAllFileService(AllFileService allFileService){
    this.allFileService = allFileService;
  }
  
  
  /**
   * 前端页面查询政务微信用户信息
   * userName:用户名
   * WXUserId:用户ID
   * mobile:手机号
   * @return
   */
  public String queryWXUserInfo() throws Exception{
	  
	  	String wxAppSecret = "";
	  	String wxUrlAccessToken = "";
	  	JSONObject json = new JSONObject();
	    //获取前端页面传送的 code
	    String code = request.getParameter("code");
	 	//获取前端页面传送的 AppId
	    String appId = request.getParameter("AppId");
	    String WX_URL = "";
	    StringBuffer sb = new StringBuffer();
	    
	    wxUrlAccessToken = wxAppService.getUserByKey("WX_URL_ACCESS_TOKEN");
	    if(!"".equals(wxUrlAccessToken) && wxUrlAccessToken != null){
	    	sb.append(wxUrlAccessToken);
	    }
		sb.append("&corpsecret=");
		if(!"".equals(appId) && appId != null){
			wxAppSecret = wxAppService.getUserByKey(appId);
		}
		if(!"".equals(wxAppSecret) && wxAppSecret != null){
			WX_URL = wxAppSecret;
		}
		sb.append(WX_URL);
		 //获取 access_token
		String access_token = "";
		//从数据库获取access_token及access_token的有效期
		WxAppInfo wi = signService.getWxAppInfoByKey("access_token",appId);
		if(wi != null){//判断数据库中access_token是否存在并且没过期
			Date expiredDate = wi.getExpired_date();
			if(expiredDate.compareTo(new Date())>0){
				access_token = wi.getAppValue();
			}else{
				access_token = getWXAccess_token(sb.toString());
				//删除已过期token并插入新生成的token
				WxAppInfo wxAppInfo = new WxAppInfo();
				wxAppInfo.setAppKey("access_token");
				wxAppInfo.setAppValue(access_token);
				wxAppInfo.setAppId(appId);
				wxAppInfo.setExpired_date(DateUtil.getExpiredDate(1000*7000));//
				wxAppInfo.setCreate_date(new Date());
				
				if(access_token != null && !"".equals(access_token)){
					signService.saveOrUpdateWxAppInfo(wxAppInfo);
				}
			}
		}else{//数据库中access_token不存在或者存在但是已经过期
			access_token = getWXAccess_token(sb.toString());
			//插入新生成的token
			WxAppInfo wxAppInfo = new WxAppInfo();
			wxAppInfo.setAppKey("access_token");
			wxAppInfo.setAppValue(access_token);
			wxAppInfo.setAppId(appId);
			wxAppInfo.setExpired_date(DateUtil.getExpiredDate(1000*7000));
			wxAppInfo.setCreate_date(new Date());
			if(access_token != null && !"".equals(access_token)){
				signService.saveOrUpdateWxAppInfo(wxAppInfo);
			}
		}
		
		String wxUrlGetUserId = wxAppService.getUserByKey("WX_URL_GET_USER_ID");
		Map<String,String> wxUserDetailsInfo = getWXUserDetailsInfo(wxUrlGetUserId,code,access_token);
		String wXUserId = "";
		if(wxUserDetailsInfo.containsKey("wxUserId")){
			wXUserId = wxUserDetailsInfo.get("wxUserId");
		}
		
		if(!"".equals(wXUserId) && wXUserId != null){
			User user = signService.getUserByWxUserId(wXUserId);
			if(user!=null){
				json.put("userName", user.getUserName());
				json.put("userId", user.getId());
				json.put("wXUserId", wXUserId);
				if(wxUserDetailsInfo.containsKey("gender")){
					json.put("gender", wxUserDetailsInfo.get("gender"));
				}
				if(wxUserDetailsInfo.containsKey("departmentId")){
					json.put("departmentId", wxUserDetailsInfo.get("departmentId"));
				}
				
				if(wxUserDetailsInfo.containsKey("departmentName")){
					json.put("departName", wxUserDetailsInfo.get("departmentName"));
				}
				if(wxUserDetailsInfo.containsKey("position")){
					json.put("position", wxUserDetailsInfo.get("position"));
				}
				if(wxUserDetailsInfo.containsKey("mobile")){
					json.put("mobile", wxUserDetailsInfo.get("mobile"));
				}
				
				if(wxUserDetailsInfo.containsKey("email")){
					json.put("email", wxUserDetailsInfo.get("email"));
				}
				json.put("auto_punch", user.getAuto_punch());
				json.put("msg", "success");
			}
		}else{
			System.out.println("------------1111111------33333-----");
			json.put("wXUserId", "");
			json.put("userName", "");
			json.put("gender", "");
			json.put("departmentId", "");
			json.put("departName", "");
			json.put("position", "");
			json.put("mobile", "");
			json.put("email", "");
			json.put("auto_punch", "0");
			json.put("msg", "fail");
		}	
		System.out.println("------------json.toString()-----------"+json.toString());
		this.result = json.toString();
	    return "success";
	}
  
  /**
   * 根据请求路径获取 access_token 凭证
   * @param connUrl
   * @return
   */
  public String getWXAccess_token(String connUrl){
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
  
  /**
   * 根据code和access_token获取User_ticket
   * @param url_get_user_id
   * @param code
   * @param access_token
   * @return
   */
  public Map<String,String> getWXUserDetailsInfo(String urlGetUserId , String code,String access_token){
		String wxUserId= "";
		String user_ticket ="";
		URL url;
		HttpURLConnection postConnection;
		InputStream inputStream = null;
		Map<String,String> wxUserdetailsInfo = new HashMap<String,String>();
		try {
		    url = new URL(urlGetUserId+"?"+"access_token="+access_token+"&"+"code="+code);
		    postConnection = (HttpURLConnection) url.openConnection();
		    postConnection.setRequestMethod("GET");
		    postConnection.setDoOutput(true);
		    postConnection.setDoInput(true);
			postConnection.connect();
			//获取返回的字符
		    inputStream = postConnection.getInputStream();
			int size =inputStream.available();
			byte[] bs =new byte[size];
			inputStream.read(bs);
			String message=new String(bs,"UTF-8");
			JSONObject jsonObject = JSONObject.fromObject(message);
			//获取access_token
			 wxUserId = jsonObject.getString("UserId");
			 user_ticket = jsonObject.getString("user_ticket");
			 
			 wxUserdetailsInfo = getWXUserDetailInfo(access_token,user_ticket);
			 wxUserdetailsInfo.put("wxUserId", wxUserId);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				inputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return wxUserdetailsInfo;
	}
  
  /**
   * 根据access_token、user_ticket 获取userInfo
   * @param access_token
   * @param user_ticket
   * @return userInfo
   */
  public Map<String,String> getWXUserDetailInfo(String access_token,String user_ticket){
	  
	  	Map<String,String> wXUserDetailInfoMap = new HashMap<String,String>();
	  	URL url;
		HttpURLConnection postConnection;
		InputStream inputStream = null;
		String wxUrlGetUserDetailInfo = wxAppService.getUserByKey("WX_URL_GETUSER_DETAIL_INFO");
		try {
		    url = new URL(wxUrlGetUserDetailInfo+"?"+"access_token="+access_token);
		    postConnection = (HttpURLConnection) url.openConnection();
		    postConnection.setRequestMethod("POST");
		    postConnection.setDoOutput(true);
		    postConnection.setDoInput(true);
		    postConnection.setRequestProperty("Content-Type","application/json");
			postConnection.connect();
			
			//设置请求包体
			JSONObject obj = new JSONObject();
			obj.element("user_ticket",user_ticket);
			//POST请求
            DataOutputStream out = new DataOutputStream(postConnection.getOutputStream());
            out.write(obj.toString().getBytes("UTF-8"));
            out.flush();
            out.close();
			//获取返回的字符
			inputStream = postConnection.getInputStream();
			int size =inputStream.available();
			byte[] bs =new byte[size];
			inputStream.read(bs);
			
			String message=new String(bs,"UTF-8");
			JSONObject jsonObject = JSONObject.fromObject(message);
		     
		     wXUserDetailInfoMap.put("userid", jsonObject.getString("userid"));//微信ID
		     wXUserDetailInfoMap.put("name", jsonObject.getString("name"));//姓名
		     wXUserDetailInfoMap.put("position", jsonObject.getString("position"));//岗位
		     wXUserDetailInfoMap.put("mobile", jsonObject.getString("mobile"));//手机号
		     wXUserDetailInfoMap.put("gender", jsonObject.getString("gender"));//性别
		     wXUserDetailInfoMap.put("email", jsonObject.getString("email"));//邮箱
		     wXUserDetailInfoMap.put("departmentId", jsonObject.getString("department"));//部门ID
		     
		     //去掉部门编号返回值中的[]
		     String deptStr = jsonObject.getString("department");
		     deptStr = deptStr.substring(1,deptStr.length()-1);
		     
		     //获取部门信息需要的access_token
		     String access_token_mail = getWXAccess_token_mailList();
		     Map<String,String> departmentInfo = getDepartmentInfo(access_token_mail,deptStr);
		     
		     if(departmentInfo.containsKey("departName")){
		    	 wXUserDetailInfoMap.put("departmentName", departmentInfo.get("departName"));//部门名称
		     }
		     postConnection.disconnect();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
            	inputStream.close();
            }
            catch (Exception e) {
            }
		}
	  return wXUserDetailInfoMap;
  }
  
  
  /**
   * 根据通讯录secret获取access_token
   * @return
   */
  public String getWXAccess_token_mailList(){
	  
		URL url;
		String access_token = "";
		HttpURLConnection connection;
		InputStream inputStream = null;
		String wxUrlGetAddressBookAccessBook = wxAppService.getUserByKey("WX_URL_ADDRESS_BOOK_ACCESS_TOKEN");
		
		try {
		    url = new URL(wxUrlGetAddressBookAccessBook);
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
		     access_token = jsonObject.getString("access_token");//获取access_token
			String errcode = jsonObject.getString("errcode");//获取errcode
			String errmsg = jsonObject.getString("errmsg");//获取errmsg
			System.out.println("access_token-----"+access_token);
			connection.disconnect();
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
  
  	  /**
  	   * 根据部门ID获取部门信息
  	   * @param access_token
  	   * @param id
  	   * @return
  	   */
	  public Map<String,String> getDepartmentInfo(String access_token,String id){
	  
	  	URL url;
		HttpURLConnection postConnection;
		InputStream inputStream = null;
		Map<String,String> departmentInfoMap= new HashMap<String,String>();
		String wxUrlGetDeptInfo = wxAppService.getUserByKey("WX_URL_GET_DEPART_INFO");
		
		try {
		    url = new URL(wxUrlGetDeptInfo+"access_token="+access_token+"&id="+id);
		    postConnection = (HttpURLConnection) url.openConnection();
		    postConnection.setRequestMethod("GET");
		    postConnection.setDoOutput(true);
		    postConnection.setDoInput(true);
		    postConnection.setRequestProperty("Content-Type","application/json");
			postConnection.connect();
			
			//获取返回的字符
			inputStream = postConnection.getInputStream();
			int size =inputStream.available();
			byte[] bs =new byte[size];
			inputStream.read(bs);
			String departMentMessage=new String(bs,"UTF-8");
			JSONObject jsonObject = JSONObject.fromObject(departMentMessage);
			
			if(jsonObject.get("errmsg").equals("ok") ){
				
				String  department= jsonObject.getString("department");
				department = department.substring(1, department.length() -1 );
				JSONObject jsonObjectDepart = JSONObject.fromObject(department);
				departmentInfoMap.put("departId", (String) jsonObjectDepart.get("department"));//部门ID
				departmentInfoMap.put("departName", (String) jsonObjectDepart.get("name"));//部门名称
				departmentInfoMap.put("parentid", String.valueOf(jsonObjectDepart.get("parentid")));//父级部门ID
			}
		     postConnection.disconnect();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				inputStream.close();
          }
          catch (Exception e) {
          }
		}
	  return departmentInfoMap;
}
  
  /**
   * 根据access_token 获取jsApiTicket
   * @param wxUrlJsapiTicket
   * @param access_token
   * @return
   */
  private String getWXJsApiTicket(String wxUrlJsapiTicket, String access_token) {
	  
	  	StringBuffer sb = new StringBuffer();
	  	String ticket = "";
	  	URL url;
		HttpURLConnection postConnection;
		InputStream inputStream = null;
		try {
		    url = new URL(wxUrlJsapiTicket+"?"+"access_token="+access_token);
		    postConnection = (HttpURLConnection) url.openConnection();
		    postConnection.setRequestMethod("GET");
		    postConnection.setDoOutput(true);
		    postConnection.setDoInput(true);
			postConnection.connect();
			
			//获取返回的字符
			inputStream = postConnection.getInputStream();
			int size =inputStream.available();
			byte[] bs =new byte[size];
			inputStream.read(bs);
			
			String message=new String(bs,"UTF-8");
			JSONObject jsonObject = JSONObject.fromObject(message);
			//获取access_token
			ticket = jsonObject.getString("ticket");
			 sb.append(ticket);
			System.out.println("ticket-----"+ticket);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				inputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	  return sb.toString();
  }
  
  	private static int getRandom(int count) {
  		return (int)Math.round(Math.random()*count);
  	}
 
	private static String string = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";   
	 
	private static String getRandomString(int length){
	    StringBuffer sb = new StringBuffer();
	    int len = string.length();
	    for (int i = 0; i < length; i++) {
	        sb.append(string.charAt(getRandom(len-1)));
	    }
	    return sb.toString();
	}
  
	public String getSha1() throws NoSuchAlgorithmException{
		String wxUrlAccessToken = "";
		String wxAppSecret = "";
		JSONObject json = new JSONObject();
		String nonceStr = getRandomString(16);//生成签名所需随机字符串
		Long timestamp = new Date().getTime()/1000;//生成签名所需时间戳
		String jsUrl = request.getParameter("url");
		
		//获取前端页面传送的 AppId
	    String appId = request.getParameter("AppId");
	    String WX_URL = "";
	    StringBuffer sb = new StringBuffer();
		wxUrlAccessToken = wxAppService.getUserByKey("WX_URL_ACCESS_TOKEN");
		if(!"".equals(wxUrlAccessToken) && wxUrlAccessToken != null){
			sb.append(wxUrlAccessToken);
		}
		sb.append("&corpsecret=");
		
		if(!"".equals(appId) && appId != null){
			wxAppSecret = wxAppService.getUserByKey(appId);
		}
		if(!"".equals(wxAppSecret) && wxAppSecret != null){
			WX_URL = wxAppSecret;
		}
		sb.append(WX_URL);
		
		 //获取 access_token
		String access_token = "";
		//从数据库获取access_token及access_token的有效期
		WxAppInfo wi = signService.getWxAppInfoByKey("access_token",appId);
		if(wi != null){//判断数据库中access_token是否存在并且没过期
			Date expiredDate = wi.getExpired_date();
			if(expiredDate.compareTo(new Date())>0){
				access_token = wi.getAppValue();
			}else{
				access_token = getWXAccess_token(sb.toString());
				//删除已过期token并插入新生成的token
				WxAppInfo wxAppInfo = new WxAppInfo();
				wxAppInfo.setAppKey("access_token");
				wxAppInfo.setAppValue(access_token);
				wxAppInfo.setExpired_date(DateUtil.getExpiredDate(1000*7000));//
				wxAppInfo.setCreate_date(new Date());
				wxAppInfo.setAppId(appId);
				if(access_token != null && !"".equals(access_token)){
					signService.saveOrUpdateWxAppInfo(wxAppInfo);
				}
			}
		}else{//数据库中access_token不存在或者存在但是已经过期
			access_token = getWXAccess_token(sb.toString());
			//插入新生成的token
			WxAppInfo wxAppInfo = new WxAppInfo();
			wxAppInfo.setAppKey("access_token");
			wxAppInfo.setAppValue(access_token);
			wxAppInfo.setExpired_date(DateUtil.getExpiredDate(1000*7000));
			wxAppInfo.setCreate_date(new Date());
			wxAppInfo.setAppId(appId);
			if(access_token != null && !"".equals(access_token)){
				signService.saveOrUpdateWxAppInfo(wxAppInfo);
			}
		}
		String wxUrlJsApiTicket = wxAppService.getUserByKey("WX_URL_JSAPI_TICKET");
		String jsApiTicket = getWXJsApiTicket(wxUrlJsApiTicket,access_token);
		String str = "jsapi_ticket="+jsApiTicket+"&noncestr="+nonceStr+"&timestamp="+timestamp+"&url="+jsUrl; 
		//SHA-1加密
		MessageDigest instance = MessageDigest.getInstance("SHA-1");
		instance.update(str.getBytes());
		byte[] digest = instance.digest();
		StringBuffer hexstr = new StringBuffer();
		String shaHex = "";
		for (int i = 0; i < digest.length; i++) {
			shaHex = Integer.toHexString(digest[i] & 0xFF);
			if (shaHex.length() < 2) {
				hexstr.append(0);
			}
			hexstr.append(shaHex);
		}
		json.put("signature", hexstr.toString());
		json.put("timestamp", timestamp);
		json.put("nonceStr", nonceStr);
		json.put("jsUrl", jsUrl);
		this.result = json.toString();
		return "success";
    }
	
	 /**
	   * 自动打卡功能设置
	   * @return
	   */
	  public String updateAutoPunch(){
		  
		  JSONObject json = new JSONObject();
		  String userName = request.getParameter("userName");
		  String autoPunchState = request.getParameter("autoPunchState");
		  User loginUser;
		  if(userName != null && !"".equals(userName) && autoPunchState != null && !"".equals(autoPunchState)){
			  loginUser = this.userService.getUserByUserName(userName);
			  loginUser.setAuto_punch(autoPunchState);
			  userService.saveUserInfoAuto(loginUser);
			  
			  AutoPunchLog log = new AutoPunchLog();
			  log.setRun_id(loginUser.getRunId());
			  log.setUser_name(loginUser.getUserName());
			  log.setDescript("自动打卡状态更新为"+loginUser.getAuto_punch());
			  log.setUpdate_time(new Date());
			  userService.saveOrUpdateAutoPunchLog(log);
			  
			  json.put("stateValiFlag", "true");
	          json.put("msg", "auto_punch success!");
		  }else{
			  json.put("stateValiFlag", "false");
	          json.put("msg", "auto_punch failed!");
		  }
		  this.result = json.toString();
		  return "success";
	  }
	   
	  public String loginCheck()throws Exception{
		    Date date = new Date();
		    JSONObject json = new JSONObject();
		    InputStream inputStream = null;
//		    boolean fromWXApp = "true".equals(this.request.getParameter("fromWXApp"));
		    String userName = request.getParameter("userName");
		    String wxUserId = request.getParameter("wxUserId");
//		    String wxUserId = "wanglin";
			StringBuffer sb = new StringBuffer();
		  	URL url;
			HttpURLConnection postConnection;
			String oldRunUrl = wxAppService.getUserByKey("OLD_RUN_URL");
			
			try {
			    url = new URL(oldRunUrl+"fromYJTApp=true&name="+URLEncoder.encode(userName, "UTF-8")+"&wxUserId="+wxUserId);
			    postConnection = (HttpURLConnection) url.openConnection();
			    postConnection.setRequestMethod("POST");
			    postConnection.setDoOutput(true);
			    postConnection.setDoInput(true);
			    postConnection.setRequestProperty("Content-Type","application/json");
				postConnection.connect();
				//获取返回的字符
				inputStream = postConnection.getInputStream();
				int size =inputStream.available();
				byte[] bs =new byte[size];
				inputStream.read(bs);
				String message=new String(bs,"GBK");
				 System.out.println("-------------------------"+message);
				 if(message!=null && message!="" && message.length()>14){
						message=message.substring(14,message.length());
					}
				JSONObject jobj= JSONObject.fromObject(message);
				if(message.indexOf("欢迎回来")!= -1){
					json.put("flag", "success");
				}
				json.put("loginName", jobj.get("userName"));
				//获取access_token
				postConnection.disconnect();
			} catch (Exception e) {
				e.printStackTrace();
				json.put("flag", "fail");
			}finally {
	            try {
	            	inputStream.close();
	            }
	            catch (Exception e) {
	            }
	        }
			this.result = json.toString();
		    return "success";
		  }
	  
}
