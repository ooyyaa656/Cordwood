<%@page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<%@page import="java.util.*,kaoqin.packa.*"%>
<%@page errorPage="error.jsp"%>
<jsp:useBean id="member_db" scope="session" class="kaoqin.packa.memberdb"></jsp:useBean>
<jsp:useBean id="para_db" scope="session" class="kaoqin.packa.paradb"></jsp:useBean>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/default1.css" rel="stylesheet" type="text/css">
</head>
<BODY>
<%@include file="head.inc"%>
<table width="60%" border=0 cellPadding=0 cellSpacing=0 align="center">
<form name="product1" method="post" action="editmemberpro.jsp">
  <tr align="center">
    <%
      String member_id=request.getParameter("member_id");
      ArrayList iterlist = (ArrayList) member_db.getonemember(member_id);
      memberdetail book = (memberdetail) iterlist.get(0);
    %>
    <td height="30" align="center">
      <input type="hidden" name="subject_id" value="<%=book.getSubject_id()%>">
      <input type="hidden" name="member_id" value="<%=member_id%>">
        <input type="hidden" name="remark" size="25" maxlength="50" value=""><br>
        <Strong>修改人员</Strong>
        <HR style="BORDER-TOP: #aaaaaa 1px solid" SIZE=0>
    </td>
  </tr>
  <tr>
      <td><table width="75%" align="center"><tr>
      <td>
            姓名</td>
      <td colspan="2"><input type="text" name="member_name" size="25" maxlength="50" value="<%=book.getMember_name()%>"></td>
  </tr><tr>
      <td height="30">
            人员分类1&nbsp;&nbsp;<a href="peopleexplain.jsp">(分类)</a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
         <td>
             <select name="para_id1" class="selectwidth1">
      <%
               String para_id1=book.getClass_name1();
               String para_id2=book.getClass_name2();
               ListIterator iter;
               iter = para_db.getpara("class1").listIterator();
               for (; iter.hasNext(); ) {
                 paradetail classes = (paradetail) iter.next();
      %>
       <option value="<%=classes.getPara_value()%>" <%if(para_id1.equals(classes.getPara_value()))out.print("selected");%>><%=classes.getPara_value()%></option>
      <%}%>
       </select></td></tr><tr>
       <td>人员分类2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>
             <select name="para_id2" class="selectwidth1">
         <%
             iter = para_db.getpara("class2").listIterator();
             for (; iter.hasNext(); ) {
               paradetail classes = (paradetail) iter.next();
          %>
        <option value="<%=classes.getPara_value()%>" <%if(para_id2.equals(classes.getPara_value()))out.print("selected");%>><%=classes.getPara_value()%></option>
          <%}%>
        </select>
        </td>
      </tr><tr>
         <td>
            进入课题时间</td>
         <td><input type="text" name="begin_date" size="15" maxlength="10" value="<%=book.getBegin_date()%>">(yyyy.mm.dd)</td>
       </tr>
  <tr>
    <td colspan="3" align="center" height="35">
      <input type="submit" value="修改" name="tijiaopa">
      <input type="button" value="返回" onclick="history.go(-1)"></td></tr></table>
    </td>
  </tr>
</form>
</table>
<%@include file="foot.inc"%>
</body>
</html>
