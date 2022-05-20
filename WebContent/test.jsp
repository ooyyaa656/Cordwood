<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<%@page import="java.util.*,javax.mail.*,javax.mail.internet.*,kaoqin.packa.*"%>
<%@page errorPage="error.jsp"%>
<jsp:useBean id="test_db" scope="session" class="kaoqin.packa.testdb"></jsp:useBean>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/default1.css" rel="stylesheet" type="text/css">
</head>
<BODY>

<table width="80%" height="380" border=0 cellPadding=0 cellSpacing=0 align="center">
  <tr>
    <br>
    <td align="center"><STRONG>
<%
  out.println(new Date());
  for (int j = 0; j < 10000; j++) {
	  test_db.adduser();
  }
  %></STRONG>
</td>
  </tr>
  <tr>
    <br>
    <td align="center"><STRONG><%out.println(new Date());  
%></STRONG></td>
  </tr>
</table>

</body>
</html>
