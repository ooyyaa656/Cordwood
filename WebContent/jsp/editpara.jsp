<%@page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<%@page import="java.util.*,kaoqin.packa.*"%>
<%@page errorPage="error.jsp"%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/default1.css" rel="stylesheet" type="text/css">
</head>
<BODY>
<%@include file="head.inc"%>
<table width="60%" border=0 cellPadding=0 cellSpacing=0 align="center">
<form name="product1" method="post" action="editparapro.jsp">
  <tr align="center">
    <%
      String para_id=new String(request.getParameter("para_id").getBytes("ISO-8859-1"),"utf-8");
      String lpara_value=new String(request.getParameter("lpara_value").getBytes("ISO-8859-1"),"utf-8");
      String para_name=(String)session.getAttribute("para_name");
      String lpara_name=(String)session.getAttribute("lpara_name");
    %>
    <td height="30" align="center" class="hcmp-title"><%=lpara_name%>
      <input type="hidden" name="para_id" value="<%=para_id%>">
      <input type="hidden" name="para_name" value="<%=para_name%>">
      <input type="hidden" name="lpara_name" value="<%=lpara_name%>">
    </td>
  </tr><tr><td>
  <HR style="BORDER-TOP: #aaaaaa 1px solid" SIZE=0></td></tr>
  <tr align="center">
    <td height="30"><%=lpara_name%>&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="text" name="lpara_value" size="35" maxlength="50" value="<%=lpara_value%>">
    </td>
  </tr>
  <tr>
    <td colspan="4" align="center" height="35">
      <input type="submit" value="修改" name="tijiaopa">
      <input type="button" value="返回" onclick="history.go(-1)">
    </td>
  </tr>
</form>
</table>
<%@include file="foot.inc"%>
</body>
</html>
