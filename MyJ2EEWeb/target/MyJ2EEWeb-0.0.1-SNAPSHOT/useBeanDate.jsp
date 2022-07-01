<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
    <head>
        <title>useBean 实例</title>
    </head>
    <body>

        <jsp:useBean id="date" class="java.util.Date"/>
        <p>日期为：<%= date %>

    </body>
</html>
