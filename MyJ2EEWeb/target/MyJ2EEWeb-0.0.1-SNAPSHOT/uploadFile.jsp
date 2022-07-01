<%@ page language="java" import="java.util.*" pageEncoding="gb2312" %>
<%@ page import="com.jspsmart.upload.*" %>
<%@ page import="com.photos.GetPhotoNumber" %>
<%
    // 设定请求编码方式，否则遇到中文就会乱码
    request.setCharacterEncoding("gb2312");
%>


<html>
    <%--    //todo:把picture信息储存到数据库中--%>
    <head><title>上传文件实例</title></head>
    <body>

        <h2>上传文件实例</h2>
        <hr>
        请选择上传文件数量：
        <select id="number" onchange="buildFileInput()">
            <option value=1>1</option>
            <option value=2>2</option>
            <option value=3>3</option>
            <option value=4>4</option>
            <option value=5>5</option>
        </select>
        <form name="form1" enctype="multipart/form-data" action="upload_do.jsp" method="post">
            <div id="files"></div>
            <input type="submit" name="Submit" value="提交"/>
        </form>
    </body>
    <script language="javascript">
        //根据选择的文件数量构造文件输入框列表
        function buildFileInput() {
            //取得文件数量下拉列表值
            var num = document.all.number.value;
            //将现有的文件输入框清除
            clearFileInput();
            //构造出新的文件输入框列表
            for (var i = 0; i < num; i++) {
                //创建一个div标签节点
                filediv = document.createElement("div");
                //创建一个文本节点
                labeltext = document.createTextNode("第" + (i + 1) + "个文件：");
                //创建一个文件输入框节点
                fileinput = document.createElement("input");
                fileinput.type = "file";
                fileinput.name = "file" + i;
                //创建一个文本节点
                memotext = document.createTextNode(" 第" + (i + 1) + "个文件备注：");
                //创建一个文本输入框节点
                memoinput = document.createElement("input");
                memoinput.type = "text";
                memoinput.name = "memo" + i;
                //将文本节点追加成div标签节点的子节点
                filediv.appendChild(labeltext);
                //将文件输入框节点追加成div标签节点的子节点
                filediv.appendChild(fileinput);
                //将文本节点追加成div标签节点的子节点
                filediv.appendChild(memotext);
                //将文本输入框节点追加成div标签节点的子节点
                filediv.appendChild(memoinput);
                //将div标签节点追加成files的子节点
                document.all.files.appendChild(filediv);
            }
        }

        function clearFileInput() {	//将现有的文件输入框清除
            while (document.all.files.childNodes.length > 0)
                document.all.files.removeChild(document.all.files.childNodes[0]);
        }

        buildFileInput();//初始化文件输入框列表
    </script>

</html>
