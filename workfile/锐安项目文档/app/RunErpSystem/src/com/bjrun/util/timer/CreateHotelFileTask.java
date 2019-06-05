package com.bjrun.util.timer;

import com.bjrun.hotelOrder.service.HotelOrderService;
import java.util.TimerTask;
import javax.servlet.ServletContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class CreateHotelFileTask extends TimerTask
{
  private WebApplicationContext applicationContext;
  private ServletContext context = null;
  private HotelOrderService hotelOrderService;

  public HotelOrderService getHotelOrderService()
  {
    return this.hotelOrderService;
  }

  public void setHotelOrderService(HotelOrderService hotelOrderService) {
    this.hotelOrderService = hotelOrderService;
  }
  public CreateHotelFileTask() {
  }

  public CreateHotelFileTask(ServletContext context) {
    this.context = context;
    this.applicationContext = WebApplicationContextUtils.getRequiredWebApplicationContext(context);
  }

  public void run()
  {
    this.hotelOrderService = ((HotelOrderService)this.applicationContext.getBean("hotelOrderService"));
    this.hotelOrderService.createAllFile();
  }
}