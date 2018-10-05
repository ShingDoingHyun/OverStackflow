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
   
    padding-top: 15px;
    padding-bottom: 15px;
    font-size: 12px;
}
  
td{
     padding-top: 10px;
    padding-bottom: 10px;
  
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
			<button onclick="location.href='<c:url value='/openWriteQuestion'/>'" style="position: absolute; right:10px; top:111px;" >
				질문하기
			</button>
		</div>
	</div>
	<div class="main">
		<div class="left">
		<p align="right">
			<button>나의흥미</button>
			<button>이번주인기</button>
			<button>이번달인기</button>
			<button>전체인기</button>
			</p>
			<hr>
			<table width="100%">
				<c:forEach items="${questionBoardList }" var="questionBoard">
						<tr>
							<td width="8%" align="center" rowspan="2" style=" border-bottom: 1px solid #777777;"><img src="<c:url value='/img/unFav.png'/>" width="30px" height="30px"></td>
							<td width="8%" align="center">0</td>
							<td width="8%" align="center">0</td>
							<td width="8%" align="center">${questionBoard.view}</td>
							<td width="48%"><p><a href="<c:url value="/questionDetail/${questionBoard.questionNo }"/>">${questionBoard.title }</a>
							</p></td>
							<td width="20%" rowspan="2" style=" border-bottom: 1px solid #777777;">작성시간 <fmt:formatDate value="${questionBoard.regDate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/> ${questionBoard.memId }</td>
						</tr>
						<tr style=" border-bottom: 1px solid #777777;">
							<td width="8%" align="center">추천</td>
							<td width="8%" align="center">답변</td>
							<td width="8%" align="center">읽음</td>
							<td width="48%">
							<c:forEach items="${questionBoard.tagList }" var="tag">
								<span style="background:#8B9DC3; color:white; width:50px; display:inline-block; text-align: center; border-radius: 2px;border-radius: 10px;">${tag.tagName }</span>&nbsp;
							</c:forEach>
							</td>
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