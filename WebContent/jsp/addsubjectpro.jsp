<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%request.setCharacterEncoding("utf-8");%>
<%@page import="java.util.*,javax.mail.*,javax.mail.internet.*,kaoqin.packa.*"%>
<%@page errorPage="error.jsp"%>
<jsp:useBean id="sum_db" scope="session" class="kaoqin.packa.sumdb"></jsp:useBean>
<jsp:useBean id="user_db" scope="session" class="kaoqin.packa.userdb"></jsp:useBean>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/default1.css" rel="stylesheet" type="text/css">
</head>
<BODY>
<%@include file="head.inc"%>
<table width="80%" height="380" border=0 cellPadding=0 cellSpacing=0 align="center">
  <tr>
    <br>
    <td align="center"><STRONG>
<%
  String filerequest[] = {
      null,null, null, null, null, null, null, null,null,null,null,null,null};
  String filerequest_name[] = {
      "operatename","institute_num","noinstitute_num","iproject_num","project_num","subject_name","subject_num","sub_num","linkman","email","subject_money","pro_num","templet"};
  for (int j = 0; j < 13; j++) {
    if (request.getParameter(filerequest_name[j]) != null) {
      filerequest[j] = request.getParameter(filerequest_name[j]);
    }
    else {
      filerequest[j] = "";
    }
  }
  String subject_id=request.getParameter("subject_id");
  String getmail[]=sum_db.getmail();
  String subject="";
  if (filerequest[0].equals("create")) {
     String uniquenum=sum_db.uniquenum(filerequest[6]);
     if(uniquenum.equals("0")){
     String user_id=(String)session.getAttribute("login_user_id");
     String name=(String)session.getAttribute("login_name");
     String email=(String)session.getAttribute("login_email");
     String tel=(String)session.getAttribute("login_tel");
     String temp;
     temp=sum_db.addsum(user_id,name,filerequest[1],filerequest[2],filerequest[3],filerequest[4],filerequest[5],filerequest[6],filerequest[7],filerequest[8],filerequest[9],filerequest[10],filerequest[11],filerequest[12]);
     try{
          String maintext="";
          String host="202.38.128.6";
          maintext=filerequest[8]+"：\r\n\r\n  您好！"
                    +"\r\n\r\n--------------------------------------------------------------------------------\r\n"
                    +"                         这是封自动发送的邮件，请勿回复！\r\n--------------------------------------------------------------------------------\r\n"
                    +"\r\n  您申请的课题已建立，请登录http://apply.ihep.ac.cn 填写完整的课题信息。\r\n\r\n"
                    +"      登录用户名："+filerequest[6]+"\r\n      密码："+temp+"\r\n--------------------------------------------------------------------------------"
                    +"\r\n\r\n      院管项目编号："+filerequest[1]+"\r\n      非院管项目编号："+filerequest[2]+"\r\n      院项目编号："+filerequest[3]
                    +"\r\n      项目编号："+filerequest[4]+"\r\n      课题名称："+filerequest[5]+"\r\n      课题编号："+filerequest[6]+"\r\n      子课题编号："+filerequest[7]
                    +"\r\n                                                        联系人："+name
                    +"\r\n                                                        电话："+tel
                    +"\r\n                                                        邮箱："+email
                    +"\r\n                                                        科研业务处"
                    +"\r\n\r\n\r\n--------------------------------------------------------------------------------\r\n"
                    +"                         这是封自动发送的邮件，请勿回复！\r\n--------------------------------------------------------------------------------";
         Properties props=new Properties();
         Authenticator auth = new Email_Autherticator(getmail[0],getmail[1]);   //进行邮件服务器用户认证
         props.put("mail.smtp.host",host);
         props.put("mail.smtp.auth","true");
         Session sendMailSession=Session.getDefaultInstance(props,auth);
         Message newMessage=new MimeMessage(sendMailSession);
         newMessage.setFrom(new InternetAddress(getmail[0]+"@ihep.ac.cn",MimeUtility.encodeText("科研业务处新建课题","GBK","B")));
         newMessage.setRecipient(Message.RecipientType.TO,new InternetAddress(filerequest[9]));
         subject="填写课题："+filerequest[5];
         newMessage.setSubject(MimeUtility.encodeText(subject,"GBK","B"));
         newMessage.setSentDate(new Date());
         newMessage.setContent(maintext, "text/plain;charset=utf-8");
         Transport.send(newMessage);

         out.print("新建完成！");
        }catch(MessagingException m){
           out.print("邮件发送失败！ "+m.toString());
        }
        }else{
          out.print("对不起，课题编号已存在，请换一个！");
          out.print("<a href=\"javascript:history.go(-1);\">返回上一页</a>");
        }
  }
 else if(filerequest[0].equals("edit")){
        sum_db.editsum(request.getParameter("subject_id"),filerequest[1],filerequest[2],filerequest[3],filerequest[4],filerequest[5],filerequest[6],filerequest[7],
        filerequest[8],filerequest[9],request.getParameter("project_name"),request.getParameter("pro_num"),request.getParameter("total"),request.getParameter("funds"),
        request.getParameter("head"),request.getParameter("department"),request.getParameter("period"),request.getParameter("co_school"),
        request.getParameter("co_country"),request.getParameter("grade"),request.getParameter("source"),request.getParameter("consigned"),
        request.getParameter("type"),request.getParameter("knowledge"),request.getParameter("field"),request.getParameter("objective"),
        request.getParameter("trade"),request.getParameter("cooperation"),request.getParameter("progress"),request.getParameter("reason"),filerequest[10],filerequest[12]);
        out.print("修改完成！");
 }else if(filerequest[0].equals("resend")){
        try{
          String maintext="";
          String host="202.38.128.6";
          String passwd=sum_db.resetpasswd(subject_id);
          ArrayList iterlist = (ArrayList) sum_db.getonesum(subject_id);
          sumdetail book = (sumdetail) iterlist.get(0);
          ArrayList iterlist1 = (ArrayList) user_db.getoneuser(book.getUser_id());
          userdetail book1 = (userdetail) iterlist1.get(0);
          maintext=book.getLinkman()+"：\r\n\r\n  您好！"
                    +"\r\n\r\n--------------------------------------------------------------------------------\r\n"
                    +"                         这是封自动发送的邮件，请勿回复！\r\n--------------------------------------------------------------------------------\r\n"
                    +"\r\n  您申请的课题已建立，请登录http://apply.ihep.ac.cn 填写完整的课题信息。\r\n\r\n"
                    +"      登录用户名："+book.getSubject_num()+"\r\n      密码："+book.getPasswd()+"\r\n--------------------------------------------------------------------------------"
                    +"\r\n\r\n      院管项目编号："+book.getInstitute_num()+"\r\n      非院管项目编号："+book.getNoinstitute_num()+"\r\n      院项目编号："+book.getIproject_num()
                    +"\r\n      项目编号："+book.getProject_num()+"\r\n      课题名称："+book.getSubject_name()+"\r\n      课题编号："+book.getSubject_num()+"\r\n      子课题编号："+book.getSub_num()
                    +"\r\n                                                        联系人："+book.getName()
                    +"\r\n                                                        电话："+book1.getTel()
                    +"\r\n                                                        邮箱："+book1.getEmail()
                    +"\r\n                                                        科研业务处"
                    +"\r\n\r\n\r\n--------------------------------------------------------------------------------\r\n"
                    +"                         这是封自动发送的邮件，请勿回复！\r\n--------------------------------------------------------------------------------";
         Properties props=new Properties();
         Authenticator auth = new Email_Autherticator(getmail[0],getmail[1]);   //进行邮件服务器用户认证
         props.put("mail.smtp.host",host);
         props.put("mail.smtp.auth","true");
         Session sendMailSession=Session.getDefaultInstance(props,auth);
         Message newMessage=new MimeMessage(sendMailSession);
         newMessage.setFrom(new InternetAddress(getmail[0]+"@ihep.ac.cn",MimeUtility.encodeText("科研业务处新建课题","GBK","B")));
         newMessage.setRecipient(Message.RecipientType.TO,new InternetAddress(book.getEmail()));
         subject="填写课题："+filerequest[5];
         newMessage.setSubject(MimeUtility.encodeText(subject,"GBK","B"));
         newMessage.setSentDate(new Date());
         newMessage.setContent(maintext, "text/plain;charset=utf-8");
         Transport.send(newMessage);

         out.print("发送完成！");
        }catch(MessagingException m){
           out.print("邮件发送失败！ "+m.toString());
        }
 }
%></STRONG>
</td>
  </tr>
  <tr>
    <td align="center">
      <br>
      <input class="button" type="submit" value="返回" onclick="location.href='main.jsp?hidden_operate=init'">
    </td>
  </tr>
</table>
<%@include file="foot.inc"%>
</body>
</html>
