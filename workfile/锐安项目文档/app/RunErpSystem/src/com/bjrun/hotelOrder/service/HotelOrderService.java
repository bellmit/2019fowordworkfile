package com.bjrun.hotelOrder.service;

import com.bjrun.hotelOrder.entity.HotelOrder;
import java.util.HashMap;
import java.util.List;

public abstract interface HotelOrderService
{
  public abstract void saveOrUpdate(HotelOrder paramHotelOrder);

  public abstract void saveOrUpdateAll(List<HotelOrder> paramList);

  public abstract void createFile(HashMap<String, String> paramHashMap);

  public abstract HotelOrder getHotelByOrderId(String paramString);

  public abstract Integer getHotelMaxId();

  public abstract void createAllFile();
}