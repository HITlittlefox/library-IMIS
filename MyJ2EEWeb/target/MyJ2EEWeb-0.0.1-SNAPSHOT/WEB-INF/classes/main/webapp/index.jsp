<%@page language="java" import="java.util.*" pageEncoding="gb2312" %>
<%@page import="java.sql.*" %>
<html>
    <head><title>���߹���</title></head>
    <%
        //װ��MySQL8��JDBC����
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        String url = "jdbc:mysql://localhost:3306/userdb?useSSL=false";
        Connection conn = DriverManager.getConnection(url, "root", "1234");
        Statement stmt = conn.createStatement();
        String sql = "select * from shop";
        ResultSet rs = stmt.executeQuery(sql);
        //�����ѯ�����ҳ��
    %>
    <body>
        <h2>���߹���</h2>
        <hr>
        <table border="1" width="600">
            <tr bgcolor="#dddddd">
                <td align="center" width="80">��Ʒ��ͼ</td>
                <td align="center">��ƷժҪ</td>
                <td align="center" width="100">���߹���</td>
            </tr>
            <%
                String sp_No, sp_Name, sp_Price, sp_Info, sp_Pic;
                //����ѯ������еļ�¼�����ҳ����
                while (rs.next()) {
                    //�ӵ�ǰ��¼�ж�ȡ���ֶε�ֵ
                    sp_Pic = rs.getString("sp_Pic").trim();
                    sp_No = rs.getString("sp_No").trim();
                    sp_Name = rs.getString("sp_Name").trim();
                    sp_Price = rs.getString("sp_Price").trim();
                    sp_Info = rs.getString("sp_Info").trim();
                    out.println("<tr>");
                    out.println("<td><img src='" + sp_Pic + "' border=0 height=60 width=60></td>");
                    out.println("<td>");
                    out.println("��Ʒ��ţ�" + sp_No + "<br>");
                    out.println("��Ʒ���ƣ�" + sp_Name + "<br>");
                    out.println("��Ʒ�۸�" + sp_Price + "Ԫ<br>");
                    out.println("��Ʒ��飺" + sp_Info + "<br>");
                    out.println("</td>");
                    out.println("<td><a href='buy.jsp?op=add&sp_No=" + sp_No + "'>���빺�ﳵ</a></td>");
                    out.println("</tr>");
                }
            %>
        </table>
        <br>
        <a href="cart.jsp">�鿴���ﳵ</a>&nbsp;&nbsp;
        <a href="buy.jsp?op=clear">��չ��ﳵ</a>
    </body>
</html>
