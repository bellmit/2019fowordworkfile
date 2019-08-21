package cn.com.img.dao;

import cn.com.img.entity.File;
import cn.com.img.entity.Folder;
import java.util.List;

public abstract interface FileDAO
{
  public abstract void upLoadImg();
  
  public abstract List<File> getImgFile(Folder paramFolder);
  
  public abstract void initImgInfo();
  
  public abstract String saveFolder(Folder paramFolder);
  
  public abstract void saveFile(File paramFile);
  
  public abstract void addFileNumber(Folder paramFolder);
}


/* Location:           C:\Users\Jack\Desktop\classes\
 * Qualified Name:     cn.com.img.dao.FileDAO
 * JD-Core Version:    0.7.0.1
 */