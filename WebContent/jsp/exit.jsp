<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
<title>
exit
</title>
</head>
<body>
<%session.invalidate();
out.print("<script language=javascript>window.open('../index.jsp','_parent')</script>");%>
</h1>
</body>
</html>
