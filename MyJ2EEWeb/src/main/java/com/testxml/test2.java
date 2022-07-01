package com.testxml;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.*;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.*;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

public class test2 {
    Connection conn = null;
    String sql;
    String url = "jdbc:mysql://localhost:3306/userdb?useSSL=false";

    public static void main(String[] args) {
        test2 test = new test2();
        test.xmlShow();
    }

    public String xmlShow() {
        String comps = null;
        try { // 链接数据库，取得数据
            // Class.forName("oracle.jdbc.driver.OracleDriver");//oracle数据库
            // mysql数据库
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

                org.w3c.dom.Element deptno = doc.createElement("CITY");// 城市
                deptno.appendChild(doc.createTextNode(String.valueOf(rs.getString(1))));
                person.appendChild(deptno);

                org.w3c.dom.Element dname = doc.createElement("WEATHER");// 天气
                dname.appendChild(doc.createTextNode(new test2().xmlReplace(rs.getString(2))));
                person.appendChild(dname);

                org.w3c.dom.Element loc = doc.createElement("TEM");// 温度
                loc.appendChild(doc.createTextNode(new test2().xmlReplace(rs.getString(3))));
                person.appendChild(loc);
                comp.appendChild(person);
            }
            rs.close();
            st.close();
            conn.close();
            doc.appendChild(comp);

////                ((XmlDocument) doc).write(new FileOutputStream("weathers.xml"));
//                (new DOMSource(doc), new StreamResult(new FileOutputStream("sql123.xml")));
//

            TransformerFactory tf = TransformerFactory.newInstance();


            Transformer t = tf.newTransformer();

            t.setOutputProperty(OutputKeys.INDENT, "yes");

            t.setOutputProperty(OutputKeys.METHOD, "xml");

            t.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "2");
            //执行上面的设置并且输出到文件中
            t.transform(new DOMSource(doc), new StreamResult(new FileOutputStream("sql123.xml")));

            System.out.println("生成XML文件成功!");


            comps = comp.toString();

            System.out.println(comp);// 打印数据
            System.out.println("操作成功！！！");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e1) {
            e1.printStackTrace();
        } catch (ParserConfigurationException e2) {
            e2.printStackTrace();
        } /*
         * catch (FileNotFoundException e3) { e3.printStackTrace(); } catch (IOException
         * e4) { e4.printStackTrace(); }
         */ catch (TransformerConfigurationException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (TransformerException e) {
            e.printStackTrace();
        }
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


