<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>">

        <title>My JSP 'myCal.jsp' starting page</title>

        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
        <meta http-equiv="description" content="This is my page">


        <!-- jsp页面中不可以直接使用script -->
        <script language="javascript">
            <!--
            //写一个函数判断是否两个数都有
            function checkNum() {
                //判断num1 num2是否为空
                if ((form1.num1.value == "") || (form1.num2.value == "")) {
                    window.alert("null,不能为空！");
                    return false;
                }
                //判断是否是数字
                if (Math.round(form1.num1.value) != form1.num1.value && Math.round(form1.num2.value) != form1.num2.value) {
                    window.alert("num1和num2不是一个数");
                    return false;
                }
                if (Math.round(form1.num1.value) != form1.num1.value) {
                    window.alert("num1不是一个数");
                    return false;
                }
                if (Math.round(form1.num2.value) != form1.num2.value) {
                    window.alert("num2不是一个数");
                    return false;
                }

            }

            -->
        </script>
    </head>
    <body>

        <form name="form1" action="myResult.jsp" method="post">
            请输入第一个数：<input type="text" name="num1">
            <select name="flag">
                <option value=+>+</option>
                <option value=->-</option>
                <option value=*>*</option>
                <option value=/>
                /</option>
            </select>
            请输入第二个数：<input type="text" name="num2">
            <input type="submit" value="计算" onclick="return checkNum();">
        </form>

    </body>
</html>
