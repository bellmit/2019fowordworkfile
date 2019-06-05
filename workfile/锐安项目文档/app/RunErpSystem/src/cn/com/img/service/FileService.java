package cn.com.img.service;

import cn.com.img.entity.File;
import cn.com.img.entity.Folder;

public abstract interface FileService
{
  public abstract String saveFolder(Folder paramFolder);
  
  public abstract void saveFile(File paramFile);
  
  public abstract void addFileNumber(Folder paramFolder);
}


/* Location:           C:\Users\Jack\Desktop\classes\
 * Qualified Name:     cn.com.img.service.FileService
 * JD-Core Version:    0.7.0.1
 */