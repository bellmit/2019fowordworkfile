/*  1:   */ package com.bjrun.util;
/*  2:   */ 
/*  3:   */ import java.io.PrintWriter;
/*  4:   */ import java.text.SimpleDateFormat;
/*  5:   */ import java.util.Date;
/*  6:   */ import javax.servlet.http.HttpServletResponse;
/*  7:   */ import net.sf.json.JSONObject;
/*  8:   */ import net.sf.json.JsonConfig;
/*  9:   */ import net.sf.json.processors.JsonValueProcessor;
/* 10:   */ 
/* 11:   */ public class MobileUtil
/* 12:   */ {
/* 13:21 */   public static JsonConfig jsonConfig = new JsonConfig();
/* 14:   */   
/* 15:   */   static
/* 16:   */   {
/* 17:24 */     jsonConfig.registerJsonValueProcessor(Date.class, new JsonValueProcessor()
/* 18:   */     {
/* 19:25 */       private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
/* 20:   */       
/* 21:   */       public Object processArrayValue(Object arg0, JsonConfig arg1)
/* 22:   */       {
/* 23:27 */         return null;
/* 24:   */       }
/* 25:   */       
/* 26:   */       public Object processObjectValue(String arg0, Object arg1, JsonConfig arg2)
/* 27:   */       {
/* 28:32 */         return arg1 == null ? "" : this.sdf.format(arg1);
/* 29:   */       }
/* 30:   */     });
/* 31:   */   }
/* 32:   */   
/* 33:   */   public static void sendMessageToApp(int type, String message, HttpServletResponse response)
/* 34:   */     throws Exception
/* 35:   */   {
/* 36:44 */     JSONObject rs = new JSONObject();
/* 37:   */     
/* 38:46 */     String title = "";
/* 39:47 */     if (type == 1) {
/* 40:48 */       title = "提醒";
/* 41:   */     }
/* 42:49 */     if (type == 2) {
/* 43:50 */       title = "警告";
/* 44:   */     }
/* 45:52 */     rs.put("title", title);
/* 46:53 */     rs.put("type", Integer.valueOf(type));
/* 47:54 */     rs.put("message", message);
/* 48:55 */     response.getWriter().write("getWorkList(" + rs.toString() + ")");
/* 49:   */   }
/* 50:   */ }


/* Location:           C:\Users\Jack\Desktop\classes\
 * Qualified Name:     com.bjrun.util.MobileUtil
 * JD-Core Version:    0.7.0.1
 */