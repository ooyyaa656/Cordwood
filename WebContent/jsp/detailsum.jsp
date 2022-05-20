<%@page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<%@page import="java.util.*,kaoqin.packa.*"%>
<%@page errorPage="error.jsp"%>
<jsp:useBean id="sum_db" scope="session" class="kaoqin.packa.sumdb"></jsp:useBean>
<jsp:useBean id="member_db" scope="session" class="kaoqin.packa.memberdb"></jsp:useBean>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/default1.css" rel="stylesheet" type="text/css">
</head>
<BODY>
<%@include file="head1.inc"%>
<table width="85%" border=0 cellPadding=0 cellSpacing=0 align="center">
  <%
        String subject_id1;
        int xuhao=0;
        subject_id1=request.getParameter("subject_id");
        ArrayList iterlist = (ArrayList) sum_db.getonesum(subject_id1);
        sumdetail book = (sumdetail) iterlist.get(0);
  %>
 <tr align="center">
    <td height="55">
      <input type="hidden" name="subject_id" value="<%=subject_id1%>">
      <input type="hidden" name="operatename" value="edit"><br>
     <STRONG>课题</STRONG>
     <HR style="BORDER-TOP: #aaaaaa 1px solid" SIZE=0>
    </td>
  </tr>
  <tr><td align="center">
    <table align="center">
      <tr>
        <td height="30">
           院管项目编号</td>
        <td><input type="text" name="institute_num" readonly="readonly" size="15" maxlength="50" value="<%=book.getInstitute_num()%>"></td>
        <td>任务来源(2)+项目申请年度(4)+项目所管局(6)+流水号(3)</td>
      </tr><tr>
        <td height="30">
           非院管项目编号</td>
        <td><input type="text" name="noinstitute_num" readonly="readonly" size="15" maxlength="50" value="<%=book.getNoinstitute_num()%>"></td>
        <td>任务来源(2)+项目任务书/项目合同编号</td>
      </tr><tr>
        <td height="30">
           院项目编号</td>
        <td><input type="text" name="iproject_num" readonly="readonly" size="15" maxlength="50" value="<%=book.getIproject_num()%>"></td>
        <td>院（非）管项目编号+流水(2)</td>
      </tr><tr>
        <td height="30">
           项目编号(6)</td>
        <td><input type="text" name="project_num" readonly="readonly" size="15" maxlength="50" value="<%=book.getProject_num()%>"></td>
        <td>开题年(2)+任务来源(2)+其他(2)</td>
      </tr><tr>
        <td height="30">
           课题名称</td>
        <td colspan="2"><input type="text" name="subject_name" readonly="readonly" size="63" maxlength="50" value="<%=book.getSubject_name()%>"></td>
      </tr><tr>
        <td height="30">
           课题编号(7)</td>
        <td><input type="text" name="subject_num" readonly="readonly" size="15" maxlength="50" value="<%=book.getSubject_num()%>"></td>
        <td>项目编号(6)+其他(1)</td>
      </tr><tr>
        <td height="30">
           子课题编号(10)</td>
        <td><input type="text" name="sub_num" readonly="readonly" size="15" maxlength="50" value="<%=book.getSub_num()%>"></td>
        <td>课题编号(7)+经费来源(3)</td>
      </tr><tr>
        <td height="30">
           联系人</td>
        <td colspan="2"><input type="text" name="linkman" readonly="readonly" size="63" maxlength="50" value="<%=book.getLinkman()%>"></td>
      </tr><tr>
        <td height="30">
           Email</td>
        <td colspan="2"><input type="text" name="email" readonly="readonly" size="63" maxlength="50" value="<%=book.getEmail()%>"></td>
      </tr><tr>
        <td height="30">
           项目名称</td>
        <td colspan="2"><input type="text" name="project_name" readonly="readonly" size="63" maxlength="10" value="<%=book.getProject_name()%>"></td>
      </tr><tr>
        <td height="30">
           项目批准号/合同号</td>
        <td colspan="2"><input type="text" name="pro_num" readonly="readonly" size="63" maxlength="50" value="<%=book.getPro_num()%>"></td>
      </tr><tr>
        <td height="30">
           经费来源</td>
        <td colspan="2"><input type="text" name="subject_money" readonly="readonly" size="63" maxlength="50" value="<%=book.getSubject_money()%>"></td>
      </tr><tr>
        <td height="30">
           预算总金额(万元)</td>
        <td colspan="2"><input type="text" name="total" readonly="readonly" size="63" maxlength="50" value="<%=book.getTotal()%>"></td>
      </tr><tr>
        <td height="30">
           留所经费</td>
        <td colspan="2"><input type="text" name="funds" readonly="readonly" size="63" maxlength="50" value="<%=book.getFunds()%>"></td>
      </tr><tr>
        <td height="30">
           课题负责人</td>
        <td colspan="2"><input type="text" name="head" readonly="readonly" size="63" maxlength="50" value="<%=book.getHead()%>"></td>
      </tr><tr>
        <td height="30">
           课题起止时间</td>
        <td colspan="2"><input type="text" name="period" readonly="readonly" size="43" maxlength="50" value="<%=book.getPeriod()%>">(2008.12.30-2011.12.30)</td>
      </tr><tr>
        <td height="30">
           合作高校、其他单位</td>
        <td colspan="2"><input type="text" name="co_school" readonly="readonly" size="63" maxlength="50" value="<%=book.getCo_school()%>"></td>
      </tr><tr>
        <td height="30">
           合作国家/地区</td>
        <td colspan="2"><input type="text" name="co_country" readonly="readonly" size="63" maxlength="50" value="<%=book.getCo_country()%>"></td>
      </tr><tr>
        <td height="30">
           所属部门</td>
        <td colspan="2"><input type="text" name="department" readonly="readonly" size="63" maxlength="50" value="<%=book.getDepartment()%>"></td>
      </tr><tr>
        <td height="30">
           课题等级</td>
        <td colspan="2"><input type="text" name="grade" readonly="readonly" size="63" maxlength="50" value="<%=book.getGrade()%>"></td>
      </tr><tr>
        <td height="30">
           任务来源</td>
        <td colspan="2"><input type="text" name="source" readonly="readonly" size="63" maxlength="50" value="<%=book.getSource()%>"></td>
      </tr><tr>
        <td height="30">
           委托单位</td>
        <td colspan="2"><input type="text" name="consigned" readonly="readonly" size="63" maxlength="50" value="<%=book.getConsigned()%>"></td>
      </tr><tr>
        <td height="30">
           课题类型(<a href="typeexplain.jsp">课题类型</a>)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td colspan="2"><input type="text" name="type" readonly="readonly" size="63" maxlength="50" value="<%=book.getType()%>"></td>
      </tr><tr>
        <td height="30">
           所属学科</td>
        <td colspan="2"><input type="text" name="knowledge" readonly="readonly" size="63" maxlength="50" value="<%=book.getKnowledge()%>"></td>
      </tr><tr>
        <td height="30">
           技术领域</td>
        <td colspan="2"><input type="text" name="field" readonly="readonly" size="63" maxlength="50" value="<%=book.getField()%>"></td>
      </tr><tr>
        <td height="30">
           经济目标</td>
        <td colspan="2"><input type="text" name="objective" readonly="readonly" size="63" maxlength="50" value="<%=book.getObjective()%>"></td>
      </tr><tr>
        <td height="30">
           所属行业</td>
        <td colspan="2"><input type="text" name="trade" readonly="readonly" size="63" maxlength="50" value="<%=book.getTrade()%>"></td>
      </tr><tr>
        <td height="30">
           合作形式</td>
        <td colspan="2"><input type="text" name="cooperation" readonly="readonly" size="63" maxlength="50" value="<%=book.getCooperation()%>"></td>
      </tr><tr>
        <td height="30">
           所一三五规划</td>
        <td colspan="2"><input type="text" name="progress" readonly="readonly" size="63" maxlength="50" value="<%=book.getProgress()%>"></td>
      </tr><tr>
        <td height="30">
           拖延原因</td>
        <td colspan="2"><input type="text" name="reason" readonly="readonly" size="63" maxlength="50" value="<%=book.getReason()%>"></td>
      </tr>
    </table>
  </td></tr>
  <tr>
      <td height="30" align="center">
      <br>
     <STRONG>人员</STRONG>
     <HR style="BORDER-TOP: #aaaaaa 1px solid" SIZE=0>
  </td></tr>
  <tr><td>
    <table width="100%" align="center" cellspacing="1" cellpadding="0" class="image-list">
        <tr>
          <th width="5%">序号</th>
          <th width="15%">姓名</th>
          <th>分类1</th>
          <th>分类2</th>
          <th>进入课题时间</th>
        </tr>
        <%
        pageination pageCtl = new memberpage();
        String queryStatement;
        queryStatement ="select * from member where subject_id="+subject_id1+" order by member_id desc";
        int rownum1=member_db.getnum(subject_id1);
        if(rownum1==0){
          pageCtl.setRowsPerPage(1);
        }else{
        pageCtl.setRowsPerPage(rownum1);}
        pageCtl.setSQL(queryStatement);
        Collection goods1 = pageCtl.getPage(1);
        Iterator allgoods = goods1.iterator();
        while (allgoods.hasNext()) {
          memberdetail book1 = (memberdetail) allgoods.next();
          xuhao++;
        %>
        <tr align="center">
          <td><%=String.valueOf(xuhao)%></td>
          <td><%=book1.getMember_name()%></td>
          <td><%=book1.getClass_name1()%></td>
          <td><%=book1.getClass_name2()%></td>
          <td><%=book1.getBegin_date()%></td>
        </tr>
      <%}      %>
</table>
  </td></tr>
  <tr>
     <td height="8" background="../image/dot.jpg" colspan="6"></td>
   </tr>
  <tr><td align="center" height="35">
          <input type="submit" value="关闭" onclick="window.opener=null;window.close(); ">
  </td></tr>
</table>
<%@include file="foot.inc"%>
</body>
</html>
