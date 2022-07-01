package com.testxml;

import java.sql.DriverManager;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class test {

    public static void main(String args[]) throws Exception {


        String sql;


        Connection conn = null;
        try {


            System.out.println("成功加载MySQL驱动程序");


            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/userdb?useSSL=false";
            conn = DriverManager.getConnection(url, "root", "1234");
            Statement stmt = conn.createStatement();

            sql = "select * from users";

            ResultSet rs = stmt.executeQuery(sql);

            System.out.println("查询人员资料：");

            DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();

            Document doc = builder.newDocument();

            Element root = doc.createElement("Info");

            doc.appendChild(root);
            while (rs.next()) {


                Element people = doc.createElement("People");

                System.out.println(rs.getString(1) + "\t" + rs.getString(2) + "\t" + rs.getString(3) + "\t" + rs.getString(3));

                Element no = doc.createElement("no");

                no.appendChild(doc.createTextNode(rs.getString(1)));

                people.appendChild(no);

                Element name = doc.createElement("name");

                name.appendChild(doc.createTextNode(rs.getString(2)));

                people.appendChild(name);

                Element sex = doc.createElement("sex");

                sex.appendChild(doc.createTextNode(rs.getString(3)));

                people.appendChild(sex);


            }

            TransformerFactory tf = TransformerFactory.newInstance();
            try {


                Transformer t = tf.newTransformer();

                t.setOutputProperty(OutputKeys.INDENT, "yes");

                t.setOutputProperty(OutputKeys.METHOD, "xml");

                t.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "2");
                //执行上面的设置并且输出到文件中
                t.transform(new DOMSource(doc), new StreamResult(new FileOutputStream("sql123.xml")));

                System.out.println("生成XML文件成功!");

            } catch (Exception e) {


                e.printStackTrace();

            }

        } catch (SQLException e) {


            System.out.println("MySql操作错误");

            e.printStackTrace();

        } catch (Exception e) {


            e.printStackTrace();

        } finally {


            conn.close();

        }

    }

}


