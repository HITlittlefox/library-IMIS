package com.filter;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/SendInfo")
public class SendInfo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset= utf-8");
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        try {
            out.println("<HTML>");
            out.println("<HEAD><TITLE>SendInfo</TITLE></HEAD>");
            out.println("<BODY>");
            out.println("<h1>一个测试的信息：" + title + ",来自于" + id + "的信息</h1>");
            out.println("</BODY><HTML>");
        } catch (Exception e) {
        } finally {
            out.close();
        }
    }
}
