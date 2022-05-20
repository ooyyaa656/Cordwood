<%@page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<%@page import="java.util.*,kaoqin.packa.*"%>
<%@page errorPage="error.jsp"%>
<jsp:useBean id="user_db" scope="session" class="kaoqin.packa.userdb"></jsp:useBean>
<script type="text/javascript">
function Trim(strSource)
{
return  strSource.replace(/^s*/,'').replace(/s*$/,'');
}
function checkname(){
          var p3=Trim(document.product.email.value);
          var p4=Trim(document.product.tel.value);
         if (p3==""||p4=="")
         {  alert("请填写必填项!");
            return false;
         }
         return true;
}
function checkname_pa(){
          var p1=Trim(document.product1.psword1_ma.value);
          var p2=Trim(document.product1.psword1_ma2.value);
         if (p1==""||p2=="")
         {  alert("请填写密码和确认密码!");
            return false;
         }
         if(p1!=p2){
           alert("确认密码与密码必须相同!");
           return false;
         }
         return true;
}
</script><html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/default1.css" rel="stylesheet" type="text/css">
</head>
<BODY>
<%@include file="head.inc"%>
<%
  String user_info_id = request.getParameter("user_info_id");
  if (user_info_id != null) {
    ArrayList iterlist = (ArrayList) user_db.getoneuser(user_info_id);
    userdetail book = (userdetail) iterlist.get(0);
%>
<table width="75%" border=0 cellPadding=0 cellSpacing=0 align="center">
  <form name="product" method="post" action="adduserpro.jsp">
  <tr>
    <th colspan="4">
      <input type="hidden" name="hidden_operate" value="init">
      <input type="hidden" name="operatename" value="edit">
      <input type="hidden" name="user_info_id" value="<%=user_info_id%>">
    </th>
  </tr>
  <tr align="center">
    <td colspan="4" height="40">
      <STRONG>修改用户资料</STRONG>
      <HR style="BORDER-TOP: #aaaaaa 1px solid" SIZE=0>
    </td>
  </tr>
  <tr>
    <td height="30" width="15%">用户名
    </td>
    <td width="35%">
      <input type="text" class="noedit" readonly="readonly" name="username" size="15" maxlength="20" value="<%=book.getUsername()%>">
    </td>
    <td>权限&nbsp;&nbsp;<FONT color="#FF0000">*</FONT>
    </td>
    <td>
    <%String user_info_role = book.getRole();    %>
      <select name="role">
        <option value="operate" <%if(user_info_role.equals("operate"))out.print("selected");%>>操作</option>
        <option value="manage" <%if(user_info_role.equals("manage"))out.print("selected");%>>管理</option>
      </select>
    </td>
  </tr>
  <tr>
    <td width="15%">姓名</td>
    <td width="35%">
      <input type="text" name="name" size="15" maxlength="10" value="<%=book.getName()%>">
    </td>
    <td height="30">Email&nbsp;&nbsp;<FONT color="#FF0000">*</FONT></td>
    <td>
      <input type="text" name="email" size="15" maxlength="50" value="<%=book.getEmail()%>">
    </td>
  </tr>
  <tr>
    <td width="15%">电话&nbsp;&nbsp;<FONT color="#FF0000">*</FONT>
    </td>
    <td colspan="3">
      <input type="text" name="tel" size="15" maxlength="50" value="<%=book.getTel()%>">
    </td>
  </tr>
  <tr>
    <td colspan="4" align="center" height="30">
      <input type="submit" value="修改资料" name="tijiao" onclick="return checkname();">
      <input type="button" value="返回" onclick="history.go(-1)">
    </td>
  </tr>
  </form>
  <form name="product1" method="post" action="adduserpro.jsp">
  <tr align="center">
    <td colspan="4" height="40"><br>
      <STRONG>修改密码</STRONG>
      <input type="hidden" name="operatename" value="psword_ch">
      <input type="hidden" name="user_info_id" value="<%=user_info_id%>">
      <HR style="BORDER-TOP: #aaaaaa 1px solid" SIZE=0>
    </td>
  </tr>
  <tr>
    <td height="30">密码&nbsp;&nbsp;<FONT color="#FF0000">*</FONT>
    </td>
    <td>
      <input type="password" name="psword1_ma" size="15" maxlength="20">
    </td>
    <td>确认密码&nbsp;&nbsp;<FONT color="#FF0000">*</FONT>
    </td>
    <td>
      <input type="password" name="psword1_ma2" size="15" maxlength="20">
    </td>
  </tr>
  <tr>
    <td colspan="4" align="center" height="30">
      <input type="submit" value="修改密码" name="tijiaopa" onclick="return checkname_pa();">
      <input type="button" value="返回" onclick="history.go(-1)">
    </td>
  </tr>
  </form>
</table>
<%}%>
<%@include file="foot.inc"%>
</body>
</html>
