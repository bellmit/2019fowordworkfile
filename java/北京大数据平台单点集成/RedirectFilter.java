package com.fr;

import com.fr.web.utils.WebUtils;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RedirectFilter
  implements Filter
{
  public void init(FilterConfig filterConfig)
    throws ServletException
  {}
  
  public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
    throws IOException, ServletException
  {
    HttpServletRequest httpRequest = (HttpServletRequest)servletRequest;
    HttpServletResponse httpServletResponse = (HttpServletResponse)servletResponse;
    String reportlet = httpRequest.getParameter("reportlet");
    if (reportlet == null) {
      reportlet = httpRequest.getParameter("formlet");
    }
    if (reportlet != null)
    {
      String originalUrl = WebUtils.getOriginalURL(httpRequest).replaceFirst("RemoteServer", "ReportServer");
      
      httpServletResponse.sendRedirect(originalUrl);
      return;
    }
    filterChain.doFilter(servletRequest, servletResponse);
  }
  
  public void destroy() {}
}
