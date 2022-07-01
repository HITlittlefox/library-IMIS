<%@ page language="java" import="com.jspsmart.upload.*" pageEncoding="gb2312" %>
<%
    // 新建一个SmartUpload对象,此项是必须的
    SmartUpload myupload = new SmartUpload();
    myupload.initialize(pageContext);    // 初始化,此项是必须的
    String op = request.getParameter("op");// 取得请求参数
    try {
        //设定contentDisposition为null以禁止浏览器自动打开文件，
        myupload.setContentDisposition(null);
        if (op.equals("en")) {//下载文件
            myupload.downloadFile("/WEB-INF/web.xml");
        } else {
            // 解决下载文件的中文问题
            String descFileName = "Web应用配置文件.xml";
            byte[] b = descFileName.getBytes();
            char[] c = new char[b.length];
            for (int x = 0; x < b.length; x++) c[x] = (char) (b[x] & 0x00FF);
            descFileName = new String(c);
            myupload.downloadFile("/WEB-INF/web.xml", "text/xml", descFileName);
        }
    } catch (Exception ex) {
        System.out.println("下载文件失败!<br>");
        out.println("下载文件失败!<br>");
        out.println("错误原因：<br>" + ex.toString());
    }
    out.clear();
    out = pageContext.pushBody();
%>
