<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>write</title>

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/index.css" type="text/css"
	media="all" />


<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<link href="<%=request.getContextPath()%>/summernote/summernote.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/summernote/summernote.min.js"></script>


<!-- include summernote-ko-KR -->
<script
	src="<%=request.getContextPath()%>/summernote/lang/summernote-ko-KR.js"></script>
</head>

<body>

	<script>
		
	</script>


	<!----------------------header--------------------------------------->

	<%@ include file="../commons/header.jspf"%>
	<!----------------------header End--------------------------------------->


	<!----------------------left menu--------------------------------------->
	<%@ include file="../commons/left.jspf"%>
	<!----------------------left menu End--------------------------------------->





	<!----------------------main--------------------------------------->
	<div class="main">
		<form>
			<br> <br> <br>
			<p>질문 제목</p>
			<input type="text" size="80" /> <br> <br>
			<p>질문 내용</p>
			<div id="summernote">
				<p>댕댕윤</p>
			</div>
			<br>
			<p>태그선택</p>
			<input type="text" size="60" /> <br>
			<br> <input type="submit" value="작성" />
		</form>
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
							onImageUpload: function(files, editor, welEditable) {
							      sendFile(files[0],editor,welEditable); 
							    }
						});
			});
	
	 function sendFile(file,editor,welEditable) 
	  {
	  data = new FormData();
	  data.append("file", file);
	            $.ajax({
	            data: data,
	            type: "POST",
	                    // 이미지 업로드하는 파일 path 
	            url: rooturl+'/modules/bbs/lang.korean/action/a.ajax_imgupload.php',
	            cache: false,
	            contentType: false,
	            processData: false,
	            success: function(url) {
	                alert(url);
	                   editor.insertImage(welEditable, url);
	            }
	        });
	  }
</script>
</html>