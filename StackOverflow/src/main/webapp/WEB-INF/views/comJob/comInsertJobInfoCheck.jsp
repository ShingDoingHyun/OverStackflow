<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>채용 공고 등록 확인</title>
</head>
<body>

<c:if test="${result == null}">
<script>
alert("채용 공고가 정상적으로 등록되었습니다.");
location.href = '<c:url value="/"/>';
</script>
</c:if>

<c:if test="${result != null}">
<script>
alert("채용 공고 등록에 실패하였습니다.");
location.href = '<c:url value="/"/>';
</script>
</c:if>
</body>
</html>
