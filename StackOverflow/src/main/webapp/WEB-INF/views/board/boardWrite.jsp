<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>write</title>

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/index.css" type="text/css" media="all" />


<link href="<%=request.getContextPath()%>/summernote/summernote.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/summernote/summernote.min.js"></script>

<!-- include summernote-ko-KR -->
<script src="<%=request.getContextPath()%>/summernote/lang/summernote-ko-KR.js"></script>


</head>
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


</style>
<body>

	<!----------------------header--------------------------------------->

	<%@ include file="../commons/header.jspf"%>
	<!----------------------header End--------------------------------------->


	<!----------------------left menu--------------------------------------->
	<%@ include file="../commons/left.jspf"%>
	<!----------------------left menu End--------------------------------------->


	<!----------------------main--------------------------------------->
	<!-- 썸머노트 부분 -->
	<div class="main" >
		<form action="insertQuestion" method="post">
		<input type="hidden" name="memId" />
			<br> <br> <br>
			<p>질문 제목</p>
			<input type="text" size="80" name="title" /> <br> <br>
			<p>질문 내용</p>
			<div>
			<textarea id="summernote" name="content"></textarea>
			</div>
			<br>
			<p>태그선택</p>
			<input type="text" size="67" id="tag" />  <button type="button" style="margin-left: 15px;"  id="myBtn">태그선택</button>  <br>
			<br> <input type="submit" value="작성" />
		</form>
	</div>
	
	
	    <!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
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


	<!----------------------footer----------------------------------------->
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
	        		
	        		
	        		var testValue = $('#tag').val();
	        		var subValue  = String(tag.tagName);
	        		

	        		var iValue = testValue.indexOf(subValue);
	        		
	        		
	        		
	           		html += '<tr>';
	           		if(iValue != -1){
	           			html += '<td onclick="javascript:tagInsert($(this));" style="background:#AED6F1;">' + tag.tagName +'</td>';
	           		}
	           		else{
	           			html += '<td onclick="javascript:tagInsert($(this));">' + tag.tagName +'</td>';
	           		}
	           		

	           	  	html += '<tr>';
	           	});
	        	$('#name').html(html);
	        }
	     });
	};

	function tagInsert(data) {
		
		var testValue = $('#tag').val();
		var subValue  = String(data.text());
		

		var iValue = testValue.indexOf(subValue);
		if(iValue != -1){
			data.css('background', '');
			$('#tag').val($('#tag').val().replace(data.text(), ''));
		
		}
		else{
			data.css('background', '#AED6F1');
			$('#tag').val($('#tag').val() + ' ' + data.text());
		
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