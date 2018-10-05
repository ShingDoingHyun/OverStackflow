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


 	<c:if test="${insertCnt>0}">
 		<c:if test="${memInfo.memberId != null}">
			<script>
				alert("${memInfo.memberId}님  회원가입성공하셨습니다");
				location.href = '<c:url value="/"/>';
			</script>
		</c:if>
		<c:if test="${comInfo.comId != null}">
			<script>
				alert("${comInfo.comId}님  회원가입성공하셨습니다");
				location.href = '<c:url value="/"/>';
			</script>
		</c:if>
	</c:if>

	<c:if test="${!(insertCnt>0) }">
		<script>
			alert("회원가입실패, 정보를 다시 입력하세요");
			location.href = '<c:url value="/"/>';
		</script>
	</c:if> 
	

</body>
</html>