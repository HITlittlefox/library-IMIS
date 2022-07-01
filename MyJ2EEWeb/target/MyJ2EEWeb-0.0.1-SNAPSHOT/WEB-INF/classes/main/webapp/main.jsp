<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@ page import="java.io.*,java.util.*" %>


<%
    String user = request.getParameter("user");//用request得到

%>
<html>
    <head>
        <title>主页面（未完成）</title>
    </head>
    <style>
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            width: 200px;
            background-color: #f1f1f1;
            border: 1px solid #555;
        }

        li a {
            display: block;
            color: #000;
            padding: 8px 16px;
            text-decoration: none;
        }

        li {
            text-align: center;
            border-bottom: 1px solid #555;
        }

        li:last-child {
            border-bottom: none;
        }

        li a.active {
            background-color: #4CAF50;
            color: white;
        }

        li a:hover:not(.active) {
            background-color: #555;
            color: white;
        }
    </style>

    <frameset rows="10%,90%">

        <frame src="./top.jsp">

        <frameset cols="25%,75%">
            <frame src="./menu.html">
            <frame name="RightFrame" src="./mydoc.html" noresize="noresize"/>
            //默认显示frame A的样式
        </frameset>

    </frameset>


    <%--    </body>--%>

</html>
