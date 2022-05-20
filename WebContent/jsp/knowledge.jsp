<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,kaoqin.packa.*"%>
<%request.setCharacterEncoding("utf-8");%>
<%@page errorPage="error.jsp"%>
<jsp:useBean id="para_db" scope="session" class="kaoqin.packa.paradb"></jsp:useBean>
<%
        if(request.getParameter("hidden_operate") == null){
            session.setAttribute("para_value","");
        }
        int pageNo = 1,xuhao=0;
        String strPage = request.getParameter("jumpPage");
        if (strPage != null) {
          pageNo = Integer.parseInt(strPage);
        }
        String hidden_operate = "";
        String operatename = "";
        pageination pageCtl = new parapage();
        pageCtl.setRowsPerPage(50);
        if (request.getParameter("hidden_operate") != null) {
          hidden_operate = request.getParameter("hidden_operate");
          operatename = request.getParameter("bt");
          if (hidden_operate.equals("uninit")) {
            if (operatename.equals("query")) {
                session.setAttribute("para_value", request.getParameter("para_value"));
            }
          }
        }
%>
<script type="text/javascript">
function gotoPage(pagenum){
  document.goodform.jumpPage.value=pagenum;
  document.goodform.submit();
  return;
}
function setAction(action){
    document.goodform.hidden_operate.value=action;
}
function setBt(oprate){
    document.goodform.bt.value=oprate;
}
function selectk(form){
  var str = "";
  var a="";
  var j=0;
  var check = document.getElementsByName("checkList");
  a=eval("document."+form);
  for (var i=0; i<check.length; i++) {
	 if (check[i].checked == true){
         j=j+1;
	 str = str + check[i].value;
	 }
  }
  a.checkValue.value = str;
  if(str == "") {
	alert("请选择一项学科");
	 return;
  }
  if(j>1) {
	alert("只能选择一项");
	 return;
  }
  window.returnValue=str;
  window.close();
}
</script>
<script type="text/javascript" src="../js/productmanage.js"></script>
<html>
<head>
<title>请选择所属学科</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/default1.css" rel="stylesheet" type="text/css">
</head>
<base target="_self">
<body onkeydown="if (event.keyCode==116){reload.click()}">
<a id="reload" href="knowledge.htm" style="display:none">reload...</a>
<table width="92%" border=0 cellPadding=0 cellSpacing=0 align="center">
<form name="goodform" method="post" action="knowledge.jsp" onsubmit="setAction('uninit')">
  <tr>
    <td  height="30" align="center" class="hcmp-title">
      <input type="hidden" name="hidden_operate" value="init">
      <input type="hidden" name="bt">
      <input type="hidden" name="checkValue">
      <input type="hidden" name="jumpPage" value="1">
        <STRONG>所属学科</STRONG>
    </td>
  </tr>
  <tr>
    <td align="center" valign="top" height="30">
      学科名&nbsp;&nbsp;<input name="para_value" type="text" size="28" maxlength="50" value="<%=(String)session.getAttribute("para_value")%>">
      &nbsp;<input type="button" name="query" value="查询" onclick="setAction('uninit');setBt('query');goodform.submit();">
        <input type="button" name="queding" value="确定" onclick="selectk('goodform');">
    </td>
  </tr>
  <tr>
    <td>
      <table width="75%" align="center" cellspacing="1" cellpadding="0" class="image-list">
        <tr>
          <th width="3%" height="25"></th>
          <th width="8%">序号</th>
          <th width="81%">所属学科</th>
        </tr>
        <%
        String para_value=(String)session.getAttribute("para_value");
        String queryStatement="select * from knowledge where para_value like '%"+para_value+"%' order by para_id desc";
        pageCtl.setSQL(queryStatement);
        Collection goods1 = pageCtl.getPage(pageNo);
        Iterator allgoods = goods1.iterator();
        while (allgoods.hasNext()) {
          paradetail book = (paradetail) allgoods.next();
          xuhao++;
        %>
        <tr align="center">
          <td>
            <input type="checkbox" name="checkList" value="<%=book.getPara_value()%>">
          </td>
          <td><%=String.valueOf(xuhao+(pageNo-1)*50)%></td>
          <td><%=book.getPara_value()%></td>
        </tr>
      <%}      %>
      </table>
    </td>
  </tr>
  <tr>
     <td height="8" background="../image/dot.jpg"></td>
   </tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td height="22" valign="top">      共
<%=pageCtl.getRowsCount()%>      行
      &nbsp;
    <%
      if (pageNo == 1) {
        out.print("首页 上一页 ");
      }
      else {
    %>
      <a href="javascript:gotoPage(1)">首页</a>
      &nbsp;
      <a href="javascript:gotoPage(<%=pageNo-1%>)">上一页</a>
      &nbsp;
    <%
      }
          if (pageNo == pageCtl.getPagesCount()) {
        out.print("下一页 尾页");
      }
      else {
    %>
      <a href="javascript:gotoPage(<%=pageNo+1%>)">下一页</a>
      &nbsp;
      <a href="javascript:gotoPage(<%=pageCtl.getPagesCount()%>)">尾页</a>
    <%}    %>
    </td>
  </tr>
</table>
</form>
</body>
</html>
