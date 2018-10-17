<%@page import="com.bit.op.osf.job.model.JobInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<title>채용 공고 수정</title>
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
	
    /*  li > div{ display:none;} */
	
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
	
	#accordian{
	border: 1px solid black;
	width: 100%;
	margin-left: 10%;
	}
	
	#accordian #title{
	margin: 0px auto;
	text-align: center;
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
<div class="main">
	<form action="<%=request.getContextPath()%>/comJob/updateJobInfo" method="post" >
	<div id="accordian">
	 	<h1 id="title"> 채용 공고 수정</h1>
		<ul>
			<li>
			 	<input type="hidden" name="jobNo" value="${jobInfo.jobNo}">
				<h1>모집 부문 및 자격 요건<span class="ico_ar">▼</span></h1>
					<div>
					 <label>채용 제목</label>
					 <input type="text" name="jobTitle" value="${jobInfo.jobTitle}"><br>
					 
					 <label>모집 분야</label>
					 <input type="text" name="jobField" value="${jobInfo.jobField}"><br>
					 
					 <label>고용 형태</label>
					 
<%-- 			       <c:if test="${jobTypeList eq '[]'}">
					 <input type="checkbox" name="jobType" value="permanent" >정규직
					 <input type="checkbox" name="jobType" value="contract" >계약직
					 <input type="checkbox" name="jobType" value="intern" >인턴직
					 <input type="checkbox" name="jobType" value="partTimeJob" >아르바이트<br>
					 </c:if> --%>
					 
					 <c:if test="${jobTypeList != null}">
					 <%-- <c:forEach var="jobType" items="${jobTypeList}"> --%>
					 <input type="checkbox" name="jobType" value="permanent" ${jobTypeList[0] eq 'permanent'? 'checked' : ''}>정규직
					 <input type="checkbox" name="jobType" value="contract" ${jobTypeList[0] || jobTypeList[1] eq 'contract'? 'checked' : ''}>계약직
					 <input type="checkbox" name="jobType" value="intern" ${jobTypeList[0] || jobTypeList[1] || jobTypeList[2] eq 'intern'? 'checked' : ''}>인턴직
					 <input type="checkbox" name="jobType" value="partTimeJob" ${jobTypeList[0] || jobTypeList[1] || jobTypeList[2] || jobTypeList[3] eq 'partTimeJob'? 'checked' : ''}>아르바이트<br>
					 <%-- </c:forEach> --%>
					 </c:if>
					
					 
					 <label>담당 업무</label>
					 <textarea  name="jobRequiredTask">${jobInfo.jobRequiredTask}</textarea><br>
					 
					 <label>지원 자격</label>
					 <textarea name="jobQualification">${jobInfo.jobQualification}</textarea><br>
					 
					 <label>관련 태그</label>
					 <input type="text" name="jobTagList">
					 <input type="button" value="태그선택"  onclick="" ><br>
					</div>
			</li>
			
			<li>
				<h1>근무 조건 및 환경<span class="ico_ar">▼</span></h1>
					<div>
					 <label>근무 지역</label> 
					 <lnput type="checkbox" value="기본 회사 주소와 동일">기본 회사 주소와 동일<br> 
					 <input type="text" name="jobLocation" id="jobLocation" value="${jobInfo.jobLocation}">
					 <input type="text" name="jobZipcode" id="jobZipcode" value="${jobInfo.jobZipcode}">
					 <input type="button" value="위치 찾기" id="jobLo" onclick="findJobLocation()"><br>
					 
					 <label>근무 시간</label>
					 <input type="text" name="jobWorkTime" value="${jobInfo.jobWorkTime}"><br>
					 
					 <label>급여 조건</label>
				
					 <input type="radio" name="jobPayType" value="year" ${jobInfo.jobPayType eq 'year'? 'checked' : ''}>연(Year)
					 <input type="radio" name="jobPayType" value="month" ${jobInfo.jobPayType eq'month'? 'checked' : '' }>월(Month)
					 <input type="radio" name="jobPayType" value="day" ${jobInfo.jobPayType eq 'day'? 'checked' :''}>일(Day)<br>
					 <input type="text" name="jobPayAmount" value="${jobInfo.jobPayAmount}"><br>
					 
					 <label>복리 후생</label>
					 <textarea name="jobBenefits">${jobInfo.jobBenefits}</textarea><br>
					</div>
			</li>
			
			<li>
				<h1>내용 작성 및 첨부 파일 업로드<span class="ico_ar">▼</span></h1>
					<div>
				      <label>채용 공고 내용</label>
				      <textarea name="jobContent" class="summernote">${jobInfo.jobContent}</textarea> 
					</div>
			</li>
			
			<li>
				<h1>기업 정보<span class="ico_ar">▼</span></h1>
					<div>
					  <input type="hidden"  name="comId" value="${jobInfo.comId}"><br>
						
					  <label>회사 이름</label>
					  <input type="text" name="comName" value="${jobInfo.comName}" readonly="readonly"><br>
					  
					  <label>회사 위치</label>
					  <input type="text" name="comAddress" value="${jobInfo.comAddress}" readonly="readonly">
					  <input type="text" name="comZipcode" value="${jobInfo.comZipcode}" readonly="readonly"><br>
					  
					  <label>연락처</label>
					  <input type="text" name="comCall" value="${jobInfo.comCall}" readonly="readonly"><br>
					  
					  <label>회사 소개</label>
					 <textarea name="comIntroduction" class="summernote">${jobInfo.comIntroduction}</textarea><br>
					</div>
			</li>
			
			<li>
				<h1>접수 기간 및 방법<span class="ico_ar">▼</span></h1>
					<div>
					  <label>접수 마감 날짜</label>
					  <input type="Date" name="jobDueDate" value="${jobInfo.jobDueDate}"><br>
					  
					  <label>접수 방법</label>
					  <input type="radio" name="jobApplyType" value="homepageURL" ${jobInfo.jobApplyType eq 'homepageURL'? 'checked' : ''}>자사 홈페이지에서 접수
					  <input type="text" name="jobHomePageUrl" value="${jobInfo.jobHomePageUrl}" ><br>
					  
					  <input type="radio" name="jobApplyType" value="email" ${jobInfo.jobApplyType eq 'email'? 'checked' : ''}>담당자 이메일로 바로 접수
					  <input type="text" name="jobChargerSendEmail" value="${jobInfo.jobChargerSendEmail}"><br>
					  
					  <input type="radio" name="jobApplyType" value="etc" ${jobInfo.jobApplyType eq 'etc'? 'checked' : ''}>기타
					  <textarea name="jobEtc">${jobInfo.jobEtc}</textarea><br>
					  
					  <label>담당자 이름</label>
					  <input type="text" name="jobChargerName" value="${jobInfo.jobChargerName}"><br>
					  
					  <label>담당자 이메일</label>
					  <input type="text" name="jobChargerEmail" value="${jobInfo.jobChargerEmail}">
					  
					</div>
			</li>
		</ul>
	<input type="submit" value="확인"> 
	<input type="button" onclick="" value="취소">
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
	var str = $("textarea").val();
	str = str.split("<br/>").join("\r\n");
	$("textarea").val(str);

	
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
	//아코디언 형식
/* 	$("#accordian h1").click(function(){
		$("#accordian ul div").slideUp();
		 $('.ico_ar').css('transform','none'); 
		if(!$(this).next().is(":visible"))
		{
			$(this).next().slideDown(); 
			 $(this).find('.ico_ar:eq(0)').css('transform','-');  
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
	                $('#jobZipcode').val(data.postcode);
	                $('#jobLocation').val(data.address);
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


