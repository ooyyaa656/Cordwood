<%@page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<%@page import="java.io.*,java.util.*,kaoqin.packa.*"%>
<%@page errorPage="error.jsp"%>
<jsp:useBean id="department_db" scope="session" class="kaoqin.packa.departmentdb"></jsp:useBean>
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
  String department_id=request.getParameter("department_id");
  String department_name=request.getParameter("department_name");
  department_db.editdepartment(department_id,department_name);
  out.print("修改完成！");
%></STRONG>
</td>
  </tr>
  <tr>
    <td align="center">
      <br>
      <input class="button" type="submit" value="返回" onclick="location.href='department.jsp'">
    </td>
  </tr>
</table>
<%@include file="foot.inc"%>
</body>
</html>
