<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,kaoqin.packa.*"%>
<%request.setCharacterEncoding("utf-8");%>
<%@page errorPage="error.jsp"%>
<jsp:useBean id="para_db" scope="session" class="kaoqin.packa.paradb"></jsp:useBean>
<%
        String para_name,lpara_name;
 if(request.getParameter("hidden_operate") == null){
        para_name=new String(request.getParameter("para_name").getBytes("ISO-8859-1"),"utf-8");
        lpara_name=new String(request.getParameter("lpara_name").getBytes("ISO-8859-1"),"utf-8");
        session.setAttribute("para_name",para_name);
        session.setAttribute("lpara_name",lpara_name);
  }else{
        para_name=(String)session.getAttribute("para_name");
        lpara_name=(String)session.getAttribute("lpara_name");
  }
        int pageNo = 1,xuhao=0;
        String strPage = request.getParameter("jumpPage");
        if (strPage != null) {
          pageNo = Integer.parseInt(strPage);
        }
        String hidden_operate = "";
        String operatename = "";
        pageination pageCtl = new parapage();
        pageCtl.setRowsPerPage(20);
        if (request.getParameter("hidden_operate") != null) {
          hidden_operate = request.getParameter("hidden_operate");
          operatename = request.getParameter("bt");
          if (hidden_operate.equals("uninit")) {
            if (operatename.equals("add")) {
               para_db.insertpara(para_name,request.getParameter("para_value"));
            }else if(operatename.equals("del")){
                String checkValue = request.getParameter("checkValue");
                String[] para_id = null;
                para_id = checkValue.split(",");
                for (int i = 0; i < para_id.length; i++) {
                  para_db.delpara(para_name,para_id[i]);
                }
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
</script>
<script type="text/javascript" src="../js/productmanage.js"></script><html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/default1.css" rel="stylesheet" type="text/css">
</head>
<BODY>
<%@include file="head.inc"%>
<table width="92%" border=0 cellPadding=0 cellSpacing=0 align="center">
<form name="goodform" method="post" action="para.jsp" onsubmit="setAction('uninit')">
  <tr>
    <td  height="30" align="center" class="hcmp-title"><%=lpara_name%>管理
      <input type="hidden" name="hidden_operate" value="init">
      <input type="hidden" name="bt">
      <input type="hidden" name="checkValue">
      <input type="hidden" name="jumpPage" value="1">
      <input type="hidden" name="para_name" value="<%=para_name%>">
      <input type="hidden" name="lpara_name" value="<%=lpara_name%>">
    </td>
  </tr>
  <tr>
    <td align="center" valign="top" height="30"><%=lpara_name%>
      <input name="para_value" type="text" size="28" maxlength="50" value="">
      <input type="button" name="add_button" value="新建" onclick="setAction('uninit');setBt('add');goodform.submit();"/>
      <input type="button" name="del_button" value="删除" onClick="setAction('uninit');setBt('del');deleteitem('goodform');">
    </td>
  </tr>
</form>
  <tr>
    <td>
      <table width="75%" align="center" cellspacing="1" cellpadding="0" class="image-list">
        <tr>
          <th width="3%" height="25">
            <input type="checkbox" name="selectall" onclick="if(this.checked==true) { checkAll('checkList'); } else { clearAll('checkList'); }">
          </th>
          <th width="8%">序号</th>
          <th width="81%"><%=lpara_name%></th>
          <th width="8%">修改</th>
        </tr>
        <%
        String queryStatement="select * from "+para_name+" order by para_id desc";
        pageCtl.setSQL(queryStatement);
        Collection goods1 = pageCtl.getPage(pageNo);
        Iterator allgoods = goods1.iterator();
        while (allgoods.hasNext()) {
          paradetail book = (paradetail) allgoods.next();
          xuhao++;
        %>
        <tr align="center">
          <td>
            <input type="checkbox" name="checkList" value="<%=book.getPara_id()%>">
          </td>
          <td><%=String.valueOf(xuhao+(pageNo-1)*20)%></td>
          <td><%=book.getPara_value()%></td>
          <td><script language="javascript" type="">
          document.write('<a href="'+encodeURI("editpara.jsp?para_id=<%=book.getPara_id()%>&lpara_value=<%=book.getPara_value()%>")+'">修改</a>');
          </script></td>
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
<%@include file="foot.inc"%>
</body>
</html>
