package com.export;

import com.alibaba.fastjson.JSON;

import javax.xml.registry.infomodel.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.lang.Object;


public class test {
    //    Pass the resultset and your keyname into argument and get the Json String in response.
    public String getJSONFromResultSet(ResultSet rs, String keyName) {


        String json = new String();
        List list = new ArrayList();
        if (rs != null) {
            try {
                ResultSetMetaData metaData = rs.getMetaData();
                while (rs.next()) {
                    Map<String, Object> columnMap = new HashMap<String, Object>();
                    for (int columnIndex = 1; columnIndex <= metaData.getColumnCount(); columnIndex++) {
                        if (rs.getString(metaData.getColumnName(columnIndex)) != null)
                            columnMap.put(metaData.getColumnLabel(columnIndex), rs.getString(metaData.getColumnName(columnIndex)));
                        else
                            columnMap.put(metaData.getColumnLabel(columnIndex), "");
                    }
                    list.add(columnMap);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
//            json.put(keyName, list);
            json = JSON.toJSONString(list);

        }

        return json;
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/userdb?useSSL=false";
        Connection conn = DriverManager.getConnection(url, "root", "1234");
        Statement stmt = conn.createStatement();
        String userList = "userList";
        String sql_userName = "select * from userdb.users";
        System.out.println(sql_userName);
        stmt.execute(sql_userName);
        ResultSet rs = stmt.executeQuery(sql_userName);
        test test = new test();
        System.out.println(test.getJSONFromResultSet(rs, userList));
        System.out.println(test.getJSONFromResultSet(rs, userList).getClass());
    }
}
//{null=[{userPwd=admin12345_, id=1, userName=admin}, {userPwd=test, id=2, userName=test}, {userPwd=admin12345_, id=3, userName=admin1}, {userPwd=6, id=4, userName=5}, {userPwd=6, id=5, userName=5}, {userPwd=admin12345_, id=6, userName=admin2222}, {userPwd=admin12345_, id=7, userName=admin}, {userPwd=admin12345_, id=8, userName=admin8}, {userPwd=admin12312_, id=9, userName=admin}, {userPwd=admin12345_, id=10, userName=admin10}, {userPwd=admin12345_, id=11, userName=admin11}, {userPwd=admin12345_, id=12, userName=admin12}, {userPwd=admin12345_, id=13, userName=admin13}, {userPwd=1234123_213, id=14, userName=admin}, {userPwd=adsad, id=15, userName=admin}]}
