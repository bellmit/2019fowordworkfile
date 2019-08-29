package com.fr;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fr.fs.base.entity.CustomRole;
import com.fr.fs.base.entity.User;
import com.fr.fs.base.entity.UserInfo;
import com.fr.fs.control.CustomRoleControl;
import com.fr.fs.control.UserControl;
import com.fr.fs.privilege.auth.FSAuthentication;
import com.fr.fs.privilege.base.FServicePrivilegeLoader;
import com.fr.fs.privilege.entity.DaoFSAuthentication;
import com.fr.privilege.session.PrivilegeInfoSessionMananger;

public class FrFilter implements Filter {
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain filterChain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) req;
		HttpServletResponse httpResponse = (HttpServletResponse) res;
		HttpSession httpSession = httpRequest.getSession(true);

		req.setCharacterEncoding("GB2312");
		//get sso flag
		String ssoFlag = httpRequest.getParameter("sso");
		System.out.println("sso==============" + ssoFlag);
		if (ssoFlag != null && "true".equals(ssoFlag)) { //如果是单点登录
			Cookie[] cookies = httpRequest.getCookies();
			String userLoginName = null;
			String userUID = null;
			String userRealName = null;
			for(Cookie cookie : cookies){
				 System.out.println("Cookie name=" + cookie.getName() + ", value=" + cookie.getValue());
	             if(cookie.getName().equals("userLoginName")){
	            	 if (cookie.getValue() != null) {
	            		 userLoginName = URLDecoder.decode(cookie.getValue(), "UTF-8");
	            	 }
	             } else if (cookie.getName().equals("userid")) {
	            	 if (cookie.getValue() != null) {
	            		 userUID = URLDecoder.decode(cookie.getValue(), "UTF-8");
	            	 }
	             } else if (cookie.getName().equals("username")) {
	            	 if (cookie.getValue() != null) {
	            		 userRealName = URLDecoder.decode(cookie.getValue(), "GBK");
	            	 }
	             }
	        }
			//get userName
			System.out.println("userLoginName==============" + userLoginName);
			//get userUID			
			System.out.println("userid==============" + userUID);
			//get userRealName
			System.out.println("userRealName==============" + userRealName);		
			//如果Loginname为空，那么就是用userId
			if (userLoginName == null) {
				userLoginName = userUID;
			}
			try {
				if (userLoginName != null && 0 < userLoginName.trim().length()) {
					User user1 = UserControl.getInstance().getByUserName(userLoginName);
					if ((user1 != null) && (httpSession.getAttribute("fr_fs_auth_key") == null)) {
						FSAuthentication authentication = new DaoFSAuthentication(
								new UserInfo(user1.getId(), user1.getUsername(), user1.getPassword()));
						long userid = authentication.getUserInfo().getId();
						PrivilegeInfoSessionMananger.login(
								new FServicePrivilegeLoader(userLoginName, UserControl.getInstance().getAllSRoleNames(userid),
										UserControl.getInstance().getUserDP(userid)), httpSession, httpResponse);
						httpSession.setAttribute("fr_fs_auth_key", authentication);
						UserControl.getInstance().login(userid);						
						System.out.println("fr FrFilter is over with username is -" + userLoginName);
						//FRContext.getLogger().error("fr FrFilter is over with username is ###" + userLoginName + "### and userpass  is ###");
						filterChain.doFilter(req, res);
					} else if (((user1 != null ? 1 : 0) & (httpSession.getAttribute("fr_fs_auth_key") != null ? 1 : 0)) != 0) {
						filterChain.doFilter(req, res);
						//FRContext.getLogger().error("no need to do the sso");
					} else {
						// 给的插入用户的接口插入用户
						User newUser = new User(userLoginName, "123456", userRealName);
						UserControl.getInstance().addUser(newUser);
						// 用户登陆
						FSAuthentication authentication = new DaoFSAuthentication(
								new UserInfo(newUser.getId(), newUser.getUsername(), newUser.getPassword()));
						long newUserid = authentication.getUserInfo().getId();
						PrivilegeInfoSessionMananger.login(
								new FServicePrivilegeLoader(
										userLoginName, UserControl.getInstance().getAllSRoleNames(newUserid),UserControl.getInstance().getUserDP(newUserid)),
										httpSession, httpResponse);
						httpSession.setAttribute("fr_fs_auth_key", authentication);
						UserControl.getInstance().login(newUserid);
						System.out.println("fr FrFilter is over with username is -"+ userLoginName );
						//FRContext.getLogger().error("fr FrFilter is over with username is ###" + userLoginName);
						CustomRole customRole =CustomRoleControl.getInstance().findByCustomRoleName("对外查看用户");
						long roleid=customRole.getId();
						long userid[]=new long[1];
						System.out.print("userid="+userid[0]+"    roleid="+roleid);
						userid[0]=newUserid;
						CustomRoleControl.getInstance().addUsers(roleid,userid);
						filterChain.doFilter(req, res);
					}					
				} else {
					filterChain.doFilter(req, res);
				}
			} catch (Exception var14) {
				var14.printStackTrace();
				filterChain.doFilter(req, res);
			}
		} else {
			//如果不是单点登录，不做任何处理
			filterChain.doFilter(req, res);
		}
	}

	public void init(FilterConfig filterconfig) throws ServletException {
	}

	public void destroy() {
	}
}
