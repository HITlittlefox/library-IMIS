<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.db.UserBean" %>
<%@ page import="com.photos.GetPhotoNumber" %>
<%

    //    Class.forName("com.mysql.cj.jdbc.Driver");
//    String url = "jdbc:mysql://localhost:3306/userdb?useSSL=false";
//    Connection conn = DriverManager.getConnection(url, "root", "1234");
//    Statement stmt = conn.createStatement();

    UserBean connjava = new UserBean();
    Connection conn = connjava.getConnection();
    Statement stmt = conn.createStatement();

%>

<html>
    <head>
        <title>登录检查页面</title>
    </head>
    <body>

        <%
            String name = request.getParameter("user");
            String psd = request.getParameter("pwd");

//            //在这里加塞一些代码，帮助后面photos获取照片数量
//            String photo_amount_sql = "select restore_path from pictures where userName";
//            System.out.println(photo_amount_sql);
//            stmt.execute(photo_amount_sql);
//            ResultSet rs = stmt.executeQuery(photo_amount_sql);
//


            //todo:(已完成)通过userName拿到userName，然后把userName传到下一个页面

            String sql = "select userName from users where userName ='" + name + "' and userPwd= '" + psd + "'";
            System.out.println(sql);
            stmt.execute(sql);
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {

//                存到session
                session.setAttribute("userName", String.valueOf(rs.getString("userName")));
//                从session取得名字并?追加到main.jsp后面
                session.getAttribute("userName");
//                request.getSession().setAttribute("sessionname",username);     //用Session保存用户名
//                request.getSession().setAttribute("sessionpwd",password);        //保存密码

//                response.sendRedirect("main.jsp?userName=" + rs.getString("userName") + "");
                stmt.close();
                conn.close();
                response.sendRedirect("main.jsp?userName=" + session.getAttribute("userName") + "");

            } else {
                stmt.close();
                conn.close();
                //如果数据库中没有这个username，则返回登录页面并传输一个标记为否
                System.out.println("nono");
                response.sendRedirect("login.jsp");
            }
        %>
    </body>

</html>
