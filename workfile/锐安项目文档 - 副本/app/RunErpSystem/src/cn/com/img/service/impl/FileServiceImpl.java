/*  1:   */ package cn.com.img.service.impl;
/*  2:   */ 
/*  3:   */ import cn.com.img.dao.FileDAO;
/*  4:   */ import cn.com.img.entity.File;
/*  5:   */ import cn.com.img.entity.Folder;
/*  6:   */ import cn.com.img.service.FileService;
/*  7:   */ 
/*  8:   */ public class FileServiceImpl
/*  9:   */   implements FileService
/* 10:   */ {
/* 11:   */   private FileDAO fileDAO;
/* 12:   */   
/* 13:   */   public FileDAO getFileDAO()
/* 14:   */   {
/* 15:15 */     return this.fileDAO;
/* 16:   */   }
/* 17:   */   
/* 18:   */   public void setFileDAO(FileDAO fileDAO)
/* 19:   */   {
/* 20:18 */     this.fileDAO = fileDAO;
/* 21:   */   }
/* 22:   */   
/* 23:   */   public String saveFolder(Folder folder)
/* 24:   */   {
/* 25:23 */     return this.fileDAO.saveFolder(folder);
/* 26:   */   }
/* 27:   */   
/* 28:   */   public void saveFile(File file)
/* 29:   */   {
/* 30:26 */     this.fileDAO.saveFile(file);
/* 31:   */   }
/* 32:   */   
/* 33:   */   public void addFileNumber(Folder folder)
/* 34:   */   {
/* 35:29 */     this.fileDAO.addFileNumber(folder);
/* 36:   */   }
/* 37:   */ }


/* Location:           C:\Users\Jack\Desktop\classes\
 * Qualified Name:     cn.com.img.service.impl.FileServiceImpl
 * JD-Core Version:    0.7.0.1
 */