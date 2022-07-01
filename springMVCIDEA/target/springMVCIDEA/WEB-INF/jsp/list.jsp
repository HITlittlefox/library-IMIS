<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//w3c//dtd html 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset = utf-8">
        <title>Inset title here</title>
        <head>
    <body>
        <h2 style="text-align:center">用户列表</h2>
        <table align="center">
            <tr>
                <td>编号</td>
                <td>姓名</td>
                <td>年龄</td>
                <td>详细信息&nbsp;</td>
            <tr>
                <c:forEach items="${users}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>${user.age}</td>
                <td><a href="${user.id}/detail.do">详细信息&nbsp;</a>
                </td>
            <tr>
                </c:forEach>
        </table>
    </body>
</html>
