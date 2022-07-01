<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>">

        <%--        <title>My JSP 'myResult.jsp' starting page</title>--%>

        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
        <meta http-equiv="description" content="This is my page">
        <!--
        <link rel="stylesheet" type="text/css" href="styles.css">
        -->

    </head>
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
        if (flag.equals("+")) {
            result = num1 + num2;
        } else if (flag.equals("-")) {
            result = num1 - num2;
        } else if (flag.equals("*")) {
            result = num1 * num2;
        } else if (flag.equals("/")) {
            result = num1 / num2;
        }
        //                存到session
        session.setAttribute("result", result);
//                从session取得名字并?追加到main.jsp后面
        session.getAttribute("result");
        //第5步
//        out.println("结果是:" + result);
    %>


    <body>
        <h3>计算器结果</h3>

        <%--    <c:out value="result"/><%=result%></c:out>--%>
        <p><c:out value="${sessionScope.result}"/>${sessionScope.result}</p>

        <%--        <br/>--%>
        <%--        <P hidden id="s_num1"><%=s_num1%>--%>
        <%--        </P>--%>
        <%--        <P hidden id="s_num2"><%=s_num2%>--%>
        <%--        </P>--%>

        <%--        <P hidden id="result"><%=result%>--%>
        <%--        </P>--%>


    </body>
    <%--    <script>--%>
    <%--        function get() {--%>
    <%--            &lt;%&ndash;var v = "${pojo.name}";&ndash;%&gt;--%>

    <%--            var s_num1 = document.getElementById("s_num1").innerHTML;--%>
    <%--            s_num1 = parseInt(s_num1);--%>

    <%--            &lt;%&ndash;            ${result}=s_num1;&ndash;%&gt;--%>
    <%--            var s_num2 = document.getElementById("s_num2").innerHTML;--%>
    <%--            s_num2 = parseInt(s_num2);--%>

    <%--            var result = document.getElementById("result").innerHTML;--%>
    <%--            result = parseInt(result);--%>
    <%--        }--%>

    <%--        get();--%>
    <%--    </script>--%>


</html>
