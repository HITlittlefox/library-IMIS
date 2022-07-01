<%--<%@ page language="java" import="java.util.*" pageEncoding="gb2312" %>--%>
<%--<%@ page import="java.sql.*" %>--%>
<%--<html>--%>
<%--    <head><title>我的购物车</title></head>--%>
<%--    <%--%>
<%--        //装载MySQL8的JDBC驱动--%>
<%--        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();--%>
<%--        String url = "jdbc:mysql://localhost:3306/userdb?useSSL=false";--%>
<%--        Connection conn = DriverManager.getConnection(url, "root", "1234");--%>
<%--        Statement stat = conn.createStatement();--%>
<%--        String sql = "select * from cart";--%>
<%--        ResultSet rs = stat.executeQuery(sql);--%>
<%--    %>--%>
<%--    <body>--%>
<%--        <h2>我的购物车</h2>--%>
<%--        <hr>--%>
<%--        <table border="1" width="600">--%>
<%--            <tr bgcolor="#dddddd">--%>
<%--                <td align="center" width="80">商品名称</td>--%>
<%--                <td align="center">商品单价</td>--%>
<%--                <td align="center" width="100">购买数量</td>--%>
<%--                <td align="center" width="100">库存数量</td>--%>

<%--                <td align="center" width="100">金额</td>--%>
<%--                <td align="center" width="100">编辑</td>--%>
<%--            </tr>--%>
<%--            <%--%>
<%--                String id, sp_Name, sp_Price, buy_Num, buy_Count, left_Storage;--%>
<%--                while (rs.next()) {--%>
<%--                    id = rs.getString("id").trim();--%>
<%--                    sp_Name = rs.getString("sp_Name").trim();--%>
<%--                    sp_Price = rs.getString("sp_Price").trim();--%>
<%--                    buy_Num = rs.getString("buy_Num").trim();--%>
<%--                    left_Storage = rs.getString("left_Storage").trim();--%>

<%--                    buy_Count = rs.getString("buy_Count").trim();--%>
<%--                    out.println("<tr>");--%>
<%--                    out.println("<td>" + sp_Name + "</td>");--%>
<%--                    out.println("<td>" + sp_Price + "</td>");--%>
<%--                    out.println("<td><input type=text value=" + buy_Num +--%>
<%--                            " onChange=\"updateNum('" + id + "',this.value,'" + sp_Price + "')\"></td>");--%>
<%--                    out.println("<td>" + left_Storage + "</td>");--%>
<%--                    out.println("<td>" + buy_Count + "</td>");--%>
<%--                    out.println("<td><a href='buy.jsp?op=del&id=" + id + "'>退回商品架</a></td>");--%>
<%--                    out.println("</tr>");--%>
<%--                }--%>
<%--            %>--%>
<%--        </table>--%>
<%--        <br>--%>
<%--        <a href="index.jsp">继续购物</a>&nbsp;&nbsp;--%>
<%--        <a href="buy.jsp?op=clear">清空购物车</a>--%>
<%--    </body>--%>
<%--    <script language="javascript">--%>
<%--        function updateNum(id, num, price, storage) {--%>
<%--            var url = "buy.jsp?op=update&id=" + id + "&num=" + num + "&price=" + price;--%>
<%--            window.location = url;--%>
<%--        }--%>
<%--    </script>--%>
<%--</html>--%>

<%@ page language="java" import="java.util.*" pageEncoding="gb2312" %>
<%@ page import="java.sql.*" %>
<%
    String user = (String) session.getAttribute("userName");//用request得到
    System.out.println("cartuser:" + user);
%>
<html>
    <head><title>我的购物车</title></head>

    <%
        //装载MySQL8的JDBC驱动
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        String url = "jdbc:mysql://localhost:3306/userdb?useSSL=false";
        Connection conn = DriverManager.getConnection(url, "root", "1234");
        Statement stat = conn.createStatement();
        String sql = "select * from cart where owner='" + user + "'";
        System.out.println("cartsql:" + sql);
        ResultSet rs = stat.executeQuery(sql);
    %>
    <body>
        <h2 id="getuser">我的购物车</h2>
        <hr>
        <table border="1" width="600">
            <tr bgcolor="#dddddd">
                <td align="center" width="80">商品名称</td>
                <td align="center">商品单价</td>
                <td align="center" width="100">购买数量</td>
                <td align="center" width="100">金额</td>
                <td align="center" width="100">编辑</td>
            </tr>
            <%
                String id, sp_Name, sp_Price, buy_Num, buy_Count;
                while (rs.next()) {
                    id = rs.getString("id").trim();
                    sp_Name = rs.getString("sp_Name").trim();
                    sp_Price = rs.getString("sp_Price").trim();
                    buy_Num = rs.getString("buy_Num").trim();
                    buy_Count = rs.getString("buy_Count").trim();
                    out.println("<tr>");
                    out.println("<td>" + sp_Name + "</td>");
                    out.println("<td>" + sp_Price + "</td>");
                    out.println("<td><input type=text value=" + buy_Num +
                            " onChange=\"updateNum('" + id + "',this.value,'" + sp_Price + "')\"></td>");
                    out.println("<td>" + buy_Count + "</td>");
                    out.println("<td><a href='buy.jsp?op=del&id=" + id + "'>退回商品架</a></td>");
                    out.println("</tr>");
                }
            %>
        </table>
        <br>
        <a href="index.jsp">继续购物</a>&nbsp;&nbsp;
        <a href="buy.jsp?op=clear">清空购物车</a>
    </body>
    <script language="javascript">
        function updateNum(id, num, price) {
            var url = "buy.jsp?op=update&id=" + id + "&num=" + num + "&price=" + price;
            window.location = url;
        }
    </script>
    <script>

        //paraName 等找参数的名称
        function GetParentUrlParam(paraName) {
            var url = parent.document.location.toString();
            var arrObj = url.split("?");

            if (arrObj.length > 1) {
                var arrPara = arrObj[1].split("&");
                var arr;

                for (var i = 0; i < arrPara.length; i++) {
                    arr = arrPara[i].split("=");

                    if (arr != null && arr[0] == paraName) {
                        return arr[1];
                    }
                }
                return "";
            } else {
                return "";
            }
        }

        //从frame_a打印user名字
        console.log("user" + GetParentUrlParam("userName"));
        document.getElementById("getuser").innerHTML = GetParentUrlParam("userName") + "的购物车";

    </script>
</html>
