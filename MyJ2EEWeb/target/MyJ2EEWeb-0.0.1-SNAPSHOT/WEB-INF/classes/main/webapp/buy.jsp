<%@ page language="java" import="java.util.*" pageEncoding="gb2312" %>
<%@ page import="java.sql.*" %>
<%
    Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
    String url = "jdbc:mysql://localhost:3306/userdb?useSSL=false";
    Connection conn = DriverManager.getConnection(url, "root", "1234");
    PreparedStatement pstat = null;
    ResultSet rs = null;
    String sql = null;
    String op = request.getParameter("op");
    if (op.equals("add")) {//将商品放入购物车
        //从商品库中取出所选购商品的数据
        String sp_No = request.getParameter("sp_No");
        String sp_Name = null, sp_Price = null;
        sql = "select * from shop where sp_No=?";
        pstat = conn.prepareStatement(sql);
        pstat.setString(1, sp_No);
        rs = pstat.executeQuery();
        if (rs.next()) {
            sp_Name = rs.getString("sp_Name").trim();
            sp_Price = rs.getString("sp_Price").trim();
        }

        rs.close();
        //将所选购商品加入到购物车中
        sql = "insert into cart(sp_Name,sp_Price,buy_Num,buy_Count) values(?,?,?,?)";
        pstat = conn.prepareStatement(sql);
        pstat.setString(1, sp_Name);
        pstat.setString(2, sp_Price);
        pstat.setInt(3, 1);
        pstat.setString(4, sp_Price);
        pstat.executeUpdate();
        pstat.close();
        conn.close();
        response.sendRedirect("cart.jsp"); //重定向到购物车页面
    }
    if (op.equals("update")) {//更改商品的数量
        int id = Integer.parseInt(request.getParameter("id"));
        int num = Integer.parseInt(request.getParameter("num"));
        double price = Double.parseDouble(request.getParameter("price"));
        sql = "update cart set buy_Num = ?, buy_Count = ? where id=?";
        pstat = conn.prepareStatement(sql);
        pstat.setInt(1, num);
        pstat.setString(2, new Double(price * num).toString());
        pstat.setInt(3, id);
        pstat.executeUpdate();
        pstat.close();
        conn.close();
        response.sendRedirect("cart.jsp");//重定向到购物车页面
    }
    if (op.equals("del")) {//将商品退回到商品架(将商品从购物车中删除)
        int id = Integer.parseInt(request.getParameter("id"));
        sql = "delete from cart where id=?";
        pstat = conn.prepareStatement(sql);
        pstat.setInt(1, id);
        pstat.executeUpdate();
        pstat.close();
        conn.close();
        response.sendRedirect("cart.jsp");//重定向到购物车页面
    }
    if (op.equals("clear")) {//清空购物车
        sql = "delete from cart";
        pstat = conn.prepareStatement(sql);
        pstat.executeUpdate();
        pstat.close();
        conn.close();
        response.sendRedirect("cart.jsp");
    }
%>
