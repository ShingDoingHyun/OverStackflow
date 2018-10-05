<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!----------------------header--------------------------------------->
	<%@ include file="../commons/header.jspf" %>
	<!----------------------header End--------------------------------------->

	<!----------------------left menu--------------------------------------->
	<%@ include file="../commons/left.jspf" %>
	<!----------------------left menu End--------------------------------------->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<link rel="stylesheet" href="css/index.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/loginStyle.css" type="text/css" media="all" />
<title>Insert title here</title>
<title>개인/기업회원가입페이지</title>
</head>
<body>
<div class="main">

	<h1>개인/기업회원 회원가입 선택페이지</h1>
	
	<input type="button" class="login" value="개인회원가입" onclick="location.href='<c:url value="/memJoinForm"/>'"><br>
	<input type="button" class="login" value="기업회원가입" onclick="location.href='<c:url value="/comJoinForm"/>'"><br>
</div>

<%@ include file="../commons/footer.jspf" %>
</body>
</html>