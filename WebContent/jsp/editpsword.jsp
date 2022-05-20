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
function checkname_pa(){
          var p1=Trim(document.product1.psword1_ma.value);
          var p2=Trim(document.product1.psword1_ma2.value);
         if (p1==""||p1==null||p2==""||p2==null)
         {  alert("请填写必填项!");
            return false;
         }
         if(p1!=p2){
           alert("确认密码与密码必须相同!");
           return false;
         }
         return true;
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
<table width="100%" height="380" border=0 cellPadding=0 cellSpacing=0 align="center"><tr><td valign="top">
<table width="60%" border=0 cellPadding=0 cellSpacing=0 align="center">
<form name="product1" method="post" action="adduserpro.jsp">
  <tr align="center">
    <td colspan="4" height="30" align="center" class="hcmp-title">更改密码
      <input type="hidden" name="operatename" value="psword_ch">
      <input type="hidden" name="user_info_id" value="<%=session.getAttribute("login_user_id")%>">
    </td>
  </tr><tr><td colspan="4" >
  <HR style="BORDER-TOP: #aaaaaa 1px solid" SIZE=0></td></tr>
  <tr align="center">
    <td height="30">密码&nbsp;&nbsp;<FONT color="#FF0000">*</FONT></td>
    <td>
      <input type="password" name="psword1_ma" size="15" maxlength="20">
    </td>
    <td>确认密码&nbsp;&nbsp;<FONT color="#FF0000">*</FONT></td>
    <td>
      <input type="password" name="psword1_ma2" size="15" maxlength="20">
    </td>
  </tr>
  <tr>
    <td colspan="4" align="center" height="35">
      <input type="submit" value="修改密码" name="tijiaopa" onclick="return checkname_pa();">
    </td>
  </tr>
</form>
</table></td></tr></table>
<%@include file="foot.inc"%>
</body>
</html>
