<%--<%@ page language="java" import="java.util.*" pageEncoding="gb2312" %>--%>
<%--<%@ page import="java.sql.*" %>--%>
<%--<%--%>
<%--    Class.forName("com.mysql.cj.jdbc.Driver").newInstance();--%>
<%--    String url = "jdbc:mysql://localhost:3306/userdb?useSSL=false";--%>
<%--    Connection conn = DriverManager.getConnection(url, "root", "1234");--%>
<%--    PreparedStatement pstat = null;--%>
<%--    ResultSet rs = null;--%>
<%--    String sql = null;--%>
<%--    String op = request.getParameter("op");--%>
<%--    if (op.equals("add")) {//����Ʒ���빺�ﳵ--%>
<%--        //����Ʒ����ȡ����ѡ����Ʒ������--%>
<%--        String sp_No = request.getParameter("sp_No");--%>
<%--        String sp_Storage = request.getParameter("sp_Storage");--%>
<%--        String sp_Name = null, sp_Price = null;--%>
<%--        sql = "select * from shop where sp_No=?";--%>
<%--        pstat = conn.prepareStatement(sql);--%>
<%--        pstat.setString(1, sp_No);--%>
<%--        rs = pstat.executeQuery();--%>
<%--        if (rs.next()) {--%>
<%--            sp_Name = rs.getString("sp_Name").trim();--%>
<%--            sp_Price = rs.getString("sp_Price").trim();--%>
<%--            sp_Storage = rs.getString("sp_Storage").trim();--%>

<%--        }--%>

<%--        rs.close();--%>
<%--        //����ѡ����Ʒ���뵽���ﳵ��--%>
<%--        sql = "insert into cart(sp_Name,sp_Price,buy_Num,buy_Count,left_Storage) values(?,?,?,?,?)";--%>
<%--        pstat = conn.prepareStatement(sql);--%>
<%--        pstat.setString(1, sp_Name);--%>
<%--        pstat.setString(2, sp_Price);--%>
<%--        pstat.setInt(3, 1);--%>
<%--        pstat.setString(4, sp_Price);--%>
<%--        pstat.setString(5, sp_Storage);--%>
<%--        pstat.executeUpdate();--%>
<%--        pstat.close();--%>
<%--        conn.close();--%>
<%--        response.sendRedirect("cart.jsp"); //�ض��򵽹��ﳵҳ��--%>
<%--    }--%>
<%--    if (op.equals("update")) {//������Ʒ������--%>
<%--        int id = Integer.parseInt(request.getParameter("id"));--%>
<%--        int num = Integer.parseInt(request.getParameter("num"));--%>
<%--        double price = Double.parseDouble(request.getParameter("price"));--%>

<%--        sql = "update cart set buy_Num = ?, buy_Count = ? ,left_Storage=? where id=?";--%>
<%--        pstat = conn.prepareStatement(sql);--%>
<%--        pstat.setInt(1, num);--%>
<%--        pstat.setString(2, new Double(price * num).toString());--%>
<%--        pstat.setInt(3, 100 + num);--%>
<%--        pstat.setInt(4, id);--%>
<%--        pstat.executeUpdate();--%>
<%--        pstat.close();--%>
<%--        conn.close();--%>
<%--        response.sendRedirect("cart.jsp");//�ض��򵽹��ﳵҳ��--%>
<%--    }--%>
<%--    if (op.equals("del")) {//����Ʒ�˻ص���Ʒ��(����Ʒ�ӹ��ﳵ��ɾ��)--%>
<%--        int id = Integer.parseInt(request.getParameter("id"));--%>
<%--        sql = "delete from cart where id=?";--%>
<%--        pstat = conn.prepareStatement(sql);--%>
<%--        pstat.setInt(1, id);--%>
<%--        pstat.executeUpdate();--%>
<%--        pstat.close();--%>
<%--        conn.close();--%>
<%--        response.sendRedirect("cart.jsp");//�ض��򵽹��ﳵҳ��--%>
<%--    }--%>
<%--    if (op.equals("clear")) {//��չ��ﳵ--%>
<%--        sql = "delete from cart";--%>
<%--        pstat = conn.prepareStatement(sql);--%>
<%--        pstat.executeUpdate();--%>
<%--        pstat.close();--%>
<%--        conn.close();--%>
<%--        response.sendRedirect("cart.jsp");--%>
<%--    }--%>
<%--%>--%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312" %>
<%@ page import="java.sql.*" %>
<%
    String user = (String) session.getAttribute("userName");//��request�õ�
    System.out.println("cartuser:" + user);
//  TODO:��ҳuser����
%>
<%
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    String url = "jdbc:mysql://localhost:3306/userdb?useSSL=false";
    Connection conn = DriverManager.getConnection(url, "root", "1234");
    PreparedStatement pstat = null;
    ResultSet rs = null;
    String sql = null;
    String op = request.getParameter("op");
    if (op.equals("add")) {//����Ʒ���빺�ﳵ
        //����Ʒ����ȡ����ѡ����Ʒ������
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
        //����ѡ����Ʒ���뵽���ﳵ�У�����������Ϣ
        sql = "insert into cart(sp_Name,sp_Price,buy_Num,buy_Count,owner) values(?,?,?,?,?)";
        pstat = conn.prepareStatement(sql);
        pstat.setString(1, sp_Name);
        pstat.setString(2, sp_Price);
        pstat.setInt(3, 1);
        pstat.setString(4, sp_Price);
        pstat.setString(5, user);
        pstat.executeUpdate();
        pstat.close();
        conn.close();
        response.sendRedirect("cart.jsp"); //�ض��򵽹��ﳵҳ��
    }
    if (op.equals("update")) {//������Ʒ������
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
        response.sendRedirect("cart.jsp");//�ض��򵽹��ﳵҳ��
    }
    if (op.equals("del")) {//����Ʒ�˻ص���Ʒ��(����Ʒ�ӹ��ﳵ��ɾ��)
        int id = Integer.parseInt(request.getParameter("id"));
        sql = "delete from cart where id=?";
        pstat = conn.prepareStatement(sql);
        pstat.setInt(1, id);
        pstat.executeUpdate();
        pstat.close();
        conn.close();
        response.sendRedirect("cart.jsp");//�ض��򵽹��ﳵҳ��
    }
    if (op.equals("clear")) {//��չ��ﳵ
        sql = "delete from cart";
        pstat = conn.prepareStatement(sql);
        pstat.executeUpdate();
        pstat.close();
        conn.close();
        response.sendRedirect("cart.jsp");
    }
%>
