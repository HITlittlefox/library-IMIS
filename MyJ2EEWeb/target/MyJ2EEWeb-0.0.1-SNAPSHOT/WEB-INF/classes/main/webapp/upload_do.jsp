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
    <head><title>�����ϴ����ļ�</title></head>
    <body>
        <h2>�����ϴ����ļ�</h2>
        <hr>
        <%
            /*******************************************************/
            /*    ����ʵ���о����ܶ���õ���һЩ��������ʵ��Ӧ����            */
            /*     ���ǿ��Ը����Լ�����Ҫ����ȡ�ᣡ                         */
            /*******************************************************/
            // �½�һ��SmartUpload����,�����Ǳ����
            SmartUpload myupload = new SmartUpload();
            // ��ʼ��,�����Ǳ����
            myupload.initialize(pageContext);
            // ����ÿ���ϴ��ļ�����󳤶�
            myupload.setMaxFileSize(1024 * 1024);
            // �������ϴ����ݵĳ���
            myupload.setTotalMaxFileSize(5 * 1024 * 1024);
            // �趨�����ϴ����ļ���ͨ����չ�����ƣ�
            myupload.setAllowedFilesList("jpg,gif,jpeg,png");
            // �趨��ֹ�ϴ����ļ���ͨ����չ�����ƣ�
            myupload.setDeniedFilesList("exe,bat,jsp,htm,html");

            try {
                myupload.upload();  //�ϴ��ļ�,�����Ǳ����
                int count = myupload.getFiles().getCount();    //ͳ���ϴ��ļ�������
                Request myRequest = myupload.getRequest();  //ȡ��Request����
                String rndFilename, fileExtName, fileName, filePathName, memo;
                java.util.Date dt = null;
                SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddHHmmssSSS");
                for (int i = 0; i < count; i++) {//��һ��ȡ�ϴ��ļ���Ϣ��ͬʱ�ɱ����ļ�
                    File file = myupload.getFiles().getFile(i);    //ȡ��һ���ϴ��ļ�
                    if (file.isMissing()) continue;    //���ļ������������
                    fileName = file.getFileName();//ȡ���ļ���
                    filePathName = file.getFilePathName(); //ȡ���ļ�ȫ��
                    fileExtName = file.getFileExt();// ȡ���ļ���չ��
                    dt = new java.util.Date(System.currentTimeMillis()); //ȡ������ļ���
                    Thread.sleep(100);
                    rndFilename = fmt.format(dt) + "." + fileExtName;
                    memo = myRequest.getParameter("memo" + i);

                    //��ʾ��ǰ�ļ���Ϣ
                    out.println("��" + (i + 1) + "���ļ����ļ���Ϣ��<br>");
                    out.println("�ļ���Ϊ��" + fileName + "<br>");
                    out.println("�ļ���չ��Ϊ��" + fileExtName + "<br>");
                    out.println("�ļ�ȫ��Ϊ��" + filePathName + "<br>");
                    out.println("�ļ���СΪ��" + file.getSize() + "�ֽ�<br>");
                    out.println("�ļ���עΪ��" + memo + "<br>");
                    out.println("�ļ�����ļ���Ϊ��" + rndFilename + "<br><br>");
                    //���ļ����,��Ӧ�õĸ�Ŀ¼��Ϊ�ϴ��ļ��ĸ�Ŀ¼����ȷ��Ŀ¼���ڣ�
                    String restore_path = "C:/Users/96361/Workspaces/MyEclipse CI/MyJ2EEWeb/src/main/webapp/upload/" + rndFilename;
                    System.out.println("restore_path:" + restore_path);
//                    file.saveAs("C:/Users/96361/Workspaces/MyEclipse CI/MyJ2EEWeb/upload/" + rndFilename, myupload.SAVE_PHYSICAL);
                    file.saveAs(restore_path, myupload.SAVE_PHYSICAL);


                    String pic_insert = "INSERT INTO pictures (pic_name, restore_path) VALUES ('" + rndFilename + "', '" + restore_path + "')";
                    System.out.println(pic_insert);
                    stmt.execute(pic_insert);
                }
                out.println(count + "���ļ��ϴ��ɹ���<br>");
            } catch (Exception ex) {
                out.println("�ϴ��ļ������������������ϴ�ʧ��!<br>");
                out.println("����ԭ��<br>" + ex.toString());
            }
        %>
    </body>
</html>
