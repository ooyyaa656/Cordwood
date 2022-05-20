<%@page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<%@page import="java.io.*,java.util.*,kaoqin.packa.*"%>
<%@page errorPage="error.jsp"%>
<jsp:useBean id="para_db" scope="session" class="kaoqin.packa.paradb"></jsp:useBean>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/default1.css" rel="stylesheet" type="text/css">
</head>
<BODY>
<%@include file="head.inc"%>
<table width="80%" height="380" border=0 cellPadding=0 cellSpacing=0 align="center">
  <tr>
    <br>
    <td align="center"><STRONG>
<%
   String para_id=request.getParameter("para_id");
   String para_value=request.getParameter("lpara_value");
   String para_name=(String)session.getAttribute("para_name");
   String lpara_name=(String)session.getAttribute("lpara_name");
   para_db.editpara(para_name,para_id,para_value);
   out.print("修改成功！");
%>
</STRONG>
</td>
  </tr>
  <tr>
    <td align="center">
      <br>
      <input class="button" type="submit" value="返回" onclick="location.href='para.jsp?para_name=<%=para_name%>&lpara_name='+encodeURIComponent('<%=lpara_name%>')">
    </td>
  </tr>
</table>
<%@include file="foot.inc"%>
</body>
</html>
