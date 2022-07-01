<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<%

    Class.forName("com.mysql.cj.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/userdb?useSSL=false";
    Connection conn = DriverManager.getConnection(url, "root", "1234");
    Statement stmt = conn.createStatement();
%>

<html>
    <head>
        <title>登录检查页面</title>
    </head>
    <body>
        <%
            String name = request.getParameter("user");
            String psd = request.getParameter("pwd");

            //todo:(已完成)通过userName拿到userName，然后把userName传到下一个页面

            String sql = "select userName from users where userName ='" + name + "' and userPwd= '" + psd + "'";
            System.out.println(sql);
            stmt.execute(sql);
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                session.setAttribute("userName", String.valueOf(rs.getString("userName")));
                response.sendRedirect("main.jsp?userName=" + rs.getString("userName") + "");
            } else {

                //如果数据库中没有这个username，则返回登录页面并传输一个标记为否
                System.out.println("nono");
                response.sendRedirect("login.jsp");
            }
        %>
    </body>
</html>
