package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/com.servlet.CheckUser")
public class UserServlet extends HttpServlet {
    @Override
    public void destroy() {
        super.destroy();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        //这里假设已经注册过了四位用户
//        String[] logined = {"admin", "users", "dywdyw", "liubin"};
        String[] logined = mysqlConnection();
        //接收从客户端提交的loginName参数
        String loginName = request.getParameter("loginName");
        //创建一个存放响应内容的字符串
        String responseContext = "true";
        for (int i = 0; i < logined.length; i++) {
            //遍历已注册用户列表，如果发现提交的注册名已存在，则修改响应内容
            if (loginName.equals(logined[i])) responseContext = "false";
        }
        //将处理结果返回给客户端
        out.println(responseContext);
        out.flush();
        out.close();
    }

    @Override
    public void init() throws ServletException {
    }

    public String[] mysqlConnection() {
        String[] arr = new String[0];
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/userdb?useSSL=false";
            Connection conn = DriverManager.getConnection(url, "root", "1234");
            Statement stmt = conn.createStatement();
            // 更改jdbc事务的默认提交方式
            conn.setAutoCommit(false);
            //查询语句
            String sql = "select userName from users";
            //得到结果集
            ResultSet rs = stmt.executeQuery(sql);
            //事务提交
            conn.commit();
            // 更改jdbc事务的默认提交方式
            conn.setAutoCommit(true);
            //创建取结果的列表，之所以使用列表，不用数组，因为现在还不知道结果有多少，不能确定数组长度，所有先用list接收，然后转为数组
            List<String> list = new ArrayList<String>();
            //如果有数据，取第一列添加如list
            while (rs.next()) {
                list.add(rs.getString(1));
            }
            //如果list中存入了数据，转化为数组
            arr = new String[list.size()];
            //数组赋值了。
            if (list != null && list.size() > 0) {
                //创建一个和list长度一样的数组
                for (int i = 0; i < list.size(); i++) {
                    arr[i] = list.get(i);
                }
                //输出数组
                for (int i = 0; i < arr.length; i++) {
                    System.out.println("user names are here: " + arr[i]);
                }
            }
//            return arr;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }


        return arr;
    }

}
