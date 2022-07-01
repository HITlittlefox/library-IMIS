<%--
  Created by IntelliJ IDEA.
  User: 96361
  Date: 2022/5/23
  Time: 22:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%--<%@ page import="com.db.UserBean" %>--%>
<%@ page import="com.export.test" %>
<%--<%--%>
<%--    UserBean connjava = new UserBean();--%>
<%--    Connection conn = connjava.getConnection();--%>
<%--    Statement stmt = conn.createStatement();--%>
<%--%>--%>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <%
            //            test test = new test();

            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/userdb?useSSL=false";
            Connection conn = DriverManager.getConnection(url, "root", "1234");
            Statement stmt = conn.createStatement();
            String userList = "userList";
            String sql_userName = "select * from userdb.users";
            System.out.println(sql_userName);
            stmt.execute(sql_userName);
            ResultSet rs = stmt.executeQuery(sql_userName);
            test test = new test();
            String test2 = test.getJSONFromResultSet(rs, userList);
            System.out.println(test.getJSONFromResultSet(rs, userList));
            System.out.println(test.getJSONFromResultSet(rs, userList).getClass());
        %>
        <p><%=test2%>
        </p>
    </body>
</html>
