package com.bjrun.hotelOrder.dao.impl;

import com.bjrun.hotelOrder.dao.HotelOrderDao;
import com.bjrun.hotelOrder.entity.HotelOrder;
import java.util.List;
import java.util.Map;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class HotelOrderDaoImpl extends HibernateDaoSupport
  implements HotelOrderDao
{
  public void saveOrUpdate(HotelOrder hotelOrder)
  {
    getHibernateTemplate().saveOrUpdate(hotelOrder);
  }

  public void saveOrUpdateAll(List<HotelOrder> hotelOrderList) {
    getHibernateTemplate().saveOrUpdateAll(hotelOrderList);
  }

  public List<HotelOrder> getHotelOrderList(Map<String, String> map)
  {
    StringBuffer hql = new StringBuffer("from HotelOrder h where 1=1 ");

    if ((map.containsKey("cDateStart")) && (map.get("cDateStart") != null) && (map.get("cDateStart") != "")) {
      hql.append(" and DATE_FORMAT(h.createTime,'%Y-%m-%d') >= '").append((String)map.get("cDateStart")).append("' ");
    }
    if ((map.containsKey("cDateEnd")) && (map.get("cDateEnd") != null) && (map.get("cDateEnd") != "")) {
      hql.append(" and DATE_FORMAT(h.createTime,'%Y-%m-%d') <= '").append((String)map.get("cDateEnd")).append("' ");
    }
    return getHibernateTemplate().find(hql.toString());
  }

  public HotelOrder getHotelByOrderId(String orderId) {
    StringBuffer hql = new StringBuffer("from HotelOrder h where h.orderId = '" + orderId + "'");
    List list = getHibernateTemplate().find(hql.toString());
    if ((list != null) && (list.size() > 0)) {
      return (HotelOrder)list.get(0);
    }
    return null;
  }

  public Integer getHotelMaxId() {
    List list = getHibernateTemplate().find("select max(id) from HotelOrder ");
    if ((list != null) && (list.size() > 0)) {
      return (Integer)list.get(0);
    }
    return null;
  }
}