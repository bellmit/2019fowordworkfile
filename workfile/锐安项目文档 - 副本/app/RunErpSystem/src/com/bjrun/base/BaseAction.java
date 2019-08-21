/*  1:   */ package com.bjrun.base;
/*  2:   */ 
/*  3:   */ import com.bjrun.mobile.entity.user.User;
/*  4:   */ import com.opensymphony.xwork2.ActionSupport;
/*  5:   */ import javax.servlet.http.HttpServletRequest;
/*  6:   */ import javax.servlet.http.HttpServletResponse;
/*  7:   */ import javax.servlet.http.HttpSession;
/*  8:   */ import org.apache.struts2.interceptor.ServletRequestAware;
/*  9:   */ import org.apache.struts2.interceptor.ServletResponseAware;
/* 10:   */ 
/* 11:   */ public class BaseAction
/* 12:   */   extends ActionSupport
/* 13:   */   implements ServletRequestAware, ServletResponseAware
/* 14:   */ {
/* 15:   */   private static final long serialVersionUID = -6228144576823767444L;
/* 16:   */   protected HttpServletRequest request;
/* 17:   */   protected HttpServletResponse response;
/* 18:   */   
/* 19:   */   public User getLoginUser()
/* 20:   */   {
/* 21:31 */     return (User)this.request.getSession().getAttribute("SESSION_USER");
/* 22:   */   }
/* 23:   */   
/* 24:   */   public HttpServletRequest getRequest()
/* 25:   */   {
/* 26:35 */     return this.request;
/* 27:   */   }
/* 28:   */   
/* 29:   */   public HttpServletResponse getResponse()
/* 30:   */   {
/* 31:39 */     return this.response;
/* 32:   */   }
/* 33:   */   
/* 34:   */   public void setServletRequest(HttpServletRequest request)
/* 35:   */   {
/* 36:43 */     this.request = request;
/* 37:   */   }
/* 38:   */   
/* 39:   */   public void setServletResponse(HttpServletResponse response)
/* 40:   */   {
/* 41:47 */     this.response = response;
/* 42:   */   }
/* 43:   */ }
