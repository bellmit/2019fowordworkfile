/*  1:   */ package cn.com.img.tools;
/*  2:   */ 
/*  3:   */ import cn.com.img.entity.File;
/*  4:   */ import java.text.SimpleDateFormat;
/*  5:   */ import java.util.Date;
/*  6:   */ import java.util.regex.Matcher;
/*  7:   */ import java.util.regex.Pattern;
/*  8:   */ 
/*  9:   */ public class PublicTools
/* 10:   */ {
/* 11:   */   public static String myFormat(Date date)
/* 12:   */   {
/* 13:12 */     SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
/* 14:   */     
/* 15:14 */     return sdf.format(date);
/* 16:   */   }
/* 17:   */   
/* 18:   */   public static boolean isImg(File file)
/* 19:   */   {
/* 20:19 */     Pattern p = Pattern.compile(".*\\.(jpg|JPG|Jpg|jpG|JPg|jPG|jPg|JpG|bmp|BMP|Bmp|bmP|BMp|bMP|bMp|BmP)");
/* 21:20 */     Matcher m = p.matcher(file.getFileName());
/* 22:   */     
/* 23:22 */     return m.find();
/* 24:   */   }
/* 25:   */ }


/* Location:           C:\Users\Jack\Desktop\classes\
 * Qualified Name:     cn.com.img.tools.PublicTools
 * JD-Core Version:    0.7.0.1
 */