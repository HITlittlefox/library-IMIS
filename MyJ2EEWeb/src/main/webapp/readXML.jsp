<%@ page contentType="text/html" pageEncoding="gb2312" %>
<%@ page import="org.dom4j.*, java.util.*" %>
<%@ page import="org.dom4j.io.SAXReader" %>
<%@ page import="java.io.File" %>

<%--<jsp:useBean id="myParse" class="com.testxml.ParseXML"/>--%>
<html>
    <head><title>��ȡ������XML�ļ�</title></head>
    <body>
        <h2>��ȡ������XML�ļ������ҳ���Ѹղ�create��xml��ȡ����</h2>
        <hr>
        <%

            class ParseXML {
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
                                result.append("<br>user_info<br>");
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

            ParseXML g = new ParseXML();
            //ȡ��test.xml�ļ��ľ���·��
//            String fileName = request.getRealPath("C:/Users/96361/Workspaces/MyEclipse CI/MyJ2EEWeb/src/main/webapp/pom.xml");
//            String fileName = "C:/Users/96361/Workspaces/MyEclipse CI/MyJ2EEWeb/src/main/webapp/testXML1.xml";
            String fileName = "C:/Users/96361/Workspaces/MyEclipse CI/sql123.xml";
            g.read(fileName); //��ȡXML�ļ��������ڴ��е�XML�ĵ�
            g.treeWalk();//�ݹ�����ڴ��е�XML�ĵ�
            out.println(g.getResult());//����������
        %>
    </body>
</html>
