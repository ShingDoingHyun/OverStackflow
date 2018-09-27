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
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/index.css" type="text/css"
	media="all" />


<link href="<%=request.getContextPath()%>/summernote/summernote.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/summernote/summernote.min.js"></script>

<!-- include summernote-ko-KR -->
<script
	src="<%=request.getContextPath()%>/summernote/lang/summernote-ko-KR.js"></script>
</head>

<style>
.accordian .subCommentAcco{
cursor:pointer;
}

#accordian li{ 
	list-style:none;
}
	
li > div{ display:none;}
	
#accordian ul{
 padding-left: 0px;
}
	
#accordian{
	margin: 0px auto;
}
	
#accordian #title{
	margin: 0px auto;
	text-align: center;
}

.main {
	display: inline-block;
	height: 100%;
}

.mainLeft {
	float: left;
	width: 50%;
	border-right: 1px solid black;
	display: inline-block;
}

.mainRight {
	float: Right;
	width: 50%;
}

.titleLeft {
	float: left;
}

.titleRight {
	float: Right;
}

iframe {
	width: 90%;
}
</style>
<body>


	<!----------------------header--------------------------------------->

	<%@ include file="../commons/header.jspf"%>
	<!----------------------header End--------------------------------------->


	<!----------------------left menu--------------------------------------->
	<%@ include file="../commons/left.jspf"%>
	<!----------------------left menu End--------------------------------------->





	<!----------------------main--------------------------------------->
	<div class="main">
		<div>
			<h2>${questionBoard.title }</h2>
			<br>
			<div style="position: absolute; right: 10px;">
				<button>
					<a href="<c:url value="/openWriteQuestion"/>">질문하기</a>
				</button>
			</div>
			<br>
		</div>
		<hr>

		<div class="mainLeft">
			<div style="float: left; width: 15%;">
				<br> 
				<a href=""><img src="<c:url value='/img/unVoteUp.png'/>" width="30px" height="20px"></a>
				<br>
				<br>
				<div style="width: 30px; text-align: center;">${questionBoard.vote }</div>
				<br> 
				<a href=""><img src="<c:url value='/img/unVoteDown.png'/>" width="30px" height="20px"></a><br>
				<br>
				<a href=""><img src="<c:url value='/img/unFav.png'/>" width="30px" height="30px"></a>
			</div>
			<div style="float: right; width: 85%;">
				<div>
					<p>${questionBoard.content }</p>
				</div>
				<div style="margin-top: 100px;">
					<a href="">공유</a> <a href="/openUpdateQuestion/${questionBoard.questionNo }">수정</a> <a href="">삭제</a>
				</div>
				<div style="width: 100%; display: inline-block;">
					<div style="float: left; width: 50%; margin-top: 80px;" class="accordian">
						댓글작성
					</div>
					<div style="float: right; width: 50%;">
						작성자 프로필 부분
					</div>
				</div>
				<div>
					<hr>
					<c:forEach items="${questionBoard.commentList }" var="comment">
						<div style="margin-left: 10px;">${comment.content } - ${comment.memId } <span class="subCommentAcco">댓글</span> 수정 삭제</div>
						<c:forEach items="${comment.commentList }" var="comment2">
							<div style="margin-left: 10px;">
								&nbsp;&nbsp;&nbsp;&nbsp;-${comment2.content }- ${comment2.memId } 수정 삭제
							</div>
						</c:forEach>
						<div id="accordian">
							<ul>
								<li> 
									<div class="comment">
										<form action="<c:url value="/insertComment"/>" method="post">
											<input type="hidden" name="memId" value="test">
											<input type="hidden" name="questionNo" value="${questionBoard.questionNo }">
											<input type="hidden" name="upperCommentNo" value="${comment.commentNo }">
											<textarea name="content" style="width: 95%;"></textarea>
											<br> <input type="submit" value="댓글작성" />
										</form>
									</div>
								</li>
							</ul>
						</div>
						<hr>
					</c:forEach>
				</div>
				<div id="accordian">
					<ul>
						<li> 
							<div class="comment">
								<form action="<c:url value="/insertComment"/>" method="post">
									<input type="hidden" name="memId" value="test">
									<input type="hidden" name="questionNo" value="${questionBoard.questionNo }">
									<textarea name="content" style="width: 95%;"></textarea>
									<br> <input type="submit" value="댓글작성" />
								</form>
							</div>
						</li>
					</ul>
				</div>
				<br>
				<br>

				<p>답글작성</p>
				<form action="<c:url value="/insertReply"/>" method="post">
					<input type="hidden" name="memId" value="text" /> <input
						type="hidden" name="questionNo"
						value="${questionBoard.questionNo }">
					<textarea id="summernote" name="content"></textarea>
					<br> <input type="submit" value="작성" />

				</form>

			</div>


		</div>
		
		



	</div>
	
	<div class="main">
		<hr>
		<h2>총 ${questionBoard.replyBoardList.size() }개의 답변</h2>
		<hr>
	</div>
	
	<c:forEach items="${questionBoard.replyBoardList }" var="replyboard">
		<div class="main">
		

			<div class="mainLeft" style="border-bottom: 1px solid #EEEEEE;">
				<div style="float: left; width: 15%;">
					<br> 
					<a href=""><img src="<c:url value='/img/unVoteUp.png'/>" width="30px" height="20px"></a>
					<br>
					<br>
					<div style="width: 30px; text-align: center;">${replyboard.vote }</div>
					<br> 
					<a href=""><img src="<c:url value='/img/unVoteDown.png'/>" width="30px" height="20px"></a><br>
					<br>
					<a href=""><img src="<c:url value='/img/unFav.png'/>" width="30px" height="30px"></a>
				</div>
				<div style="float: right; width: 85%;">
					<div>
						<p>${replyboard.content }</p>
					</div>
					<div style="margin-top: 100px;">
						<a href="">공유</a> <a href="">수정</a> <a href="">삭제</a>
					</div>
					<div style="width: 100%; display: inline-block;">
						<div style="float: left; width: 50%; margin-top: 80px;" class="accordian">
							댓글작성
						</div>
						<div style="float: right; width: 50%;">
							작성자 프로필 부분
						</div>
					</div>
					<div>
						<hr>
						<c:forEach items="${replyboard.commentList }" var="comment">
							<div style="margin-left: 10px;">${comment.content } - ${comment.memId } <span class="subCommentAcco">댓글</span> 수정 삭제</div>
							<c:forEach items="${comment.commentList }" var="comment2">
								<div style="margin-left: 10px;">
									&nbsp;&nbsp;&nbsp;&nbsp;-${comment2.content }- ${comment2.memId } 댓글 수정 삭제
								</div>
							</c:forEach>
							<div id="accordian">
								<ul>
									<li> 
										<div class="comment">
											<form action="<c:url value="/insertComment"/>" method="post">
												<input type="hidden" name="memId" value="test">
												<input type="hidden" name="questionNo" value="${replyboard.questionNo }">
												<input type="hidden" name="replyNo" value="${replyboard.replyNo }">
												<input type="hidden" name="upperCommentNo" value="${comment.commentNo }">
												<textarea name="content" style="width: 95%;"></textarea>
												<br> <input type="submit" value="댓글작성" />
											</form>
										</div>
									</li>
								</ul>			
							</div>
							<hr>
						</c:forEach>
					</div>
					<div id="accordian">
						<ul>
							<li> 
								<div class="comment">
									<form action="<c:url value="/insertComment"/>" method="post">
										<input type="hidden" name="memId" value="test">
										<input type="hidden" name="questionNo" value="${replyboard.questionNo }">
										<input type="hidden" name="replyNo" value="${replyboard.replyNo }">
										<textarea name="content" style="width: 95%;"></textarea>
										<br> <input type="submit" value="댓글작성" />
									</form>
								</div>
							</li>
						</ul>
					</div>
					<br>
					<br>
				</div>
			</div>
			<div class="mainRight"></div>
	
		</div>		
		<br>
		<br>
			
			

	</c:forEach>






	<!----------------------main End--------------------------------------->


	<!----------------------footer--------------------------------------->
	<%@ include file="../commons/footer.jspf"%>
	<!----------------------footer End--------------------------------------->





</body>

<!-- 게시판 jQuery -->
<script>


$(function(){
	//아코디언 형식
	$(".accordian").click(function(){
		$(this).parent().next().next().find(".comment").slideUp();
		if(!$(this).parent().next().next().find(".comment").is(":visible"))
		{
			$(this).parent().next().next().find(".comment").slideDown(); 
		} 
	});
});

$(function(){
	//아코디언 형식
	$(".subCommentAcco").click(function(){
		$(this).parent().next().next().find(".comment").slideUp();
		if(!$(this).parent().next().next().find(".comment").is(":visible"))
		{
			$(this).parent().next().next().find(".comment").slideDown(); 
		} 
	});
});
	
	$(document)
			.ready(
					function() {
						$('#summernote')
								.summernote(
										{
											lang : 'ko-KR',
											height : 300,
											width : 600,
											fontNames : [ '맑은고딕', 'Arial',
													'Arial Black',
													'Comic Sans MS',
													'Courier New', ],
											fontNamesIgnoreCheck : [ '맑은고딕' ],
											focus : true,
											callbacks : {
												onImageUpload : function(files,
														editor, welEditable) {
													for (var i = files.length - 1; i >= 0; i--) {

														sendFile(files[i], this);
													}
												}
											}

										});
					});

	function sendFile(file, el) {
		var form_data = new FormData();
		form_data.append('file', file);

		$.ajax({
			data : form_data,
			type : "POST",
			url : getContextPath() +'/imageUpload',
			cache : false,
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			dataType : "text",
			success : function(img_name) {

				$('#summernote').summernote('insertImage',getContextPath() + img_name);
			}
		});
	}

	function getContextPath() {
		var hostIndex = location.href.indexOf(location.host)
				+ location.host.length;
		return location.href.substring(hostIndex, location.href.indexOf('/',
				hostIndex + 1));
	};
</script>

</html>