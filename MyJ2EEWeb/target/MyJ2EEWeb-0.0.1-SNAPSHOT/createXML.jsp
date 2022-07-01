<%@ page contentType="text/html" pageEncoding="gb2312" %>
<%@ page import="org.dom4j.*, java.util.*" %>
<%@ page import="org.dom4j.io.OutputFormat" %>
<%@ page import="org.dom4j.io.XMLWriter" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.*" %>

<%--<jsp:useBean id="myCreate" class="com.testxml.CreateXML"/>--%>
<%

    Class.forName("com.mysql.cj.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/userdb?useSSL=false";
    Connection conn = DriverManager.getConnection(url, "root", "1234");
    Statement stmt = conn.createStatement();
%>

<html>
    <head><title>����XML�ļ�</title></head>
    <body>
        <h2>����XML�ļ�</h2>
        <hr>
        <%
            //            String sql = "select userName from users where userName ='" + name + "' and userPwd= '" + psd + "'";
            String tableName = "users";    //���ݿ����
            String sql = "SELECT * FROM " + tableName;    //sql��䣬�������ݱ�Ĳ���
            ResultSet rs = stmt.executeQuery(sql);    //ִ��sql��䲢�����ݱ��ظ�ResultSet
            System.out.println(sql);
//            stmt.execute(sql);
//            rs.next();

        %>
        //����table����չʾ����
        <table align="center" cellspacing="0" border="1">
            <tr>
                <th>id</th>
                <th>userName</th>
                <th>userPwd</th>
            </tr>
            <%--            //�������ݱ����--%>
            <%while (rs.next()) { %>
            <tr>
                <td><%out.print(rs.getString(1));%></td>
                <%--                //��ʾ���ݱ�ǰ�еĵ�1��--%>
                <td><%out.print(rs.getString(2));%></td>
                <%--                //��ʾ���ݱ�ǰ�еĵ�2��--%>
                <td><%out.print(rs.getString(3));%></td>
                <%--                //��ʾ���ݱ�ǰ�еĵ�3��--%>
            </tr>
            <% } %>
        </table>
        <%

            class CreateXML {
                public CreateXML() {
                }

                public Document create(String filename) { //����һ��XML�ĵ�������

                    Document document = DocumentHelper.createDocument();
                    Element rootElement = document.addElement("linkmans");//������Ԫ��
                    //Ϊ��Ԫ�ش�����һ����Ԫ��

                    Element firstElement = rootElement.addElement("linkman");
                    Element element1 = firstElement.addElement("id");
                    element1.setText("1");
                    Element element2 = firstElement.addElement("userName");
                    element2.setText("2");
                    Element element3 = firstElement.addElement("userPwd");
                    element3.setText("3");
                    
//                    //Ϊ��Ԫ�ش����ڶ�����Ԫ��
//                    Element secondElement = rootElement.addElement("linkman");
//                    Element elementa = secondElement.addElement("name");
//                    elementa.setText("����");
//                    Element elementb = secondElement.addElement("id");
//                    elementb.setText("002");
//                    Element elementc = secondElement.addElement("company");
//                    elementc.setText("B��˾");
//                    Element elementd = secondElement.addElement("email");
//                    elementd.setText("li@bbb.com");
//                    Element elemente = secondElement.addElement("tel");
//                    elemente.setText("(010)12345678");
//                    Element elementf = secondElement.addElement("address");
//                    elementf.setText("������");
                    //��������XML�ĵ�����
                    try {
                        OutputFormat format = OutputFormat.createPrettyPrint();//����һ����ʽ������
                        format.setIndent("\t");//ʹ��TAB����
                        //����һ��XMLWriter����
                        XMLWriter output = new XMLWriter(new FileOutputStream(new File(filename)), format);
                        output.write(document);//��XML�ĵ����
                        output.close();
                    } catch (IOException e) {
                        System.out.println(e.getMessage());
                    }
                    //����XML�ĵ�����
                    return document;
                }

                //���ı���ת����XML�ĵ�������
                public Document create(String filename, String text) throws Exception {
                    //ʹ��DocumentHelper�ཫ�ı���ת��ΪXML�ĵ�
                    Document document = DocumentHelper.parseText(text);
                    //��������XML�ĵ�����
                    try {
                        //����һ����ʽ������
                        OutputFormat format = OutputFormat.createPrettyPrint();
                        //ʹ��TAB����
                        format.setIndent("\t");
                        //����һ��XMLWriter����
                        XMLWriter output = new XMLWriter(new FileOutputStream(new File(filename)), format);
                        //��XML�ĵ����
                        output.write(document);
                        output.close();
                    } catch (IOException e) {
                        System.out.println(e.getMessage());
                    }
                    //����XML�ĵ�����
                    return document;
                }
            }

            CreateXML d = new CreateXML();
            //����һ��myfirst.xml�ļ��ľ�������·��
            String fileName1 = request.getRealPath("/") + "testXML1.xml";
            System.out.println("fileName1" + fileName1);
            //����������myfirst.xml�ļ�,ȡ�ø�XML�ĵ�����
            Document doc = d.create(fileName1);
            String reslut = doc.asXML();//�ݴ��XML�ĵ�������
        %>
        <textarea rows="10" cols="60"><%=reslut%></textarea>
        <%
            //����һ������XML�ĵ��﷨���ı���
            StringBuffer text = new StringBuffer();
            text.append("<users>");
            text.append("<user>");
            text.append("<loginname>admin</loginname>");
            text.append("<password>123</password>");
            text.append("</user>");
            text.append("</users>");
            //���ı���Ϊ���ݴ���һ��XML�ĵ�
            String fileName2 = request.getRealPath("/") + "testXML2.xml";
            System.out.println("fileName2" + fileName2);

//            doc = d.create(fileName2,rs, text.toString());
            reslut = doc.asXML();
        %>
        <textarea rows="10" cols="60"><%=reslut%></textarea>
    </body>
</html>
