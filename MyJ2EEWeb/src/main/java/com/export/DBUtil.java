package com.export;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import java.sql.*;

public class DBUtil {
    public static final String IP = "localhost";
    public static final String username = "root";
    public static final String password = "1234";
    public static final String port = "3306";
    public static final String hostname = "userdb";
    public static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    public static final String DB_URL = "jdbc:mysql://localhost:3306/database";


//    Class.forName("com.mysql.cj.jdbc.Driver");
//    String database = "userdb";
//    String password = "1234";
//    String user = "root";
//    String url = "jdbc:mysql://localhost:3306/" + database + "?useSSL=false&serverTimezone=GMT" + "&user=" + user + "&password=" + password;
//    Connection conn = DriverManager.getConnection(url, user, password);
////        Statement stmt = conn.createStatement();
//        return conn;


    public static BasicDataSource basicDataSource = null;

    static {
        basicDataSource = new BasicDataSource();
        basicDataSource.setDriverClassName(JDBC_DRIVER);
        basicDataSource.setUrl(DB_URL);
        basicDataSource.setUsername(username);
        basicDataSource.setPassword(password);
    }

    public static Connection getConn() {
        try {
            return basicDataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void release(Connection conn, Statement stat, ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (stat != null) {
            try {
                stat.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}


