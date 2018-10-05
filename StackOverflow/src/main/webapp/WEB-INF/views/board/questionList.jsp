<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.cookie.js"></script>
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
				<h2>질문리스트</h2>
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
		<form action="<c:url value='/questionList'/>" method="get">
			<input type="text" name="keyword" size="100" value="${param.keyword}">
			<input type="hidden" name="order" value="${param.order}">
			<input type="hidden" name="tagNo" value="${param.tagNo}">
			
			<input type="submit" value="검색">
		</form>
		
		<p align="right">
			<button onclick="location.href='<c:url value='/questionList?order=regDate&keyword=${param.keyword }&tagNo=${param.tagNo }'/>'">최신순</button>
			<button onclick="location.href='<c:url value='/questionList?order=view&keyword=${param.keyword }&tagNo=${param.tagNo }'/>'">많이본</button>
			<button onclick="location.href='<c:url value='/questionList?order=vote&keyword=${param.keyword }&tagNo=${param.tagNo }'/>'">인기순</button>
			<button onclick="location.href='<c:url value='/questionList?order=pi&keyword=${param.keyword }&tagNo=${param.tagNo }'/>'">현상금</button>
			<button onclick="location.href='<c:url value='/questionList?order=non&keyword=${param.keyword }&tagNo=${param.tagNo }'/>'">채택안됨</button>
			<select>
				<option value="10">10</option>
				<option value="30">30</option>
				<option value="50">50</option>
				<option value="100">100</option>
			</select>
			</p>
			<hr>
			<table width="100%">
				<c:forEach items="${questionBoardList.questionBoardList }" var="questionBoard">
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
								<span style="background:#8B9DC3; width:50px; display:inline-block; text-align: center; border-radius: 2px;border-radius: 10px;">
									<a href="<c:url value='/questionList?tagNo=${tag.tagNo }'/>" style="color:white;">${tag.tagName }</a>
								</span>&nbsp;
							</c:forEach>
							</td>
						</tr>
				</c:forEach>
			</table>
			<p style='text-align: center'>
				
 				<c:if test="${param.page > 9 }">
					<<
				</c:if>
				<c:set var="count" value="${questionBoardList.pageTotalCount /10}" />
				
				<c:forEach begin="1" end="${questionBoardList.pageTotalCount}" var="i">
					<a href="<c:url value='/questionList?page=${ i}&order=${param.order}&keyword=${param.keyword}&tagNo=${param.tagNo }'/>"style="display: inline;">${ i}</a>
				</c:forEach>
				
<%-- 				
				<c:if test="${param.page < 10 }">
					>>
				</c:if>
				 --%>
				
				<br>
			</p>
		</div>
		<div class="right">
			<div style="border:1px solid black; width:300px; height:200px;margin-left:80px; margin-top:63px">
			<p style="text-align: center; border-bottom:1px solid black; padding: 10px 0 10px 0; margin-top: 0; margin-bottom:0;">흥미태그</p>
			</div>
			<div style="border:1px solid black; width:300px; height:200px;margin-left:80px; margin-top:30px">
			<p style="text-align: center; border-bottom:1px solid black; padding: 10px 0 10px 0; margin-top: 0; margin-bottom:0;">즐겨찾기한 질문</p>
			</div>
			<div style="border:1px solid black; width:300px; height:200px;margin-left:80px; margin-top:30px">
			<p style="text-align: center; border-bottom:1px solid black; padding: 10px 0 10px 0; margin-top: 0; margin-bottom:0;">방문한 페이지</p>
			<c:forEach items="${visitQuestionBoard }" var="visitQuestion">
				<div style="border-bottom: 1px solid #333333; margin-top:3px; margin-bottom:3px;"><a href="<c:url value='/questionDetail/${visitQuestion.questionNo }'/>">${ visitQuestion.title}</a></div>
			</c:forEach>
			</div>
		</div>
	</div>
	<!----------------------main End--------------------------------------->


	<!----------------------footer--------------------------------------->
	<%@ include file="../commons/footer.jspf"%>
	<!----------------------footer End--------------------------------------->

</body>

<script>

$(function(){


	 	var list = new cookieList("visitQuestion");
	 	
		/* list.add("asd");    */ 
		
	 	/* deleteCookie('cookieTest');  */
	 	var cookies = getCookie('visitQuestion').split(',');
		console.log(cookies);
		  
});

function getCookie(cName) {
    cName = cName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cName);
    var cValue = '';
    if(start != -1){
        start += cName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cValue = cookieData.substring(start, end);
    }
    return unescape(cValue);
};

var deleteCookie = function(name) {
	  document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
};

var cookieList = function(cookieName){
	 var cookie = $.cookie(cookieName);
	 var items = cookie ? cookie.split(/,/) : new Array();
	 return {
	  "add" : function(val){
	   items.push(val);
	   $.cookie(cookieName,items.join(','));
	  },
	  "clear" : function(){
	   items = null;
	   $.cookie(cookieName, null);
	  },
	  "items" : function(){
	   return items; 
	  }
	};
};





</script>
</html>