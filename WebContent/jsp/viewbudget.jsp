<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<%@page import="java.util.*,kaoqin.packa.*"%>
<%@page errorPage="error.jsp"%>
<jsp:useBean id="budget_db" scope="session" class="kaoqin.packa.budgetdb"></jsp:useBean>
<jsp:useBean id="sum_db" scope="session" class="kaoqin.packa.sumdb"></jsp:useBean>
<script type="text/javascript" src="../js/productmanage.js"></script>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/default1.css" rel="stylesheet" type="text/css">
</head>
<BODY>
<%@include file="head.inc"%>
<table width="85%" border=0 cellPadding=0 cellSpacing=0 align="center">
  <%
      String budget_id=request.getParameter("budget_id");
      String templet=request.getParameter("templet");
      ArrayList iterlist = (ArrayList) budget_db.getonebudget(budget_id);
      budgetdetail book = (budgetdetail) iterlist.get(0);
      String subject_id,islock;
      subject_id=request.getParameter("subject_id");
      ArrayList iterlist1 = (ArrayList) sum_db.getonesum(subject_id);
      sumdetail book1 = (sumdetail) iterlist1.get(0);
      islock=book1.getLocked();
      if(islock.equals("0")){
      String budget_year=book.getBudget_year();
  %>
 <tr align="center">
    <td height="25">
      <input type="hidden" name="budget_id" value="<%=budget_id%>">
      <input type="hidden" name="subject_id" value="<%=subject_id%>">
      <input type="hidden" name="operatename" value="edit"><br>
     <STRONG>修改课题预算（单位:元）</STRONG>
     <HR style="BORDER-TOP: #aaaaaa 1px solid" SIZE=0>
    </td>
  </tr>
  <tr><td align="center">
    <table align="center">
    <tr>
        <td height="30">年份</td>
        <td><input type="text" name="budget_year" size="15" value="<%=budget_year%>" readonly="true">年</td>
      </tr>
    <%
    if(templet.equals("0")){
     %>
      <tr>
        <td height="30">购置设备费</td>
        <td><input type="text" name="device1" size="15" maxlength="10" value="<%if(!book.getDevice1().equals("0"))out.print(book.getDevice1());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">试制设备费</td>
        <td><input type="text" name="device2" size="15" maxlength="10" value="<%if(!book.getDevice2().equals("0"))out.print(book.getDevice2());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">设备改造与租赁费</td>
        <td><input type="text" name="device3" size="15" maxlength="10" value="<%if(!book.getDevice3().equals("0"))out.print(book.getDevice3());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">材料费</td>
        <td><input type="text" name="material" size="15" maxlength="10" value="<%if(!book.getMaterial().equals("0"))out.print(book.getMaterial());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">测试化验加工费</td>
        <td><input type="text" name="experiment" size="15" maxlength="10" value="<%if(!book.getExperiment().equals("0"))out.print(book.getExperiment());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">燃料动力费</td>
        <td><input type="text" name="power" size="15" maxlength="10" value="<%if(!book.getPower().equals("0"))out.print(book.getPower());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">差旅费</td>
        <td><input type="text" name="travel" size="15" maxlength="10" value="<%if(!book.getTravel().equals("0"))out.print(book.getTravel());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">会议费</td>
        <td><input type="text" name="meeting" size="15" maxlength="10" value="<%if(!book.getMeeting().equals("0"))out.print(book.getMeeting());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">国际合作与交流费</td>
        <td><input type="text" name="international" size="15" maxlength="10" value="<%if(!book.getInternational().equals("0"))out.print(book.getInternational());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">出版/文献/信息传播/知识产权事务费</td>
        <td><input type="text" name="publish" size="15" maxlength="10" value="<%if(!book.getPublish().equals("0"))out.print(book.getPublish());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">劳务费</td>
        <td><input type="text" name="labour" size="15" maxlength="10" value="<%if(!book.getLabour().equals("0"))out.print(book.getLabour());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">专家咨询费</td>
        <td><input type="text" name="expert" size="15" maxlength="10" value="<%if(!book.getExpert().equals("0"))out.print(book.getExpert());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">管理费</td>
        <td><input type="text" name="manage" size="15" maxlength="10" value="<%if(!book.getManage().equals("0"))out.print(book.getManage());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">转拨经费</td>
        <td><input type="text" name="transfer" size="15" maxlength="10" value="<%if(!book.getTransfer().equals("0"))out.print(book.getTransfer());%>" readonly="true">(整数)</td>
      </tr>
    <%}else if(templet.equals("1")){
     %>
      <tr>
        <td height="30">购置设备费</td>
        <td><input type="text" name="device1" size="15" maxlength="10" value="<%if(!book.getDevice1().equals("0"))out.print(book.getDevice1());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">研制设备费</td>
        <td><input type="text" name="device2" size="15" maxlength="10" value="<%if(!book.getDevice2().equals("0"))out.print(book.getDevice2());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">设备改造与租赁费</td>
        <td><input type="text" name="device3" size="15" maxlength="10" value="<%if(!book.getDevice3().equals("0"))out.print(book.getDevice3());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">材料费</td>
        <td><input type="text" name="material" size="15" maxlength="10" value="<%if(!book.getMaterial().equals("0"))out.print(book.getMaterial());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">测试化验加工及计算分析费</td>
        <td><input type="text" name="experiment" size="15" maxlength="10" value="<%if(!book.getExperiment().equals("0"))out.print(book.getExperiment());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">差旅费</td>
        <td><input type="text" name="travel" size="15" maxlength="10" value="<%if(!book.getTravel().equals("0"))out.print(book.getTravel());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">燃料动力费</td>
        <td><input type="text" name="power" size="15" maxlength="10" value="<%if(!book.getPower().equals("0"))out.print(book.getPower());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">会议费</td>
        <td><input type="text" name="meeting" size="15" maxlength="10" value="<%if(!book.getMeeting().equals("0"))out.print(book.getMeeting());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">国际合作与交流费</td>
        <td><input type="text" name="international" size="15" maxlength="10" value="<%if(!book.getInternational().equals("0"))out.print(book.getInternational());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">出版/文献/信息传播/知识产权事务费</td>
        <td><input type="text" name="publish" size="15" maxlength="10" value="<%if(!book.getPublish().equals("0"))out.print(book.getPublish());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">专家咨询费</td>
        <td><input type="text" name="expert" size="15" maxlength="10" value="<%if(!book.getExpert().equals("0"))out.print(book.getExpert());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">劳务费</td>
        <td><input type="text" name="labour" size="15" maxlength="10" value="<%if(!book.getLabour().equals("0"))out.print(book.getLabour());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">管理费</td>
        <td><input type="text" name="manage" size="15" maxlength="10" value="<%if(!book.getManage().equals("0"))out.print(book.getManage());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">综合集成与调控费</td>
        <td><input type="text" name="multi" size="15" maxlength="10" value="<%if(!book.getMulti().equals("0"))out.print(book.getMulti());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">转拨经费</td>
        <td><input type="text" name="transfer" size="15" maxlength="10" value="<%if(!book.getTransfer().equals("0"))out.print(book.getTransfer());%>" readonly="true">(整数)</td>
      </tr>
    <%}else if(templet.equals("2")){
     %>
     <tr>
        <td height="30">购置设备费</td>
        <td><input type="text" name="device1" size="15" maxlength="10" value="<%if(!book.getDevice1().equals("0"))out.print(book.getDevice1());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">试制设备费</td>
        <td><input type="text" name="device2" size="15" maxlength="10" value="<%if(!book.getDevice2().equals("0"))out.print(book.getDevice2());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">设备改造与租赁费</td>
        <td><input type="text" name="device3" size="15" maxlength="10" value="<%if(!book.getDevice3().equals("0"))out.print(book.getDevice3());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">材料费</td>
        <td><input type="text" name="material" size="15" maxlength="10" value="<%if(!book.getMaterial().equals("0"))out.print(book.getMaterial());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">测试化验加工费</td>
        <td><input type="text" name="experiment" size="15" maxlength="10" value="<%if(!book.getExperiment().equals("0"))out.print(book.getExperiment());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">燃料动力费</td>
        <td><input type="text" name="power" size="15" maxlength="10" value="<%if(!book.getPower().equals("0"))out.print(book.getPower());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">差旅费</td>
        <td><input type="text" name="travel" size="15" maxlength="10" value="<%if(!book.getTravel().equals("0"))out.print(book.getTravel());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">会议费</td>
        <td><input type="text" name="meeting" size="15" maxlength="10" value="<%if(!book.getMeeting().equals("0"))out.print(book.getMeeting());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">国际合作与交流费</td>
        <td><input type="text" name="international" size="15" maxlength="10" value="<%if(!book.getInternational().equals("0"))out.print(book.getInternational());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">出版/文献/信息传播/知识产权事务费</td>
        <td><input type="text" name="publish" size="15" maxlength="10" value="<%if(!book.getPublish().equals("0"))out.print(book.getPublish());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">劳务费</td>
        <td><input type="text" name="labour" size="15" maxlength="10" value="<%if(!book.getLabour().equals("0"))out.print(book.getLabour());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">专家咨询费</td>
        <td><input type="text" name="expert" size="15" maxlength="10" value="<%if(!book.getExpert().equals("0"))out.print(book.getExpert());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">绩效支出</td>
        <td><input type="text" name="jixiao" size="15" maxlength="10" value="<%if(!book.getJixiao().equals("0"))out.print(book.getJixiao());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">其他间接费用</td>
        <td><input type="text" name="other1" size="15" maxlength="10" value="<%if(!book.getOther1().equals("0"))out.print(book.getOther1());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">转拨经费</td>
        <td><input type="text" name="transfer" size="15" maxlength="10" value="<%if(!book.getTransfer().equals("0"))out.print(book.getTransfer());%>" readonly="true">(整数)</td>
      </tr>
    <%}else if(templet.equals("3")){
     %>
     <tr>
        <td height="30">测试/计算/分析费</td>
        <td><input type="text" name="experiment" size="15" maxlength="10" value="<%if(!book.getExperiment().equals("0"))out.print(book.getExperiment());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">能源/动力费</td>
        <td><input type="text" name="power" size="15" maxlength="10" value="<%if(!book.getPower().equals("0"))out.print(book.getPower());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">会议费/差旅费</td>
        <td><input type="text" name="meeting" size="15" maxlength="10" value="<%if(!book.getMeeting().equals("0"))out.print(book.getMeeting());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">出版物/文献/信息传播事务费</td>
        <td><input type="text" name="publish" size="15" maxlength="10" value="<%if(!book.getPublish().equals("0"))out.print(book.getPublish());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">其他科研业务费</td>
        <td><input type="text" name="other1" size="15" maxlength="10" value="<%if(!book.getOther1().equals("0"))out.print(book.getOther1());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">原材料/试剂/药品购置费</td>
        <td><input type="text" name="material" size="15" maxlength="10" value="<%if(!book.getMaterial().equals("0"))out.print(book.getMaterial());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">其他试验材料费</td>
        <td><input type="text" name="other2" size="15" maxlength="10" value="<%if(!book.getOther2().equals("0"))out.print(book.getOther2());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">仪器设备费</td>
        <td><input type="text" name="device1" size="15" maxlength="10" value="<%if(!book.getDevice1().equals("0"))out.print(book.getDevice1());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">实验室改造费</td>
        <td><input type="text" name="device2" size="15" maxlength="10" value="<%if(!book.getDevice2().equals("0"))out.print(book.getDevice2());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">协作费</td>
        <td><input type="text" name="cooperate" size="15" maxlength="10" value="<%if(!book.getCooperate().equals("0"))out.print(book.getCooperate());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">项目组成员出国合作交流</td>
        <td><input type="text" name="international" size="15" maxlength="10" value="<%if(!book.getInternational().equals("0"))out.print(book.getInternational());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">境外专家来华合作交流</td>
        <td><input type="text" name="expert" size="15" maxlength="10" value="<%if(!book.getExpert().equals("0"))out.print(book.getExpert());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">劳务费</td>
        <td><input type="text" name="labour" size="15" maxlength="10" value="<%if(!book.getLabour().equals("0"))out.print(book.getLabour());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">管理费</td>
        <td><input type="text" name="manage" size="15" maxlength="10" value="<%if(!book.getManage().equals("0"))out.print(book.getManage());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">转拨经费</td>
        <td><input type="text" name="transfer" size="15" maxlength="10" value="<%if(!book.getTransfer().equals("0"))out.print(book.getTransfer());%>" readonly="true">(整数)</td>
      </tr>
    <%}else if(templet.equals("4")){
     %>
      <tr>
        <td height="30">设备费</td>
        <td><input type="text" name="device1" size="15" maxlength="10" value="<%if(!book.getDevice1().equals("0"))out.print(book.getDevice1());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">材料费</td>
        <td><input type="text" name="material" size="15" maxlength="10" value="<%if(!book.getMaterial().equals("0"))out.print(book.getMaterial());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">测试化验加工费</td>
        <td><input type="text" name="experiment" size="15" maxlength="10" value="<%if(!book.getExperiment().equals("0"))out.print(book.getExperiment());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">燃料动力费</td>
        <td><input type="text" name="power" size="15" maxlength="10" value="<%if(!book.getPower().equals("0"))out.print(book.getPower());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">差旅费</td>
        <td><input type="text" name="travel" size="15" maxlength="10" value="<%if(!book.getTravel().equals("0"))out.print(book.getTravel());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">会议费</td>
        <td><input type="text" name="meeting" size="15" maxlength="10" value="<%if(!book.getMeeting().equals("0"))out.print(book.getMeeting());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">国际合作与交流费</td>
        <td><input type="text" name="international" size="15" maxlength="10" value="<%if(!book.getInternational().equals("0"))out.print(book.getInternational());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">出版/文献/信息传播/知识产权事务费</td>
        <td><input type="text" name="publish" size="15" maxlength="10" value="<%if(!book.getPublish().equals("0"))out.print(book.getPublish());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">劳务费</td>
        <td><input type="text" name="labour" size="15" maxlength="10" value="<%if(!book.getLabour().equals("0"))out.print(book.getLabour());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">专家咨询费</td>
        <td><input type="text" name="expert" size="15" maxlength="10" value="<%if(!book.getExpert().equals("0"))out.print(book.getExpert());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">基本建设费-房屋建筑物购建</td>
        <td><input type="text" name="base1" size="15" maxlength="10" value="<%if(!book.getBase1().equals("0"))out.print(book.getBase1());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">基本建设费-专用设备购置</td>
        <td><input type="text" name="base2" size="15" maxlength="10" value="<%if(!book.getBase2().equals("0"))out.print(book.getBase2());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">基本建设费-基本设施建设</td>
        <td><input type="text" name="base3" size="15" maxlength="10" value="<%if(!book.getBase3().equals("0"))out.print(book.getBase3());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">基本建设费-大型修缮</td>
        <td><input type="text" name="base4" size="15" maxlength="10" value="<%if(!book.getBase4().equals("0"))out.print(book.getBase4());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">基本建设费-信息网络建设</td>
        <td><input type="text" name="base5" size="15" maxlength="10" value="<%if(!book.getBase5().equals("0"))out.print(book.getBase5());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">基本建设费-其他基本建设支出</td>
        <td><input type="text" name="base6" size="15" maxlength="10" value="<%if(!book.getBase6().equals("0"))out.print(book.getBase6());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">其他-间接费用</td>
        <td><input type="text" name="other1" size="15" maxlength="10" value="<%if(!book.getOther1().equals("0"))out.print(book.getOther1());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">其他-不可预见费</td>
        <td><input type="text" name="other2" size="15" maxlength="10" value="<%if(!book.getOther2().equals("0"))out.print(book.getOther2());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">中间试验（制）费</td>
        <td><input type="text" name="device2" size="15" maxlength="10" value="<%if(!book.getDevice2().equals("0"))out.print(book.getDevice2());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">转拨经费</td>
        <td><input type="text" name="transfer" size="15" maxlength="10" value="<%if(!book.getTransfer().equals("0"))out.print(book.getTransfer());%>" readonly="true">(整数)</td>
      </tr>
    <%}else if(templet.equals("5")){
     %>
     <tr>
        <td height="30">设备费</td>
        <td><input type="text" name="device1" size="15" maxlength="10" value="<%if(!book.getDevice1().equals("0"))out.print(book.getDevice1());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">材料费</td>
        <td><input type="text" name="material" size="15" maxlength="10" value="<%if(!book.getMaterial().equals("0"))out.print(book.getMaterial());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">测试化验加工及计算分析费</td>
        <td><input type="text" name="experiment" size="15" maxlength="10" value="<%if(!book.getExperiment().equals("0"))out.print(book.getExperiment());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">燃料动力费</td>
        <td><input type="text" name="power" size="15" maxlength="10" value="<%if(!book.getPower().equals("0"))out.print(book.getPower());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">差旅费</td>
        <td><input type="text" name="travel" size="15" maxlength="10" value="<%if(!book.getTravel().equals("0"))out.print(book.getTravel());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">会议费</td>
        <td><input type="text" name="meeting" size="15" maxlength="10" value="<%if(!book.getMeeting().equals("0"))out.print(book.getMeeting());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">国际合作与交流费</td>
        <td><input type="text" name="international" size="15" maxlength="10" value="<%if(!book.getInternational().equals("0"))out.print(book.getInternational());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">出版/文献/信息传播/知识产权事务费</td>
        <td><input type="text" name="publish" size="15" maxlength="10" value="<%if(!book.getPublish().equals("0"))out.print(book.getPublish());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">专家咨询费</td>
        <td><input type="text" name="expert" size="15" maxlength="10" value="<%if(!book.getExpert().equals("0"))out.print(book.getExpert());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">劳务费</td>
        <td><input type="text" name="labour" size="15" maxlength="10" value="<%if(!book.getLabour().equals("0"))out.print(book.getLabour());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">管理费</td>
        <td><input type="text" name="manage" size="15" maxlength="10" value="<%if(!book.getManage().equals("0"))out.print(book.getManage());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">转拨经费</td>
        <td><input type="text" name="transfer" size="15" maxlength="10" value="<%if(!book.getTransfer().equals("0"))out.print(book.getTransfer());%>" readonly="true">(整数)</td>
      </tr>
    <%}else if(templet.equals("6")){
     %>
     <tr>
        <td height="30">购置设备费</td>
        <td><input type="text" name="device1" size="15" maxlength="10" value="<%if(!book.getDevice1().equals("0"))out.print(book.getDevice1());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">设备费</td>
        <td><input type="text" name="device2" size="15" maxlength="10" value="<%if(!book.getDevice2().equals("0"))out.print(book.getDevice2());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">材料费</td>
        <td><input type="text" name="material" size="15" maxlength="10" value="<%if(!book.getMaterial().equals("0"))out.print(book.getMaterial());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">测试化验加工费</td>
        <td><input type="text" name="experiment" size="15" maxlength="10" value="<%if(!book.getExperiment().equals("0"))out.print(book.getExperiment());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">燃料动力费</td>
        <td><input type="text" name="power" size="15" maxlength="10" value="<%if(!book.getPower().equals("0"))out.print(book.getPower());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">差旅费</td>
        <td><input type="text" name="travel" size="15" maxlength="10" value="<%if(!book.getTravel().equals("0"))out.print(book.getTravel());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">会议费</td>
        <td><input type="text" name="meeting" size="15" maxlength="10" value="<%if(!book.getMeeting().equals("0"))out.print(book.getMeeting());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">国际合作与交流费</td>
        <td><input type="text" name="international" size="15" maxlength="10" value="<%if(!book.getInternational().equals("0"))out.print(book.getInternational());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">出版/文献/信息传播/知识产权事务费</td>
        <td><input type="text" name="publish" size="15" maxlength="10" value="<%if(!book.getPublish().equals("0"))out.print(book.getPublish());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">专家咨询费</td>
        <td><input type="text" name="expert" size="15" maxlength="10" value="<%if(!book.getExpert().equals("0"))out.print(book.getExpert());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">人员劳务费</td>
        <td><input type="text" name="labour" size="15" maxlength="10" value="<%if(!book.getLabour().equals("0"))out.print(book.getLabour());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">管理费</td>
        <td><input type="text" name="manage" size="15" maxlength="10" value="<%if(!book.getManage().equals("0"))out.print(book.getManage());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">其他费</td>
        <td><input type="text" name="other1" size="15" maxlength="10" value="<%if(!book.getOther1().equals("0"))out.print(book.getOther1());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">转拨经费</td>
        <td><input type="text" name="transfer" size="15" maxlength="10" value="<%if(!book.getTransfer().equals("0"))out.print(book.getTransfer());%>" readonly="true">(整数)</td>
      </tr>
    <%}else if(templet.equals("7")){
     %> 
     <tr>
        <td height="30">购置设备费</td>
        <td><input type="text" name="device1" size="15" maxlength="10" value="<%if(!book.getDevice1().equals("0"))out.print(book.getDevice1());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">试制设备费</td>
        <td><input type="text" name="device2" size="15" maxlength="10" value="<%if(!book.getDevice2().equals("0"))out.print(book.getDevice2());%>" readonly="true">(整数)</td>
      </tr>
       <tr>
        <td height="30">设备改造与租赁费</td>
        <td><input type="text" name="device3" size="15" maxlength="10" value="<%if(!book.getDevice3().equals("0"))out.print(book.getDevice3());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">材料费</td>
        <td><input type="text" name="material" size="15" maxlength="10" value="<%if(!book.getMaterial().equals("0"))out.print(book.getMaterial());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">测试化验加工费</td>
        <td><input type="text" name="experiment" size="15" maxlength="10" value="<%if(!book.getExperiment().equals("0"))out.print(book.getExperiment());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">燃料动力费</td>
        <td><input type="text" name="power" size="15" maxlength="10" value="<%if(!book.getPower().equals("0"))out.print(book.getPower());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">差旅费</td>
        <td><input type="text" name="travel" size="15" maxlength="10" value="<%if(!book.getTravel().equals("0"))out.print(book.getTravel());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">会议费</td>
        <td><input type="text" name="meeting" size="15" maxlength="10" value="<%if(!book.getMeeting().equals("0"))out.print(book.getMeeting());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">国际合作与交流费</td>
        <td><input type="text" name="international" size="15" maxlength="10" value="<%if(!book.getInternational().equals("0"))out.print(book.getInternational());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">出版/文献/信息传播/知识产权事务费</td>
        <td><input type="text" name="publish" size="15" maxlength="10" value="<%if(!book.getPublish().equals("0"))out.print(book.getPublish());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">劳务费</td>
        <td><input type="text" name="labour" size="15" maxlength="10" value="<%if(!book.getLabour().equals("0"))out.print(book.getLabour());%>" readonly="true">(整数)</td>
      </tr>      
      <tr>
        <td height="30">专家咨询费</td>
        <td><input type="text" name="expert" size="15" maxlength="10" value="<%if(!book.getExpert().equals("0"))out.print(book.getExpert());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">管理费</td>
        <td><input type="text" name="manage" size="15" maxlength="10" value="<%if(!book.getManage().equals("0"))out.print(book.getManage());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">其他费</td>
        <td><input type="text" name="other1" size="15" maxlength="10" value="<%if(!book.getOther1().equals("0"))out.print(book.getOther1());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">转拨经费</td>
        <td><input type="text" name="transfer" size="15" maxlength="10" value="<%if(!book.getTransfer().equals("0"))out.print(book.getTransfer());%>" readonly="true">(整数)</td>
      </tr>
    <%
    }else if(templet.equals("8")){
     %>
      <tr>
        <td height="30">设备购置费</td>
        <td><input type="text" name="device1" size="15" maxlength="10" value="<%if(!book.getDevice1().equals("0"))out.print(book.getDevice1());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">设备试制费</td>
        <td><input type="text" name="device2" size="15" maxlength="10" value="<%if(!book.getDevice2().equals("0"))out.print(book.getDevice2());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">设备改造与租赁费</td>
        <td><input type="text" name="device3" size="15" maxlength="10" value="<%if(!book.getDevice3().equals("0"))out.print(book.getDevice3());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">材料费</td>
        <td><input type="text" name="material" size="15" maxlength="10" value="<%if(!book.getMaterial().equals("0"))out.print(book.getMaterial());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">测试化验加工费</td>
        <td><input type="text" name="experiment" size="15" maxlength="10" value="<%if(!book.getExperiment().equals("0"))out.print(book.getExperiment());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">燃料动力费</td>
        <td><input type="text" name="power" size="15" maxlength="10" value="<%if(!book.getPower().equals("0"))out.print(book.getPower());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">差旅费</td>
        <td><input type="text" name="travel" size="15" maxlength="10" value="<%if(!book.getTravel().equals("0"))out.print(book.getTravel());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">会议费</td>
        <td><input type="text" name="meeting" size="15" maxlength="10" value="<%if(!book.getMeeting().equals("0"))out.print(book.getMeeting());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">国际合作与交流费</td>
        <td><input type="text" name="international" size="15" maxlength="10" value="<%if(!book.getInternational().equals("0"))out.print(book.getInternational());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">出版/文献/信息传播/知识产权事务费</td>
        <td><input type="text" name="publish" size="15" maxlength="10" value="<%if(!book.getPublish().equals("0"))out.print(book.getPublish());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">劳务费</td>
        <td><input type="text" name="labour" size="15" maxlength="10" value="<%if(!book.getLabour().equals("0"))out.print(book.getLabour());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">专家咨询费</td>
        <td><input type="text" name="expert" size="15" maxlength="10" value="<%if(!book.getExpert().equals("0"))out.print(book.getExpert());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">其他支出</td>
        <td><input type="text" name="other1" size="15" maxlength="10" value="<%if(!book.getOther1().equals("0"))out.print(book.getOther1());%>" readonly="true">(整数)</td>
      </tr>
      <%}else if(templet.equals("9")){
     %>
     <tr>
        <td height="30">购置设备费</td>
        <td><input type="text" name="device1" size="15" maxlength="10" value="<%if(!book.getDevice1().equals("0"))out.print(book.getDevice1());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">试制设备费</td>
        <td><input type="text" name="device2" size="15" maxlength="10" value="<%if(!book.getDevice2().equals("0"))out.print(book.getDevice2());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">设备改造与租赁费</td>
        <td><input type="text" name="device3" size="15" maxlength="10" value="<%if(!book.getDevice3().equals("0"))out.print(book.getDevice3());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">材料费</td>
        <td><input type="text" name="material" size="15" maxlength="10" value="<%if(!book.getMaterial().equals("0"))out.print(book.getMaterial());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">测试化验加工费</td>
        <td><input type="text" name="experiment" size="15" maxlength="10" value="<%if(!book.getExperiment().equals("0"))out.print(book.getExperiment());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">燃料动力费</td>
        <td><input type="text" name="power" size="15" maxlength="10" value="<%if(!book.getPower().equals("0"))out.print(book.getPower());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">差旅费/会议费/国际合作与交流费</td>
        <td><input type="text" name="travel" size="15" maxlength="10" value="<%if(!book.getTravel().equals("0"))out.print(book.getTravel());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">出版/文献/信息传播/知识产权事务费</td>
        <td><input type="text" name="publish" size="15" maxlength="10" value="<%if(!book.getPublish().equals("0"))out.print(book.getPublish());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">劳务费</td>
        <td><input type="text" name="labour" size="15" maxlength="10" value="<%if(!book.getLabour().equals("0"))out.print(book.getLabour());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">专家咨询费</td>
        <td><input type="text" name="expert" size="15" maxlength="10" value="<%if(!book.getExpert().equals("0"))out.print(book.getExpert());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">其他支出</td>
        <td><input type="text" name="other2" size="15" maxlength="10" value="<%if(!book.getOther2().equals("0"))out.print(book.getOther2());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">间接费用</td>
        <td><input type="text" name="other1" size="15" maxlength="10" value="<%if(!book.getOther1().equals("0"))out.print(book.getOther1());%>" readonly="true">(整数)</td>
      </tr>
      <tr>
        <td height="30">转出经费</td>
        <td><input type="text" name="transfer" size="15" maxlength="10" value="<%if(!book.getTransfer().equals("0"))out.print(book.getTransfer());%>" readonly="true">(整数)</td>
      </tr>
    <%} %>
    </table>
  </td></tr>
  <tr><td align="center" height="30">
          <input type="button" value="返回" onclick="history.go(-1)">
  </td>
  </tr>
</table>
<%
 }else{
     response.sendRedirect("nomonth.jsp");
  }
%>
<%@include file="foot.inc"%>
</body>
</html>
