package com.testxml;

import org.dom4j.*;
import org.dom4j.io.*;

import java.io.*;
import java.util.*;

public class CreateXML {
    public CreateXML() {
    }

    public Document create(String filename) { //产生一个XML文档并存盘
        //使用DocumentHelper类创建一个文档实例
        Document document = DocumentHelper.createDocument();
        Element rootElement = document.addElement("linkmans");//创建根元素
        //为根元素创建第一个子元素
        Element firstElement = rootElement.addElement("linkman");
        Element element1 = firstElement.addElement("name");
        element1.setText("张三");
        Element element2 = firstElement.addElement("id");
        element2.setText("001");
        Element element3 = firstElement.addElement("company");
        element3.setText("A公司");
        Element element4 = firstElement.addElement("email");
        element4.setText("zhang@aaa.com");
        Element element5 = firstElement.addElement("tel");
        element5.setText("(020)12345678");
        Element element6 = firstElement.addElement("address");
        element6.setText("广东省广州市");
        //为根元素创建第二个子元素
        Element secondElement = rootElement.addElement("linkman");
        Element elementa = secondElement.addElement("name");
        elementa.setText("李四");
        Element elementb = secondElement.addElement("id");
        elementb.setText("002");
        Element elementc = secondElement.addElement("company");
        elementc.setText("B公司");
        Element elementd = secondElement.addElement("email");
        elementd.setText("li@bbb.com");
        Element elemente = secondElement.addElement("tel");
        elemente.setText("(010)12345678");
        Element elementf = secondElement.addElement("address");
        elementf.setText("北京市");
        //将创建的XML文档存盘
        try {
            OutputFormat format = OutputFormat.createPrettyPrint();//创建一个格式化对象
            format.setIndent("\t");//使用TAB缩进
            //创建一个XMLWriter对象
            XMLWriter output = new XMLWriter(new FileOutputStream(new File(filename)), format);
            output.write(document);//将XML文档输出
            output.close();
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
        //返回XML文档对象
        return document;
    }

    //将文本串转换成XML文档并存盘
    public Document create(String filename, String text) throws Exception {
        //使用DocumentHelper类将文本串转换为XML文档
        Document document = DocumentHelper.parseText(text);
        //将创建的XML文档存盘
        try {
            //创建一个格式化对象
            OutputFormat format = OutputFormat.createPrettyPrint();
            //使用TAB缩进
            format.setIndent("\t");
            //创建一个XMLWriter对象
            XMLWriter output = new XMLWriter(new FileOutputStream(new File(filename)), format);
            //将XML文档输出
            output.write(document);
            output.close();
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
        //返回XML文档对象
        return document;
    }
}
