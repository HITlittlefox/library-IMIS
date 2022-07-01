package filter;

import java.io.*;
import javax.servlet.*;

//@WebFilter({ "/CharSetFilter", "/chap3/*" })
public class CharSetFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        System.out.println(" CharSetFilter doFilter()执行前！");
        request.setCharacterEncoding("gb2312");
        response.setCharacterEncoding("gb2312");
        response.setContentType("text/html;charset=gb2312");
        chain.doFilter(request, response);
        System.out.println(" CharSetFilter doFilter()执行后！");
    }

    @Override
    public void init(FilterConfig fConfig) throws ServletException {
    }

    @Override
    public void destroy() {
    }
}
