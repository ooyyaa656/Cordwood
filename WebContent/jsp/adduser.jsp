<%@page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<%@page import="java.util.*,kaoqin.packa.*"%>
<%@page errorPage="error.jsp"%>
<jsp:useBean id="user_db" scope="session" class="kaoqin.packa.userdb"></jsp:useBean>
<script type="text/javascript" src="../js/productmanage.js"></script>
<script type="text/javascript">
function Trim(strSource)
{
return  strSource.replace(/^s*/,'').replace(/s*$/,'');
}
function checkname(){
          var t=Trim(document.product.username.value);
          var p1=Trim(document.product.psword1_ma.value);
          var p2=Trim(document.product.psword2_ma.value);
          var p3=Trim(document.product.email.value);
          var p4=Trim(document.product.tel.value);
         if (t==""||p1==""||p2==""||p3==""||p4=="")
         {  alert("请填写必填项!");
            return false;
         }
         if(p1!=p2){
           alert("确认密码与密码必须相同!");
           return false;
         }
          s = "用户名只能由大小写英文字母、阿拉伯数字和下划线组成!";
        if (t.search(/[^a-zA-z0-9_]/)>=0){
          alert(s);
          return false;
        }
         return true;
}
</script>
<html>
<head>
<title>新建用户</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/default1.css" rel="stylesheet" type="text/css">
</head>
<BODY>
<%@include file="head.inc"%>
<form name="product" method="post" action="adduserpro.jsp">
<table width="75%" border=0 cellPadding=0 cellSpacing=0 align="center">
  <tr align="center">
    <td colspan="4" height="25">
      <input type="hidden" name="operatename" value="create">
     <STRONG> 用户信息</STRONG>
     <HR style="BORDER-TOP: #aaaaaa 1px solid" SIZE=0>
    </td>
  </tr>
  <tr>
    <td height="30" width="15%">用户名&nbsp;&nbsp;<FONT color="#FF0000">*</FONT>
    </td>
    <td width="35%">
      <input type="text" name="username" size="15" maxlength="20">
    </td>
    <td>权限&nbsp;&nbsp;<FONT color="#FF0000">*</FONT>
    </td>
    <td>
      <select name="role">
        <option value="operate" selected>操作</option>
        <option value="manage">管理</option>
      </select>
    </td>
  </tr>
  <tr>
    <td height="30">密码&nbsp;&nbsp;<FONT color="#FF0000">*</FONT>
    </td>
    <td>
      <input type="password" name="psword1_ma" size="17" maxlength="20">
    </td>
    <td>确认密码&nbsp;&nbsp;<FONT color="#FF0000">*</FONT>
    </td>
    <td>
      <input type="password" name="psword2_ma" size="17" maxlength="20">
    </td>
  </tr>
  <tr>
    <td width="15%">姓名
    </td>
    <td width="35%">
      <input type="text" name="name" size="15" maxlength="10">
    </td>
    <td height="30">Email&nbsp;&nbsp;<FONT color="#FF0000">*</FONT>
    </td>
    <td>
      <input type="text" name="email" size="15" maxlength="50">
    </td>
  </tr>
  <tr>
    <td width="15%">电话&nbsp;&nbsp;<FONT color="#FF0000">*</FONT>
    </td>
    <td colspan="3">
      <input type="text" name="tel" size="15" maxlength="50">
    </td>
  </tr>
  <tr>
    <td colspan="4" align="center">
      <input type="submit" value="提交" name="tijiao" onclick="return checkname();">
      <input type="button" value="返回" onclick="location.href='user.jsp'">
    </td>
  </tr>
</table>
</form>
<%@include file="foot.inc"%>
</body>
</html>
