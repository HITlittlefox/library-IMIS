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
    <head><title>创建XML文件</title></head>
    <body>
        <h2>创建XML文件</h2>
        <hr>
        <%
            //            String sql = "select userName from users where userName ='" + name + "' and userPwd= '" + psd + "'";
            String tableName = "users";    //数据库表名
            String sql = "SELECT * FROM " + tableName;    //sql语句，遍历数据表的参数
            ResultSet rs = stmt.executeQuery(sql);    //执行sql语句并将数据表返回给ResultSet
            System.out.println(sql);
//            stmt.execute(sql);
//            rs.next();

        %>
        //创建table方便展示数据
        <table align="center" cellspacing="0" border="1">
            <tr>
                <th>id</th>
                <th>userName</th>
                <th>userPwd</th>
            </tr>
            <%--            //遍历数据表的行--%>
            <%while (rs.next()) { %>
            <tr>
                <td><%out.print(rs.getString(1));%></td>
                <%--                //显示数据表当前行的第1列--%>
                <td><%out.print(rs.getString(2));%></td>
                <%--                //显示数据表当前行的第2列--%>
                <td><%out.print(rs.getString(3));%></td>
                <%--                //显示数据表当前行的第3列--%>
            </tr>
            <% } %>
        </table>
        <%

            class CreateXML {
                public CreateXML() {
                }

                public Document create(String filename) { //产生一个XML文档并存盘

                    Document document = DocumentHelper.createDocument();
                    Element rootElement = document.addElement("linkmans");//创建根元素
                    //为根元素创建第一个子元素

                    Element firstElement = rootElement.addElement("linkman");
                    Element element1 = firstElement.addElement("id");
                    element1.setText("1");
                    Element element2 = firstElement.addElement("userName");
                    element2.setText("2");
                    Element element3 = firstElement.addElement("userPwd");
                    element3.setText("3");
                    
//                    //为根元素创建第二个子元素
//                    Element secondElement = rootElement.addElement("linkman");
//                    Element elementa = secondElement.addElement("name");
//                    elementa.setText("李四");
//                    Element elementb = secondElement.addElement("id");
//                    elementb.setText("002");
//                    Element elementc = secondElement.addElement("company");
//                    elementc.setText("B公司");
//                    Element elementd = secondElement.addElement("email");
//                    elementd.setText("li@bbb.com");
//                    Element elemente = secondElement.addElement("tel");
//                    elemente.setText("(010)12345678");
//                    Element elementf = secondElement.addElement("address");
//                    elementf.setText("北京市");
                    //将创建的XML文档存盘
                    try {
                        OutputFormat format = OutputFormat.createPrettyPrint();//创建一个格式化对象
                        format.setIndent("\t");//使用TAB缩进
                        //创建一个XMLWriter对象
                        XMLWriter output = new XMLWriter(new FileOutputStream(new File(filename)), format);
                        output.write(document);//将XML文档输出
                        output.close();
                    } catch (IOException e) {
                        System.out.println(e.getMessage());
                    }
                    //返回XML文档对象
                    return document;
                }

                //将文本串转换成XML文档并存盘
                public Document create(String filename, String text) throws Exception {
                    //使用DocumentHelper类将文本串转换为XML文档
                    Document document = DocumentHelper.parseText(text);
                    //将创建的XML文档存盘
                    try {
                        //创建一个格式化对象
                        OutputFormat format = OutputFormat.createPrettyPrint();
                        //使用TAB缩进
                        format.setIndent("\t");
                        //创建一个XMLWriter对象
                        XMLWriter output = new XMLWriter(new FileOutputStream(new File(filename)), format);
                        //将XML文档输出
                        output.write(document);
                        output.close();
                    } catch (IOException e) {
                        System.out.println(e.getMessage());
                    }
                    //返回XML文档对象
                    return document;
                }
            }

            CreateXML d = new CreateXML();
            //定义一个myfirst.xml文件的绝对物理路径
            String fileName1 = request.getRealPath("/") + "testXML1.xml";
            System.out.println("fileName1" + fileName1);
            //产生并保存myfirst.xml文件,取得该XML文档对象
            Document doc = d.create(fileName1);
            String reslut = doc.asXML();//暂存该XML文档的内容
        %>
        <textarea rows="10" cols="60"><%=reslut%></textarea>
        <%
            //创建一个符合XML文档语法的文本串
            StringBuffer text = new StringBuffer();
            text.append("<users>");
            text.append("<user>");
            text.append("<loginname>admin</loginname>");
            text.append("<password>123</password>");
            text.append("</user>");
            text.append("</users>");
            //以文本串为内容创建一个XML文档
            String fileName2 = request.getRealPath("/") + "testXML2.xml";
            System.out.println("fileName2" + fileName2);

//            doc = d.create(fileName2,rs, text.toString());
            reslut = doc.asXML();
        %>
        <textarea rows="10" cols="60"><%=reslut%></textarea>
    </body>
</html>
