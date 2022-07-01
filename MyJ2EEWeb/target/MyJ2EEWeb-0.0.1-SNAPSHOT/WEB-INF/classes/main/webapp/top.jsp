<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="utf-8" %>
<%@ page import="java.io.*,java.util.*" %>


<%
    String user = request.getParameter("user");//用request得到

%>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Document</title>

    </head>
    <body>
        <!--
        获得当前日期（年月日）并显示在段落内
        -->

        <table border="1">
            <tr>
                <td id="getuser">
                </td>
                <td></td>
                <td id="ymd"></td>
            </tr>
        </table>

    </body>
    <script>
        var date = new Date()<!--获得日期数据-->
        var y = date.getFullYear();<!--年-->
        var m = date.getMonth() + 1;<!--月，这里的月份必须要+1才是当前月份-->
        var d = date.getDate(); <!--日，getDay是获得当前星期几（0-6），getDate是获得当前日期-->

        var e = date.getDay(); <!--日，getDay是获得当前星期几（0-6），getDate是获得当前日期-->
        document.getElementById("ymd").innerHTML = "今日日期:" + y + "-" + m + "-" + d + ";星期" + e;


        //paraName 等找参数的名称
        function GetParentUrlParam(paraName) {
            var url = parent.document.location.toString();
            var arrObj = url.split("?");

            if (arrObj.length > 1) {
                var arrPara = arrObj[1].split("&");
                var arr;

                for (var i = 0; i < arrPara.length; i++) {
                    arr = arrPara[i].split("=");

                    if (arr != null && arr[0] == paraName) {
                        return arr[1];
                    }
                }
                return "";
            } else {
                return "";
            }
        }

        //从frame_a打印user名字
        console.log(GetParentUrlParam("user"));
        document.getElementById("getuser").innerHTML = "您好，" + GetParentUrlParam("user");

    </script>
</html>

