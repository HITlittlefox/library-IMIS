<%@ page contentType="text/html" pageEncoding="gb2312" %>
<%@ page import="org.dom4j.*, java.util.*" %>
<%@ page import="org.dom4j.io.SAXReader" %>
<%@ page import="java.io.File" %>
<%@ page import="com.photos.GetPhotoNumber" %>
<%@ page import="java.sql.SQLException" %>
<%
    GetPhotoNumber getPhotoNumber = new GetPhotoNumber();
    int photonumber = 0;
    try {
        photonumber = getPhotoNumber.returnphotonumber();
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }
//    System.out.println("photonumber:" + photonumber);
//    //                存到session
//    session.setAttribute("photonumber", photonumber);
//
//    Object sessionphotonumber = session.getAttribute("photonumber");
////                从session取得名字并?追加到main.jsp后面
//    System.out.println("sessionphotonumber:" + sessionphotonumber);
%>
<%--<jsp:useBean id="myParse" class="com.testxml.ParseXML"/>--%>
<!DOCTYPE html>
<html lang="en">
    <p hidden id="jsphotonumber"><%=photonumber%>
    </p>
    <head>
        <title>在线交互式电子相册</title>
        <meta http-equiv="content-type" content="text/html; charset=gb2312">

    </head>

    <script language="javascript">

        // class ClassWithStaticMethod {
        //     static photonumber = document.getElementById("photonumber").innerHTML;
        //
        //     static staticMethod() {
        //         return 'static method has been called.';
        //     }
        //
        //     static {
        //         console.log('Class static initialization block called');
        //
        //
        //     }
        // }
        var jsphotonumber = document.getElementById("jsphotonumber").innerHTML;
        jsphotonumber = parseInt(jsphotonumber);

        // var photonumber = ClassWithStaticMethod.photonumber;
        console.log("photonumber:" + jsphotonumber);


        //定义一个变量用于存放XMLHttpRequest对象
        var xmlHttp;
        var selected = 0;//当前相片号

        // var photonumber=session.getAttribute("photonumber")
        // var photonumber = "${sessioScope.photonumber}";

        //该函数用于创建一个XMLHttpRequest对象
        function createXMLHttpRequest() {
            if (window.ActiveXObject)
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            else if (window.XMLHttpRequest)
                xmlHttp = new XMLHttpRequest();
        }

        //这是一个通过AJAX获取相片的方法
        function getPhoto() {
            createXMLHttpRequest();//创建一个XMLHttpRequest对象
            xmlHttp.onreadystatechange = processor; //将状态触发器绑定到一个函数
            xmlHttp.open("GET", "GetPhoto?selected=" + selected); //建立对服务器的调用
            xmlHttp.send(null); //发送请求
        }

        //处理从服务器返回的结果
        function processor() {
            if (xmlHttp.readyState == 4) { //如果响应完成
                if (xmlHttp.status == 200) {//如果返回成功
                    document.all.photo.src = xmlHttp.responseText; //更新相片文件
                    document.all.photo.width = "500";
                    document.all.photo.height = "500";
                }
            }
        }

        //响应“上一张”
        function prev() {
            selected = (selected - 1 + jsphotonumber) % jsphotonumber;
            getPhoto();
        }

        //响应“下一张”
        function next() {
            selected = (selected + 1 + jsphotonumber) % jsphotonumber;
            getPhoto();
        }


    </script>
    <body>

        <TABLE border="0" bgcolor="#c0c0c0" width="300px" height="240px">
            <TR>
                <TD colspan="2" align="center"><h2>电子相册</h2></TD>
            </TR>
            <TR>
                <TD WIDTH="500" HEIGHT="500" colspan="2" align="center"><img width="500" height="500" id="photo"
                                                                             src="upload/20220524165155674.jpg"></TD>
            </TR>
            <TR>
                <TD align="center"><span onClick="prev()" style="cursor:hand;">
                        上一张</span></TD>
                <TD align="center"><span onClick="next()" style="cursor:hand;">
                        下一张</span></TD>
            </TR>
        </TABLE>
    </body>

</html>
