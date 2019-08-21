package com.bjrun.hotelOrder.dao;

import com.bjrun.hotelOrder.entity.HotelOrder;
import java.util.List;
import java.util.Map;

public abstract interface HotelOrderDao
{
  public abstract void saveOrUpdate(HotelOrder paramHotelOrder);

  public abstract void saveOrUpdateAll(List<HotelOrder> paramList);

  public abstract List<HotelOrder> getHotelOrderList(Map<String, String> paramMap);

  public abstract HotelOrder getHotelByOrderId(String paramString);

  public abstract Integer getHotelMaxId();
}