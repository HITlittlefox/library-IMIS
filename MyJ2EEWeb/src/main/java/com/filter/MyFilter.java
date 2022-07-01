package com.filter;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

//@WebFilter({ "/CharSetFilter", "/chap3/SendInfo" })
public class MyFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        String userName = request.getParameter("userName");
        userName = (userName == null) ? "" : userName;
        if (userName.equals(""))
            ((HttpServletResponse) response).sendRedirect("login.jsp?filter");
        else
            chain.doFilter(request, response);
    }
}
