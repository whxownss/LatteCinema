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
String memStopD = (String)request.getAttribute("memStopD");
%>
		<script type="text/javascript">
			alert("정지된 아이디입니다. 정지된 날:   <%=memStopD %>");
			history.back();
		</script>
</body>
</html>