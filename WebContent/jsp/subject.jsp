<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,kaoqin.packa.*"%>
<%request.setCharacterEncoding("utf-8");%>
<%@page errorPage="error.jsp"%>
<jsp:useBean id="sum_db" scope="session" class="kaoqin.packa.sumdb"></jsp:useBean>
<jsp:useBean id="department_db" scope="session" class="kaoqin.packa.departmentdb"></jsp:useBean>
<jsp:useBean id="query" scope="session" class="kaoqin.packa.query"></jsp:useBean>
<jsp:useBean id="para_db" scope="session" class="kaoqin.packa.paradb"></jsp:useBean>
<%
if(request.getParameter("hidden_operate") == null){
   session.setAttribute("queryStatement","");
   session.setAttribute("subject_num","");
   session.setAttribute("head","");
   session.setAttribute("department","");
   session.setAttribute("source","");
}
        int pageNo = 1,xuhao=0;
        String strPage = request.getParameter("jumpPage");
        if (strPage != null) {
          pageNo = Integer.parseInt(strPage);
        }
        String hidden_operate = "";
        String operatename = "";
        pageination pageCtl = new sumpage();
        pageCtl.setRowsPerPage(20);
        if (request.getParameter("hidden_operate") != null) {
          hidden_operate = request.getParameter("hidden_operate");
          operatename = request.getParameter("bt");
          String queryStatement ="";
          boolean back=true;
          if (hidden_operate.equals("uninit")) {
            if (operatename.equals("query")) {
              queryStatement =query.sumQueryManage("0",request.getParameter("subject_num"),request.getParameter("head"),request.getParameter("department"),request.getParameter("source"));
              session.setAttribute("queryStatement",queryStatement);
              session.setAttribute("subject_num", request.getParameter("subject_num"));
              session.setAttribute("head", request.getParameter("head"));
              session.setAttribute("department", request.getParameter("department"));
              session.setAttribute("source", request.getParameter("source"));
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
<table width="95%" border=0 cellPadding=0 cellSpacing=0 align="center">
<form name="goodform" method="post" action="subject.jsp" onsubmit="setAction('uninit')">
  <tr>
    <td height="30" align="center" class="hcmp-title">课题查看
      <input type="hidden" name="hidden_operate" value="init">
      <input type="hidden" name="bt">
      <input type="hidden" name="checkValue">
      <input type="hidden" name="jumpPage" value="1">
    </td>
  </tr>
  <tr>
    <td align="center">
      课题号
      <input type="text" name="subject_num" size="15" maxlength="50" value="<%=(String)session.getAttribute("subject_num")%>">
      负责人
      <input type="text" name="head" size="15" maxlength="50" value="<%=(String)session.getAttribute("head")%>">
     部门
     <select name="department">
        <%
        String department=(String)session.getAttribute("department");
        String source=(String)session.getAttribute("source");
        ListIterator iter;
        iter = department_db.getdepartment().listIterator();
        out.print("<option value=\"\">          </option>");
        for (; iter.hasNext(); ) {
            departmentdetail classes = (departmentdetail) iter.next();
        %>
          <option value="<%=classes.getDepartment_name()%>" <%if(department.equals(classes.getDepartment_name()))out.print("selected");%>><%=classes.getDepartment_name()%></option>
        <%}        %>
     </select>
  </td></tr><tr><td align="center">
     任务来源
     <select name="source">
          <option value="">          </option>
        <%
          ListIterator iter1;
          iter1=para_db.getpara("source").listIterator();
          for (; iter1.hasNext(); ) {
            paradetail classes = (paradetail) iter1.next();
        %>
          <option value="<%=classes.getPara_value()%>" <%if(source.equals(classes.getPara_value()))out.print("selected");%>><%=classes.getPara_value()%></option>
        <%}        %>
     </select>
     &nbsp;<input type="button" name="query" value="查询" onclick="setAction('uninit');setBt('query');goodform.submit();">
     </td>
    </tr>
</form>
  <tr>
    <td><br>
      <table width="100%" align="center" cellspacing="1" cellpadding="0" class="image-list">
        <tr>
          <th width="3%" height="25">
            <input type="checkbox" name="selectall" onclick="if(this.checked==true) { checkAll('checkList'); } else { clearAll('checkList'); }">
          </th>
          <th width="5%">序号</th>
          <th width="7%">课题号</th>
          <th width="7%">负责人</th>
          <th>部门</th>
          <th>任务来源</th>
          <th width="7%">创建人</th>
          <th width="5%">状态</th>
        </tr>
        <%
        String queryStatement=(String)session.getAttribute("queryStatement");
        String islock;
        if(queryStatement.equals("")){
           queryStatement =query.sumQueryManage("0","","","","");
        }
        pageCtl.setSQL(queryStatement);
        Collection goods1 = pageCtl.getPage(pageNo);
        Iterator allgoods = goods1.iterator();
        while(allgoods.hasNext()){
          sumdetail1 book = (sumdetail1) allgoods.next();
          xuhao++;
          islock=book.getLocked();
        %>
        <tr align="center">
          <td>
            <input type="checkbox" name="checkList" value="<%=book.getSubject_id()%>">
          </td>
          <td><%=String.valueOf(xuhao+(pageNo-1)*20)%></td>
          <td><a href="detailsum.jsp?subject_id=<%=book.getSubject_id()%>" target="_blank"><%=book.getSubject_num()%></a></td>
          <td><%=book.getHead()%></td>
          <td><%=book.getDepartment()%></td>
          <td><%=book.getSource()%></td>
          <td><%=book.getName()%></td>
          <%if(islock.equals("0")){out.print("<td>开放</td>");}else{out.print("<td>锁定</td>");}%>
        </tr>
      <%}%>
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
