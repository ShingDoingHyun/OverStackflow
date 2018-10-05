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


<style>
.bluebTabDesign {
	padding: 0 0 0px 0px;
}

.bluebTabDesign ul {
	margin: 0;
	padding-left: 10px;
	list-style: none;
	border-bottom: 1px solid #2390ff;
	font-family: dotum, Sans-serif;
	font-size: 12px;
	*zoom: 1;
}

.bluebTabDesign ul:after {
	content: "";
	display: block;
	clear: both;
}

.bluebTabDesign li {
	float: left;
	margin: 0px 1px -1px 1px;
}

.bluebTabDesign li a {
	position: relative;
	float: left;
	text-decoration: none;
	border-top: 1px solid #c0c0c0;
	border-right: 1px solid #c0c0c0;
	border-left: 1px solid #c0c0c0;
	background: #efefef;
	color: #666;
}

.bluebTabDesign li a span {
	display: inline-block;
	padding: 6px 7px;
	letter-spacing: -1px;
	cursor: pointer;
	border-top: 1px solid #fff;
	border-left: 1px solid #fff;
}

.bluebTabDesign li a:hover {
	background: #fff;
	color: #2390ff;
	border: 1px solid #2390ff;
}

.bluebTabDesign li ul {
	display: none;
	width: 100%;
	top: 40px;
	left: 0;
	list-style: none;
	border: 0;
	margin: 0;
	padding: 0;
	white-space: nowrap;
	overflow: hidden;
	*zoom: 1;
}

.bluebTabDesign li ul:after {
	content: "";
	display: block;
	clear: both;
}

.bluebTabDesign li.selected a {
	border: 2px solid #2390ff;
	padding: 1px;
	border-bottom: 0px solid #fff;
	margin-top: -3px;
	background-color: #fff;
	color: #2390ff;
}

.bluebTabDesign li.selected a span {
	display: inline-block;
	padding-top: 7px;
	font-weight: bold;
	background-color: #fff;
}

.bluebTabDesign li.selected a:hover {
	border: 2px solid #2390ff;
	padding: 1px;
	border-bottom: 0px solid #fff;
	margin-top: -3px;
	background-color: #fff;
	color: #2390ff;
}

.insert {
	text-align: left;
	width: 1200px;
}

#output {
	width: 150px;
	height: 150px;
}

.title {
	font-size: 18px;
}

.sidenav2 {
	margin-top: 130px;
	margin-left: 120px;
	height: 30%;
	width: 170px;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	overflow-x: hidden;
	padding-top: 20px;
	margin-bottom: 150px;
}

.sidenav2 a {
	padding: 6px 6px 6px 32px;
	text-decoration: none;
	font-size: 14px;
	color: #818181;
	display: block;
}

.left_select {
	font-size: 16px;
	color: red;
	padding: 6px 6px 6px 32px;
}

.sidenav2 a:hover {
	color: #f1f1f1;
}

.main_2 {
	margin-Left: 140px;
}

.job {
	border: 1px solid gray;
	width: 80%;
}

#customers {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 1200px;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: aquamarine;
	color: white;
}

select {
	width: 120px;
}

#jobtotal {
	font-size: 12px;
}

body {
	width: 100%;
}

.insert_file {
	border: 1px solid gray;
	width: 1200px;
}
.btn btn-dark{
margin-left:300px;}
</style>
</head>

<body>

	<script>
		var loadFile = function(event) {
			var output = document.getElementById('output');
			output.src = URL.createObjectURL(event.target.files[0]);
		};
	</script>


	<!----------------------header--------------------------------------->

	<%@ include file="/WEB-INF/views/commons/header.jspf"%>
	<!----------------------header End--------------------------------------->


	<!----------------------left menu--------------------------------------->
	<%@ include file="/WEB-INF/views/commons/left.jspf"%>
	<!----------------------left menu End--------------------------------------->





	<!----------------------main--------------------------------------->
	<div class="main">

		<div style="margin-top: 20px;"></div>

		<div class="bluebTabDesign">
			<ul>
				<li><a href="#"><span>프로필</span></a></li>
				<li><a href="#"><span>활동정보</span></a></li>
				<li class="selected"><a href="#"><span>지원관리</span></a></li>
				<li><a href="#"><span>프로필 설정</span></a></li>

			</ul>
		</div>
		<div class="sidenav2">
			<span class="left_select"><strong>지원관리</strong></span> <a
				style="color: black" href="#">이력서 관리</a> <a href="#">내가 지원한 목록</a> <a
				href="#">관심기업</a><a href="#">즐겨찾기한 채용 공고</a>
		</div>
		<div class="main_2">
			<div style="margin-top: 20px;"></div>
			<h3>이력서 관리</h3>
			<hr>
			<form name="form" method="POST" enctype="multipart/form-data">
				<table class="insert">
					<tr>
						<th class="title">인적 사항</th>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>이름</th>
						<th>생년월일</th>
						<th>성별</th>
						<th>Email</th>
						<th rowspan="6"><img id="output" /></th>



					</tr>
					<tr>
						<td><input type="text"></td>
						<td><input type="text"></td>
						<td><select>
								<option>여자</option>
								<option>남자</option>
						</select></td>
						<td><input type="text"></td>


					</tr>
					<tr>
						<th>전화번호</th>
						<th>휴대폰 번호</th>
						<th>주소</th>
						<th>사진</th>


					</tr>
					<tr>
						<td><input type="text"></td>
						<td><input type="text"></td>
						<td><input type="text"></td>
						<td><input type="file" accept="image/*"
							onchange="loadFile(event)"></td>

					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th class="title">학력</th>
					<tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th>학교구분</th>
						<th>학교명</th>
						<th>입학년월</th>
						<th>졸업년월</th>


					</tr>
					<tr>
						<td><input type="text"></td>
						<td><input type="text"></td>
						<td><input type="date"></td>
						<td><input type="date"></td>

					</tr>
					<tr>
						<th>학과명</th>
						<th>학점</th>
						<th>졸업상태</th>
					</tr>
					<tr>
						<td><input type="text"></td>
						<td><input type="text"></td>
						<td><input type="text"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th class="title">자기 소개</th>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td colspan='5'><div id="summernote"></div></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>

					<tr>
						<th class="title">첨부 파일</th>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>

				</table>

				<div class="insert_file">
					<select>
						<option>이력서</option>
						<option>자기소개서</option>
						<option>기타</option>


					</select> <input type="file" name="files" value="" size="40"><input
						type="button" value="추가" onclick="attachFile.add()"
						style="margin-left: 10px">
				</div>

				<div id="attachFileDiv"></div>
				<table class="insert">
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<th class="title">경력&nbsp;<span id="jobtotal"></span></th>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
				</table>

				<table id="customers">
					<tr>
						<th>회사/기관이름</th>
						<th>업무내용</th>
						<th>직책</th>
						<th>기간(개월수)</th>
						<th>연봉</th>
					</tr>
					<tr>
						<td><input type="text"></td>
						<td><input type="text"></td>
						<td><input type="text"></td>
						<td><input type="number" class="count1" name="count">개월</td>
						<td><input type="text"></td>
					</tr>
					<tr>
						<td><input type="text"></td>
						<td><input type="text"></td>
						<td><input type="text"></td>
						<td><input type="number" class="count2" name="count">개월</td>
						<td><input type="text"></td>
					</tr>
					<tr>
						<td><input type="text"></td>
						<td><input type="text"></td>
						<td><input type="text"></td>
						<td><input type="number" class="count3" name="count">개월</td>
						<td><input type="text"></td>
					</tr>
					<tr>
						<td><input type="text"></td>
						<td><input type="text"></td>
						<td><input type="text"></td>
						<td><input type="number" class="count4" name="count">개월</td>
						<td><input type="text"></td>
					</tr>


				</table>


				<button type="button" class="btn btn-dark">저장</button>
				<button type="button" class="btn btn-dark">취소</button>
			</form>
		</div>
	</div>

	<!-- 첨부파일 -->
	<script language="JavaScript">
        attachFile = {
            idx: 0,
            add: function() { // 파일필드 추가
                var o = this;
                var idx = o.idx;
                var div = document.createElement('div');
                
                div.style.marginTop = '5px';
                div.id = 'file' + o.idx;
                div.className = 'insert_file';

                var select = document.all ? document.createElement("<select>") : document.createElement('select');
                var array = ["이력서", "자기소개서", "기타"];
                for (var i = 0; i < array.length; i++) {
                    var option = document.createElement("option");
                    option.value = array[i];
                    option.text = array[i];
                    select.appendChild(option);

                }
                var file = document.all ? document.createElement('<input name="files">') : document.createElement('input');
                file.type = 'file';
                file.name = 'files';
                file.size = '40';
               
                file.id = 'fileField' + o.idx;

 				file.style.marginLeft = '10px';

                var btn = document.createElement('input');
                btn.type = 'button';
                btn.value = '삭제';
                btn.onclick = function() {
                    o.del(idx)
                }
                btn.style.marginLeft = '10px';

                div.appendChild(select);
                div.appendChild(file);

                div.appendChild(btn);
                document.getElementById('attachFileDiv').appendChild(div);

                o.idx++;
            },
            del: function(idx) { // 파일필드 삭제
                if (document.getElementById('fileField' + idx).value != '' && !confirm('삭제 하시겠습니까?')) {
                    return;
                }
                document.getElementById('attachFileDiv').removeChild(document.getElementById('file' + idx));
            }
        }

    </script>

	<!-- 경력개월수 -->
	<script>
        window.onload = function(){
       
            $("input[name='count']").click(function(){             
                var sale = 12; // 12달로 나눠야함
                      var total = 0;
             
                $("input[name='count']").each(function(index) { 
                    var num =  Number($(this).val());
                      total += num;
                });

                /* alert("최종"+total); */
                var result = parseInt((total / sale)); //몫( 년)
                var result2 = total % 12; // 나머지 (개월)
                $('#jobtotal').text("(총"+result+"년"+result2+"개월 )");               
            });  
        }
    </script>
	<!-- 서머노트 -->
	<script>
		$(document).ready(function() {
					$('#summernote').summernote(
							{
								lang : 'ko-KR',
								height : 300,
								width : 1200,
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
								
							})(jQuery);
				})
				
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
	    }
		
		
		function getContextPath() {
			var hostIndex = location.href.indexOf( location.host ) + location.host.length;
			return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
			};
		</script>


	<!----------------------main End--------------------------------------->


	<!----------------------footer--------------------------------------->
	<%@ include file="/WEB-INF/views/commons/footer.jspf"%>
	<!----------------------footer End--------------------------------------->





</body>

</html>