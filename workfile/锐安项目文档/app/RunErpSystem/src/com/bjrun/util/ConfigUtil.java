/*  1:   */ package com.bjrun.util;
/*  2:   */ 
/*  3:   */ import java.io.FileNotFoundException;
/*  4:   */ import java.io.FileReader;
/*  5:   */ import java.io.IOException;
/*  6:   */ import java.util.HashMap;
/*  7:   */ import java.util.Map;
/*  8:   */ import java.util.Properties;
/*  9:   */ 
/* 10:   */ public class ConfigUtil
/* 11:   */ {
/* 12:   */   public static Map<String, String> resolveProperties()
/* 13:   */   {
/* 14:26 */     Map<String, String> map = null;
/* 15:   */     
/* 16:28 */     Properties p = new Properties();
/* 17:   */     
/* 18:30 */     FileReader fr = null;
/* 19:   */     try
/* 20:   */     {
/* 21:32 */       p.load(ConfigUtil.class.getClassLoader().getResourceAsStream("sftpConfig.properties"));
/* 22:   */       
/* 23:34 */       map = new HashMap(p);
/* 24:   */     }
/* 25:   */     catch (FileNotFoundException e)
/* 26:   */     {
/* 27:37 */       e.printStackTrace();
/* 28:43 */       if (fr != null) {
/* 29:   */         try
/* 30:   */         {
/* 31:45 */           fr.close();
/* 32:   */         }
/* 33:   */         catch (IOException e1)
/* 34:   */         {
/* 35:47 */           e1.printStackTrace();
/* 36:   */         }
/* 37:   */       }
/* 38:   */     }
/* 39:   */     catch (IOException e)
/* 40:   */     {
/* 41:39 */       e.printStackTrace();
/* 42:43 */       if (fr != null) {
/* 43:   */         try
/* 44:   */         {
/* 45:45 */           fr.close();
/* 46:   */         }
/* 47:   */         catch (IOException e1)
/* 48:   */         {
/* 49:47 */           e1.printStackTrace();
/* 50:   */         }
/* 51:   */       }
/* 52:   */     }
/* 53:   */     catch (Exception e)
/* 54:   */     {
/* 55:41 */       e.printStackTrace();
/* 56:43 */       if (fr != null) {
/* 57:   */         try
/* 58:   */         {
/* 59:45 */           fr.close();
/* 60:   */         }
/* 61:   */         catch (IOException e1)
/* 62:   */         {
/* 63:47 */           e1.printStackTrace();
/* 64:   */         }
/* 65:   */       }
/* 66:   */     }
/* 67:   */     finally
/* 68:   */     {
/* 69:43 */       if (fr != null) {
/* 70:   */         try
/* 71:   */         {
/* 72:45 */           fr.close();
/* 73:   */         }
/* 74:   */         catch (IOException e)
/* 75:   */         {
/* 76:47 */           e.printStackTrace();
/* 77:   */         }
/* 78:   */       }
/* 79:   */     }
/* 80:52 */     return map;
/* 81:   */   }
/* 82:   */ }


/* Location:           C:\Users\Jack\Desktop\classes\
 * Qualified Name:     com.bjrun.util.ConfigUtil
 * JD-Core Version:    0.7.0.1
 */