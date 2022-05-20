<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<%@page import="java.util.*,kaoqin.packa.*"%>
<%@page errorPage="error.jsp"%>
<jsp:useBean id="sum_db" scope="session" class="kaoqin.packa.sumdb"></jsp:useBean>
<jsp:useBean id="department_db" scope="session" class="kaoqin.packa.departmentdb"></jsp:useBean>
<jsp:useBean id="para_db" scope="session" class="kaoqin.packa.paradb"></jsp:useBean>
<script type="text/javascript">
function setAction(action){
    document.goodform.operatename.value=action;
}
function select_k(){
    var somevalue;
    somevalue=window.showModalDialog("knowledge.jsp","","dialogHeight:40;dialogWidth:45;")
    if(somevalue!=null)
    document.goodform.knowledge.value=somevalue;
}
function check(){
         var t=document.goodform.reason.value;
         if (t==null || t=="")
         {  alert("项目属性不能为空!");
            return false;
         }
         return true;
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
<form name="goodform" method="post" action="addsubjectpro.jsp">
<table width="85%" border=0 cellPadding=0 cellSpacing=0 align="center">
  <%
        String subject_id1,islock;
        subject_id1=request.getParameter("subject_id");
        ArrayList iterlist = (ArrayList) sum_db.getonesum(subject_id1);
        sumdetail book = (sumdetail) iterlist.get(0);
        islock=book.getLocked();
        if(islock.equals("0")){
  %>
 <tr align="center">
    <td height="25">
      <input type="hidden" name="subject_id" value="<%=subject_id1%>">
      <input type="hidden" name="operatename" value="edit"><br>
     <STRONG>修改课题</STRONG>
     <HR style="BORDER-TOP: #aaaaaa 1px solid" SIZE=0>
    </td>
  </tr>
  <tr><td align="center">
    <table align="center">
      <tr>
        <td height="30">
           院管项目编号</td>
        <td><input type="text" name="institute_num" size="15" maxlength="50" value="<%=book.getInstitute_num()%>"></td>
        <td>任务来源(2)+项目申请年度(4)+项目所管局(6)+流水号(3)</td>
      </tr><tr>
        <td height="30">
           非院管项目编号</td>
        <td><input type="text" name="noinstitute_num" size="15" maxlength="50" value="<%=book.getNoinstitute_num()%>"></td>
        <td>任务来源(2)+项目任务书/项目合同编号</td>
      </tr><tr>
        <td height="30">
           院项目编号</td>
        <td><input type="text" name="iproject_num" size="15" maxlength="50" value="<%=book.getIproject_num()%>"></td>
        <td>院（非）管项目编号+流水(2)</td>
      </tr><tr>
        <td height="30">
           项目批准号/合同号&nbsp;<font color="red">*</font></td>
        <td colspan="2"><input type="text" name="pro_num" size="63" maxlength="50" value="<%=book.getPro_num()%>"></td>
      </tr><tr>
        <td height="30">
           项目编号(6)</td>
        <td><input type="text" name="project_num" size="15" maxlength="50" value="<%=book.getProject_num()%>"></td>
        <td>开题年(2)+任务来源(2)+其他(2)</td>
      </tr><tr>
        <td height="30">
           课题编号(7)</td>
        <td><input type="text" name="subject_num" size="15" maxlength="50" value="<%=book.getSubject_num()%>"></td>
        <td>项目编号(6)+其他(1)</td>
      </tr><tr>
        <td height="30">
           子课题编号(10)</td>
        <td><input type="text" name="sub_num" size="15" maxlength="50" value="<%=book.getSub_num()%>"></td>
        <td>课题编号(7)+经费来源(3)</td>
      </tr><tr>
        <td height="30">
           课题名称</td>
        <td colspan="2"><input type="text" name="subject_name" size="63" maxlength="50" value="<%=book.getSubject_name()%>"></td>
      </tr><tr>
        <td height="30">
           经费来源&nbsp;<font color="red">*</font></td>
        <td colspan="2"> <select name="subject_money" class="selectwidth">
        <%
        String money=book.getSubject_money();
        String templet=book.getTemplet();
        ListIterator iter;
        iter = para_db.getpara("money").listIterator();
        for (; iter.hasNext(); ) {
            paradetail classes = (paradetail) iter.next();
        %>
          <option value="<%=classes.getPara_value()%>" <%if(money.equals(classes.getPara_value()))out.print("selected");%>><%=classes.getPara_value()%></option>
        <%}        %>
          </select></td>
      </tr><tr>
        <td height="30">
           预算模板&nbsp;<font color="red">*</font></td>
        <td colspan="2">
          <select name="templet">
           <option value="0" <%if(templet!=null&&templet.equals("0"))out.print("selected");%>>国家科技支撑计划预算模板</option>
           <option value="1" <%if(templet!=null&&templet.equals("1"))out.print("selected");%>>院重大项目预算模板</option>
           <option value="2" <%if(templet!=null&&templet.equals("2"))out.print("selected");%>>国家863计划预算模板</option>
           <option value="3" <%if(templet!=null&&templet.equals("3"))out.print("selected");%>>国家自然基金预算模板</option>
           <option value="4" <%if(templet!=null&&templet.equals("4"))out.print("selected");%>>国家科技重大专项预算模版</option>
           <option value="5" <%if(templet!=null&&templet.equals("5"))out.print("selected");%>>高技术应用项目预算模板</option>
           <option value="6" <%if(templet!=null&&templet.equals("6"))out.print("selected");%>>其他项目预算模板</option>
           <option value="7" <%if(templet!=null&&templet.equals("7"))out.print("selected");%>>973计划预算模板</option>
           <option value="8" <%if(templet!=null&&templet.equals("8"))out.print("selected");%>>新基金项目预算模板</option>
           <option value="9" <%if(templet!=null&&templet.equals("9"))out.print("selected");%>>重点研发计划预算模板</option>
          </select>
        </td>
      </tr><tr>
        <td height="30">
           联系人</td>
        <td colspan="2"><input type="text" name="linkman" size="63" maxlength="50" value="<%=book.getLinkman()%>"></td>
      </tr><tr>
        <td height="30">
           Email</td>
        <td colspan="2"><input type="text" name="email" size="63" maxlength="50" value="<%=book.getEmail()%>"></td>
      </tr><tr>
        <td height="30">
           项目名称</td>
        <td colspan="2"><input type="text" name="project_name" size="63" maxlength="50" value="<%=book.getProject_name()%>"></td>
      </tr><tr>
        <td height="30">
           预算总金额(万元)</td>
        <td colspan="2"><input type="text" name="total" size="63" maxlength="50" value="<%=book.getTotal()%>"></td>
      </tr><tr>
        <td height="30">
           留所经费</td>
        <td colspan="2"><input type="text" name="funds" size="63" maxlength="50" value="<%=book.getFunds()%>"></td>
      </tr><tr>
        <td height="30">
           课题负责人</td>
        <td colspan="2"><input type="text" name="head" size="63" maxlength="50" value="<%=book.getHead()%>"></td>
      </tr><tr>
        <td height="30">
           课题起止时间</td>
        <td colspan="2"><input type="text" name="period" size="39" maxlength="50" value="<%=book.getPeriod()%>">(yyyy.mm.dd-yyyy.mm.dd)</td>
      </tr><tr>
        <td height="30">
           合作高校、其他单位</td>
        <td colspan="2"><input type="text" name="co_school" size="63" maxlength="50" value="<%=book.getCo_school()%>"></td>
      </tr><tr>
        <td height="30">
           合作国家/地区</td>
        <td colspan="2"><input type="text" name="co_country" size="63" maxlength="50" value="<%=book.getCo_country()%>"></td>
      </tr><tr>
        <td height="30">
           所属部门</td>
        <td colspan="2">
             <select name="department" class="selectwidth">
        <%
        String department=book.getDepartment();
        String grade=book.getGrade();
        String source=book.getSource();
        String consigned=book.getConsigned();
        String type=book.getType();
        String knowledge=book.getKnowledge();
        String field=book.getField();
        String objective=book.getObjective();
        String trade=book.getTrade();
        String cooperation=book.getCooperation();
        String progress=book.getProgress();
        String reason=book.getReason();
        
        iter = department_db.getdepartment().listIterator();
        for (; iter.hasNext(); ) {
            departmentdetail classes = (departmentdetail) iter.next();
        %>
           <option value="<%=classes.getDepartment_name()%>" <%if(department.equals(classes.getDepartment_name()))out.print("selected");%>><%=classes.getDepartment_name()%></option>
        <%}        %>
           </select>
      </td>
      </tr><tr>
        <td height="30">
           课题等级</td>
        <td colspan="2">
             <select name="grade" class="selectwidth">
        <%
        iter = para_db.getpara("grade").listIterator();
        for (; iter.hasNext(); ) {
            paradetail classes = (paradetail) iter.next();
        %>
          <option value="<%=classes.getPara_value()%>" <%if(grade.equals(classes.getPara_value()))out.print("selected");%>><%=classes.getPara_value()%></option>
        <%}        %>
           </select></td>
      </tr><tr>
        <td height="30">
           任务来源</td>
        <td colspan="2">
             <select name="source" class="selectwidth">
        <%
        iter = para_db.getpara("source").listIterator();
        for (; iter.hasNext(); ) {
            paradetail classes = (paradetail) iter.next();
        %>
          <option value="<%=classes.getPara_value()%>" <%if(source.equals(classes.getPara_value()))out.print("selected");%>><%=classes.getPara_value()%></option>
        <%}        %>
          </select></td>
      </tr><tr>
        <td height="30">
           委托单位</td>
        <td colspan="2">
             <select name="consigned" class="selectwidth">
        <%
        iter = para_db.getpara("consigned").listIterator();
        for (; iter.hasNext(); ) {
            paradetail classes = (paradetail) iter.next();
        %>
          <option value="<%=classes.getPara_value()%>" <%if(consigned.equals(classes.getPara_value()))out.print("selected");%>><%=classes.getPara_value()%></option>
        <%}        %>
          </select></td>
      </tr><tr>
        <td height="30">
           课题类型&nbsp;(<a href="typeexplain.jsp">课题类型</a>)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td colspan="2">
             <select name="type" class="selectwidth">
        <%
        iter = para_db.getpara("type").listIterator();
        for (; iter.hasNext(); ) {
            paradetail classes = (paradetail) iter.next();
        %>
          <option value="<%=classes.getPara_value()%>" <%if(type.equals(classes.getPara_value()))out.print("selected");%>><%=classes.getPara_value()%></option>
        <%}        %>
          </select></td>
      </tr><tr>
        <td height="30">
           所属学科</td>
        <td colspan="2"><input type="text" name="knowledge" readonly="readonly" size="56" maxlength="50" value="<%=book.getKnowledge()%>">
        <input type="button" value="查询" onclick="select_k();"></td>
      </tr><tr>
        <td height="30">
           技术领域</td>
        <td colspan="2">
             <select name="field" class="selectwidth">
        <%
        iter = para_db.getpara("field").listIterator();
        for (; iter.hasNext(); ) {
            paradetail classes = (paradetail) iter.next();
        %>
          <option value="<%=classes.getPara_value()%>" <%if(field.equals(classes.getPara_value()))out.print("selected");%>><%=classes.getPara_value()%></option>
        <%}        %>
          </select></td>
      </tr><tr>
        <td height="30">
           经济目标</td>
        <td colspan="2">
             <select name="objective" class="selectwidth">
        <%
        iter = para_db.getpara("objective").listIterator();
        for (; iter.hasNext(); ) {
            paradetail classes = (paradetail) iter.next();
        %>
          <option value="<%=classes.getPara_value()%>" <%if(objective.equals(classes.getPara_value()))out.print("selected");%>><%=classes.getPara_value()%></option>
        <%}        %>
          </select></td>
      </tr><tr>
        <td height="30">
           所属行业</td>
        <td colspan="2">
             <select name="trade" class="selectwidth">
        <%
        iter = para_db.getpara("trade").listIterator();
        for (; iter.hasNext(); ) {
            paradetail classes = (paradetail) iter.next();
        %>
          <option value="<%=classes.getPara_value()%>" <%if(trade.equals(classes.getPara_value()))out.print("selected");%>><%=classes.getPara_value()%></option>
        <%}        %>
          </select></td>
      </tr><tr>
        <td height="30">
           合作形式</td>
        <td colspan="2">
             <select name="cooperation" class="selectwidth">
        <%
        iter = para_db.getpara("cooperation").listIterator();
        for (; iter.hasNext(); ) {
            paradetail classes = (paradetail) iter.next();
        %>
          <option value="<%=classes.getPara_value()%>" <%if(cooperation.equals(classes.getPara_value()))out.print("selected");%>><%=classes.getPara_value()%></option>
        <%}        %>
          </select></td>
      </tr><tr>
        <td height="30">
           所一三五规划</td>
        <td colspan="2">
             <select name="progress" class="selectwidth">
        <%
        iter = para_db.getpara("progress").listIterator();
        for (; iter.hasNext(); ) {
            paradetail classes = (paradetail) iter.next();
        %>
          <option value="<%=classes.getPara_value()%>" <%if(progress.equals(classes.getPara_value()))out.print("selected");%>><%=classes.getPara_value()%></option>
        <%}        %>
          </select></td>
      </tr><tr>
        <td height="30">
           项目属性&nbsp;<font color="red">*</font></td>
        <td colspan="2">
             <select name="reason" class="selectwidth">
        <%
        iter = para_db.getpara("reason").listIterator();
        for (; iter.hasNext(); ) {
            paradetail classes = (paradetail) iter.next();
        %>
          <option value="<%=classes.getPara_value()%>" <%if(reason.equals(classes.getPara_value()))out.print("selected");%>><%=classes.getPara_value()%></option>
        <%}        %>
          </select></td>
      </tr></table>
  </td></tr>
  <tr><td align="center" height="30">
          <input type="submit" value="提交" name="tijiao" onclick="return check();">
          <input type="button" value="重发邮件" name="tijiao" onclick="setAction('resend');goodform.submit();">
          <input type="button" value="返回" onclick="history.go(-1)">
  </td>
  </tr>
  <tr><td align="center" height="30">
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT color="#FF0000">注：点击“重发邮件”会重新设置联系人的登录密码。</font>
  </td>
</tr>
</table>
</form>
<%
 }else{
     response.sendRedirect("nomonth.jsp");
  }
%>
<%@include file="foot.inc"%>
</body>
</html>
