<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/index.css" type="text/css"
	media="all" />


<style>
.main {
	display: inline-block;
	height: 100%;
}

.left {
	float: left;
	width: 70%;
}

.right {
	float: right;
	width: 30%;
}
table {
    width: 100%;
    border-collapse: collapse;
  }
  
th, td {
    border-bottom: 1px solid #777777;
    padding-top: 15px;
    padding-bottom: 15px;
    font-size: 12px;
  }
</style>

</head>
<body>
	<!----------------------header--------------------------------------->

	<%@ include file="../commons/header.jspf"%>
	<!----------------------header End--------------------------------------->


	<!----------------------left menu--------------------------------------->
	<%@ include file="../commons/left.jspf"%>
	<!----------------------left menu End--------------------------------------->



	<!----------------------main--------------------------------------->
	<div class="main">
		<div class="left">
			<div>
				<h2>인기질문</h2>
				<br> <br>

			</div>
		</div>

		<div class="right">
			<button>
				<a href="<c:url value="/openWriteQuestion"/>">질문하기</a>
			</button>
		</div>
	</div>
	<div class="main">
		<div class="left">
			<hr>
			<table width="100%">
				<c:forEach items="${questionBoardList }" var="questionBoard">
						<tr>
							<td width="8%" align="center"><img src="<c:url value='/img/unFav.png'/>" width="30px" height="30px"></td>
							<td width="8%" align="center">0<br>추천</td>
							<td width="8%" align="center">0<br>답변</td>
							<td width="8%" align="center">${questionBoard.view}<br>읽음</td>
							<td width="48%"><p><a href="<c:url value="/questionDetail/${questionBoard.questionNo }"/>">${questionBoard.title }</a></p></td>
							<td width="20%">작성시간 <fmt:formatDate value="${questionBoard.regDate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/> ${questionBoard.memId }</td>
						</tr>
					
				</c:forEach>
			</table>
		</div>
	</div>
	<!----------------------main End--------------------------------------->


	<!----------------------footer--------------------------------------->
	<%@ include file="../commons/footer.jspf"%>
	<!----------------------footer End--------------------------------------->

</body>

<script>

</script>
</html>