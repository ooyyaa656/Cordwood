<%@page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<%@page errorPage="error.jsp"%>
<%@page import="java.io.*,java.util.*,kaoqin.packa.*,com.oreilly.servlet.MultipartRequest"%>
<jsp:useBean id="init_data" scope="session" class="kaoqin.packa.initdata"></jsp:useBean>
<script type="text/javascript">
function changeLocation1()
{
window.location="rencai.jsp"
}
</script>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/default1.css" rel="stylesheet" type="text/css">
</head>
<BODY>
<%@include file="head.inc"%>
<%
  String filename1 = application.getRealPath("/");
  String filename,para_name;
  String saveDirectory = filename1.replaceAll("\\\\", "//") + "attachment1";
  File test = new File(saveDirectory);
  if (!test.exists()) {
    test.mkdir();
  }
  int maxPostSize = 5*1024*1024;

  MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxPostSize, "utf-8");
  if (multi.getParameter("para_name") != null) {
      para_name= multi.getParameter("para_name");
  }
    else {
      para_name= "";
  }

  Enumeration filesname = multi.getFileNames();
  String name = (String) filesname.nextElement();
  filename = multi.getFilesystemName(name);
  if (filename != null) {
      File orifile = multi.getFile(name);
      if (orifile.exists() && orifile.length() != 0) {
        long timeset = System.currentTimeMillis();
        int location = filename.lastIndexOf(".");
        String name1 = String.valueOf(timeset)+ filename.substring(location, filename.length());
        String newname = saveDirectory + "//" + name1;
        orifile.renameTo(new File(newname));
        init_data.initgood(newname,para_name);
      }
    }
%>
<table width="100%" height="380" border=0 cellPadding=0 cellSpacing=0 align="center">
 <tr align="center">
    <th height="18">
      导入完成！
    </th>
</tr>
<tr align="center">
    <td height="18">
      <input type="button" value="返回" onclick="location.href='main.jsp'">
    </td>
</tr>
</table>
<%@include file="foot.inc"%>
</body>
</html>
