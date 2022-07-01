<%@page language="java" import="java.util.*" pageEncoding="gb2312" %>
<%@page import="java.sql.*" %>
<html>
    <head><title>在线购物</title></head>
    <%
        //装载MySQL8的JDBC驱动
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        String url = "jdbc:mysql://localhost:3306/userdb?useSSL=false";
        Connection conn = DriverManager.getConnection(url, "root", "1234");
        Statement stmt = conn.createStatement();
        String sql = "select * from shop";
        ResultSet rs = stmt.executeQuery(sql);
        //输出查询结果到页面
    %>
    <body>
        <h2>在线购物</h2>
        <hr>
        <table border="1" width="600">
            <tr bgcolor="#dddddd">
                <td align="center" width="80">商品缩图</td>
                <td align="center">商品摘要</td>
                <td align="center" width="100">在线购买</td>
            </tr>
            <%
                String sp_No, sp_Name, sp_Price, sp_Info, sp_Pic;
                //将查询结果集中的记录输出到页面上
                while (rs.next()) {
                    //从当前记录中读取各字段的值
                    sp_Pic = rs.getString("sp_Pic").trim();
                    sp_No = rs.getString("sp_No").trim();
                    sp_Name = rs.getString("sp_Name").trim();
                    sp_Price = rs.getString("sp_Price").trim();
                    sp_Info = rs.getString("sp_Info").trim();
                    out.println("<tr>");
                    out.println("<td><img src='" + sp_Pic + "' border=0 height=60 width=60></td>");
                    out.println("<td>");
                    out.println("商品编号：" + sp_No + "<br>");
                    out.println("商品名称：" + sp_Name + "<br>");
                    out.println("商品价格：" + sp_Price + "元<br>");
                    out.println("商品简介：" + sp_Info + "<br>");
                    out.println("</td>");
                    out.println("<td><a href='buy.jsp?op=add&sp_No=" + sp_No + "'>放入购物车</a></td>");
                    out.println("</tr>");
                }
            %>
        </table>
        <br>
        <a href="cart.jsp">查看购物车</a>&nbsp;&nbsp;
        <a href="buy.jsp?op=clear">清空购物车</a>
    </body>
</html>
