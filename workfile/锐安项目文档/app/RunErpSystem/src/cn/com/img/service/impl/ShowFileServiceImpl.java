/*  1:   */ package cn.com.img.service.impl;
/*  2:   */ 
/*  3:   */ import cn.com.img.dao.ShowFileDAO;
/*  4:   */ import cn.com.img.entity.File;
/*  5:   */ import cn.com.img.entity.Folder;
/*  6:   */ import cn.com.img.service.ShowFileService;
/*  7:   */ import java.util.List;
/*  8:   */ 
/*  9:   */ public class ShowFileServiceImpl
/* 10:   */   implements ShowFileService
/* 11:   */ {
/* 12:   */   private ShowFileDAO showFileDAO;
/* 13:   */   
/* 14:   */   public ShowFileDAO getShowFileDAO()
/* 15:   */   {
/* 16:15 */     return this.showFileDAO;
/* 17:   */   }
/* 18:   */   
/* 19:   */   public void setShowFileDAO(ShowFileDAO showFileDAO)
/* 20:   */   {
/* 21:19 */     this.showFileDAO = showFileDAO;
/* 22:   */   }
/* 23:   */   
/* 24:   */   public List<Folder> getFolderList(int pageNumber, int pageCount)
/* 25:   */   {
/* 26:23 */     return this.showFileDAO.getFolderList(pageNumber, pageCount);
/* 27:   */   }
/* 28:   */   
/* 29:   */   public List<File> getFileList(Folder folder, int pageNumber, int pageCount)
/* 30:   */   {
/* 31:27 */     return this.showFileDAO.getFileList(folder, pageNumber, pageCount);
/* 32:   */   }
/* 33:   */   
/* 34:   */   public Folder getFolder(String folderId)
/* 35:   */   {
/* 36:31 */     return this.showFileDAO.getFolder(folderId);
/* 37:   */   }
/* 38:   */ }


/* Location:           C:\Users\Jack\Desktop\classes\
 * Qualified Name:     cn.com.img.service.impl.ShowFileServiceImpl
 * JD-Core Version:    0.7.0.1
 */