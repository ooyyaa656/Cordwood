<%@page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" language="java" %>
<STYLE>/* Root = Horizontal, Secondary = Vertical */
ul#navmenu-h {
  margin: 0;
  border: 0 none;
  padding: 0;
  list-style: none;
  height: 31px;
}

ul#navmenu-h li {
  margin: 0;
  border: 0 none;
  padding: 0;
  float: left; /*For Gecko*/
  display: inline;
  list-style: none;
  position: relative;
}

ul#navmenu-h ul {
  margin: 0;
  border: 0 none;
  padding: 0;
  width: 160px;
  list-style: none;
  display: none;
  position: absolute;
  top: 32px;
  left: 0;
}

ul#navmenu-h ul:after /*From IE 7 lack of compliance*/{
  clear: both;
  display: block;
  font: 1px/0px serif;
  content: ".";
  height: 0;
  visibility: hidden;
}

ul#navmenu-h ul li {
  width: 130px;
  float: left; /*For IE 7 lack of compliance*/
  display: block !important;
  display: inline; /*For IE*/
}

/* Root Menu */
ul#navmenu-h a {
  border: 1px solid #FFF;
  border-right-color: #CCC;
  border-bottom-color: #CCC;
  PADDING-RIGHT: 25px; PADDING-LEFT: 25px;
  PADDING-BOTTOM: 0px; PADDING-TOP: 8px;
  TEXT-ALIGN: center;
  vertical-align:middle;
  float: left; /*For IE*/
  display: block;
  background: #EEE;
  color: #000;
  font: 14px,Arial;
  text-decoration: none;
  height: 31px;
}

/* Root Menu Hover Persistence */
ul#navmenu-h a:hover,
ul#navmenu-h li:hover a,
ul#navmenu-h li.iehover a {
  background: #CCC;
  color: #FFF;
}

/* 2nd Menu */
ul#navmenu-h li:hover li a,
ul#navmenu-h li.iehover li a {
  float: none;
  background: #EEE;
  color: #666;
  font: 12px,Arial;
  height: 28px;
}

/* 2nd Menu Hover Persistence */
ul#navmenu-h li:hover li a:hover,
ul#navmenu-h li:hover li:hover a,
ul#navmenu-h li.iehover li a:hover,
ul#navmenu-h li.iehover li.iehover a {
  background: #CCC;
  color: #FFF;
}

/* 3rd Menu */
ul#navmenu-h li:hover li:hover li a,
ul#navmenu-h li.iehover li.iehover li a {
  background: #EEE;
  color: #666;
}

/* 3rd Menu Hover Persistence */
ul#navmenu-h li:hover li:hover li a:hover,
ul#navmenu-h li:hover li:hover li:hover a,
ul#navmenu-h li.iehover li.iehover li a:hover,
ul#navmenu-h li.iehover li.iehover li.iehover a {
  background: #CCC;
  color: #FFF;
}

/* 4th Menu */
ul#navmenu-h li:hover li:hover li:hover li a,
ul#navmenu-h li.iehover li.iehover li.iehover li a {
  background: #EEE;
  color: #666;
}

/* 4th Menu Hover */
ul#navmenu-h li:hover li:hover li:hover li a:hover,
ul#navmenu-h li.iehover li.iehover li.iehover li a:hover {
  background: #CCC;
  color: #FFF;
}
ul#navmenu-h ul ul,
ul#navmenu-h ul ul ul {
  display: none;
  position: absolute;
  top: 0;
  left: 160px;
}

/* Do Not Move - Must Come Before display:block for Gecko */
ul#navmenu-h li:hover ul ul,
ul#navmenu-h li:hover ul ul ul,
ul#navmenu-h li.iehover ul ul,
ul#navmenu-h li.iehover ul ul ul {
  display: none;
}

ul#navmenu-h li:hover ul,
ul#navmenu-h ul li:hover ul,
ul#navmenu-h ul ul li:hover ul,
ul#navmenu-h li.iehover ul,
ul#navmenu-h ul li.iehover ul,
ul#navmenu-h ul ul li.iehover ul {
  display: block;
}

</STYLE>

<SCRIPT language=javascript>
window.onerror = new Function("return(false);")
navHover = function() {
    var lis = document.getElementById("navmenu-h").getElementsByTagName("LI");
    for (var i=0; i<lis.length; i++) {
        lis[i].onmouseover=function() {
            this.className+=" iehover";
        }
        lis[i].onmouseout=function() {
            this.className=this.className.replace(new RegExp(" iehover\\b"),"");
        }
    }
}
if (window.attachEvent) window.attachEvent("onload", navHover);
</SCRIPT>
<div id="container" align="center">
   <div id="Header"></div>
   <div class=b3><div id="mid">
   <table height="6" width="100%" bgcolor="#B42A2A">
    <tr>
      <td>      </td>
    </tr>
   </table></div>
   <div id="banner1">
  <DIV>
<UL id=navmenu-h>
<!--
 <LI><A href="main.jsp">课题信息</A>
  <UL>
     <LI><A href="addsubject.jsp">新建课题</A> </LI>
   </UL>
 </LI>
 <%
    String login_role1=(String)session.getAttribute("login_role");
     if(!login_role1.equals("operate")){
  %>
 <LI><A href="#">系统维护</A>
   <UL>
     <script language="javascript">
     document.write('<LI><A href=department.jsp>所属部门</A></LI><LI><a href="import.jsp?para_name=grade&lpara_name='+encodeURIComponent("课题等级")+'">课题等级</A></LI><LI>');
     document.write('<a href="import.jsp?para_name=source&lpara_name='+encodeURIComponent("任务来源")+'">任务来源</A></LI><LI>');
     document.write('<a href="import.jsp?para_name=consigned&lpara_name='+encodeURIComponent("委托单位")+'">委托单位</A></LI><LI>');
     document.write('<a href="import.jsp?para_name=type&lpara_name='+encodeURIComponent("课题类型")+'">课题类型</A></LI><LI>');
     document.write('<a href="import.jsp?para_name=knowledge&lpara_name='+encodeURIComponent("所属学科")+'">所属学科</A></LI><LI>');
     document.write('<a href="import.jsp?para_name=field&lpara_name='+encodeURIComponent("技术领域")+'">技术领域</A></LI><LI>');
     document.write('<a href="import.jsp?para_name=objective&lpara_name='+encodeURIComponent("经济目标")+'">经济目标</A></LI><LI>');
     document.write('<a href="import.jsp?para_name=trade&lpara_name='+encodeURIComponent("所属行业")+'">所属行业</A></LI><LI>');
     document.write('<a href="import.jsp?para_name=cooperation&lpara_name='+encodeURIComponent("合作形式")+'">合作形式</A></LI><LI>');
     document.write('<a href="import.jsp?para_name=progress&lpara_name='+encodeURIComponent("进展情况")+'">进展情况</A></LI><LI>');
     document.write('<a href="import.jsp?para_name=reason&lpara_name='+encodeURIComponent("拖延原因")+'">拖延原因</A></LI><LI>');
     document.write('<a href="import.jsp?para_name=class1&lpara_name='+encodeURIComponent("人员分类1")+'">人员分类1</A></LI><LI>');
     document.write('<a href="import.jsp?para_name=class2&lpara_name='+encodeURIComponent("人员分类2")+'">人员分类2</A></LI><LI>');
     document.write('<a href="import.jsp?para_name=money&lpara_name='+encodeURIComponent("经费来源")+'">经费来源</A></LI>');</script>
   </UL>
 </LI>
 <LI><A href="#">用户管理</A>
   <UL>
     <LI><A href="user.jsp">用户管理</A> </LI>
     <LI><A href="editpsword.jsp">更改密码</A> </LI>
   </UL>
 </LI><%}else{%>
 <LI><A href="subject.jsp">课题查看</A></LI>
 <LI><A href="editpsword.jsp">更改密码</A></LI>
<%}%>-->
 <LI><A href="exit.jsp">退出</A></LI>
</UL>
 </DIV>
  </div>
<div id="PageBody">
