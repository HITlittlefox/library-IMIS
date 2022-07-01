<%@ page import="java.security.SecureRandom" %><%--
  Created by IntelliJ IDEA.
  User: 96361
  Date: 2022/5/23
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String message = (String) session.getAttribute("userName");//用request得到
    System.out.println("defaultError:" + message);
%>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <%--        其他异常信息：${ex.message}. <br>--%>
        <p>异常处理：您的用户名或者密码错误:<%=message%>
        </p>

    </body>

</html>
