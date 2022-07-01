<%@ page import="java.security.SecureRandom" %><%--
  Created by IntelliJ IDEA.
  User: 96361
  Date: 2022/5/23
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String userName = (String) session.getAttribute("userName");//用request得到
    String psd = (String) session.getAttribute("psd");//用request得到

    System.out.println("defaultErroruserName:" + userName);
    System.out.println("defaultErrorpsd:" + psd);
%>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <%--        其他异常信息：${ex.message}. <br>--%>
        <p>异常处理：您的用户名：<%=userName%>错误
        </p>
        <p>或者密码：<%=psd%>错误。</p>
        <p>或者二者不对应</p>

    </body>

</html>
