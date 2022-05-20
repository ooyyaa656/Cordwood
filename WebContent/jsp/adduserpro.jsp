<%@page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<%@page import="java.io.*,java.util.*,kaoqin.packa.*"%>
<%@page errorPage="error.jsp"%>
<jsp:useBean id="user_db" scope="session" class="kaoqin.packa.userdb"></jsp:useBean>
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
  String filerequest[] = {
      null, null, null, null,null,null, null, null};
  String filerequest_name[] = {
      "operatename", "username", "name", "psword1_ma", "email","tel","role","user_info_id"};
  for (int j = 0; j < 8; j++) {
    if (request.getParameter(filerequest_name[j]) != null) {
      filerequest[j] = request.getParameter(filerequest_name[j]);
    }
    else {
      filerequest[j] = "";
    }
  }
  if (filerequest[0].equals("create")) {
    int num=user_db.checkUserid(filerequest[1]);
    if(num==0){
        user_db.adduser(filerequest[1], filerequest[3], filerequest[2], filerequest[4], filerequest[5],filerequest[6]);
        out.print("新建完成！");
    }else{
        out.print("该用户名已存在，请换一个用户名！");
    }
  }
 else if(filerequest[0].equals("edit")){
        user_db.edituser(filerequest[7], filerequest[2], filerequest[4], filerequest[5], filerequest[6]);
        out.print("修改完成！");
 }else if(filerequest[0].equals("psword_ch")){
        user_db.editpsword(filerequest[7],filerequest[3]);
        out.print("修改完成！");
 }
%></STRONG>
</td>
  </tr>
  <tr>
    <td align="center">
      <br>
      <input class="button" type="submit" value="返回" onclick="location.href='user.jsp'">
    </td>
  </tr>
</table>
<%@include file="foot.inc"%>
</body>
</html>
