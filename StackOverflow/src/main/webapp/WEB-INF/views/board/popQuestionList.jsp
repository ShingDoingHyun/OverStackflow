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
				<h2>인기질문</h2>
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
		<p align="right">
			<button id="favTagQuestionBtn">나의흥미</button>
			<button>이번주인기</button>
			<button>이번달인기</button>
			<button>전체인기</button>
			</p>
			<hr>
			<table width="100%">
				<c:forEach items="${questionBoardList }" var="questionBoard" varStatus="status">
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
							<td width="8%" align="center">${questionBoard.vote}</td>
							<td width="8%" align="center">${questionBoard.replyCount}</td>
							<td width="8%" align="center">${questionBoard.view}</td>
							<td width="48%"><p><a href="<c:url value='/questionDetail/${questionBoard.questionNo }'/>">${questionBoard.title }</a>
							</p></td>
							<td width="20%" rowspan="2" style=" border-bottom: 1px solid #777777;">작성시간 <fmt:formatDate value="${questionBoard.regDate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/> ${questionBoard.memId }</td>
						</tr>
						<tr style=" border-bottom: 1px solid #777777;">
							<td width="8%" align="center">추천</td>
							<td width="8%" align="center">답변</td>
							<td width="8%" align="center">읽음</td>
							<td width="48%">
							<c:forEach items="${questionBoard.tagList }" var="tag">
								<span style="background:#8B9DC3; color:white; width:50px; display:inline-block; text-align: center; border-radius: 2px;border-radius: 10px;">
									<a href="<c:url value='/questionList?tagNo=${tag.tagNo }'/>" style="color:white;">${tag.tagName }</a>
								</span>&nbsp;
							</c:forEach>
							</td>
						</tr>
				</c:forEach> 
			</table>
		</div>
		<div class="right">
			<p style="margin-top: 30px">
			<c:if test="${memInfo != null}">
				<div style="border:1px solid black; width:300px; height:200px;margin-left:80px; margin-top:30px" class="modalLoad" id="favTag">
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
			</c:if>
	
			<div style="border:1px solid black; width:300px; height:200px;margin-left:80px; margin-top:30px">
			<p style="text-align: center; border-bottom:1px solid black; padding: 10px 0 10px 0; margin-top: 0; margin-bottom:0;">방문한 페이지</p>
			<c:forEach items="${visitQuestionBoard }" var="visitQuestion">
				<div style="border-bottom: 1px solid #333333; margin-top:3px; margin-bottom:3px;"><a href="<c:url value='/questionDetail/${visitQuestion.questionNo }'/>">${ visitQuestion.title}</a></div>
			</c:forEach>
			</div>
		</div>
	</div>
	
	
		   <!-- The Modal -->
    <div id="favTagModal" class="modal">
 
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

<script>


//모달부분

var modal = document.getElementById('favTagModal');


 
// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0]

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

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
         modal.style.display = "none";
    }
};



$(".modalLoad").click( function() {
	var modalName="";
	if($(this).attr("id")=="favTag"){
		modalName = "favTagModal";
	}
    modal.style.display = "block";
    
    var html = '';
    $.ajax({
       	url: 'selectTagMainName',
        dataType:"json",
        success: function(data) {
        	$.each(data, function(index,tag){ 
           			
           		html += '<tr>';

           	  	html += '<td onclick="javascript:mainTagClick($(this),\''+modalName+'\');">' + tag.tagMainName +'</td>';

           	  	html += '<tr>';
           	});
        	$("#"+modalName).find('#mainName').html(html);
        	$("#"+modalName).find('#middleName').html('');
        	$("#"+modalName).find('#name').html('');
        }
     });
});

function mainTagClick(data,modalName) {
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

           	  	html += '<td onclick="javascript:middleTagClick($(this),\''+modalName+'\');">' + tag.tagMiddleName +'</td>';

           	  	html += '<tr>';
           	});
        	$("#"+modalName).find('#middleName').html(html);
        	$("#"+modalName).find('#name').html('');
        }
     });
};

function middleTagClick(data,modalName) {
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
        	$("#"+modalName).find('#name').html(html);
        }
     });
};


function tagInsert(data) {
	var chk = 0;
	
	$.ajax({
		type : 'post',
       	url: 'updateMemFavTag',
       	data : { "tagNo" : data.next().text()},
        dataType:"test",
        success: function(data) {
        	
        }
   }); 
	
	$('.tag').each(function(index) {

		var testValue = $(this).text();
		var subValue  = '#'+data.text();

		if(testValue == subValue){
			chk=1;
			$(this).remove();
		    	
		}
	});

	if(chk > 0){
	data.css('background', '');	
	}
	else{ 
	data.css('background', '#AED6F1');
	$('#tags').append('<span class="tag" style="margin-left:10px;">#'+data.text()+'</span>');
	} 

};



$(function(){


 	var list = new cookieList("visitQuestion");
	console.log(getCookie('visitQuestion')); 
 	
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

function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
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

$("#favTagQuestionBtn").click(function() {
	$("#favTagForm").submit();
});


</script>
</html>