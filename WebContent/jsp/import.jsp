<%@page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<%@page import="java.util.*,kaoqin.packa.*"%>
<%@page errorPage="error.jsp"%>
<script type="text/javascript" src="../js/productmanage.js"></script>
<html>
<head>
<title>人员更新</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/default1.css" rel="stylesheet" type="text/css">
</head>
<BODY>
<%@include file="head.inc"%>
<form name="product" enctype="multipart/form-data" method="post" action="importpro.jsp">
  <table width="75%" height="380" border=0 cellPadding=0 cellSpacing=0 align="center">
    <%String para_name,lpara_name;
        para_name=new String(request.getParameter("para_name").getBytes("ISO-8859-1"),"utf-8");
        lpara_name=new String(request.getParameter("lpara_name").getBytes("ISO-8859-1"),"utf-8");
    %>
        <tr>
          <td align="center">
             <input type="hidden" name="para_name" value="<%=para_name%>">
             <STRONG><%=lpara_name%></STRONG>
             <HR style="BORDER-TOP: #aaaaaa 1px solid" SIZE=0>
          </td>
        </tr>
        <tr>
          <td  height="30" align="center">
            Excel文件  <input type="file" name="file1" size="60">
          </td>
        </tr>
        <tr>
          <td height="30" align="center">
            <input type="submit" value="提交" name="tijiao">
          </td>
        </tr>
        <tr><td valign="top">
            <pre>
   使用说明：

        1、使用Excel文件更新参数，请在Excel文件的第一列中保存您想更新的内容，然后通过上述的文本
    框指定您要更新的文件名，点击“提交”按钮即可。
        2、如您对Excel文件格式不确定，请点击<a href="example.xls">示例文件</a>，下载后对比示例文件更新您的上传文件即可。
        3、注意：一条内容不要超过50个字，不要有空白行。
      </pre>
        </td></tr>
</table>
</form>
<%@include file="foot.inc"%>
</body>
</html>
