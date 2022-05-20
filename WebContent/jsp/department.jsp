<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,kaoqin.packa.*"%>
<%request.setCharacterEncoding("utf-8");%>
<%@page errorPage="error.jsp"%>
<jsp:useBean id="department_db" scope="session" class="kaoqin.packa.departmentdb"></jsp:useBean>
<%      int pageNo = 1,xuhao=0;
        String strPage = request.getParameter("jumpPage");
        if (strPage != null) {
          pageNo = Integer.parseInt(strPage);
        }
        String hidden_operate = "";
        String operatename = "";
        pageination pageCtl = new departmentpage();
        pageCtl.setRowsPerPage(20);
        if (request.getParameter("hidden_operate") != null) {
          hidden_operate = request.getParameter("hidden_operate");
          operatename = request.getParameter("bt");
          if (hidden_operate.equals("uninit")) {
            if (operatename.equals("add")) {
               department_db.adddepartment(request.getParameter("department_name"));
            }else if(operatename.equals("del")){
                String checkValue = request.getParameter("checkValue");
                String[] department_id = null;
                department_id = checkValue.split(",");
                for (int i = 0; i < department_id.length; i++) {
                  department_db.deldepartment(department_id[i]);
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
<form name="goodform" method="post" action="department.jsp">
  <tr>
    <td  height="30" align="center" class="hcmp-title">所属部门管理
      <input type="hidden" name="hidden_operate" value="init">
      <input type="hidden" name="bt">
      <input type="hidden" name="checkValue">
      <input type="hidden" name="jumpPage" value="1">
    </td>
  </tr>
  <tr>
    <td align="center" valign="top" height="30">      部门
      <input name="department_name" type="text" size="28" maxlength="50" value="">
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
          <th width="81%">部门</th>
          <th width="8%">修改</th>
        </tr>
        <%
        String queryStatement="select * from department order by department_id desc";
        pageCtl.setSQL(queryStatement);
        Collection goods1 = pageCtl.getPage(pageNo);
        Iterator allgoods = goods1.iterator();
        while (allgoods.hasNext()) {
          departmentdetail book = (departmentdetail) allgoods.next();
          xuhao++;
        %>
        <tr align="center">
          <td>
            <input type="checkbox" name="checkList" value="<%=book.getDepartment_id()%>">
          </td>
          <td><%=String.valueOf(xuhao+(pageNo-1)*20)%></td>
          <td><%=book.getDepartment_name()%></td>
          <td><a href="editdepartment.jsp?department_id=<%=book.getDepartment_id()%>&department_name=<%=book.getDepartment_name()%>">修改</a></td>
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
