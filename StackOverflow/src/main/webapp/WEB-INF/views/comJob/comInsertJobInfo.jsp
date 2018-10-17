<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<!-----------------------------head ----------------------------------------->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Novus Admin Panel Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Bootstrap Core CSS -->
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/css/style.css" rel='stylesheet' type='text/css' />
<!-- font CSS -->
<!-- font-awesome icons -->
<link href="<%=request.getContextPath()%>/css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
 <!-- js-->
<script src="<%=request.getContextPath()%>/js/jquery-1.11.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/modernizr.custom.js"></script>
<!--webfonts-->
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<!--//webfonts--> 
<!--animate-->
<link href="<%=request.getContextPath()%>/css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="<%=request.getContextPath()%>/js/wow.min.js"></script>
	<script>
		 new WOW().init();
	</script>
<!--//end-animate-->
<!-- chart -->
<script src="<%=request.getContextPath()%>/cjs/Chart.js"></script>
<!-- //chart -->
<!--Calender-->

<!--End Calender-->
<!-- Metis Menu -->
<script src="<%=request.getContextPath()%>/js/metisMenu.min.js"></script>
<script src="<%=request.getContextPath()%>/js/custom.js"></script>
<link href="<%=request.getContextPath()%>/css/custom.css" rel="stylesheet">
<!-----------------------------head End----------------------------------------->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="<%=request.getContextPath()%>/summernote/summernote.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/summernote/summernote.min.js"></script>
<script src="<%=request.getContextPath()%>/summernote/lang/summernote-ko-KR.js"></script>

<title>채용 공고 작성</title>
 <style>
	 .main {
	    display: inline-block;
	    height: 100%;
	    width: 70%;
	    margin-top: 20px;
	}
	
	#accordian li{ 
	 list-style:none; 
	}
	
    /*  li > div{ display:none;}  */
	
	#accordian li >h1{ 
	cursor:pointer;
	font-size: 20px;
	border: 1px solid black;
	padding-top: 1%;
	padding-bottom: 1%;
	padding-left: 3%;
	}
	
	#accordian li >h1+div{
		padding: 2%;
	}

	#accordian ul{
	 padding-left: 0px;
	}
	
	#accordian{
	border: 1px solid black;
	width: 100%;
	margin-left: 10%;
	}
	
	#title{
	margin-bottom: 5%;
	}
	
	.right {
    float: right;
    width: 30%;
    right: 10px;
	}	
	
	input[type=button], input[type=submit], button{
	font-weight: 300 !important;
	border-radius: 4px;
	background-color: #999999;
	display: inline;
 	padding: .2em .6em .3em;
 	font-size: 95%;
 	line-height: 1;
  	color: #fff;
	text-align: center;
	white-space: nowrap;
	vertical-align: baseline;
	border: 0;
    outline: 0;
	height: 25px;
    margin-right: 4px;
    font-family: inherit;
}

</style>
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

<!----------------------main--------------------------------------->
<div class="main-page">
	
	<div class="right"> 
	<span style="font-size: 14px;"><a href="<c:url value="/comJob/seeJobInfoList/1"/>">채용 정보</a> > <a href="<c:url value="/comJob/writeJobInfo"/>">새로운 채용 공고 작성</a> </span><br>
   	<a href="#title"><img src="http://icons.iconarchive.com/icons/graphicloads/100-flat-2/256/arrow-up-icon.png" width="4%" style="position:fixed; bottom: 10px;"></a>
	</div>
	
<div class="main">
	<form action="<%=request.getContextPath()%>/comJob/writeJobInfo" method="post" name="jobForm" >
	 <h2 id="title" > 채용 공고 작성</h2>
	<div id="accordian">
		<ul>
			<li>
				<h1>모집 부문 및 자격 요건<span class="ico_ar">▼</span></h1>
					<div>
					 <label>채용 제목</label> &nbsp;
					 <input type="text" name="jobTitle" style="width:60%; margin-bottom: 1%; padding:2px;"><br>
					 
					 <label>모집 분야</label>  &nbsp;
					 <input type="text" name="jobField" style="width:60%; margin-bottom: 1%; padding:2px;"><br>
					 
					 <label>고용 형태</label>
					 <input type="checkbox" name="jobType" value="permanent">정규직
					 <input type="checkbox" name="jobType" value="contract">계약직
					 <input type="checkbox" name="jobType" value="intern">인턴직
					 <input type="checkbox" name="jobType" value="partTimeJob" style="margin-bottom: 2%;">아르바이트<br>
					 
					 <label>담당 업무</label><br>
					 <textarea name="jobRequiredTask" style="width:80%; height:150px; margin-bottom: 2%;"></textarea><br>
					 
					 <label>지원 자격</label><br>
					 <textarea name="jobQualification" style="width:80%;  height:150px; margin-bottom: 2%;" ></textarea><br>
					 
<!-- 				 <label>관련 태그</label>
					 <input type="text" name="jobTagList">
					 <input type="button" value="태그선택"  padding:2px; onclick="" ><br> -->
					</div>
			</li>
			
			<li>
				<h1>근무 조건 및 환경<span class="ico_ar">▼</span></h1>
					<div>
					 <label>근무 지역</label> 
					 <input type="text" name="jobLocation" id="jobLocation" style="width:30%; padding:2px;">
					 <input type="text" name="jobZipcode" id="jobZipcode" style="width:30%; margin-bottom: 1%; padding:2px;">
					 <input type="button" value="위치 찾기" id="jobLo" onclick="findJobLocation()"><br>
					 
					 <label>근무 시간</label>
					 <input type="text" name="jobWorkTime" style="width:30%; margin-bottom: 1%; padding:2px;"><br>
					 
					 <label>급여 조건</label>
					 <input type="radio" name="jobPayType" value="year">연(Year) &nbsp;
					 <input type="radio" name="jobPayType" value="month">월(Month) &nbsp; 
					 <input type="radio" name="jobPayType" value="day">일(Day) &nbsp;&nbsp;
					 <input type="text" name="jobPayAmount" style="width:30%; margin-bottom: 2%; padding:2px;"><br>
					 
					 <label>복리 후생</label><br>
					 <textarea name="jobBenefits" style="width:80%;  height:150px; margin-bottom: 2%;""></textarea><br>
					</div>
			</li>
			
			<li>
				<h1>내용 작성 및 첨부 파일 업로드<span class="ico_ar">▼</span></h1>
					<div>
				      <label>채용 공고 내용</label><br>
				      <textarea name="jobContent" class="summernote"></textarea> 
					</div>
			</li>
			
			<li>
				<h1>기업 정보<span class="ico_ar">▼</span></h1>
					<div>
					  <input type="hidden"  name="comId" value="${comMember.comId}"><br>  <!-- hidden -->
						
					  <label>회사 이름</label>
					  <input type="text" value="${comMember.comName}" style="width:60%; padding:2px; margin-bottom: 1%;" readonly="readonly" ><br>
					  
					  <label>회사 위치</label>
					  <input type="text"  value="${comMember.comAddress}" style="width:30%; padding:2px; margin-bottom: 1%;" readonly="readonly">
					  <input type="text"  value="${comMember.comZipcode}" style="width:30%; padding:2px;" readonly="readonly"><br>
					  
					  <label>연락처</label> &nbsp;&nbsp;&nbsp;
					  <input type="text" value="${comMember.comCall}" style="width:50%; margin-bottom: 2%; padding:2px;" readonly="readonly"><br>
					  
					  <label>회사 소개</label>
					 <textarea name="comIntroduction" class="summernote" value="${comMember.comIntroduction}"></textarea><br>
					</div>
			</li>
			
			<li>
				<h1>접수 기간 및 방법<span class="ico_ar">▼</span></h1>
					<div>
					  <label>접수 마감 날짜</label>  &nbsp;
					  <input type="Date" name="jobDueDate" style="width:30%; margin-bottom: 2%; padding:2px;"><br>
					  
					  <label>접수 방법</label><br>
					  <input type="radio" name="jobApplyType" value="homepageURL">자사 홈페이지에서 접수 &nbsp;&nbsp;&nbsp;
					  <input type="text" name="jobHomePageUrl" value="${comMember.comHomePageUrl}" style="width:30%; margin-bottom: 1%; padding:2px;"><br>
					  
					  <input type="radio" name="jobApplyType" value="email">담당자 이메일로 바로 접수 &nbsp;
					  <input type="text" name="jobChargerSendEmail" value="${comMember.comChargerEmail}" style="width:30%; margin-bottom: 1%; padding:2px;"><br>
					  
					  <input type="radio" name="jobApplyType" value="etc">기타<br>
					  <textarea name="jobEtc" style="width:80%; height:150px; margin-bottom: 2%;"></textarea><br>
					  
					  <label>담당자 이름</label>  &nbsp;&nbsp;&nbsp;
					  <input type="text" name="jobChargerName" value="${comMember.comChargerName}" style="width:30%;margin-bottom: 1%;padding:2px;"><br>
					  
					  <label>담당자 이메일</label>  &nbsp;
					  <input type="text" name="jobChargerEmail"  value="${comMember.comChargerEmail}" style="width:30%; margin-bottom: 3%; padding:2px;">
					  
					</div>
			</li>
		</ul>
	<input type="submit" style="margin-left:43%; background-color:#f0ad4e; margin-bottom:5%; text-align: center;" value="확인"> 
	<input type="button"   style="text-align: center; background-color:#f0ad4e; margin-bottom:5%;"  onclick="" value="취소">
	</div>
	</form>
	</div>
	</div>
	</div>
</div>


<!----------------------main end--------------------------------------->

<!----------------------footer--------------------------------------->
	<%@ include file="../commons/bfooter.jspf" %>
<!----------------------footer End--------------------------------------->

<!----------------------boothStrap Script--------------------------------------->
<script src="<%=request.getContextPath()%>/js/classie.js"></script>
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
<script src="<%=request.getContextPath()%>/js/jquery.nicescroll.js"></script>
<script src="<%=request.getContextPath()%>/js/scripts.js"></script>
<!--//scrolling js-->
<!-- Bootstrap Core JavaScript -->
 <script src="<%=request.getContextPath()%>/js/bootstrap.js"> </script> 
<!----------------------boothStrap Script End--------------------------------------->  
<!----------------------My Script--------------------------------------->

<script>

$(function(){
	$(".summernote").summernote({
				lang : "ko-KR",
				height : 300,
				width : 600,
				fontNames : [ "맑은고딕", "Arial", "Arial Black",
						"Comic Sans MS", "Courier New", ],
				fontNamesIgnoreCheck : [ "맑은고딕" ],
				focus : true,
				callbacks: {
					onImageUpload: function(files, editor, welEditable) {
			            for (var i = files.length - 1; i >= 0; i--) {

			            	sendFile(files[i], this);
			            }
			        }
				}
	});
	
	var str = $("textarea").val();
	str = str.replace(/(?:\r\n|\r|\n)/g, "<br/>");
	$("textarea").val(str);
	
	
	//아코디언 형식
/* 	$("#accordian h1").click(function(){
		$("#accordian ul div").slideUp();
		$('.ico_ar').css('transform','none'); 
		if(!$(this).next().is(":visible"))
		{
			$(this).next().slideDown(); 
		} 
	}); */
});

function sendFile(file, el) {
	var form_data = new FormData();
	form_data.append("file", file);

  	$.ajax({
    	data: form_data,
    	type: "POST",
    	url: "imageUpload",
    	cache: false,
    	contentType: false,
    	enctype: "multipart/form-data",
    	processData: false,
    	dataType:"text",
    	success: function(img_name) {

    		$(".summernote").summernote("insertImage", getContextPath()+img_name);
    	}
  	});
}

function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf("/", hostIndex + 1) );
};
 
 
//Daum 주소 API
function findJobLocation(){   
	    var width=500;
	    var height=600;
	    
	    daum.postcode.load(function(){
	        new daum.Postcode({
	            oncomplete: function(data){
	                $("#jobZipcode").val(data.postcode);
	                $("#jobLocation").val(data.address);
	            }
	        }).open({
	            left: (window.screen.width/2)-(width/2),
	            top: (window.screen.height/2)-(height/2)
	        });
	    });
	}
	

</script>

<!-- 우편번호 찾기 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!----------------------My Script End--------------------------------------->
</body>
</html>


