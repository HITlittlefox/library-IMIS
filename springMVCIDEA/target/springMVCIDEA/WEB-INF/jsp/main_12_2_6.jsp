<%--
  Created by IntelliJ IDEA.
  User: 96361
  Date: 2022/4/29
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //    String sessionusername = (String) session.getAttribute("userName");
//    System.out.println("sessionusername" + sessionusername);

    String mainuser = (String) session.getAttribute("userName");//用request得到
//    System.out.println("mainuser:" + mainuser);
%>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <P>您的用户名：</P>
        <p id="mainuser"><%=mainuser%>
        </p>
        <h1>${msg }</h1>
        <h2>Hello World!</h2>
        <h2>This is homepage!</h2>
        <%--todo:拦截器，如果userName="",就弹出提示，无法登录        --%>
        <div>
            <div id="loginhidden">
                <a href="${pageContext.request.contextPath}/login.do" role="button">login</a>
            </div>
            <div id="registerhidden">
                <a href="${pageContext.request.contextPath}/register.do" role="button">register</a>
            </div>
            <div>

                <button type="button" onclick="showbuttons()" role="button">显示登录与注册按钮</button>

            </div>

        </div>
        <%--        <script>--%>

        <%--            //paraName 等找参数的名称--%>
        <%--            function GetParentUrlParam(paraName) {--%>
        <%--                var url = parent.document.location.toString();--%>
        <%--                var arrObj = url.split("?");--%>

        <%--                if (arrObj.length > 1) {--%>
        <%--                    var arrPara = arrObj[1].split("&");--%>
        <%--                    var arr;--%>

        <%--                    for (var i = 0; i < arrPara.length; i++) {--%>
        <%--                        arr = arrPara[i].split("=");--%>

        <%--                        if (arr != null && arr[0] == paraName) {--%>
        <%--                            return arr[1];--%>
        <%--                        }--%>
        <%--                    }--%>
        <%--                    return "";--%>
        <%--                } else {--%>
        <%--                    return "";--%>
        <%--                }--%>
        <%--            }--%>

        <%--        // //从frame_a打印user名字--%>
        <%--        // console.log("user:" + GetParentUrlParam("userName"));--%>
        <%--        // var jsusername = GetParentUrlParam("userName");--%>
        <%--        // console.log("jsusername" + jsusername);--%>
        <%--        // // document.getElementById("getuser").innerHTML = GetParentUrlParam("userName") + "的购物车";--%>

        <%--        </script>--%>
        <script type="text/javascript">
            var mainuser = null;
            if (document.getElementById("mainuser").innerText !== 'null') {
                mainuser = "notlogin11111111";
            } else {
                mainuser = document.getElementById("mainuser").innerText;
            }

            console.log(mainuser, typeof (mainuser));
            var loginhidden = document.getElementById("loginhidden");
            var registerhidden = document.getElementById("registerhidden");

            function hiddenOrnot() {
                if (document.getElementById("mainuser").innerText !== 'null') {
                    loginhidden.setAttribute("hidden", true);
                    registerhidden.setAttribute("hidden", true);
                    // return false
                    // var msg = confirm("您尚未登录，请登录");
                    // if (msg) {
                    //     window.location.href = "login.do";
                } else {
                    // return true
                }

            }

            hiddenOrnot()

            function showbuttons() {

                // loginhidden.getAttribute("hidden", false);
                // registerhidden.setAttribute("hidden", false);
                // return false
                // var msg = confirm("您尚未登录，请登录");
                // if (msg) {
                //     window.location.href = "login.do";
                loginhidden.removeAttribute("hidden");
                registerhidden.removeAttribute("hidden");

            }

            // checkName()
        </script>

    </body>
</html>
