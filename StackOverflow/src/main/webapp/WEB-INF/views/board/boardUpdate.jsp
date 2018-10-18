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



<!-- 추가한 스타일 -->
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<link href="<c:url value="/summernote/summernote.css"/>" rel="stylesheet">
<script src="<c:url value="/summernote/summernote.min.js"/>"></script>

<!-- include summernote-ko-KR -->
<script src="<c:url value="/summernote/lang/summernote-ko-KR.js"/>"></script>


<style>

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
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
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
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        
        #mainName, #middleName, #name{
			cursor:pointer;
		}
		#myModal td{
			padding-top: 0;
		    padding-bottom: 0;
		}
		
		button{
			border: 0;
			outline: 0;
			height: 25px;
			margin-right: 4px;
			
		}
		.main {
			display: inline-block;
		}
		
		.left {
			float: left;
			width: 50%;
		}
		
		.right {
			float: right;
			width: 50%;
		}

</style>

<!-- 우리가 추가한 스타일 등등 end-->

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
		<h2>질문수정</h2>
			
			<div class="main-page" style="overflow: auto;">
		<!-- 썸머노트 부분 -->
				<div class="left" >
					<form action="<c:url value="/updateQuestion"/>" method="post">
					<input type="hidden" name="questionNo" value="${questionBoard.questionNo }"/>
						<br> <br> <br>
						<p>질문 제목</p>
						<input type="text" size="80" name="title" value="${questionBoard.title }"/> <br> <br>
						<p>질문 내용</p>
						<div>
						<textarea id="summernote" name="content">${questionBoard.content }</textarea>
						</div>
						<br>
						<button type="button" id="myBtn"  class="label label-warning">태그선택</button>  
						<div style="height:50px;" id="tags">
						<c:forEach items="${questionBoard.tagList }" var="tag" >
							<span class="tag" style="margin-left:10px;">#${tag.tagName }</span>
						</c:forEach>
						</div>
						<input type="hidden" name="tags" value="<c:forEach items="${questionBoard.tagList }" var="tag" >#${tag.tagNo }</c:forEach>">
						<br>
						<br> <button type="submit"  class="label label-warning">수정</button>
					</form>
				</div>
				<div class="right">
					<div style="margin-top: 125px;"></div>
						
					<h3 style="margin-bottom: 5px;">미리보기</h3>
					<div id="view">${questionBoard.content }</div>
						
				</div>
			</div>
				
				    <!-- The Modal -->
			    <div id="myModal" class="modal">
			 
			      <!-- Modal content -->
			      <div class="modal-content" style="width: 710px;">
			      <span class="close">&times;</span>   
			        <form>
			        <input type="text" size="20" />  <button type="button" style="margin-left: 15px;" >태그검색</button>
			        </form>    
			        <br>
			        <form>
			        	<table border="1" style="font-size: 12px">
			        		<tr>
			        			<td style="width:250px; text-align: center;">대분류</td>
			        			<td style="width:250px; text-align: center;">중분류</td>
			        			<td style="width:250px; text-align: center;">태그</td>	
			        		</tr>
			        		<tr>
				        		<td style="height:200px;" valign="top">
				        			<table id="mainName"  style="width: 100%">
									</table>
								</td>
				        		<td style="height:200px;" valign="top">
									<table id="middleName"  style="width: 100%">
									</table>
								</td>
				        		<td style="height:200px;" valign="top">
									<table id="name"  style="width: 100%">
									</table>
								</td>
			        		</tr>
			        
			        
			        	</table>
			        </form>                                                      
			        
			      </div>
			 
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
						        },
						        onKeyup: function ($editable, sHtml) {
									  console.log($editable, sHtml);
										$("#view").html($("#summernote").val());
										
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
	       	url: getContextPath()+'/selectTagMainName',
	        dataType:"json",
	        success: function(data) {
	        	$.each(data, function(index,tag){ 
	           			
	           		html += '<tr>';

	           	  	html += '<td onclick="javascript:mainTagClick($(this));">' + tag.tagMainName +'</td>';

	           	  	html += '</tr>';
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
	       	url: getContextPath()+'/selectTagMiddleName',
	       	data : { "mainTag" : data.text()},
	        dataType:"json",
	        success: function(data) {
	        	$.each(data, function(index,tag){ 
	           			
	           		html += '<tr>';

	           	  	html += '<td onclick="javascript:middleTagClick($(this));">' + tag.tagMiddleName +'</td>';

	           	  	html += '</tr>';
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
	       	url: getContextPath()+'/selectTagName',
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
	


		

</script>
</html>