<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	
	
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.cookie.js"></script>	
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

/* 프로필 영역 css  */
.profile{
	float: right; 
	width: 250px; 
	height:90px; 
	border-radius: 5px; 
	background: #eeeeee; 
	margin-right: 10px;
	
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
				<button id="writeBtn" >
					질문하기
				</button>
			</div>
			<br>
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
						<img src="<c:url value='/img/fav.png'/>" width="30px" height="30px" class="fav">
					</c:if>
					<c:if test="${questionBoard.fav <= 0}">
						<img src="<c:url value='/img/unFav.png'/>" width="30px" height="30px" class="fav">
					</c:if>				
				</a>
			</div>
			<div style="float: right; width: 85%;">
				<div>
					<p>${questionBoard.content }</p>
				</div>
				<c:forEach items="${questionBoard.tagList }" var="tag" >
					<a href="<c:url value='/questionList?tagNo=${tag.tagNo }'/>" style="color:white;"><span style="background:#8B9DC3; color:white; width:50px; display:inline-block; text-align: center; border-radius: 2px;border-radius: 10px;">${tag.tagName }</span></a>
				</c:forEach>
				<div style="margin-top: 100px;">
					<a href="">공유</a> <a href="javascript:loginCheck('${questionBoard.memId }', 'openUpdateQuestion/${questionBoard.questionNo }');">수정</a> <a href="javascript:deleteQuestion('${questionBoard.memId }', '/deleteQuestion/${questionBoard.questionNo }');">삭제</a>
				</div>
				<div style="width: 100%; display: inline-block;">
					<div style="float: left; width: 50%; margin-top: 80px;" class="accordian">
						댓글작성
					</div>
					<div class="profile">
						<img class='photo2' src="<c:url value='/resources/uploadFile/memberPhoto/${memberInfo.memberPhoto}'/>"> ${memberInfo.memberId}
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
				<form action="<c:url value="/insertReply"/>" method="post">
					<input type="hidden" name="memId" value="${memInfo.memberId }" /> 
					<input type="hidden" name="questionNo" value="${questionBoard.questionNo }">
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
						<a href="">공유</a> <a href="javascript:loginCheck('${replyboard.memId }', 'openUpdateQuestion/${replyboard.questionNo }');">수정</a> <a href="javascript:deleteQuestion('${replyboard.memId }', '/deleteQuestion/${replyboard.questionNo }');">삭제</a>
					</div>
					<div style="width: 100%; display: inline-block;">
						<div style="float: left; width: 50%; margin-top: 80px;" class="accordian">
							댓글작성
						</div>
					<div class="profile">
						<img class='photo2' src="<c:url value='/resources/uploadFile/memberPhoto/${replyboard.memberPhoto}'/>"> ${replyboard.memId}
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
	            dataType : 'text',
	            contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	            success : function(data){

					$(".fav").attr("src",getContextPath()+"/img/"+data);
	                
	            }
	        }); 
	}
}

var changeVote = function(questionNo, vote){
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
	
}

	
</script>

</html>