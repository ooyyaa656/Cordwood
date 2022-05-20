<%@page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<%@page import="java.util.*,kaoqin.packa.*"%>
<%@page errorPage="error.jsp"%>
<jsp:useBean id="sum_db" scope="session" class="kaoqin.packa.sumdb"></jsp:useBean>
<jsp:useBean id="para_db" scope="session" class="kaoqin.packa.paradb"></jsp:useBean>
<script type="text/javascript" src="../js/productmanage.js"></script>
<html>
<head><script type="text/javascript">
function Trim(strSource)
{
return  strSource.replace(/^s*/,'').replace(/s*$/,'');
}
function check(){
         var t=Trim(document.product.pro_num.value); 
         var p=Trim(document.product.subject_money.value); 
         var q=Trim(document.product.templet.value); 
         if (t==null || t==""||p==""||p==null||q==""||q==null)
         {  alert("项目批准号/合同号、经费来源、预算模板不能为空!");
            return false;
         }
         return true;
}
</script>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/default1.css" rel="stylesheet" type="text/css">
</head>
<BODY>
<%@include file="head.inc"%>
<form name="product" method="post" action="addsubjectpro.jsp">
<table width="75%" border=0 cellPadding=0 cellSpacing=0 align="center">
 <tr align="center">
    <td height="25">
      <input type="hidden" name="hidden_operate" value="init">
      <input type="hidden" name="operatename" value="create"><br>
     <STRONG>新建课题</STRONG>
     <HR style="BORDER-TOP: #aaaaaa 1px solid" SIZE=0>
    </td>
  </tr>
  <tr><td align="center">
    <table align="center">
      <tr>
        <td height="30">
           院管项目编号</td>
        <td><input type="text" name="institute_num" size="15" maxlength="50"></td>
        <td>任务来源(2)+项目申请年度(4)+项目所管局(6)+流水号(3)</td>
      </tr><tr>
        <td height="30">
           非院管项目编号</td>
        <td><input type="text" name="noinstitute_num" size="15" maxlength="50"></td>
        <td>任务来源(2)+项目任务书/项目合同编号</td>
      </tr><tr>
        <td height="30">
           院项目编号</td>
        <td><input type="text" name="iproject_num" size="15" maxlength="50"></td>
        <td>院（非）管项目编号+流水(2)</td>
      </tr><tr>
        <td height="30">
           项目批准号/合同号&nbsp;<font color="red">*</font></td>
        <td colspan="2"><input type="text" name="pro_num" size="63" maxlength="50"></td>
      </tr><tr>
        <td height="30">
           项目编号(6)</td>
        <td><input type="text" name="project_num" size="15" maxlength="50"></td>
        <td>开题年(2)+任务来源(2)+其他(2)</td>
      </tr><tr>
        <td height="30">
           课题编号(7)</td>
        <td><input type="text" name="subject_num" size="15" maxlength="50"></td>
        <td>项目编号(6)+其他(1)</td>
      </tr><tr>
        <td height="30">
           子课题编号(10)</td>
        <td><input type="text" name="sub_num" size="15" maxlength="50"></td>
        <td>课题编号(7)+经费来源(3)</td>
      </tr><tr>
        <td height="30">
           课题名称</td>
        <td colspan="2"><input type="text" name="subject_name" size="63" maxlength="50"></td>
      </tr><tr>
        <td height="30">
           经费来源&nbsp;<font color="red">*</font></td>
        <td colspan="2"><select name="subject_money" class="selectwidth">
        <%
        ListIterator iter;
        iter = para_db.getpara("money").listIterator();
        for (; iter.hasNext(); ) {
            paradetail classes = (paradetail) iter.next();
        %>
          <option value="<%=classes.getPara_value()%>"><%=classes.getPara_value()%></option>
        <%}        %>
          </select></td>
      </tr><tr>
        <td height="30">
           预算模板&nbsp;<font color="red">*</font></td>
        <td colspan="2">
          <select name="templet">
           <option value="" ></option>
           <option value="0">国家科技支撑计划预算模板</option>
           <option value="1">院重大项目预算模板</option>
           <option value="2">国家863计划预算模板</option>
           <option value="3">国家自然基金预算模板</option>
           <option value="4">国家科技重大专项预算模版</option>
           <option value="5">高技术应用项目预算模板</option>
           <option value="6">其他项目预算模板</option>
           <option value="7">973计划预算模板</option>
           <option value="8">新基金项目预算模板</option>
           <option value="9">重点研发计划预算模板</option>
          </select>
        </td>
      </tr><tr>
        <td height="30">
           联系人</td>
        <td colspan="2"><input type="text" name="linkman" size="15" maxlength="50"></td>
      </tr><tr>
        <td height="30">
           Email</td>
        <td colspan="2"><input type="text" name="email" size="15" maxlength="50"></td>
      </tr></table>
  </td></tr>
  <tr><td align="center" height="30">
          <input type="submit" value="提交" name="tijiao" onclick="return check();">
          <input type="button" value="返回" onclick="location.href='main.jsp'">
  </td></tr>
</table>
</form>
<%@include file="foot.inc"%>
</body>
</html>
