package com.db;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//@WebServlet("/com.servlet.ConnectionUtil")
public class UserBean {

    public Connection getConnection() throws SQLException, ClassNotFoundException {

        Class.forName("com.mysql.cj.jdbc.Driver");
        String database = "userdb";
        String password = "1234";
        String user = "root";
        String url = "jdbc:mysql://localhost:3306/" + database + "?useSSL=false&serverTimezone=GMT" + "&user=" + user + "&password=" + password;
        Connection conn = DriverManager.getConnection(url, user, password);
//        Statement stmt = conn.createStatement();
        return conn;
    }


    // 扩展 HttpServlet 类
    public static class HelloWorld extends HttpServlet {

        private String message;

        @Override
        public void init() throws ServletException {
            // 执行必需的初始化
            message = "Hello World";
        }

        @Override
        public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            // 设置响应内容类型
            response.setContentType("text/html");

            // 实际的逻辑是在这里
            PrintWriter out = response.getWriter();
            out.println("<h1>" + message + "</h1>");
        }

        @Override
        public void destroy() {
            // 什么也不做
        }
    }
}
