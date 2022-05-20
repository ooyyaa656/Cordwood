<%@page contentType="text/html; charset=UTF-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<%@page import="java.util.*,kaoqin.packa.*"%>
<%@page errorPage="error.jsp"%>
<jsp:useBean id="budget_db" scope="session" class="kaoqin.packa.budgetdb"></jsp:useBean>
<jsp:useBean id="sum_db" scope="session" class="kaoqin.packa.sumdb"></jsp:useBean>
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
<script type="text/javascript" src="../js/productmanage.js"></script>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/default1.css" rel="stylesheet" type="text/css">
</head>
<BODY>
<%@include file="head.inc"%>
<%
  String subject_id;
  subject_id=request.getParameter("subject_id");
  ArrayList iterlist = (ArrayList) sum_db.getonesum(subject_id);
  sumdetail book1 = (sumdetail) iterlist.get(0);
  String templet=book1.getTemplet();
  int pageNo = 1,xuhao=0;
  String strPage = request.getParameter("jumpPage");
  if (strPage != null) {
    pageNo = Integer.parseInt(strPage);
  }
     String hidden_operate = "";
     String operatename = "";
     pageination pageCtl = new budgetpage();
     pageCtl.setRowsPerPage(20);
     if(request.getParameter("hidden_operate") != null){
            hidden_operate = request.getParameter("hidden_operate");
            operatename = request.getParameter("bt");
            if (hidden_operate.equals("uninit")) {
              if (operatename.equals("del")){
              String checkValue = request.getParameter("checkValue");
              String[] budget_id = null;
              budget_id = checkValue.split(",");
              for(int i = 0; i < budget_id.length; i++){
                  budget_db.delbudget(budget_id[i]);
                }
              }
        }
    }
  %>
<form name="goodform" method="post" action="budget.jsp">
<table width="90%" border=0 cellPadding=0 cellSpacing=0 align="center">
   <tr align="center">
     <td height="25">
       <input type="hidden" name="subject_id" value="<%=subject_id%>">
       <input type="hidden" name="hidden_operate" value="init">
       <input type="hidden" name="bt">
       <input type="hidden" name="checkValue">
       <input type="hidden" name="jumpPage" value="1">
         <input type="hidden" name="remark" size="25" maxlength="50" value=""><br>
       <STRONG>课题预算</STRONG>
       <HR style="BORDER-TOP: #aaaaaa 1px solid" SIZE=0>
     </td>
   </tr>
   <tr>
    <td height="25">&nbsp;&nbsp;&nbsp;&nbsp;课题编号：<%=book1.getSubject_num()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;课题名称：<%=book1.getSubject_name()%></td>
   </tr>
  <tr><td align="center" height="35">
          <input type="button" value="返回" onclick="location.href='main.jsp?hidden_operate=init'">
          <input type="button" name="add_button" value="新建" onclick="location.href='addbudget.jsp?subject_id=<%=subject_id%>'"/>
          <input type="button" name="del_button" value="删除" onClick="setAction('uninit');setBt('del');deleteitem('goodform');"/>
 </td></tr>
</form>
  <tr><td>
    <table width="100%" align="center" cellspacing="1" cellpadding="0" class="image-list">
        <tr>
          <th width="3%" height="25">
            <input type="checkbox" name="selectall" onclick="if(this.checked==true) { checkAll('checkList'); } else { clearAll('checkList'); }">
          </th>
          <th width="5%">序号</th>
          <th width="15%">年份</th>
          <th>购置设备费</th>
          <th>会议费</th>
          <th width="15%">操作</th>
        </tr>
        <%
        String queryStatement;
        queryStatement ="select * from budget where subject_id="+subject_id+" order by budget_id desc";
        pageCtl.setSQL(queryStatement);
        Collection goods1 = pageCtl.getPage(pageNo);
        Iterator allgoods = goods1.iterator();
        while (allgoods.hasNext()) {
          budgetdetail book = (budgetdetail) allgoods.next();
          xuhao++;
        %>
        <tr align="center">
          <td>
            <input type="checkbox" name="checkList" value="<%=book.getBudget_id()%>">
          </td>
          <td><%=String.valueOf(xuhao+(pageNo-1)*20)%></td>
          <td><%=book.getBudget_year()%></td>
          <td><%=book.getDevice1()%></td>
          <td><%=book.getMeeting()%></td>
          <td><a href="viewbudget.jsp?budget_id=<%=book.getBudget_id()%>&templet=<%=templet%>&subject_id=<%=subject_id%>">查看</a>
          &nbsp;&nbsp;<a href="editbudget.jsp?budget_id=<%=book.getBudget_id()%>&templet=<%=templet%>&subject_id=<%=subject_id%>">修改</a></td>
        </tr>
      <%}      %>
    </table>
  </td></tr>
  <tr>
     <td height="8" background="../image/dot.jpg" colspan="6"></td>
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
