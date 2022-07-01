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
//    //                �浽session
//    session.setAttribute("photonumber", photonumber);
//
//    Object sessionphotonumber = session.getAttribute("photonumber");
////                ��sessionȡ�����ֲ�?׷�ӵ�main.jsp����
//    System.out.println("sessionphotonumber:" + sessionphotonumber);
%>
<%--<jsp:useBean id="myParse" class="com.testxml.ParseXML"/>--%>
<!DOCTYPE html>
<html lang="en">
    <p hidden id="jsphotonumber"><%=photonumber%>
    </p>
    <head>
        <title>���߽���ʽ�������</title>
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


        //����һ���������ڴ��XMLHttpRequest����
        var xmlHttp;
        var selected = 0;//��ǰ��Ƭ��

        // var photonumber=session.getAttribute("photonumber")
        // var photonumber = "${sessioScope.photonumber}";

        //�ú������ڴ���һ��XMLHttpRequest����
        function createXMLHttpRequest() {
            if (window.ActiveXObject)
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            else if (window.XMLHttpRequest)
                xmlHttp = new XMLHttpRequest();
        }

        //����һ��ͨ��AJAX��ȡ��Ƭ�ķ���
        function getPhoto() {
            createXMLHttpRequest();//����һ��XMLHttpRequest����
            xmlHttp.onreadystatechange = processor; //��״̬�������󶨵�һ������
            xmlHttp.open("GET", "GetPhoto?selected=" + selected); //�����Է������ĵ���
            xmlHttp.send(null); //��������
        }

        //����ӷ��������صĽ��
        function processor() {
            if (xmlHttp.readyState == 4) { //�����Ӧ���
                if (xmlHttp.status == 200) {//������سɹ�
                    document.all.photo.src = xmlHttp.responseText; //������Ƭ�ļ�
                    document.all.photo.width = "500";
                    document.all.photo.height = "500";
                }
            }
        }

        //��Ӧ����һ�š�
        function prev() {
            selected = (selected - 1 + jsphotonumber) % jsphotonumber;
            getPhoto();
        }

        //��Ӧ����һ�š�
        function next() {
            selected = (selected + 1 + jsphotonumber) % jsphotonumber;
            getPhoto();
        }


    </script>
    <body>

        <TABLE border="0" bgcolor="#c0c0c0" width="300px" height="240px">
            <TR>
                <TD colspan="2" align="center"><h2>�������</h2></TD>
            </TR>
            <TR>
                <TD WIDTH="500" HEIGHT="500" colspan="2" align="center"><img width="500" height="500" id="photo"
                                                                             src="upload/20220524165155674.jpg"></TD>
            </TR>
            <TR>
                <TD align="center"><span onClick="prev()" style="cursor:hand;">
                        ��һ��</span></TD>
                <TD align="center"><span onClick="next()" style="cursor:hand;">
                        ��һ��</span></TD>
            </TR>
        </TABLE>
    </body>

</html>
