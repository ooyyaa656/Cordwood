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
<form name="product1" method="post" action="editdepartmentpro.jsp">
  <tr align="center">
    <td height="30" align="center" class="hcmp-title">所属部门
      <input type="hidden" name="department_id" value="<%=request.getParameter("department_id")%>">
      <HR style="BORDER-TOP: #aaaaaa 1px solid" SIZE=0></td></tr>
    <tr align="center">
      <td height="30">所属部门&nbsp;&nbsp;&nbsp;&nbsp;<%String department_name=new String(request.getParameter("department_name").getBytes("ISO-8859-1"),"utf-8");%>
      <input type="text" name="department_name" size="35" maxlength="50" value="<%=department_name%>">
      </td>
    </tr>
    <tr>
      <td align="center" height="35">
        <input type="submit" value="修改" name="tijiaopa">
        <input type="button" value="返回" onclick="history.go(-1)">
      </td>
    </tr>
</form>
</table>
<%@include file="foot.inc"%>
</body>
</html>
