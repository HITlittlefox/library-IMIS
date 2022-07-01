<%@page language="java" contentType="text/html; charset = utf-8" pageEncoding="utf-8" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//w3c//DTD html 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset = ISO-8859-1">
        <title>Inset title here</title>
        <head>
    <body>
        <h1 style="text-align:center">修改学生信息</h1>
        <form:form action="" method="post" commandName="user">
            <table border="1" align="center">
                <tr>
                    <td>用户名：</td>
                    <td><form:input path="username"/></td>
                <tr>
                <tr>
                    <td>密码：</td>
                    <td><form:password path="password" showPassword="true"/></td>
                </tr>
                <tr>
                    <td>年龄：</td>
                    <td><form:input path="age"/></td>
                </tr>
                <tr>
                    <td>性别：</td>
                    <td>
                        <form:radiobutton path="gender" value="true" label="男"/>
                        <form:radiobutton path="gender" value="false" label="女"/>
                    </td>
                </tr>
                <tr>
                    <td>婚否：</td>
                    <td>
                        <form:radiobutton path="married" value="是"/>已婚
                        <form:radiobutton path="married" value="否"/>未婚
                    </td>
                </tr>
                <tr>
                    <td>兴趣爱好1：</td>
                    <td>
                        <form:checkbox path="myInteresting" value="舞蹈"/>舞蹈
                        <form:checkbox path="myInteresting" value="旅游"/>旅游
                        <form:checkbox path="myInteresting" value="唱歌"/>唱歌
                        <form:checkbox path="myInteresting" value="音乐"/>音乐
                        <form:checkbox path="myInteresting" value="运动"/>运动
                        <form:checkbox path="myInteresting" value="美食"/>美食
                    </td>
                </tr>
                <tr>
                    <td>兴趣爱好2：</td>
                    <td>
                        <form:checkbox path="myInteresting" value="舞蹈" label="舞蹈"/>
                        <form:checkbox path="myInteresting" value="旅游" label="旅游"/>
                        <form:checkbox path="myInteresting" value="唱歌" label="唱歌"/>
                        <form:checkbox path="myInteresting" value="音乐" label="音乐"/>
                        <form:checkbox path="myInteresting" value="运动" label="运动"/>
                        <form:checkbox path="myInteresting" value="美食" label="美食"/>
                    </td>
                </tr>
                <tr>
                    <td>兴趣爱好3：</td>
                    <td><form:checkboxes path="myInteresting" items="${allInteresting}"/></td>
                </tr>
                <tr>
                    <td>所在城市1：</td>
                    <td><form:radiobuttons path="city" items="${cities}"/><br/></td>
                </tr>
                <tr>
                    <td>所在城市2：</td>
                    <td>
                        <form:select path="city">
                            <option>请选择城市</option>
                            <form:option value="北京">北京</form:option>
                            <form:option value="上海">上海</form:option>
                            <form:option value="广州">广州</form:option>
                            <form:option value="深圳">深圳</form:option>
                        </form:select>
                    </td>
                </tr>
                <tr>
                    <td>所在城市3：</td>
                    <td>
                        <form:select path="city">
                            <option>请选择城市</option>
                            <form:options items="${cities}"/>
                        </form:select>
                    </td>
                </tr>
                <tr>
                    <td>学历1：</td>
                    <td><form:radiobuttons path="graduated" items="${graduates}"/><br/></td>
                </tr>
                <tr>
                    <td>学历2：</td>
                    <td>
                        <form:select path="graduated">
                            <option>请选择学历</option>
                            <form:options items="${graduates}"/>
                        </form:select>
                    </td>
                </tr>
                <tr>
                    <td>个人描述：</td>
                    <td><form:input path="description"/></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="提交"/></td>
                </tr>
            </table>
        </form:form>
    </body>
    <html>
