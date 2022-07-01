<%@ page contentType="text/html" pageEncoding="gb2312" %>
<%@ page import="org.dom4j.*, java.util.*" %>
<%@ page import="org.dom4j.io.OutputFormat" %>
<%@ page import="org.dom4j.io.XMLWriter" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="org.w3c.dom.Element" %>
<%@ page import="javax.xml.parsers.ParserConfigurationException" %>
<%@ page import="javax.xml.transform.dom.DOMSource" %>
<%@ page import="javax.xml.transform.stream.StreamResult" %>
<%@ page import="javax.xml.transform.*" %>
<%@ page import="java.io.FileNotFoundException" %>
<%--<%@ page import="org.apache.crimson.tree.XmlDocument" %>--%>

<%--<jsp:useBean id="myCreate" class="CreateXML"/>--%>
<%

    //    Class.forName("com.mysql.cj.jdbc.Driver");
//    String url = "jdbc:mysql://localhost:3306/userdb?useSSL=false";
//    Connection conn = DriverManager.getConnection(url, "root", "1234");
//    Statement stmt = conn.createStatement();
%>

<html>
    <head><title>����XML�ļ�</title></head>
    <body>
        <%
            class Test {
                Connection conn = null;
                String sql;
                String url = "jdbc:mysql://localhost:3306/userdb?useSSL=false";

                public void main(String[] args) {
                    Test test = new Test();
                    test.xmlShow();
                }

                public String xmlShow() {
                    String comps = null;
                    try { // �������ݿ⣬ȡ������
                        // Class.forName("oracle.jdbc.driver.OracleDriver");//oracle���ݿ�
                        // mysql���ݿ�
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        conn = DriverManager.getConnection(url, "root", "1234");
                        Statement st = conn.createStatement();
                        ResultSet rs = st.executeQuery("select * from users");

                        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                        DocumentBuilder builder = factory.newDocumentBuilder();
                        org.w3c.dom.Document doc = builder.newDocument();

                        org.w3c.dom.Element comp = doc.createElement("COMP");

                        while (rs.next()) {
                            org.w3c.dom.Element person = doc.createElement("PERSON");

                            org.w3c.dom.Element deptno = doc.createElement("CITY");// ����
                            deptno.appendChild(doc.createTextNode(String.valueOf(rs.getString(1))));
                            person.appendChild(deptno);

                            org.w3c.dom.Element dname = doc.createElement("WEATHER");// ����
                            dname.appendChild(doc.createTextNode(new Test().xmlReplace(rs.getString(2))));
                            person.appendChild(dname);

                            org.w3c.dom.Element loc = doc.createElement("TEM");// �¶�
                            loc.appendChild(doc.createTextNode(new Test().xmlReplace(rs.getString(3))));
                            person.appendChild(loc);
                            comp.appendChild(person);
                        }
                        rs.close();
                        st.close();
                        conn.close();
                        doc.appendChild(comp);
                        TransformerFactory tf = TransformerFactory.newInstance();


                        Transformer t = null;
                        try {
                            t = tf.newTransformer();
                        } catch (TransformerConfigurationException e) {
                            e.printStackTrace();
                        }

                        t.setOutputProperty(OutputKeys.INDENT, "yes");

                        t.setOutputProperty(OutputKeys.METHOD, "xml");

                        t.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "2");
                        //ִ����������ò���������ļ���
                        try {
                            t.transform(new DOMSource(doc), new StreamResult(new FileOutputStream("sql123.xml")));
                        } catch (TransformerException | FileNotFoundException e) {
                            e.printStackTrace();
                        }

                        System.out.println("����XML�ļ��ɹ�!");

                        comps = comp.toString();

                        System.out.println(comp);// ��ӡ����
                        System.out.println("�����ɹ�������");
                    } catch (ClassNotFoundException e) {
                        e.printStackTrace();
                    } catch (SQLException e1) {
                        e1.printStackTrace();
                    } catch (ParserConfigurationException e2) {
                        e2.printStackTrace();
                    } /*
                     * catch (FileNotFoundException e3) { e3.printStackTrace(); } catch (IOException
                     * e4) { e4.printStackTrace(); }
                     */
                    System.out.print("!!!!!" + comps + "!!!!!");
                    return comps;
                }

                public String xmlReplace(String value) {
                    //value=value.replace("&", "&");
//   value=value.replace("<", "<");
//   value=value.replace(">", ">");
//   value=value.replace("'", "'");
                    value = value.replace("<", "<");
                    value = value.replace(">", ">");
                    value = value.replace("'", "'");
// value.replace("""", """);

                    return value;
                }

            }

        %>
        <p>�Ӳ˵����뱾ҳ��󣬻�ȥ���ݿ�������ݲ�����xml</p>
    </body>
</html>
