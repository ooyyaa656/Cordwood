<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<%@page import="java.util.*,javax.mail.*,javax.mail.internet.*,kaoqin.packa.*"%>
<%@page errorPage="error.jsp"%>
<jsp:useBean id="budget_db" scope="session" class="kaoqin.packa.budgetdb"></jsp:useBean>
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
  String filerequest[] = {
      null,null, null, null, null, null, null, null,null,null,null,null,null,
      null,null, null, null, null, null, null, null,null,null,null,null,null,null,null};
  String filerequest_name[] = {
      "operatename","budget_year","device1","device2","device3","device4","material","experiment","power","travel","meeting","international",
      "publish","cooperate","expert","labour","manage","multi","jixiao","other1","other2","transfer","base1","base2","base3",
      "base4","base5","base6"};
  for (int j = 0; j < 28; j++) {
    if (request.getParameter(filerequest_name[j]) != null) {
      filerequest[j] = request.getParameter(filerequest_name[j]);
    }
    else {
      filerequest[j] = "";
    }
  }
  if (filerequest[0].equals("create")) {
  
     budget_db.addbudget(subject_id,filerequest[1],filerequest[2],filerequest[3],filerequest[4],
     filerequest[5],filerequest[6],filerequest[7],filerequest[8],filerequest[9],filerequest[10],
     filerequest[11],filerequest[12],filerequest[13],filerequest[14],filerequest[15],filerequest[16],
     filerequest[17],filerequest[18],filerequest[19],filerequest[20],filerequest[21],filerequest[22],
     filerequest[23],filerequest[24],filerequest[25],filerequest[26],filerequest[27]);
     out.print("新建完成！");
  }
 else if(filerequest[0].equals("edit")){
     String budget_id=request.getParameter("budget_id");
     
     budget_db.editbudget(budget_id,filerequest[1],filerequest[2],filerequest[3],filerequest[4],
     filerequest[5],filerequest[6],filerequest[7],filerequest[8],filerequest[9],filerequest[10],
     filerequest[11],filerequest[12],filerequest[13],filerequest[14],filerequest[15],filerequest[16],
     filerequest[17],filerequest[18],filerequest[19],filerequest[20],filerequest[21],filerequest[22],
     filerequest[23],filerequest[24],filerequest[25],filerequest[26],filerequest[27]);
        out.print("修改完成！");
 }
%></STRONG>
</td>
  </tr>
  <tr>
    <td align="center">
      <br>
      <input class="button" type="submit" value="返回" onclick="location.href='budget.jsp?subject_id=<%=subject_id%>'">
    </td>
  </tr>
</table>
<%@include file="foot.inc"%>
</body>
</html>
