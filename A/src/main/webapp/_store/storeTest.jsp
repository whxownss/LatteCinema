<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="storeItem" value="${requestScope.storeItemJson}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

${storeItem.itemImage}


<script type="text/javascript">
var a = ${storeItem};
debugger;
</script>
</body>



</html>