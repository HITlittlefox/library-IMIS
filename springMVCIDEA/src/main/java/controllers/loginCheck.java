//package controllers;
//
//import java.sql.*;
//
//import com.db.UserBean;
//
//public class loginCheck {
//    public loginCheck() throws SQLException, ClassNotFoundException {
//        UserBean connjava = new UserBean();
//        Connection conn = connjava.getConnection();
//        Statement stmt = conn.createStatement();
//        String name = request.getParameter("user");
//        String psd = request.getParameter("pwd");
//
//        //todo:(已完成)通过userName拿到userName，然后把userName传到下一个页面
//
//        String sql = "select userName from users where userName ='" + name + "' and userPwd= '" + psd + "'";
//        System.out.println(sql);
//        stmt.execute(sql);
//        ResultSet rs = stmt.executeQuery(sql);
//        if (rs.next()) {
//
////                存到session
//            session.setAttribute("userName", String.valueOf(rs.getString("userName")));
////                从session取得名字并?追加到main.jsp后面
//            session.getAttribute("userName");
////                request.getSession().setAttribute("sessionname",username);     //用Session保存用户名
////                request.getSession().setAttribute("sessionpwd",password);        //保存密码
//
////                response.sendRedirect("main_12_2_6.jsp?userName=" + rs.getString("userName") + "");
//
//            response.sendRedirect("main_12_2_6.jsp?userName=" + session.getAttribute("userName") + "");
//
//        } else {
//
//            //如果数据库中没有这个username，则返回登录页面并传输一个标记为否
//            System.out.println("nono");
//            response.sendRedirect("login_12_3_5.jsp");
//        }
//    }
//}
//
