/*  1:   */ package com.bjrun.util.timer;
/*  2:   */ 
/*  3:   */ import cn.com.img.service.AllFileService;
/*  4:   */ import java.util.TimerTask;
/*  5:   */ import javax.servlet.ServletContext;
/*  6:   */ import org.springframework.web.context.WebApplicationContext;
/*  7:   */ import org.springframework.web.context.support.WebApplicationContextUtils;
/*  8:   */ 
/*  9:   */ public class CreateFileTask
/* 10:   */   extends TimerTask
/* 11:   */ {
/* 12:   */   private WebApplicationContext applicationContext;
/* 13:   */   private AllFileService allFileService;
/* 14:   */   
/* 15:   */   public AllFileService getAllFileService()
/* 16:   */   {
/* 17:21 */     return this.allFileService;
/* 18:   */   }
/* 19:   */   
/* 20:   */   public void setAllFileService(AllFileService allFileService)
/* 21:   */   {
/* 22:25 */     this.allFileService = allFileService;
/* 23:   */   }
/* 24:   */   
/* 25:34 */   private ServletContext context = null;
/* 26:   */   
/* 27:   */   public CreateFileTask() {}
/* 28:   */   
/* 29:   */   public CreateFileTask(ServletContext context)
/* 30:   */   {
/* 31:37 */     this.context = context;
/* 32:   */     
/* 33:39 */     this.applicationContext = WebApplicationContextUtils.getRequiredWebApplicationContext(context);
/* 34:   */   }
/* 35:   */   
/* 36:   */   public void run()
/* 37:   */   {
/* 38:44 */     this.allFileService = ((AllFileService)this.applicationContext.getBean("allFileService"));
/* 39:   */     
/* 40:46 */     this.allFileService.saveAllfile();
/* 41:   */   }
/* 42:   */ }


/* Location:           C:\Users\Jack\Desktop\classes\
 * Qualified Name:     com.bjrun.util.timer.CreateFileTask
 * JD-Core Version:    0.7.0.1
 */