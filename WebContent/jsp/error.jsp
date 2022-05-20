<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<%@ page isErrorPage="true" %>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<body bgcolor="#ffffff">
<h1>错误页面</h1>
<br>An error occurred in the bean. Error Message is: <%= exception.getMessage() %><br>
Stack Trace is : <pre><font color="red"><%
 java.io.CharArrayWriter cw = new java.io.CharArrayWriter();
 java.io.PrintWriter pw = new java.io.PrintWriter(cw,true);
 exception.printStackTrace(pw);
 out.println(cw.toString());
 %></font></pre>
<br></body>
</html>
