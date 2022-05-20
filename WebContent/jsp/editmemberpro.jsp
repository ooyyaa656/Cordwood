<%@page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<%@page import="java.io.*,java.util.*,kaoqin.packa.*"%>
<%@page errorPage="error.jsp"%>
<jsp:useBean id="member_db" scope="session" class="kaoqin.packa.memberdb"></jsp:useBean>
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
   String subject_id=request.getParameter("subject_id");
   member_db.editmember(request.getParameter("member_id"),request.getParameter("member_name"),request.getParameter("begin_date"),request.getParameter("remark"),request.getParameter("para_id1"),request.getParameter("para_id2"));
   out.print("修改成功！");
%>
</STRONG>
</td>
  </tr>
  <tr>
    <td align="center">
      <br>
      <input class="button" type="submit" value="返回" onclick="location.href='member.jsp?subject_id=<%=subject_id%>'">
    </td>
  </tr>
</table>
<%@include file="foot.inc"%>
</body>
</html>
