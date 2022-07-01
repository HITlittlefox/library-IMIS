<%--
  Created by IntelliJ IDEA.
  User: 96361
  Date: 2022/5/23
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String mainuser = (String) session.getAttribute("userName");//用request得到
%>

<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        用户信息<br/>
        用户名：${username}<br/>
        密码：${password}<br/>
        wrongflag：<%=mainuser%><br/>

    </body>

</html>
