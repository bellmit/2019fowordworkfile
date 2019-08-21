/*  1:   */ package com.bjrun.util;
/*  2:   */ 
/*  3:   */ import java.io.FileNotFoundException;
/*  4:   */ import java.io.IOException;
/*  5:   */ import java.util.Properties;
/*  6:   */ 
/*  7:   */ public class Constant
/*  8:   */ {
/*  9:   */   public static String HostIP;
/* 10:   */   public static String HostUname;
/* 11:   */   public static String HostPwd;
/* 12:   */   public static String CreateXmlFilePath;
/* 13:   */   public static String FileName;
/* 14:   */   public static String MemberFileName;
/* 15:   */   public static String RecordFileName;
/* 16:   */   public static String SwkUser;
/* 17:   */   public static String SwkPwd;
/* 18:   */   
/* 19:   */   static
/* 20:   */   {
/* 21:28 */     Properties pps = new Properties();
/* 22:   */     try
/* 23:   */     {
/* 24:30 */       pps.load(Constant.class.getClassLoader().getResourceAsStream("filePath.properties"));
/* 25:31 */       CreateXmlFilePath = pps.getProperty("createXmlFilePath");
/* 26:32 */       HostIP = pps.getProperty("hostIP");
/* 27:33 */       HostUname = pps.getProperty("hostUname");
/* 28:34 */       HostPwd = pps.getProperty("hostPwd");
/* 29:35 */       FileName = pps.getProperty("fileName");
/* 30:36 */       MemberFileName = pps.getProperty("memberFileName");
/* 31:37 */       RecordFileName = pps.getProperty("recordFileName");
/* 32:38 */       SwkUser = pps.getProperty("swkUser");
/* 33:39 */       SwkPwd = pps.getProperty("swkPwd");
/* 34:   */     }
/* 35:   */     catch (FileNotFoundException e)
/* 36:   */     {
/* 37:42 */       e.printStackTrace();
/* 38:   */     }
/* 39:   */     catch (IOException e)
/* 40:   */     {
/* 41:45 */       e.printStackTrace();
/* 42:   */     }
/* 43:   */   }
/* 44:   */ }


/* Location:           C:\Users\Jack\Desktop\classes\
 * Qualified Name:     com.bjrun.util.Constant
 * JD-Core Version:    0.7.0.1
 */