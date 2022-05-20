<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,kaoqin.packa.*"%>
<%request.setCharacterEncoding("utf-8");%>
<%@page errorPage="error.jsp"%>
<jsp:useBean id="user_db" scope="session" class="kaoqin.packa.userdb"></jsp:useBean>
<%
        String login_role=(String)session.getAttribute("login_role");
        if(login_role.equals("operate")){response.sendRedirect("nopriviledge.jsp");}
        int pageNo = 1,xuhao=0;
        String strPage = request.getParameter("jumpPage");
        if (strPage != null) {
          pageNo = Integer.parseInt(strPage);
        }
        String hidden_operate = "";
        String operatename = "";
        pageination pageCtl = new userpage();
        pageCtl.setRowsPerPage(20);
        if (request.getParameter("hidden_operate") != null) {
          hidden_operate = request.getParameter("hidden_operate");
          operatename = request.getParameter("bt");
          if (hidden_operate.equals("uninit")) {
            if (operatename.equals("del")) {
              String checkValue = request.getParameter("checkValue");
              String[] unique_id = null;
              unique_id = checkValue.split(",");
              for (int i = 0; i < unique_id.length; i++) {
              user_db.deluser(unique_id[i]);
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
<title>用户管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/default1.css" rel="stylesheet" type="text/css">
</head>
<BODY>
<%@include file="head.inc"%>
<table width="92%" border=0 cellPadding=0 cellSpacing=0 align="center">
<form name="goodform" method="post" action="user.jsp" onsubmit="setAction('uninit')">
  <tr>
    <td  height="30" align="center" class="hcmp-title">用户管理
      <input type="hidden" name="hidden_operate" value="init">
      <input type="hidden" name="bt">
      <input type="hidden" name="checkValue">
      <input type="hidden" name="jumpPage" value="1">
    </td>
  </tr>
  <tr>
    <td align="right"  height="30">
      <input type="button" name="add_button" value="新建" onclick="location.href='adduser.jsp'"/>
      <input type="button" name="del_button" value="删除" onClick="setAction('uninit');setBt('del');deleteitem('goodform');"/>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </td>
  </tr>
</form>
  <tr>
    <td>
      <table width="100%" align="center" cellspacing="1" cellpadding="0" class="image-list">
        <tr>
          <th width="3%" height="25">
            <input type="checkbox" name="selectall" onclick="if(this.checked==true) { checkAll('checkList'); } else { clearAll('checkList'); }">
          </th>
          <th width="5%">序号</th>
          <th width="10%">用户名</th>
          <th width="7%">权限</th>
          <th width="10%">姓名</th>
          <th>Email</th>
          <th>电话</th>
          <th width="5%">修改</th>
        </tr>
        <%
        String queryStatement;
        queryStatement ="select * from user_info where role<>'admin'";

        pageCtl.setSQL(queryStatement);
        Collection goods1 = pageCtl.getPage(pageNo);
        Iterator allgoods = goods1.iterator();
        while (allgoods.hasNext()) {
          userdetail book = (userdetail) allgoods.next();
          xuhao++;
        %>
        <tr align="center">
          <td>
            <input type="checkbox" name="checkList" value="<%=book.getUser_id()%>">
          </td>
          <% String user_info_role=book.getRole();%>
          <td><%=String.valueOf(xuhao+(pageNo-1)*20)%></td>
          <td><%=book.getUsername()%></td>
          <td><%if(user_info_role.equals("operate")){out.print("操作");}else{out.print("管理");}%></td>
          <td><%=book.getName()%></td>
          <td><%=book.getEmail()%></td>
          <td><%=book.getTel()%></td>
          <td><a href="edituser.jsp?user_info_id=<%=book.getUser_id()%>">修改</a></td>
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
