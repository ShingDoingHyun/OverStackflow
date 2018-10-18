<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>OverStackFlow</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Novus Admin Panel Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Bootstrap Core CSS -->
<link href="<c:url value="/css/bootstrap.css"/>" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="<c:url value="/css/style.css"/>" rel='stylesheet' type='text/css' />
<!-- font CSS -->
<!-- font-awesome icons -->
<link href="<c:url value="/css/font-awesome.css"/>" rel="stylesheet"> 
<!-- //font-awesome icons -->
 <!-- js-->
<script src="<c:url value="/js/jquery-1.11.1.min.js"/>"></script>
<script src="<c:url value="/js/modernizr.custom.js"/>"></script>
<!--webfonts-->
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<!--//webfonts--> 
<!--animate-->
<link href="<c:url value="/css/animate.css"/>" rel="stylesheet" type="text/css" media="all">
<script src="<c:url value="/js/wow.min.js"/>"></script>
	<script>
		 new WOW().init();
	</script>
<!--//end-animate-->
<!-- chart -->
<script src="<c:url value="/cjs/Chart.js"/>"></script>
<!-- //chart -->
<!--Calender-->

<!--End Calender-->
<!-- Metis Menu -->
<script src="<c:url value="/js/metisMenu.min.js"/>"></script>
<script src="<c:url value="/js/custom.js"/>"></script>
<link href="<c:url value="/css/custom.css"/>" rel="stylesheet">
<!--//Metis Menu -->




<!-- 우리가 추가한 스타일 등등 -->



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
	width: 100%;
}

.left {
	float: left;
	width: 80%;
}

.right {
	float: right;
	width: 20%;
}

.mainLeft {
	float: left;
	width: 50%;
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

/* 프로필 영역 css  */
.profile{
	float: right; 
	width: 250px; 
	height:90px; 
	border-radius: 5px; 
	background: #eeeeee; 
	margin-right: 10px;
	
}

button{
border: 0;
outline: 0;
height: 25px;
margin-right: 4px;

}
a {
 color: black;
}
</style>


<link href="<c:url value="/summernote/summernote.css"/>" rel="stylesheet">
<script src="<c:url value="/summernote/summernote.min.js"/>"></script>

<!-- include summernote-ko-KR -->
<script src="<c:url value="/summernote/lang/summernote-ko-KR.js"/>"></script>
	
	
<script type="text/javascript" src="<c:url value="/js/jquery.cookie.js"/>"></script>	


<!-- 우리가 추가한 스타일 등등  end-->


</head> 
<body class="cbp-spmenu-push">
	<div class="main-content">
	
		<!--left-fixed -navigation-->
			<%@ include file="../commons/bleft.jspf" %>
		<!--left-fixed -navigation-->
		
		<!-- header-starts -->
			<%@ include file="../commons/bheader.jspf" %>
		<!-- //header-ends -->
		
		
		
		
		
		<!-- main content start-->
		<div id="page-wrapper">
		
			<div class="main-page">
			

				<div class="main">
					<div>
						<h2>${questionBoard.title }</h2>
					
					</div>
					<hr>		
					<div class="mainLeft">
						<div style="float: left; width: 15%;">
							<br> 
							<c:if test="${memberVote > 0}">
							<a href="javascript:changeVote('${questionBoard.questionNo }','0');">
								<img src="<c:url value='/img/voteUp.png'/>" width="30px" height="20px" class="upVote">
							</a>
							</c:if>
							<c:if test="${memberVote <= 0}">
							<a href="javascript:changeVote('${questionBoard.questionNo }','1');">
								<img src="<c:url value='/img/unVoteUp.png'/>" width="30px" height="20px" class="upVote">
							</a>
							</c:if>
							<br>
							<br>
							<div style="width: 30px; text-align: center;" class="vote">${questionBoard.vote }</div>
							<br>
							<c:if test="${memberVote >= 0}"> 
							<a href="javascript:changeVote('${questionBoard.questionNo }','-1');">
								<img src="<c:url value='/img/unVoteDown.png'/>" width="30px" height="20px" class="downVote">
							</a>
							</c:if>
							<c:if test="${memberVote < 0}"> 
							<a href="javascript:changeVote('${questionBoard.questionNo }','0');">
								<img src="<c:url value='/img/voteDown.png'/>" width="30px" height="20px" class="downVote">
							</a>
							</c:if>
							<br>
							<br>
							<a href="javascript:checkFavQuestion('${questionBoard.questionNo }');">
							
							
								<c:if test="${questionBoard.fav > 0}">
									<img src="<c:url value='/img/fav.png'/>" width="30px" height="30px" class="fav" name="fav">
								</c:if>
								<c:if test="${questionBoard.fav <= 0}">
									<img src="<c:url value='/img/unFav.png'/>" width="30px" height="30px" class="fav" name="unFav">
								</c:if>				
							</a>
						</div>
						<div style="float: right; width: 85%;">
							<div>
								<p>${questionBoard.content }</p>
							</div>
							<c:forEach items="${questionBoard.tagList }" var="tag" >
								<a href="<c:url value='/popQuestionList?tagNo=${tag.tagNo }'/>" style="color:white;"><span style="background:#8B9DC3; color:white; width:50px; display:inline-block; text-align: center; border-radius: 2px;border-radius: 10px;">${tag.tagName }</span></a>
							</c:forEach>
							<div style="margin-top: 100px;">
								<a href="">공유</a> <a href="javascript:loginCheck('${questionBoard.memId }', 'openUpdateQuestion/${questionBoard.questionNo }');">수정</a> <a href="javascript:deleteQuestion('${questionBoard.memId }', '/deleteQuestion/${questionBoard.questionNo }');">삭제</a>
							</div>
							<div style="width: 100%; display: inline-block;">
								<div style="float: left; width: 50%; margin-top: 80px;" class="accordian">
									댓글작성
								</div>
								<div class="profile">
									<div style="margin-left: 10px;margin-top:  10px">
										<c:if test="${memberInfo.memberPhoto != null && memberInfo.memberPhoto != ''}">
											<img class='photo2' src="<c:url value='/resources/uploadFile/memberPhoto/${memberInfo.memberPhoto}'/>"  altSrc="<c:url value='/img/default.png'/>" onerror="this.src = $(this).attr('altSrc')">
										</c:if>
										<c:if test="${memberInfo.memberPhoto == null || memberInfo.memberPhoto == ''}">
											<img class='photo2' src="<c:url value='/resources/img/default.png'/>">
										</c:if>
										 ${memberInfo.memberId}<br>
										<span style="font-size: 12px;">작성시간 : <fmt:formatDate value="${questionBoard.regDate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/></span>
									</div>
								</div>
							</div>
							<div>
								<hr>
								<c:forEach items="${questionBoard.commentList }" var="comment">
									<div style="margin-left: 10px;">
										<span class="content">${comment.content }</span> - <span class="commentId">${comment.memId }</span> &nbsp;&nbsp; [ 작성시간 ${comment.regDate} 
										<span class="subCommentAcco">댓글</span> <span class="updateComment">수정</span> <span onclick="javacript:deleteComment(${comment.commentNo }, $(this));">삭제</span> ]
									</div>
									<div style="display: none;">
										<form  onSubmit="return updateComment($(this));">
											<input type="hidden" name="commentNo" value="${comment.commentNo }">
											<textarea name="content" style="width: 95%;">${comment.content }</textarea>
											<br> <button type="button" class="cancelUpdate">수정취소</button> <input type="submit" value="댓글수정">
										</form>
									</div>
									<div>
									<c:forEach items="${comment.commentList }" var="comment2">
										<div style="margin-left: 10px;">
											&nbsp;&nbsp;&nbsp;&nbsp;- <span class="content">${comment2.content }</span> - <span class="commentId">${comment2.memId }</span> &nbsp;&nbsp; [작성시간 ${comment2.regDate} 
											<span class="updateComment">수정</span> <span onclick="javacript:deleteComment(${comment2.commentNo }, $(this));">삭제</span> ]
										</div>
										<div style="display: none;">
											<form  onSubmit="return updateComment($(this));">
												<input type="hidden" name="commentNo" value="${comment2.commentNo }">
												<textarea name="content" style="width: 95%;">${comment2.content }</textarea>
												<br> <button type="button" class="cancelUpdate">수정취소</button> <input type="submit" value="댓글수정">
											</form>
										</div>
									</c:forEach>
									</div>
									<div id="accordian">
										<ul>
											<li> 
												<div class="comment">
													<form action="<c:url value="/insertComment"/>" method="post">
														<input type="hidden" name="memId" value="${memInfo.memberId }">
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
												<input type="hidden" name="memId" value="${memInfo.memberId }">
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
							<form action="<c:url value="/insertReply"/>" onsubmit="return replyInsert();" method="post">
								<input type="hidden" name="memId" value="${memInfo.memberId }" /> 
								<input type="hidden" name="questionNo" value="${questionBoard.questionNo }">
								<textarea id="summernote" name="content"></textarea>
								<br> <input type="submit" value="작성" />
			
							</form>
			
						</div>
			
			
					</div>
					<div class="right" style="font-size: 14px">
						 <span style="font-size: 14px;margin-left:19%;">
						      <a href="<c:url value="/popQuestionList"/>">질문게시판</a> > 
						      <a href="<c:url value="/popQuestionList"/>">인기질문</a>
					      </span>
						<div style="margin-top: 100px">
							<button id="writeBtn"  style="position: absolute; right:10px; top:111px; width:100px; height: 30px; font-size: 15px" class="label label-warning">
								질문하기
							</button>
						</div>
						<c:if test="${memInfo != null}">
							<div style="border:1px solid black; width:300px; height:auto; min-height: 200px; margin-left:20px; margin-top:30px" class="modalLoad" id="favTag">
								<p style="text-align: center; border-bottom:1px solid black; padding: 10px 0 10px 0; margin-top: 0; margin-bottom:0;">흥미태그</p>
								<form id="favTagForm" action="<c:url value='/popQuestionList'/>" method="get">
									<div id="tags">
										<c:forEach items="${fagTagList }" var="fagTag" varStatus="status">
											<span class="tag" style="margin-left:10px;">#${ fagTag.tagName}</span>
											<input type="hidden" name="tagList[${status.index}].tagNo" value="${fagTag.tagNo }">
										</c:forEach> 
									</div>
								</form> 
							</div>
							
							<div style="border:1px solid black; width:300px; height:auto; min-height: 200px; margin-left:20px; margin-top:30px">
								<p style="text-align: center; border-bottom:1px solid black; padding: 10px 0 10px 0; margin-top: 0; margin-bottom:0;">즐겨찾기한 질문</p>
								<div id="favList">
								<c:forEach items="${favQuestionList }" var="favQuestionList">
									<div style="margin-top:3px; margin-bottom:3px;">
										<a href="<c:url value='/questionDetail/${favQuestionList.questionNo }'/>">${ favQuestionList.title}</a>
									</div>
								</c:forEach>
								</div>
							</div>
						</c:if>
						<div style="border:1px solid black; width:300px; height:auto; min-height: 200px; margin-left:20px; margin-top:30px">
						<p style="text-align: center; border-bottom:1px solid black; padding: 10px 0 10px 0; margin-top: 0; margin-bottom:0;">방문한 페이지</p>
						<div style="margin-top:3px; margin-bottom:3px;"><a href="<c:url value='/questionDetail/${questionBoard.questionNo }'/>">${ questionBoard.title}</a></div>
						<c:forEach items="${visitQuestionBoard }" var="visitQuestion">
							<c:if test="${questionBoard.questionNo != visitQuestion.questionNo}">
								<div style="margin-top:3px; margin-bottom:3px;"><a href="<c:url value='/questionDetail/${visitQuestion.questionNo }'/>">${ visitQuestion.title}</a></div>
							</c:if>
						</c:forEach>
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
							</div>
							<div style="float: right; width: 85%;">
								<div>
									<p>${replyboard.content }</p>
								</div>
								<div style="margin-top: 100px;">
									<a href="">공유</a> <a href="javascript:loginCheck('${replyboard.memId }', 'openUpdateQuestion/${replyboard.questionNo }');">수정</a> <a href="javascript:deleteQuestion('${replyboard.memId }', '/deleteReply/${replyboard.replyNo }/${questionBoard.questionNo }');">삭제</a>
								</div>
								<div style="width: 100%; display: inline-block;">
									<div style="float: left; width: 50%; margin-top: 80px;" class="accordian">
										댓글작성
									</div>	
									<div class="profile">
										<div style="margin-left: 10px;margin-top:  10px">
											<c:if test="${replyboard.memberPhoto != null && replyboard.memberPhoto != ''}">
												<img class='photo2' src="<c:url value='/resources/uploadFile/memberPhoto/${replyboard.memberPhoto}'/>"  altSrc="<c:url value='/img/default.png'/>" onerror="this.src = $(this).attr('altSrc')">
											</c:if>
											<c:if test="${replyboard.memberPhoto == null || replyboard.memberPhoto == ''}">
												<img class='photo2' src="<c:url value='/resources/img/default.png'/>">
											</c:if>
											${replyboard.memId}<br>
											<span style="font-size: 12px;">작성시간 : <fmt:formatDate value="${replyboard.regDate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/></span>
										</div>
									</div>
								</div>
								<div>
									<hr>
									<c:forEach items="${replyboard.commentList }" var="comment">
										<div style="margin-left: 10px;">
											<span class="content">${comment.content }</span> - <span class="commentId">${comment.memId }</span> &nbsp;&nbsp; [ 작성시간 ${comment.regDate} 
											<span class="subCommentAcco">댓글</span> <span class="updateComment">수정</span> <span onclick="javacript:deleteComment(${comment.commentNo }, $(this));">삭제</span> ]
										</div>
										<div style="display: none;">
											<form  onSubmit="return updateComment($(this));">
												<input type="hidden" name="commentNo" value="${comment.commentNo }">
												<textarea name="content" style="width: 95%;">${comment.content }</textarea>
												<br> <button type="button" class="cancelUpdate">수정취소</button> <input type="submit" value="댓글수정">
											</form>
										</div>
										<div>
											<c:forEach items="${comment.commentList }" var="comment2">
												<div style="margin-left: 10px;">
													&nbsp;&nbsp;&nbsp;&nbsp;- <span class="content">${comment2.content }</span> - <span class="commentId">${comment2.memId }</span> &nbsp;&nbsp; [ 작성시간 ${comment2.regDate} 
													<span class="updateComment">수정</span> <span onclick="javacript:deleteComment(${comment2.commentNo }, $(this));">삭제</span> ]
												</div>
												<div style="display: none;">
													<form  onSubmit="return updateComment($(this));">
														<input type="hidden" name="commentNo" value="${comment2.commentNo }">
														<textarea name="content" style="width: 95%;">${comment2.content }</textarea>
														<br> <button type="button" class="cancelUpdate">수정취소</button> <input type="submit" value="댓글수정">
													</form>
												</div>
											</c:forEach>
										</div>
										<div id="accordian">
											<ul>
												<li> 
													<div class="comment">
														<form action="<c:url value="/insertComment"/>" method="post">
															<input type="hidden" name="memId" value="${memInfo.memberId }">
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
													<input type="hidden" name="memId" value="${memInfo.memberId }">
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
	
				
					</div>		
					<br>
					<br>
				
				
	
					</c:forEach>
	
						
				</div>
				
			</div>
		
		<!--footer-->
		<%@ include file="../commons/bfooter.jspf" %>
        <!--//footer-->
        
	</div>
	<!-- Classie -->
		<script src="<c:url value="/js/classie.js"/>"></script>
		<script>
			var menuLeft = document.getElementById( 'cbp-spmenu-s1' ),
				showLeftPush = document.getElementById( 'showLeftPush' ),
				body = document.body;
				
			showLeftPush.onclick = function() {
				classie.toggle( this, 'active' );
				classie.toggle( body, 'cbp-spmenu-push-toright' );
				classie.toggle( menuLeft, 'cbp-spmenu-open' );
				disableOther( 'showLeftPush' );
			};
			

			function disableOther( button ) {
				if( button !== 'showLeftPush' ) {
					classie.toggle( showLeftPush, 'disabled' );
				}
			}
		</script>
		
	<!--scrolling js-->
	<script src="<c:url value="/js/jquery.nicescroll.js"/>"></script>
	<script src="<c:url value="/js/scripts.js"/>"></script>
	<!--//scrolling js-->
	<!-- Bootstrap Core JavaScript -->
   <script src="<c:url value="/js/bootstrap.js"/>"> </script> 
   
   
   
   
   
   
   
   
</body>

<!-- 게시판 jQuery -->
<script>

$(document).ready(
		//서머노트
		function() {
			$('#summernote').summernote({
				lang : 'ko-KR',
				height : 300,
				width : 600,
				fontNames : 
					[ '맑은고딕', 'Arial',
					'Arial Black',
					'Comic Sans MS',
					'Courier New', ],
				fontNamesIgnoreCheck : [ '맑은고딕' ],
				focus : true,
				callbacks : {
					onImageUpload : function(files, editor, welEditable) {
										for (var i = files.length - 1; i >= 0; i--) {
											sendFile(files[i], this);
										}
									}
					}

				});
		}	
				
);


$(function(){
	
	
	//아코디언 형식
	$(".accordian").click(function(){
		$(this).parent().next().next().find(".comment").slideUp();
		if(!$(this).parent().next().next().find(".comment").is(":visible"))
		{
			$(this).parent().next().next().find(".comment").slideDown(); 
		} 
	});

	//아코디언 형식
	$(".subCommentAcco").click(function(){
		$(this).parent().next().next().next().find(".comment").slideUp();
		if(!$(this).parent().next().next().next().find(".comment").is(":visible"))
		{
			$(this).parent().next().next().next().find(".comment").slideDown(); 
		} 
	});

	$(".updateComment").click(function(){
		var commentId = $(this).parent().find(".commentId").text();
		if('${memInfo.memberId}' !== commentId){
			alert("권한이 없습니다.");
		}
		else{
			$(this).parent().next().css("display", "");
			$(this).parent().css("display", "none");
		}
	});
	
	$(".cancelUpdate").click(function(){
		$(this).parent().parent().prev().css("display", "");
		$(this).parent().parent().css("display", "none");
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
	};

	function getContextPath() {
		var hostIndex = location.href.indexOf(location.host)
				+ location.host.length;
		return location.href.substring(hostIndex, location.href.indexOf('/',
				hostIndex + 1));
	};
	
	function updateComment(e) {

	       var queryString = e.serialize();


	       
 	        $.ajax({
	            type : 'post',
	            url : getContextPath() +'/updateComment',
	            data : queryString,
	            dataType : 'text',
	            contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	            success : function(data){
	            	e.parent().css("display", "none");
	            	e.parent().prev().css("display", "");
	            	e.parent().prev().find(".content").text(data);
	                
	            }
	        }); 

	       return false;

	};
	
	function deleteComment(commentNo, e){
		var commentId = e.parent().find(".commentId").text();
		if('${memInfo.memberId}' !== commentId){
			alert("권한이 없습니다.");
		}else{
			if(confirm("정말로 삭제하시겠습니까? ") === true){
			   $.ajax({
		            type : 'post',
		            url : getContextPath() +'/deleteComment',
		            data : { "commentNo" : commentNo },
		            dataType : 'text',
		            contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		            success : function(data){
		            	e.parent().find(".content").text("삭제된 댓글입니다.");
		            	e.parent().find(".commentId").text("알 수 없는 사용자");
		                
		            }
		        }); 
			}
			
		}
		
	};
	
	
$(function(){

	 	var list = new cookieList("visitQuestion");
	 	
	 	var cookies  = [];
	 	var cookie = null;
	 	cookies = getCookie('visitQuestion').split(',');
	 	 	
	 	for(var index in cookies){
	 		
	 		if(cookies[index]==${questionBoard.questionNo}){
	 			if(index < cookies.length-1){
	 				cookie = getCookie('visitQuestion').replace(${questionBoard.questionNo}+",", "");
	 			}
	 			else{
	 				cookie = getCookie('visitQuestion').replace(","+${questionBoard.questionNo}, "");
	 			}
	 			list.clear();
	 			list = new cookieList("visitQuestion");

	 			var cookies2  = []; 
	 			cookies2  = cookie.split(',');
	 			
	 			for(var index2 in cookies2){
	 	
	 				list.add(cookies2[index2]);
	 			} 
	 			break;
	 		}
	 	}
	 	
	 	if(${questionBoard.questionNo} != getCookie('visitQuestion')){
	  		list.add(${questionBoard.questionNo}); 
	 	}

		  
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
	   $.cookie(cookieName,items.join(','), {path:'/'});
	  },
	  "clear" : function(){
	   items = null;
	   $.cookie(cookieName, null, {path:'/'});
	  },
	  "items" : function(){
	   return items; 
	  }
	};
};

$("#writeBtn").click(function() {
	if(${memInfo == null}){
		alert("로그인 후 이용하세요");
	}
	else{
		location.href= getContextPath()+'/openWriteQuestion';
	}
});



var loginCheck = function (id, url) {
	
	if(id !== '${memInfo.memberId}'){
		alert("권한이 없습니다.");
	}
	else{
		location.href= getContextPath()+'/'+url;
	}
};


var deleteQuestion = function (id, url) {
	
	if(id !== '${memInfo.memberId}'){
		alert("권한이 없습니다.");
	}
	else{
		if(confirm("정말로 삭제하시겠습니까? ") === true){
			location.href= getContextPath()+'/'+url;
		}
	}
};



	
var checkFavQuestion = function(questionNo){
	if(${memInfo.memberId == null}){
		alert("권한이 없습니다.");
	} 
	else{ 
		   $.ajax({
	            type : 'post',
	            url : getContextPath() +'/checkQuestionFav',
	            data : { "memId" : '${memInfo.memberId}' ,  "questionNo": questionNo},
	            dataType : 'json',
	            contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	            success : function(data){

	            	if($(".fav").attr("name")=="fav"){
	            		$(".fav").attr("src",getContextPath()+"/img/unFav.png");
	            		$(".fav").attr("name", "unFav")
	            	}else{

	            		$(".fav").attr("src",getContextPath()+"/img/fav.png");
	            		$(".fav").attr("name", "fav")
	            	}
	            	
	                
	            }
	        }); 
	}
};

var changeVote = function(questionNo, vote, index){
	if(${memInfo.memberId == null}){
		alert("권한이 없습니다.");
	} 
	else{ 
		   $.ajax({
	            type : 'post',
	            url : getContextPath() +'/changeVote',
	            data : { "memId" : '${memInfo.memberId}' ,  "questionNo": questionNo, "vote" : vote},
	            dataType : 'text',
	            contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	            success : function(data){
	            	if(vote>0){
	            		$(".upVote").parent().attr("href","javascript:changeVote('${questionBoard.questionNo }','0');");
	            		$(".downVote").parent().attr("href","javascript:changeVote('${questionBoard.questionNo }','-1');");
						$(".upVote").attr("src",getContextPath()+"/img/voteUp.png");    
						$(".downVote").attr("src",getContextPath()+"/img/unVoteDown.png");    
	            	}
	            	else if(vote<0){
	            		$(".upVote").parent().attr("href","javascript:changeVote('${questionBoard.questionNo }','1');");
	            		$(".downVote").parent().attr("href","javascript:changeVote('${questionBoard.questionNo }','0');");
	            		$(".upVote").attr("src",getContextPath()+"/img/unVoteUp.png");    
						$(".downVote").attr("src",getContextPath()+"/img/voteDown.png"); 
	            	}
	            	else{
	            		$(".upVote").parent().attr("href","javascript:changeVote('${questionBoard.questionNo }','1');");
	            		$(".downVote").parent().attr("href","javascript:changeVote('${questionBoard.questionNo }','-1');");
	            		$(".upVote").attr("src",getContextPath()+"/img/unVoteUp.png"); 
	            		$(".downVote").attr("src",getContextPath()+"/img/unVoteDown.png"); 
	            	}
	            	$(".vote").text(data);  
	            	
	            }
	        }); 
	}
	
};

var changeVoteReply = function(replyNo, vote){
	if(${memInfo.memberId == null}){
		alert("권한이 없습니다.");
	} 
	else{ 
		   $.ajax({
	            type : 'post',
	            url : getContextPath() +'/changeVote',
	            data : { "memId" : '${memInfo.memberId}' ,  "questionNo": replyNo, "vote" : vote},
	            dataType : 'text',
	            contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	            success : function(data){
	            	if(vote>0){
	            		$(".upVote"+replyNo).parent().attr("href","javascript:changeVoteReply('"+replyNo+"','0');");
	            		$(".downVote"+replyNo).parent().attr("href","javascript:changeVoteReply('"+replyNo+"','-1');");
						$(".upVote"+replyNo).attr("src",getContextPath()+"/img/voteUp.png");    
						$(".downVote"+replyNo).attr("src",getContextPath()+"/img/unVoteDown.png");    
	            	}
	            	else if(vote<0){
	            		$(".upVote"+replyNo).parent().attr("href","javascript:changeVoteReply('"+replyNo+"','1');");
	            		$(".downVote"+replyNo).parent().attr("href","javascript:changeVoteReply('"+replyNo+"','0');");
	            		$(".upVote"+replyNo).attr("src",getContextPath()+"/img/unVoteUp.png");    
						$(".downVote"+replyNo).attr("src",getContextPath()+"/img/voteDown.png"); 
	            	}
	            	else{
	            		$(".upVote"+replyNo).parent().attr("href","javascript:changeVoteReply('"+replyNo+"','1');");
	            		$(".downVote"+replyNo).parent().attr("href","javascript:changeVoteReply('"+replyNo+"','-1');");
	            		$(".upVote"+replyNo).attr("src",getContextPath()+"/img/unVoteUp.png"); 
	            		$(".downVote"+replyNo).attr("src",getContextPath()+"/img/unVoteDown.png"); 
	            	}
	            	$(".vote"+replyNo).text(data);  
	            	
	            }
	        }); 
	}
	
};


var replyInsert = function(){

		if(${memInfo.memberId == null}){
			alert("로그인 후 이용하세요.");
			return false;
		} 
		else{ 
			return true;
		}
};











	
</script>
</html>