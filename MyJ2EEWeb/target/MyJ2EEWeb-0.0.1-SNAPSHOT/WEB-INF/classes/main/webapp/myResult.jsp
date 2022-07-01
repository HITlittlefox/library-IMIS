<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

    <title>My JSP 'myResult.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

  </head>

  <body>
    <%
      //第1步接收到 第1个数
      String s_num1 = request.getParameter("num1");
      //第2步接收到 第2个数
      String s_num2 = request.getParameter("num2");
      //第3步接收到 运算符
      String flag = request.getParameter("flag");
      //第4步 计算

      int num1 = Integer.parseInt(s_num1);
      int num2 = Integer.parseInt(s_num2);
      int result = 0;
      if(flag.equals("+"))
      {
        result = num1+num2;
      }
      else if(flag.equals("-"))
      {
        result = num1-num2;
      }
      else if(flag.equals("*"))
      {
        result = num1*num2;
      }
      else if(flag.equals("/"))
      {
        result = num1/num2;
      }
      //第5步
      out.println("结果是:"+result);
    %>

  </body>
</html>
