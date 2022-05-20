<%@page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<%@page import="java.util.*,kaoqin.packa.*,java.text.SimpleDateFormat"%>
<%@page errorPage="error.jsp"%>
<jsp:useBean id="madeexcel" scope="session" class="kaoqin.packa.madeexcel"></jsp:useBean>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="refresh" content="0;url=javascript:window.close()">
<link href="../css/default1.css" rel="stylesheet" type="text/css">
</head>
<BODY>
  <%
              long timeset = System.currentTimeMillis();
              String subject_id=request.getParameter("subject_id");
              String filename1=application.getRealPath("/")+"jsp\\excel\\"+String.valueOf(timeset)+".xls";
              String old_path=application.getRealPath("/")+"jsp\\excel\\template.xls";
              String filedown="excel/"+String.valueOf(timeset)+".xls";
              String filename=filename1.replaceAll("\\\\", "/");
              old_path=old_path.replaceAll("\\\\", "/");
              madeexcel.copyFile(old_path,filename);
              madeexcel.getexcel(subject_id,filename);
              response.sendRedirect(filedown);
  %>
</body>
</html>
