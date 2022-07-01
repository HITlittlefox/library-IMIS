package filter;


import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;

@WebFilter({"/main.do"})
public class MyFilter_12_1 implements Filter {
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        String mainuser = null;
        mainuser = request.getParameter("loginflag");
        System.out.println("filtermainuser:" + mainuser);

        if (mainuser != null) {
//            System.out.println("filtermainuser:" + mainuser);
//            ((HttpServletResponse) response).sendRedirect("WEB-INF/jsp/main_12_2_6.jsp");
            chain.doFilter(request, response);
        } else {
            popAlert(response);

////            mainuser = request.getParameter("loginflag");
//            ((HttpServletResponse) response).sendRedirect("main.do?loginflag=true");
////            popgood(response);
        }

//        String mainuser = (String) session.getAttribute("userName");

//        mainuser = (mainuser == null) ? "" : mainuser;
//        if (mainuser.equals("nonono")) {
//
////            ((HttpServletResponse) response).sendRedirect("main.do");
//        }
////            chain.doFilter(request, response);
//
//        else
    }

    public void popAlert(ServletResponse response) throws IOException {

//        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        out.print("<script>alert('您尚未登录，请登录'); window.location='login.do' </script>");
//        out.print("<script>alert('您尚未登录，请登录');  </script>");
        out.flush();
        out.close();

    }

//    public void popgood(ServletResponse response) throws IOException {
//
////        response.setCharacterEncoding("utf-8");
//        PrintWriter out = response.getWriter();
//        out.print("<script>alert('您已登录，正在前往主页'); window.location='main.do' </script>");
////        out.print("<script>alert('您尚未登录，请登录');  </script>");
//        out.flush();
//        out.close();
//
//    }
}
