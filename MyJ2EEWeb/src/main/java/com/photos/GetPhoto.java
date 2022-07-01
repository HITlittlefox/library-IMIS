package com.photos;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.UserBean;

//@WebServlet("/chap6/GetPhoto")
public class GetPhoto extends HttpServlet {
    public GetPhoto() {
        super();
    }

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
        response.setCharacterEncoding("gb2312");
        PrintWriter out = response.getWriter();
        String selected = request.getParameter("selected");


        int index = Integer.parseInt(selected);
        //返回相片给客户端
        //定义相册,并从数据库拿到图片地址列表
//        String[] photos = {"upload/photo1.jpg", "upload/20220415160912233.jpg"};
        String[] photos = new String[0];
        try {
            photos = doPhotos();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        out.println(photos[index]);
        out.flush();
        out.close();

    }

    @Override
    public void init() throws ServletException {
    }

    public String[] doPhotos() throws SQLException, ClassNotFoundException {
        UserBean connjava = new UserBean();
        Connection conn = null;


        conn = connjava.getConnection();

        Statement stmt = null;
        assert conn != null;
        stmt = conn.createStatement();

//        String photosSql = "select restore_path from pictures";
//        System.out.println("photosSql" + photosSql);
//
//        assert stmt != null;
//        stmt.execute(photosSql);
//        ResultSet rs = null;
//
//        rs = stmt.executeQuery(photosSql);


        String sql = "select * from pictures";//查询语句
        ResultSet rs = stmt.executeQuery(sql);//得到结果集
//        conn.commit();//事务提交
//        conn.setAutoCommit(true);// 更改jdbc事务的默认提交方式
        List<String> list = new ArrayList<String>();//创建取结果的列表，之所以使用列表，不用数组，因为现在还不知道结果有多少，不能确定数组长度，所有先用list接收，然后转为数组
        while (rs.next()) {//如果有数据，取第一列添加如list
            list.add(rs.getString(2));
        }
        String[] arr = new String[list.size()];//创建一个和list长度一样的数组

        if (list != null && list.size() > 0) {//如果list中存入了数据，转化为数组
            for (int i = 0; i < list.size(); i++) {
                arr[i] = list.get(i);//数组赋值了。
            }
            //输出数组
            for (int i = 0; i < arr.length; i++) {
                System.out.println(arr[i]);
            }

        }
        System.out.println("photos:" + Arrays.toString(arr));

//        assert rs != null;
//        System.out.println("rs:" + rs);
//        if (rs.next()) {
//            System.out.println(String.valueOf(rs.getString("restore_path")));
//        }


        //定义相册,并从数据库拿到图片地址列表
//        String[] photos = {"upload/photo1.jpg", "upload/20220415160912233.jpg"};
//        ResultSetMetaData md = null;
//
//
////        List list = new ArrayList();
//
//        //获取键名
//        md = rs.getMetaData();
//        System.out.println("md:" + md);
////
//        //获取行的数量
//        int columnCount = md.getColumnCount();
//        System.out.println("columnCount:" + columnCount);
////        String[] photos = new String[columnCount];
//        System.out.println("rowphotos:" + Arrays.toString(photos));
////        while (rs.next()) {}
//        //声明Map
////            Map rowData = new HashMap();
////            for (int i = 1; i <= columnCount; i++) {
////                //获取键名及值
////                rowData.put(md.getColumnName(i), rs.getObject(i));
////            }
////            list.add(rs.getString("restore_path"));
//        for (int i = 0; i < columnCount; i++) {
//
//            photos[i] = String.valueOf(rs.next());
//        }
//        String[] arrayofScores = null;
//        while (rs.next()) {
//            String score = rs.getString(1);
//            arrayofScores = score.split("\n");
//            for (int i = 0; i < columnCount - 1; i++) {
//                System.out.println(arrayofScores[i]);
//            }
//        }
//        System.out.println(photos);


//        for (int i = 0; i < columnCount - 1; i++) {
////            photos = new String[columnCount];
//            photos[i] = (String) list.get(i);
//        }

        return arr;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        GetPhoto getPhoto = new GetPhoto();
        String[] strings;
        strings = getPhoto.doPhotos();
        System.out.println(Arrays.toString(strings));
    }
}
