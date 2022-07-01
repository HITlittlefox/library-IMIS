<%@ page language="java" import="java.util.*" pageEncoding="gb2312" %>
<%@ page import="com.jspsmart.upload.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.sql.*" %>
<%

    Class.forName("com.mysql.cj.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/userdb?useSSL=false";
    Connection conn = DriverManager.getConnection(url, "root", "1234");
    Statement stmt = conn.createStatement();

%>
<html>
    <head><title>处理上传的文件</title></head>
    <body>
        <h2>处理上传的文件</h2>
        <hr>
        <%
            /*******************************************************/
            /*    　该实例中尽可能多地用到了一些方法，在实际应用中            */
            /*     我们可以根据自己的需要进行取舍！                         */
            /*******************************************************/
            // 新建一个SmartUpload对象,此项是必须的
            SmartUpload myupload = new SmartUpload();
            // 初始化,此项是必须的
            myupload.initialize(pageContext);
            // 限制每个上传文件的最大长度
            myupload.setMaxFileSize(1024 * 1024);
            // 限制总上传数据的长度
            myupload.setTotalMaxFileSize(5 * 1024 * 1024);
            // 设定允许上传的文件（通过扩展名限制）
            myupload.setAllowedFilesList("jpg,gif,jpeg,png");
            // 设定禁止上传的文件（通过扩展名限制）
            myupload.setDeniedFilesList("exe,bat,jsp,htm,html");

            try {
                myupload.upload();  //上传文件,此项是必须的
                int count = myupload.getFiles().getCount();    //统计上传文件的总数
                Request myRequest = myupload.getRequest();  //取得Request对象
                String rndFilename, fileExtName, fileName, filePathName, memo;
                java.util.Date dt = null;
                SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddHHmmssSSS");
                for (int i = 0; i < count; i++) {//逐一提取上传文件信息，同时可保存文件
                    File file = myupload.getFiles().getFile(i);    //取得一个上传文件
                    if (file.isMissing()) continue;    //若文件不存在则继续
                    fileName = file.getFileName();//取得文件名
                    filePathName = file.getFilePathName(); //取得文件全名
                    fileExtName = file.getFileExt();// 取得文件扩展名
                    dt = new java.util.Date(System.currentTimeMillis()); //取得随机文件名
                    Thread.sleep(100);
                    rndFilename = fmt.format(dt) + "." + fileExtName;
                    memo = myRequest.getParameter("memo" + i);

                    //显示当前文件信息
                    out.println("第" + (i + 1) + "个文件的文件信息：<br>");
                    out.println("文件名为：" + fileName + "<br>");
                    out.println("文件扩展名为：" + fileExtName + "<br>");
                    out.println("文件全名为：" + filePathName + "<br>");
                    out.println("文件大小为：" + file.getSize() + "字节<br>");
                    out.println("文件备注为：" + memo + "<br>");
                    out.println("文件随机文件名为：" + rndFilename + "<br><br>");
                    //将文件另存,以应用的根目录作为上传文件的根目录（需确保目录存在）
                    String restore_path = "C:/Users/96361/Workspaces/MyEclipse CI/MyJ2EEWeb/src/main/webapp/upload/" + rndFilename;
                    System.out.println("restore_path:" + restore_path);
//                    file.saveAs("C:/Users/96361/Workspaces/MyEclipse CI/MyJ2EEWeb/upload/" + rndFilename, myupload.SAVE_PHYSICAL);
                    file.saveAs(restore_path, myupload.SAVE_PHYSICAL);


                    String pic_insert = "INSERT INTO pictures (pic_name, restore_path) VALUES ('" + rndFilename + "', '" + restore_path + "')";
                    System.out.println(pic_insert);
                    stmt.execute(pic_insert);
                }
                out.println(count + "个文件上传成功！<br>");
            } catch (Exception ex) {
                out.println("上传文件超过了限制条件，上传失败!<br>");
                out.println("错误原因：<br>" + ex.toString());
            }
        %>
    </body>
</html>
