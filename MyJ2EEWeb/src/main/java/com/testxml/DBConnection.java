package com.testxml;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class DBConnection {
    String Driver = "com.mysql.jdbc.Driver";
    String Url = "jdbc:mysql://localhost:3306/userdb?useSSL=false";//xml为数据源
    String Name = "root";
    String Pwd = "1234";

    public Connection getConnection() throws SQLException, ClassNotFoundException {
        Connection conn = null;

        try {
            Class.forName(Driver);
            conn = DriverManager.getConnection(Url, Name, Pwd);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    public ResultSet sqlUser() throws SQLException, ClassNotFoundException {
        getConnection();
        String sql = "select * from users";
        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection conn = null;
        conn = DriverManager.getConnection(Url, Name, Pwd);
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery(sql);
        return rs;
    }
}
