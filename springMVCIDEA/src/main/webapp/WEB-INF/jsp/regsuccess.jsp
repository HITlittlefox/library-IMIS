<%--
  Created by IntelliJ IDEA.
  User: 96361
  Date: 2022/5/6
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        用户注册信息<br/>
        用户名：${user.username }<br/>
        密码：${user.password}<br/>
        国家：${user.address.country }<br/>
        城市：${user.address.city}<br/>
    </body>

</html>
