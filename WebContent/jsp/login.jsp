<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8" language="java" import="java.util.*" errorPage="error.jsp"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="loginin" scope="session" class="kaoqin.packa.loginin"></jsp:useBean>
<html>
<head>
<title>
登录
</title>
</head>
<body bgcolor="#ffffff">
<%
   boolean nu=loginin.getlogin(request.getParameter("username"),request.getParameter("passwd"));
   if(nu){
     String[] user_info=loginin.getrole(request.getParameter("username"));
     session.setAttribute("login_user_id",user_info[0]);
     session.setAttribute("login_username",user_info[1]);
     session.setAttribute("login_name",user_info[2]);
     session.setAttribute("login_email",user_info[3]);
     session.setAttribute("login_tel",user_info[4]);
     session.setAttribute("login_role",user_info[5]);
     response.sendRedirect("indexinner.jsp");
   }else{
     out.print("对不起，您的用户名/密码有误，请重新登录。");
   }
%>
<input type="button" value="返回" onClick="location.href='../index.jsp'"/>
</body>
</html>
