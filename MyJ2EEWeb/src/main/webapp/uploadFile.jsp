<%@ page language="java" import="java.util.*" pageEncoding="gb2312" %>
<%@ page import="com.jspsmart.upload.*" %>
<%@ page import="com.photos.GetPhotoNumber" %>
<%
    // �趨������뷽ʽ�������������ľͻ�����
    request.setCharacterEncoding("gb2312");
%>


<html>
    <%--    //todo:��picture��Ϣ���浽���ݿ���--%>
    <head><title>�ϴ��ļ�ʵ��</title></head>
    <body>

        <h2>�ϴ��ļ�ʵ��</h2>
        <hr>
        ��ѡ���ϴ��ļ�������
        <select id="number" onchange="buildFileInput()">
            <option value=1>1</option>
            <option value=2>2</option>
            <option value=3>3</option>
            <option value=4>4</option>
            <option value=5>5</option>
        </select>
        <form name="form1" enctype="multipart/form-data" action="upload_do.jsp" method="post">
            <div id="files"></div>
            <input type="submit" name="Submit" value="�ύ"/>
        </form>
    </body>
    <script language="javascript">
        //����ѡ����ļ����������ļ�������б�
        function buildFileInput() {
            //ȡ���ļ����������б�ֵ
            var num = document.all.number.value;
            //�����е��ļ���������
            clearFileInput();
            //������µ��ļ�������б�
            for (var i = 0; i < num; i++) {
                //����һ��div��ǩ�ڵ�
                filediv = document.createElement("div");
                //����һ���ı��ڵ�
                labeltext = document.createTextNode("��" + (i + 1) + "���ļ���");
                //����һ���ļ������ڵ�
                fileinput = document.createElement("input");
                fileinput.type = "file";
                fileinput.name = "file" + i;
                //����һ���ı��ڵ�
                memotext = document.createTextNode(" ��" + (i + 1) + "���ļ���ע��");
                //����һ���ı������ڵ�
                memoinput = document.createElement("input");
                memoinput.type = "text";
                memoinput.name = "memo" + i;
                //���ı��ڵ�׷�ӳ�div��ǩ�ڵ���ӽڵ�
                filediv.appendChild(labeltext);
                //���ļ������ڵ�׷�ӳ�div��ǩ�ڵ���ӽڵ�
                filediv.appendChild(fileinput);
                //���ı��ڵ�׷�ӳ�div��ǩ�ڵ���ӽڵ�
                filediv.appendChild(memotext);
                //���ı������ڵ�׷�ӳ�div��ǩ�ڵ���ӽڵ�
                filediv.appendChild(memoinput);
                //��div��ǩ�ڵ�׷�ӳ�files���ӽڵ�
                document.all.files.appendChild(filediv);
            }
        }

        function clearFileInput() {	//�����е��ļ���������
            while (document.all.files.childNodes.length > 0)
                document.all.files.removeChild(document.all.files.childNodes[0]);
        }

        buildFileInput();//��ʼ���ļ�������б�
    </script>

</html>
