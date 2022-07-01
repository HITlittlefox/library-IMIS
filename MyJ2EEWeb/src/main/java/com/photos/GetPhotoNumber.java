package com.photos;


import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetPhotoNumber {
    public int returnphotonumber() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String database = "userdb";
        String password = "1234";
        String user = "root";
        String url = "jdbc:mysql://localhost:3306/" + database + "?useSSL=false&serverTimezone=GMT" + "&user=" + user + "&password=" + password;
        Connection conn = DriverManager.getConnection(url, user, password);
        Statement stmt = conn.createStatement();
//        // 更改jdbc事务的默认提交方式
        conn.setAutoCommit(false);
        //查询语句
        String sql = "select * from pictures";
        //得到结果集
        ResultSet rs = stmt.executeQuery(sql);
        conn.commit();//事务提交
        // 更改jdbc事务的默认提交方式
//        conn.setAutoCommit(true);
        //创建取结果的列表，之所以使用列表，不用数组，因为现在还不知道结果有多少，不能确定数组长度，所有先用list接收，然后转为数组
        List<String> list = new ArrayList<String>();
        //如果有数据，取第一列添加如list
        while (rs.next()) {
            list.add(rs.getString(1));
        }
        //如果list中存入了数据，转化为数组
//        System.out.println("photonumber:" + list.size());
        if (list != null && list.size() > 0) {
            //创建一个和list长度一样的数组
            String[] arr = new String[list.size()];
            for (int i = 0; i < list.size(); i++) {
                //数组赋值了。
                arr[i] = list.get(i);
            }
            //输出数组
            for (int i = 0; i < arr.length; i++) {
//                System.out.println(arr[i]);
            }
        }
        return list.size();

    }

    public static void main(String[] args) throws Exception {
        GetPhotoNumber getPhotoNumber = new GetPhotoNumber();
        System.out.println("photonumber:" + getPhotoNumber.returnphotonumber());
    }

}
