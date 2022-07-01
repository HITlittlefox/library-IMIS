<%--
  Created by IntelliJ IDEA.
  User: 96361
  Date: 2022/5/6
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        我的兴趣爱好<br>
        <form action="dointerest.do">
            摄影：<input type="checkbox" name="myinterest" value="摄影"/><br/>
            跳舞：<input type="checkbox" name="myinterest" value="跳舞"/><br/>
            旅游：<input type="checkbox" name="myinterest" value="旅游"/><br/>
            阅读：<input type="checkbox" name="myinterest" value="阅读"/><br/>
            <input type="submit" value="确定"/>
        </form>
        <br/>观测控制台的输出
    </body>

</html>
