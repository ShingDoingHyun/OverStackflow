<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${memInfo != null}">
			<script>
				alert("로그인 성공");
				location.href = '<c:url value="/"/>';
			</script>
	</c:if>
	<c:if test="${memInfo == null}">
		    <script>
				alert("정보를 다시 확인해 주세요");
				location.href = '<c:url value="/memLoginForm" />';
			</script>	
	</c:if>


</body>
</html>