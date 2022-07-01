
<%@ page import="SimpleCalculator.java"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>计算器</title>
    </head>
    <body>

        <form action="" method="post">
            第一个数：<input type="text" value="" name="first" size="25px"/>
            <br /><br />
            第二个数：<input type="text" value="" name="second" size="25px"/>
            <br /><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="submit" value="+" name="operator" size="3"/>         &nbsp;&nbsp;&nbsp;
            <input type="submit" value="-" name="operator" size="3"/>         &nbsp;&nbsp;&nbsp;
            <input type="submit" value="*" name="operator" size="3"/>         &nbsp;&nbsp;&nbsp;
            <input type="submit" value="/" name="operator" size="3"/>         &nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="reset" value="清除"/>
        </form>
        <br /><br />
        <%

            //获取表单中的数据进行运算
            String first = request.getParameter("first");//第一个数
            String second = request.getParameter("second");//第二个数
            String operator = request.getParameter("operator");//运算符
            String result = "" ;//运算结果

            //判断运算符
            if(operator.equals("+")) {
                result = String.valueOf((Integer.valueOf(first) + Integer.valueOf(second) ));
            }
            if(operator.equals("-")) {
                result = String.valueOf((Integer.valueOf(first) - Integer.valueOf(second) ));
            }
            if(operator.equals("*")) {
                result = String.valueOf((Integer.valueOf(first) * Integer.valueOf(second) ));
            }
            if(operator.equals("/")) {

                if(second.equals("0")) {
                    result = "除数不能为0";
                }else {
                    result = String.valueOf((double)(Integer.valueOf(first) / (double)Integer.valueOf(second) ));
                }
            }

            //定义一个计算器类
            SimpleCalculator simpleCalculator = new SimpleCalculator();
            simpleCalculator.setResult(result);
            if( !simpleCalculator.getResult().equals("") && simpleCalculator.getResult() != null){
                out.print("<h2 style= 'color: blue'>");
                out.print("计算结果："+first+operator+second+" = "+simpleCalculator.getResult());
                out.print("<h4>");
            }else{
                out.print("计算错误");
            }

        %>
        <br /><br />
    </body>
</html>

