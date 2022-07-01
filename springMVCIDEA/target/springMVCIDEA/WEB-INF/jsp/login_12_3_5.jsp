<%--
  Created by IntelliJ IDEA.
  User: 96361
  Date: 2022/4/29
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@ page import="java.util.*" %>
<%
    String wrongflag = null;
    if (request.getParameter("wrongflag") != null) {
        wrongflag = request.getParameter("wrongflag");
    }
    System.out.println("wrongflag:" + wrongflag);

    String registerflag = null;
    if (request.getParameter("registerflag") != null) {
        registerflag = request.getParameter("registerflag");
    }
    System.out.println("registerflag:" + registerflag);
%>

<!DOCTYPE html>
<html>
    <head>
        <title>登录页面</title>
    </head>
    <style type="text/css">
        #code {
            font-style: italic;
            font-weight: bold;
            border: 0;
            letter-spacing: 2px;
            color: blue;
        }
    </style>
    <body>
        <p>登录页面</p>
        <p hidden id="wrongflag"><%=wrongflag%>
        </p>
        <p hidden id="registerflag"><%=registerflag%>
        </p>
        <form method="post" action="${pageContext.request.contextPath}/dologincheck.do" onsubmit="return loginCheck()">
                <label>用户名:</label><input type="text" id="userName" name="user" placeholder="用户名不能为空"/><span
                id="userNameShow"></span><br>
            <label>密码:</label><input type="text" id="pwd" name="pwd" placeholder="密码不能为空"/><span
                id="pwdShow"></span><br>


            <%--            <label>验证码:</label>--%>


            <%--            <!--时间：2017-01-11 描述：输入框ct100_textcode -->--%>
            <%--            <input type="text" id="ctl00_txtcode" placeholder="请输入验证码不区分大小写"/>--%>
            <%--            <!--时间：2017-01-11 描述：把验证码定义为按钮，点击刷新-->--%>
            <%--            <input type="button" id="code" onclick="createCode()"/>--%>


            <div id="select">
                <%--                <input type="submit" class="button" value="登陆" onclick="loginCheck()">--%>
                <input type="submit" value="提交">
                <%--保持注册与登录按钮样式相同，并点击注册后跳转页面--%>
                <input type="button" class="button" value="注册"
                       onclick="window.location.href='register.do'">
            </div>
        </form>
        <script>

            var wrongflag = null;
            wrongflag = document.getElementById("wrongflag").innerText;

            function alarmyou() {

                if (wrongflag === 'true\n        ') {
                    // wrongflag = document.getElementById("wrongflag").innerText;
                    alert('用户名和密码出错,您需要重新输入');
                }
                console.log(wrongflag, typeof (wrongflag));
            }

            alarmyou()


            var registerflag = null;
            registerflag = document.getElementById("registerflag").innerText;

            function registerOrnot() {
                if (registerflag === 'true\n        ') {
                    // wrongflag = document.getElementById("wrongflag").innerText;
                    alert("注册成功！")

                }
                console.log(registerflag, typeof (registerflag));

            }

            registerOrnot()
        </script>


        <script>
            //用户名判断
            function checkUserName() {

                var userName = document.getElementById("userName").value;
                var userNameShowDom = document.getElementById("userNameShow");
                var pwd = document.getElementById("pwd").value;
                var pwdShowDom = document.getElementById("pwdShow");

                if (userName.length >= 1) {
                    userNameShowDom.innerText = "您的用户名格式填写正确，不为空";
                    userNameShowDom.style.color = "green";
                    return true;

                } else {
                    //数字开头
                    userNameShowDom.innerText = "用户名不能为空";
                    userNameShowDom.style.color = "red";
                    if (pwd.length < 1) {
                        pwdShowDom.innerText = "密码不能为空";
                        pwdShowDom.style.color = "red";
                    }
                    return false;
                }
            }

            //密码判断
            function checkPwd() {
                //密码判断
                var pwd = document.getElementById("pwd").value;
                var pwdShowDom = document.getElementById("pwdShow");

                if (pwd.length >= 1) {
                    pwdShowDom.innerText = "您的密码格式填写正确，不为空";
                    pwdShowDom.style.color = "green";
                    return true;
                } else {

                    pwdShowDom.innerText = "密码不能为空";
                    pwdShowDom.style.color = "red";
                    return false;
                }
            }


            // //产生验证码
            // window.onload = function () {
            //     createCode()
            // }
            // var code; //在全局定义验证码
            // function createCode() {
            //     code = "";
            //     var codeLength = 4; //验证码的长度
            //     var checkCode = document.getElementById("code");
            //     var random = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
            //         'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']; //随机数
            //     for (var i = 0; i < codeLength; i++) { //循环操作
            //         var index = Math.floor(Math.random() * 36); //取得随机数的索引（0~35）
            //         code += random[index]; //根据索引取得随机数加到code上
            //     }
            //     checkCode.value = code; //把code值赋给验证码
            // }
            //
            // //校验验证码
            // function checkValidate() {
            //     var inputCode = document.getElementById("ctl00_txtcode").value.toUpperCase(); //获取输入框内验证码并转化为大写
            //     if (inputCode.length <= 0) { //若输入的验证码长度为0
            //         alert("请输入验证码！"); //则弹出请输入验证码
            //         return false;
            //     } else if (inputCode !== code) { //若输入的验证码与产生的验证码不一致时
            //         alert("验证码输入错误!"); //则弹出验证码输入错误
            //         createCode(); //刷新验证码
            //         document.getElementById("ctl00_txtcode").value = "";//清空文本框
            //         return false;
            //
            //     } else { //输入正确时
            //         // alert("验证码正确"); //弹出
            //         return true;
            //     }
            // }

            // //跳转判断（带验证码）
            // function loginCheck() {
            //     if ((checkUserName() === true) && (checkPwd() === true) && (checkValidate())) {
            //         // alert("your name,password and validate are ok")
            //         return true;
            //         // document.getElementById("form1").submit();
            //     } else {
            //         alert("您需要三个空都填写！")
            //         return false;
            //     }
            //
            //
            // }

            //跳转判断（不带验证码）
            function loginCheck() {
                if ((checkUserName() === true) && (checkPwd() === true)) {
                    // alert("your name,password and validate are ok")
                    return true;
                    // document.getElementById("form1").submit();
                } else {
                    alert("用户名不能为空！” “密码不能为空！")
                    return false;
                }


            }
        </script>


    </body>
</html>
