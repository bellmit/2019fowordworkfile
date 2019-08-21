package com.fr;

import com.fr.base.FRContext;
import com.fr.fs.base.entity.User;
import com.fr.fs.base.entity.UserInfo;
import com.fr.fs.control.UserControl;
import com.fr.fs.privilege.auth.FSAuthentication;
import com.fr.fs.privilege.base.FServicePrivilegeLoader;
import com.fr.fs.privilege.entity.DaoFSAuthentication;
import com.fr.log.FRLoggerProvider;
import com.fr.privilege.session.PrivilegeInfoSessionMananger;
import java.io.IOException;
import java.io.PrintStream;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.jasig.cas.client.authentication.AttributePrincipal;
import org.jasig.cas.client.validation.Assertion;

public class FrFilter
  implements Filter
{
  public void doFilter(ServletRequest req, ServletResponse res, FilterChain filterChain)
    throws IOException, ServletException
  {
    HttpServletRequest re = (HttpServletRequest)req;
    HttpServletResponse resp = (HttpServletResponse)res;
    HttpSession session = re.getSession(true);
       
    String userpass = "";
    //Object object = re.getSession().getAttribute("_const_cas_assertion_");
    //获取用户名
    String username = "???";
    //获取登陆名
    String loginname="???";

    /*String username;
    if (object != null)
    {
      Assertion assertion = (Assertion)object;
      username = assertion.getPrincipal().getName();
    }
    else
    {
      username = (String)session.getAttribute("edu.yale.its.tp.cas.client.filter.user");
      if ((username == null) || ("".equals(username))) {
        resp.sendRedirect("http://www.baidu.com");
      }
    }*/
    try
    {
      User user1 = UserControl.getInstance().getByUserName(username);
      if ((user1 != null) && (session.getAttribute("fr_fs_auth_key") == null))
      {
        FSAuthentication authentication = new DaoFSAuthentication(new UserInfo(user1.getId(), user1.getUsername(), user1.getPassword()));
        long userid = authentication.getUserInfo().getId();
        PrivilegeInfoSessionMananger.login(new FServicePrivilegeLoader(username, UserControl.getInstance().getAllSRoleNames(userid), UserControl.getInstance().getUserDP(userid)), session, resp);
        session.setAttribute("fr_fs_auth_key", authentication);
        UserControl.getInstance().login(userid);
        System.out.println("fr FrFilter is over with username is -" + username + "- and userpass  is -" + userpass + "-");
        FRContext.getLogger().error("fr FrFilter is over with username is ###" + username + "### and userpass  is ###" + userpass + "###");
        filterChain.doFilter(req, res);
      }
      else if (((user1 != null ? 1 : 0) & (session.getAttribute("fr_fs_auth_key") != null ? 1 : 0)) != 0)
      {
        filterChain.doFilter(req, res);
        FRContext.getLogger().error("no need");
      }
      else
      {
        // 给的插入用户的接口插入用户
        UserControl.getInstance().addUser(new User("name","password","realName"));
        //用户登陆
        FSAuthentication authentication = new DaoFSAuthentication(new UserInfo(user1.getId(), user1.getUsername(), user1.getPassword()));
        long userid = authentication.getUserInfo().getId();
        PrivilegeInfoSessionMananger.login(new FServicePrivilegeLoader(username, UserControl.getInstance().getAllSRoleNames(userid), UserControl.getInstance().getUserDP(userid)), session, resp);
        session.setAttribute("fr_fs_auth_key", authentication);
        UserControl.getInstance().login(userid);
        System.out.println("fr FrFilter is over with username is -" + username + "- and userpass  is -" + userpass + "-");
        FRContext.getLogger().error("fr FrFilter is over with username is ###" + username + "### and userpass  is ###" + userpass + "###");
        filterChain.doFilter(req, res);
      }
    }
    catch (Exception var14)
    {
      var14.printStackTrace();
    }
  }
  
  public void init(FilterConfig filterconfig)
    throws ServletException
  {}
  
  public void destroy() {}
}
