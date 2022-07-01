package com.testxml;

import org.dom4j.*;
import org.dom4j.io.*;

import java.io.*;

/**
 * @author 96361
 */
public class ParseXML {
    StringBuffer result = new StringBuffer();
    Document doc = null;

    public void read(String fileName) throws Exception {
        SAXReader reader = new SAXReader();
        doc = reader.read(new File(fileName));
    }


    public void treeWalk() {
        treeWalk(doc.getRootElement());
    }


    public void treeWalk(Element element) {
        for (int i = 0, size = element.nodeCount(); i < size; i++) {
            Node node = element.node(i);
            if (node instanceof Element) {
                if (node.getText().trim().length() > 0) {
                    result.append(node.getName() + " = ");
                } else {
                    result.append("<br>Contact Record<br>");
                }
                treeWalk((Element) node);
            } else {
                if (node.getText().trim().length() > 0) {
                    result.append(node.getText() + "<br>");
                }
            }
        }
    }

    public String getResult() {
        return result.toString();
    }
}
