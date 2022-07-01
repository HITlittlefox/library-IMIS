<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
    <head>
        <title>注册页面</title>
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
    <body onload="isDuplicatedName()">
        <p>注册页面</p>

        <form method="post" action="registerCheck.jsp" onsubmit="return registerCheck()">
            <label>用户名:</label><input type="text" id="userName" name="user" placeholder="长度在3-15&&非数字开头"/><span
                id="userNameShow"></span><br>
            <label>密码:</label><input type="text" id="pwd" name="pwd" placeholder="长度在6-18&&含数字和字母"/><span
                id="pwdShow"></span><br>

            <div>
                <!--时间：2017-01-11 描述：输入框ct100_textcode -->
                <input type="text" id="ctl00_txtcode"/>
                <!--时间：2017-01-11 描述：把验证码定义为按钮，点击刷新-->
                <input type="button" id="code" onclick="createCode()"/>

            </div>
            <div id="select">
                <%--                <input type="submit" class="button" value="登陆" onclick="loginCheck()">--%>
                <input type="submit" value="提交">
                <%--                &lt;%&ndash;保持注册与登录按钮样式相同，并点击注册后跳转页面&ndash;%&gt;--%>
                <%--                <input type="button" class="button" value="注册"--%>
                <%--                       onclick="window.location.href='register.jsp'">--%>
            </div>
        </form>

        <script>
            //用户名判断
            function checkUserName() {

                var userName = document.getElementById("userName").value;
                var userNameShowDom = document.getElementById("userNameShow");

                if (userName.length >= 3 && userName.length <= 15) {
                    //符合长度要求
                    //1：不是数字开头的
                    var c = userName.charAt(0);
                    if (isNaN(c)) {
                        //非数字开头--符合要求
                        userNameShowDom.innerText = "验证通过";
                        userNameShowDom.style.color = "green";
                        // alert("the form of your name  is ok");

                        return true;
                    } else {
                        //数字开头
                        userNameShowDom.innerText = "*不能以数字开头";
                        userNameShowDom.style.color = "red";
                        return false;
                    }


                } else { //不符合长度要求
                    userNameShowDom.innerText = "*长度不符合要求";
                    userNameShowDom.style.color = "red";
                    return false;
                }
            }

            //密码判断
            function checkPwd() {
                //密码判断
                var pwd = document.getElementById("pwd").value;
                var pwdShowDom = document.getElementById("pwdShow");

                if (pwd.length >= 6 && pwd.length <= 18) {
                    //1:纯数字
                    var pwdReg = /(\D+\d+) |(\d+\D)/;

                    if (pwdReg.test(pwd)) {
                        pwdShowDom.innerText = "验证通过";
                        pwdShowDom.style.color = "green";
                        // alert("the form of your pwd is ok")

                        return true;
                    } else {
                        pwdShowDom.innerText = "*不能是纯字符";
                        pwdShowDom.style.color = "red";
                        return false;
                    }
                } else {
                    pwdShowDom.innerText = "*长度不符合要求";
                    pwdShowDom.style.color = "red";
                    return false;
                }
            }


            //产生验证码
            window.onload = function () {
                createCode()
            }
            var code; //在全局定义验证码
            function createCode() {
                code = "";
                var codeLength = 4; //验证码的长度
                var checkCode = document.getElementById("code");
                var random = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
                    'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']; //随机数
                for (var i = 0; i < codeLength; i++) { //循环操作
                    var index = Math.floor(Math.random() * 36); //取得随机数的索引（0~35）
                    code += random[index]; //根据索引取得随机数加到code上
                }
                checkCode.value = code; //把code值赋给验证码
            }

            //校验验证码
            function checkValidate() {
                var inputCode = document.getElementById("ctl00_txtcode").value.toUpperCase(); //获取输入框内验证码并转化为大写
                if (inputCode.length <= 0) { //若输入的验证码长度为0
                    alert("请输入验证码！"); //则弹出请输入验证码
                    return false;
                } else if (inputCode !== code) { //若输入的验证码与产生的验证码不一致时
                    alert("验证码输入错误!"); //则弹出验证码输入错误
                    createCode(); //刷新验证码
                    document.getElementById("ctl00_txtcode").value = "";//清空文本框
                    return false;

                } else { //输入正确时
                    // alert("验证码正确"); //弹出
                    return true;
                }
            }

            //跳转判断
            function registerCheck() {
                if ((checkUserName() === true) && (checkPwd() === true) && (checkValidate() === true) && (beginCheck() === true)) {
                    // alert("your name,password and validate are ok")
                    return true;
                    // document.getElementById("form1").submit();
                } else {
                    alert("no, you can't register!!!")
                    return false;
                }
            }


            //获取URL参数
            function getQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
                var r = window.location.search.substr(1).match(reg);
                if (r != null) {
                    return decodeURI(r[2]);
                } else {
                    return null;
                }
            }

            //重复判断
            var isDuplicatedName = getQueryString("isDuplicatedName");


            if (isDuplicatedName === 'true') {
                // document.getElementById("p_DuplicatedName").hidden = false;
                // // } else {
                // document.getElementById("p_DuplicatedName").innerText = "您的用户名：" + obj.innerText + "是重复的！";
                alert("您的用户名是重复的！请换一个用户名！");
            }


            //定义一个变量用于存放XMLHttpRequest对象
            var xmlHttp;

            //该函数用于创建一个XMLHttpRequest对象
            function createXMLHttpRequest() {
                if (window.ActiveXObject)
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                else if (window.XMLHttpRequest)
                    xmlHttp = new XMLHttpRequest();
            }




            //这是一个启动AJAX异步通信的方法
            function beginCheck() {
                // var tempLoginName = document.all.loginName.value;

                var tempLoginName = document.getElementsByName("user")['0'].value;

                if (tempLoginName == "") {//如果尚未输入注册名
                    alert("对不起，请您输入注册名!");
                    return;
                }
                createXMLHttpRequest();//创建一个XMLHttpRequest对象
                xmlHttp.onreadystatechange = processor; //将状态触发器绑定到一个函数
                //通过GET方法向指定的URL建立服务器的调用
                xmlHttp.open("GET", "CheckUser?loginName=" + tempLoginName);
                xmlHttp.send(null); //发送请求
            }

            //这是一用来处理状态改变的函数
            function processor() {
                //定义一个变量用于存放从服务器返回的响应结果
                var responseContext;
                if (xmlHttp.readyState == 4) { //如果响应完成
                    if (xmlHttp.status == 200) {//如果返回成功
                        //取出服务器的响应内容
                        responseContext = xmlHttp.responseText;
                        //如果注册名检查有效
                        if (responseContext.indexOf("true") != -1) {
                            alert("恭喜您，该注册名有效！");
                            return true
                        } else
                            alert("对不起，该注册名已被使用！");
                    }
                }
            }
        </script>


    </body>
</html>
