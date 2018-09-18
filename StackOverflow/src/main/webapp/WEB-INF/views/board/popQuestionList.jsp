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
	width:75%;
}
.right{
	float: right;
	width:25%;
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
		<div class="left">
			<div>
				<h2>인기질문</h2>
				<p>이곳은 나중에 태그 추천이 들어갈 자리입니다다.</p>
			</div>
			<div>
				<h2>인기질문</h2>
				<p>이곳은 나중에 태그 추천이 들어갈 자리입니다다.</p>
			</div>
			<div>
				<h2>인기질문</h2>
				<p>이곳은 나중에 태그 추천이 들어갈 자리입니다다.</p>
			</div>
			<div>
				<h2>인기질문</h2>
				<p>이곳은 나중에 태그 추천이 들어갈 자리입니다다.</p>
			</div>
			<div>
				<h2>인기질문</h2>
				<p>이곳은 나중에 태그 추천이 들어갈 자리입니다다.</p>
			</div>
			<div>
				<h2>인기질문</h2>
				<p>이곳은 나중에 태그 추천이 들어갈 자리입니다다.</p>
			</div>
		</div>
		<div class="right">
			<p>이곳은 나중에 흥미태그 등 여러가지가 들어갈 자자리입니다.</p>
		</div>
	</div>
	<!----------------------main End--------------------------------------->


	<!----------------------footer--------------------------------------->
	<%@ include file="../commons/footer.jspf" %>
	<!----------------------footer End--------------------------------------->

</body>
</html>