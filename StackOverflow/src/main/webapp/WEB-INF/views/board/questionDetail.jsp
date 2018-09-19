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
</head>

<style>
.main{
	display:inline-block;
	height: 100%;
}
.mainLeft{
	float: left;
	width:650px;
	height:1000px;
	border-right: 1px solid black;
}
.mainRight{
	float: Right;
	width:650px;
	height:1000px;
}

.titleLeft{
	float: left;
}

.titleRight{
	float: Right;
}

</style>
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
		<h2>${questionBoard.title }</h2>
		<br>
		<div style="position: absolute; right: 10px; ">
		<button><a href="<c:url value="/openWriteQuestion"/>">질문하기</a></button>
		</div>
		<br>
		</div>
		<hr>

		<div class="mainLeft">
	
			<p>${questionBoard.content }</p>
		</div>
		<div class="mainRight">
		
		</div>
	</div>
	<!----------------------main End--------------------------------------->


	<!----------------------footer--------------------------------------->
	<%@ include file="../commons/footer.jspf" %>
	<!----------------------footer End--------------------------------------->





</body>

</html>