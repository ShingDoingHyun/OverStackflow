<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/index.css" type="text/css" media="all" />


<style>

.main{
	display:inline-block;
	height: 100%;
}
.left{
	float: left;
	width:80%;
}
.right{
	float: right;
	width:20%;
}



</style>

</head>
<body>
<!----------------------header--------------------------------------->
	
	<%@ include file="../commons/header.jspf" %>
	<!----------------------header End--------------------------------------->


	<!----------------------left menu--------------------------------------->
	<%@ include file="../commons/left.jspf" %>
	<!----------------------left menu End--------------------------------------->





	<!----------------------main--------------------------------------->
	<div class="main">
				<div>
				<h2>인기질문</h2>
				<br>
				<br>
		
			</div>
		<div class="left">
			<hr>
			<c:forEach items="${questionBoardList }" var="questionBoard">
			<a href="<c:url value="/questionDetail/${questionBoard.questionNo }"/>">
				<div>
					<p>${questionBoard.title }</p>
					<h2>${questionBoard.memId }</h2>
					<hr>
				</div>
			</a>
			</c:forEach>
		
		</div>
		<div class="right">
			<button><a href="<c:url value="/openWriteQuestion"/>">질문하기</a></button>
		</div>
	</div>
	<!----------------------main End--------------------------------------->


	<!----------------------footer--------------------------------------->
	<%@ include file="../commons/footer.jspf" %>
	<!----------------------footer End--------------------------------------->

</body>
</html>