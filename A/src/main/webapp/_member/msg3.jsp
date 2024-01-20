<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/msg2.jsp</title>
<script src="jQuery/jquery-3.6.0.js"></script>
</head>
<body>
<%
String memDeleteD = (String)request.getAttribute("memDeleteD");
%>
		<script type="text/javascript">
			alert("탈퇴한 아이디입니다. 탈퇴한 날:   <%=memDeleteD %>");
			history.back();
		</script>
</body>
</html>