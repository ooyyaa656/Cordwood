<%request.setCharacterEncoding("utf-8");%>
<%@page contentType="text/html;charset=utf-8" language="java" pageEncoding="utf-8" errorPage="jsp/error.jsp"%>
<html>
<head>
<script type="text/javascript">
function Trim(strSource)
{
return  strSource.replace(/^s*/,'').replace(/s*$/,'');
}
function check(){
          var t=Trim(document.indexForm.username.value);
          var p=Trim(document.indexForm.passwd.value);
         if (t==null || t==""||p==""||p==null)
         {  alert("请填写用户名和密码!");
            return false;
         }
          s = "用户名只能由大小写英文字母、阿拉伯数字和下划线组成!";
        if (t.search(/[^a-zA-Z0-9_]/)>=0){
          alert(s);
          return false;
        }
         return true;
}
</script><META http-equiv="Content-Type" content="text/html; charset=utf-8">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="0">
<link href="css/default1.css" rel="stylesheet" type="text/css">
<title>课题管理</title>
</head>
<BODY>
<div id="container" align="center">
  <div id="Header">  </div>
  <div id="PageBody">
    <div class="line1">&nbsp;</div>
    <div id="center">
      <DIV class=b2 align="center">
        <img src="image/28.jpg" border="0" alt="">
        <TABLE cellSpacing=0 cellPadding=4 width=240 border=0>
          <TBODY>
          <form name="indexForm" method="post" action="jsp/login.jsp">
           <tr>
           <td width="56" class="f14">用户名:</td>
           <td width="156"><input type="text" class="ip" name="username" maxlength="20" value="">
            </td>
            </tr><tr>
            <td width="56" class="f14">密　码:</td>
            <td width="156"><input type="password" class="ip" name="passwd" maxlength="20" value="">
            </td>
            </tr><tr>
            <td colspan="2" align="center">
              <input type="submit" name="login" value=" 登录 " onclick="return check();">
            </td>
          </tr>
        </form>
        </TBODY>
        </table>
      </DIV>
    </DIV>
    <div id="Footer">
      <HR style="BORDER-TOP: #aaaaaa 1px solid" SIZE=0>
        <table width="100%" border=0 cellPadding=0 cellSpacing=0 align="center"><tr><td align="center">
        通讯地址:&nbsp;北京市石景山区玉泉路19号(乙)&nbsp;&nbsp;&nbsp;邮政编码:&nbsp;100049</td></tr>
      <tr><td align="center">中国科学院高能物理研究所&nbsp;承制</td></tr></table>
    </div>
  </DIV>
</DIV>
</body>
</html>
