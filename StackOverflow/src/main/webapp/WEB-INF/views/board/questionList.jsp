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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/index.css" type="text/css" media="all" />


<link href="<%=request.getContextPath()%>/summernote/summernote.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/summernote/summernote.min.js"></script>

<!-- include summernote-ko-KR -->
<script src="<%=request.getContextPath()%>/summernote/lang/summernote-ko-KR.js"></script>


<%-- <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/index.css" type="text/css" media="all" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/index.css" type="text/css"
	media="all" />

<link href="<%=request.getContextPath()%>/summernote/summernote.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/summernote/summernote.min.js"></script>

<!-- include summernote-ko-KR -->
<script src="<%=request.getContextPath()%>/summernote/lang/summernote-ko-KR.js"></script>
 --%>
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

.main table {
	width: 100%;
	border-collapse: collapse;
}

.main th, td {
	padding-top: 15px;
	padding-bottom: 15px;
	font-size: 12px;
}

.main td{
	padding-top: 10px;
	padding-bottom: 10px;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 10000; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
}
/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

#mainName, #middleName, #name {
	cursor: pointer;
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
			<button id="writeBtn"  style="position: absolute; right:10px; top:111px;" >
				질문하기
			</button>
		</div>
	</div>
	<div class="main">
		<div class="left">
		<form action="<c:url value='/questionList'/>" method="get">
			<input type="text" name="keyword" size="100" value="${param.keyword}">
			<input type="hidden" name="order" value="${param.order}">
			<input type="hidden" name="tagNo" value="${param.tagNo}"><input type="submit" value="검색">	
		</form>
			<button type="button" id="myBtn">태그선택</button>  
			<div style="height:50px;" id="tags"></div>
			<input type="hidden" name="tags">
		
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
				<c:forEach items="${questionBoardList.questionBoardList }" var="questionBoard" varStatus="status">
						<tr>
							<td width="8%" align="center" rowspan="2" style=" border-bottom: 1px solid #777777;">
							<a href="javascript:checkFavQuestion('${questionBoard.questionNo }', '${status.index}');">
								<c:if test="${questionBoard.fav > 0}">
									<img src="<c:url value='/img/fav.png'/>" width="30px" height="30px" class="fav${status.index}" name="fav">
								</c:if>
								<c:if test="${questionBoard.fav <= 0}">
									<img src="<c:url value='/img/unFav.png'/>" width="30px" height="30px" class="fav${status.index}" name="unFav">
								</c:if>
							</a>
							</td>
							</td>
							<td width="8%" align="center">${questionBoard.vote}</td>
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
			<div id="favList">
			<c:forEach items="${favQuestionList }" var="favQuestionList">
				<div style="border-bottom: 1px solid #333333; margin-top:3px; margin-bottom:3px;">
					<a href="<c:url value='/questionDetail/${favQuestionList.questionNo }'/>">${ favQuestionList.title}</a>
				</div>
			</c:forEach>
			</div>
			</div>
			<div style="border:1px solid black; width:300px; height:200px;margin-left:80px; margin-top:30px">
			<p style="text-align: center; border-bottom:1px solid black; padding: 10px 0 10px 0; margin-top: 0; margin-bottom:0;">방문한 페이지</p>
			<c:forEach items="${visitQuestionBoard }" var="visitQuestion">
				<div style="border-bottom: 1px solid #333333; margin-top:3px; margin-bottom:3px;"><a href="<c:url value='/questionDetail/${visitQuestion.questionNo }'/>">${ visitQuestion.title}</a></div>
			</c:forEach>
			</div>
		</div>

	</div>
	
	
	   <!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content"  style="width: 710px;">
      <span class="close">&times;</span>   
        <form>
        <input type="text" size="20" />  <button type="button" style="margin-left: 15px;" >태그검색</button>
        </form>    
        <br>
        <form>
        	<table border="1px">
        		<tr>
        			<td style="width:250px; text-align: center;">대분류</td>
        			<td style="width:250px; text-align: center;">중분류</td>
        			<td style="width:250px; text-align: center;">태그</td>	
        		</tr>
        		<tr>
	        		<td style="height:200px;" valign="top">
	        			<table id="mainName">
						</table>
					</td>
	        		<td style="height:200px;" valign="top">
						<table id="middleName">
						</table>
					</td>
	        		<td style="height:200px;" valign="top">
						<table id="name">
						</table>
					</td>
        		</tr>
        
        
        	</table>
        </form>                                                      
        
      </div>
 
    </div>
	
	<!----------------------main End--------------------------------------->


	<!----------------------footer--------------------------------------->
	<%@ include file="../commons/footer.jspf"%>
	<!----------------------footer End--------------------------------------->



</body>
<!-- 게시판 jQuery -->
<script>
	$(document).ready(
			function() {
				$('#summernote').summernote(
						{
							lang : 'ko-KR',
							height : 300,
							width : 600,
							fontNames : [ '맑은고딕', 'Arial', 'Arial Black',
									'Comic Sans MS', 'Courier New', ],
							fontNamesIgnoreCheck : [ '맑은고딕' ],
							focus : true,
							callbacks: {
								onImageUpload: function(files, editor, welEditable) {
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
        	data: form_data,
        	type: "POST",
        	url: 'imageUpload',
        	cache: false,
        	contentType: false,
        	enctype: 'multipart/form-data',
        	processData: false,
        	dataType:"text",
        	success: function(img_name) {

        		$('#summernote').summernote('insertImage', getContextPath()+img_name);
        	}
      	});
    };
	
	
	function getContextPath() {
		var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};
		
		

	
	//모달부분
	
	var modal = document.getElementById('myModal');
		   
	// Get the button that opens the modal
	var btn = document.getElementById("myBtn");
	 
	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];                                          
	 
	// When the user clicks on the button, open the modal 
	btn.onclick = function() {
	    modal.style.display = "block";
	    var html = '';
	    $.ajax({
	       	url: 'selectTagMainName',
	        dataType:"json",
	        success: function(data) {
	        	$.each(data, function(index,tag){ 
	           			
	           		html += '<tr>';

	           	  	html += '<td onclick="javascript:mainTagClick($(this));">' + tag.tagMainName +'</td>';

	           	  	html += '<tr>';
	           	});
	        	$('#mainName').html(html);
	        	$('#middleName').html('');
	        	$('#name').html('');
	        }
	     });

	};
	

	function mainTagClick(data) {
		data.parent().siblings().children().css('background', '');
		data.css('background', '#AED6F1');
	    var html = '';
	    $.ajax({
	       	url: 'selectTagMiddleName',
	       	data : { "mainTag" : data.text()},
	        dataType:"json",
	        success: function(data) {
	        	$.each(data, function(index,tag){ 
	           			
	           		html += '<tr>';

	           	  	html += '<td onclick="javascript:middleTagClick($(this));">' + tag.tagMiddleName +'</td>';

	           	  	html += '<tr>';
	           	});
	        	$('#middleName').html(html);
	        	$('#name').html('');
	        }
	     });
	};
	
	function middleTagClick(data) {
		data.parent().siblings().children().css('background', '');
		data.css('background', '#AED6F1');
	    var html = '';
	    $.ajax({
	       	url: 'selectTagName',
	       	data : { "middleTag" : data.text()},
	        dataType:"json",
	        success: function(data) {
	        	$.each(data, function(index,tag){ 
	        		
					var chk = 0;
					$('.tag').each(function(index) {
						
						var testValue = $(this).text();
		        		var subValue  = '#'+String(tag.tagName);
		        		if(testValue == subValue){
		        			chk=1;
		        		}
					});
					
		           	html += '<tr>';
	           		if(chk > 0){
	           			html += '<td onclick="javascript:tagInsert($(this));" style="background:#AED6F1;">' + tag.tagName;
	           		}
	           		else{ 
	           			html += '<td onclick="javascript:tagInsert($(this));">' + tag.tagName;
 	           		}
	           	  	html += '</td><td style="display:none">'+tag.tagNo+'</td><tr>';
	           	});
	        	$('#name').html(html);
	        }
	     });
	};

	function tagInsert(data) {
			var chk = 0;
			$('.tag').each(function(index) {
				
				var testValue = $(this).text();
        		var subValue  = '#'+data.text();
        		if(testValue == subValue){
        			chk=1;
        			$(this).remove();
        		}
			});
		console.log(data);
		console.log(data.next());
	 	if(chk > 0){
			data.css('background', '');	
			$('input[name=tags]').val($('input[name=tags]').val().replace('#'+data.next().text(),''));
		}
		else{ 
			data.css('background', '#AED6F1');
			$('#tags').append('<span class="tag" style="margin-left:10px;">#'+data.text()+'</span>');
			$('input[name=tags]').val($('input[name=tags]').val()+'#'+data.next().text());
 		} 
		
	}
	 
	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	     modal.style.display = "none";
	}
	 
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	    if (event.target == modal) {
	         modal.style.display = "none";
	    }
	};
	
	$("#writeBtn").click(function() {
		if(${memInfo == null}){
			alert("로그인 후 이용하세요");
		}
		else{
			location.href= getContextPath()+'/openWriteQuestion';
		}
	});


	var checkFavQuestion = function(questionNo, value){
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
		            		
		            	if($(".fav"+value).attr("name")=="fav"){
		            		$(".fav"+value).attr("src",getContextPath()+"/img/unFav.png"); 
		            		$(".fav"+value).attr("name", "unFav")
		            	}else{
		              		$(".fav"+value).attr("src",getContextPath()+"/img/fav.png");
		            		$(".fav"+value).attr("name", "fav")
		            	}
		            	
		            	$("#favList").html("");
			           	$.each( data, function( key, value ) {
			           		$("#favList").append('<div style="border-bottom: 1px solid #333333; margin-top:3px; margin-bottom:3px;"><a href="<c:url value="/questionDetail/'+value.questionNo+'"/>">'+value.title+'</a></div>');
			           	});
		                
		            }
		        }); 
			   
		}
	};


		

</script>
</html>