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
        <title>注册检查页面</title>
    </head>
    <body>

        <%
            String name = request.getParameter("user");
            String psd = request.getParameter("pwd");
            //todo:(已完成)通过userName拿到userName，然后把userName传到下一个页面

            //todo:重复用户名的判断
            //用户名不重复的情况下：

            String sql_select = "select userName from users where userName ='" + name + "' and userPwd= '" + psd + "'";
            System.out.println(sql_select);
            stmt.execute(sql_select);
            ResultSet rs = stmt.executeQuery(sql_select);
            if (rs.next()) {
                System.out.println("rs.getString(userName):" + rs.getString("userName"));
                //如果数据库中有这个username，就代表注册时使用了重复的用户名
                response.sendRedirect("register.jsp?isDuplicatedName=true");

            } else {

                String sql_register = "INSERT INTO users (userName, userPwd) VALUES ('" + name + "', '" + psd + "')";
                System.out.println(sql_register);
                stmt.execute(sql_register);
                session.setAttribute("userName", String.valueOf(name));
                response.sendRedirect("main.jsp?userName=" + name + "");

            }


        %>
    </body>

</html>
