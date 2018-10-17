<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>Novus Admin Panel an Admin Panel Category Flat Bootstrap Responsive Website Template | Home :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Novus Admin Panel Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- font CSS -->
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
 <!-- js-->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/modernizr.custom.js"></script>
<!--webfonts-->
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<!--//webfonts--> 
<!--animate-->
<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="js/wow.min.js"></script>
	<script>
		 new WOW().init();
	</script>
<!--//end-animate-->
<!-- chart -->
<script src="js/Chart.js"></script>
<!-- //chart -->
<!--Calender-->

<!--End Calender-->
<!-- Metis Menu -->
<script src="js/metisMenu.min.js"></script>
<script src="js/custom.js"></script>
<link href="css/custom.css" rel="stylesheet">
<!--//Metis Menu -->




<!-- 우리가 추가한 스타일 등등 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.cookie.js"></script>



<style> 

.main {
	display: inline-block;
	width: 100%;
	height: 100%;
}

.left {
	float: left;
	width: 80%;
}

.right {
	float: right;
	width: 20%;
}
table {
    width: 100%;
    border-collapse: collapse;
 }
  
th, td {
   
    padding-top: 20px;
    padding-bottom: 20px;
    font-size: 12px;
}
  
td{
     padding-top: 20px;
    padding-bottom: 20px;
  
} 

button{
border: 0;
outline: 0;
height: 25px;
margin-right: 4px;

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
a {
 color: black;
}
#myModal td{
	padding-top: 0;
    padding-bottom: 0;
}
</style>



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
		<h2>질문리스트</h2>
				<br> <br>
			<div class="main-page">

				<div class="main">
					<div class="left">
					<form action="<c:url value='/questionList'/>" method="get" id="searchForm">
						<input type="text" name="keyword" size="100" value="${param.keyword}">
						<input type="hidden" name="order" value="${param.order}">
						
						<input type="hidden" name="page" value="${param.page == null ? 0 :  param.page}">
					
				
						<button class="label label-default" onclick="searchForm();" style="background: #999999;">검색</button>	 
					</form>
						<br>
						<button class="label label-warning tagMenu" type="button" id="searchTag">태그선택</button>  
						<div style="height:50px;" id="tags">
						<c:forEach items="${searchTagList }" var="tag" varStatus="status">
						<span class="tag" style="margin-left:10px;">#${tag.tagName}</span>
						</c:forEach>
						</div>
						<input type="hidden" name="tags" value="${param.tagLists }">	
					
					<p align="right">
					
						<button class="label label-warning" onclick="searchForm('order','regDate')">최신순</button>
						<button class="label label-warning" onclick="searchForm('order','view')">많이본</button>
						<button class="label label-warning" onclick="searchForm('order','vote')">인기순</button>
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
												<a href="<c:url value='/popQuestionList?tagNo=${tag.tagNo }'/>" style="color:white;">${tag.tagName }</a>
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
								<a href="javascript:searchForm('paging', '${ i}' );">${ i}</a>
			<%-- 					<a href="<c:url value='/questionList?page=${ i}&order=${param.order}&keyword=${param.keyword}'/>"style="display: inline;">${ i}</a> --%>
							</c:forEach>
							
			<%-- 				
							<c:if test="${param.page < 10 }">
								>>
							</c:if>
							 --%>
							
							<br>
						</p>
					</div>
					<div class="right" style="font-size: 14px">
						<div style="margin-top: 100px">
							<button class="label label-warning" id="writeBtn"  style="position: absolute; right:10px; top:111px;" >
								질문하기
							</button>
						</div>
						<c:if test="${memInfo != null}">
							<div style="border:1px solid black; width:300px; height:200px;margin-left:30px; margin-top:30px" class="tagMenu" id="favTag">
								<p style="text-align: center; border-bottom:1px solid black; padding: 10px 0 10px 0; margin-top: 0; margin-bottom:0;">흥미태그</p>
									<div id="favTags">
									<c:forEach items="${fagTagList }" var="fagTag">
										<span class="favTag" style="margin-left:10px;">#${ fagTag.tagName}</span>
									</c:forEach> 		
								</div>
							</div>
							<div style="border:1px solid black; width:300px; height:200px;margin-left:30px; margin-top:30px">
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
						<div style="border:1px solid black; width:300px; height:200px;margin-left:30px; margin-top:30px">
						<p style="text-align: center; border-bottom:1px solid black; padding: 10px 0 10px 0; margin-top: 0; margin-bottom:0;">방문한 페이지</p>
						<c:forEach items="${visitQuestionBoard }" var="visitQuestion">
							<div style="margin-top:3px; margin-bottom:3px;"><a href="<c:url value='/questionDetail/${visitQuestion.questionNo }'/>">${ visitQuestion.title}</a></div>
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
					
			</div>
			
		</div>
		
		<!--footer-->
		<%@ include file="../commons/bfooter.jspf" %>
        <!--//footer-->
        
	</div>
	<!-- Classie -->
		<script src="js/classie.js"></script>
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
	<script src="js/jquery.nicescroll.js"></script>
	<script src="js/scripts.js"></script>
	<!--//scrolling js-->
	<!-- Bootstrap Core JavaScript -->
   <script src="js/bootstrap.js"> </script> 
   
   
   
   
   
   
   
   
</body>


<script>


$(function() {
	$(".leftQuestion").addClass("active");
});
	
	function getContextPath() {
		var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};
		
		

	
	//모달부분
	
	var modal = document.getElementById('myModal');
		   

	 
	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];                                          
	 
	// When the user clicks on the button, open the modal 
	$(".tagMenu").click(function() {
		var type = "";
		if($(this).attr("id")=="searchTag"){
			type="search";
		}
		else if($(this).attr("id")=="favTag"){
			type="fav";
		}
	    modal.style.display = "block";
	    
	    var html = '';
	    $.ajax({
	       	url: 'selectTagMainName',
	        dataType:"json",
	        success: function(data) {
	        	$.each(data, function(index,tag){ 
	           			
	           		html += '<tr>';

	           	  	html += '<td onclick="javascript:mainTagClick($(this), \''+type+'\');">' + tag.tagMainName +'</td>';

	           	  	html += '<tr>';
	           	});
	        	$('#mainName').html(html);
	        	$('#middleName').html('');
	        	$('#name').html('');
	        }
	     });

	});
	

	function mainTagClick(data, type) {
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

	           	  	html += '<td onclick="javascript:middleTagClick($(this), \''+type+'\');">' + tag.tagMiddleName +'</td>';

	           	  	html += '<tr>';
	           	});
	        	$('#middleName').html(html);
	        	$('#name').html('');
	        }
	     });
	};
	
	function middleTagClick(data, type) {
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
					var tagClsType = "";
					
					if(type=="search") tagClsType = "tag";
					else if(type=="fav") tagClsType = "favTag";
					$('.'+tagClsType+'').each(function(index) {
						
						var testValue = $(this).text();
		        		var subValue  = '#'+String(tag.tagName);
		        		if(testValue == subValue){
		        			chk=1;
		        		}
					});
					
		           	html += '<tr>';
	           		if(chk > 0){
	           			html += '<td onclick="javascript:tagInsert($(this), \''+type+'\');" style="background:#AED6F1;">' + tag.tagName;
	           		}
	           		else{ 
	           			html += '<td onclick="javascript:tagInsert($(this), \''+type+'\');">' + tag.tagName;
 	           		}
	           	  	html += '</td><td style="display:none">'+tag.tagNo+'</td><tr>';
	           	});
	        	$('#name').html(html);
	        }
	     });
	};

	function tagInsert(data, type) {
		var chk = 0;
			
		if(type=="search"){	
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
				$('input[name=tags]').val($('input[name=tags]').val().replace('#'+data.next().text(),''));
			}
			else{ 
				data.css('background', '#AED6F1');
				$('#tags').append('<span class="tag" style="margin-left:10px;">#'+data.text()+'</span>');
				$('input[name=tags]').val($('input[name=tags]').val()+'#'+data.next().text());
	 		} 
	 	
		}
		
		else if(type=="fav"){
			$.ajax({
				type : 'post',
		       	url: 'updateMemFavTag',
		       	data : { "tagNo" : data.next().text()},
		        dataType:"test",
		        success: function(data) {
		        	
		        }
		   }); 
			
			$('.favTag').each(function(index) {
	
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
			$('#favTags').append('<span class="favTag" style="margin-left:10px;">#'+data.text()+'</span>');
			} 
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

	var searchForm = function(type, value) {
		
		if(type=="order"){
		$('input[name=order]').val(value);
		
		}
		else if(type=="paging"){
			$('input[name=page]').val(value);
		}

		if($('input[name="tags"]').val()!= null){
			
			var tagNoList = $('input[name="tags"]').val().split('#');

			for(var i=1 ;i < tagNoList.length; i++){

				$('#searchForm').append('<input type="hidden" name="tagList['+(i-1)+'].tagNo" value="'+tagNoList[i]+'">');
			}
			$('#searchForm').append('<input type="hidden" name="tagLists" value="'+$('input[name="tags"]').val()+'">');
		}

		$('#searchForm').submit();
		
	};
		
	
	
	$(function(){
		
		
	});

</script> 
</html>