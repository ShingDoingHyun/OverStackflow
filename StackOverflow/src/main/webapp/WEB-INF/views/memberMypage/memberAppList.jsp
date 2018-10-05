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
				 href="memberUpdate">이력서 관리</a> <a href="memberApplist" style="color: black">내가 지원한 목록</a> <a
				href="memberInterestComList" >관심기업</a><a href="#">즐겨찾기한 채용 공고</a>
		</div>
		<div class="main_2">
			<div style="margin-top: 20px;"></div>
			<h3>내가 지원한 목록</h3>
			<hr>
	<table class="insert">
					<tr>
						<th class="title">전체 지원한 목록</th>
					</tr>
				


				</table>
	
			
		</div>
	</div>




	<!----------------------main End--------------------------------------->


	<!----------------------footer--------------------------------------->
	<%@ include file="/WEB-INF/views/commons/footer.jspf"%>
	<!----------------------footer End--------------------------------------->





</body>

</html>