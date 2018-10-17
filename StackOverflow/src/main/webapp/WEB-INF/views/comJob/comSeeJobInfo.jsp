<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
<title>채용 공고 상세보기</title>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.cookie.js"></script>	
<style>
.main {
    display: inline-block;
    height: 100%;
    width: 1500px;
}

.mainofmain{
	float:left;
	width: 70%;
}

.rightbar{
	float:right;
	width:10%;
	height:1000px;
}

.rightbar a{
	position:fixed;
	bottom:10px;
}

.rightbar a:hover{
	opacity: 0.5;
}

.centerup{
   padding-top: 20px;
   padding-right: 20px;
   padding-bottom: 20px;
}

.center{
	border: 1px solid black;
	padding-right: 30px;
	padding-left: 30px;
	padding-top: 20px;
	padding-bottom: 30px;
	margin-top: 2px;
}

.center div h2{
	margin-top: 4%;
	margin-bottom: 4%;
}

.center div p{
	margin-top: 1%;
	margin-bottom:3%;
}

.box{
 	border: 1px solid black;
 	padding: 4px;
 	font-weight: bold;
 	width: 13%;
 	text-align:center;
 	/* display: inline-block; */
}

.index{
	padding: 2%;
	margin-right: 5%;
	border-bottom: 3px solid gray;
}

.index:hover{
	border-bottom: 3px solid orange;
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

   <div class="rightbar">
   	  <a href="#mainofmain"><img src="http://icons.iconarchive.com/icons/graphicloads/100-flat-2/256/arrow-up-icon.png" width="30%"></a>
   </div>
	
   <div class="mainofmain" id="mainofmain">
	<div class="centerup">
		<c:if test="${jobInfo.comPhoto!=null}">
		<img src="<c:url value="/resources/jobimage/${jobInfo.comPhoto}"/>" width="6%;">
		
		</c:if>
		<h1 style="display:inline;">${jobInfo.jobTitle} <span style="font-size:15px;">${jobInfo.comName}</span>
		<c:if test="${jobInfo.endedJob == 'Y'}">
			<span style="color:red; font-size:15px;">이 채용공고는 마감되었습니다.</span>
		</c:if></h1>
		<div>
		<br>
		<span style="font-weight:bold;">모집 분야</span> &nbsp; ${jobInfo.jobField}<br> 
		<span style="font-weight:bold;">연락처</span> &nbsp; ${jobInfo.comCall}<br>
		<span style="font-weight:bold;">주소</span> &nbsp; ${jobInfo.jobLocation} <br> 
		<span style="font-weight:bold;">등록일</span> &nbsp; ${jobInfo.jobRegisterDate}<br><br>
		
		<a href="#Qualification" class="index">모집부문 및 자격요건</a>
		<a href="#Condition" class="index">근무조건 및 환경</a>
		<a href="#Content" class="index">내용</a>
		<a href="#Company" class="index">기업정보</a>
		<a href="#Apply" class="index">접수기간 및 방법</a>	
		</div>
	</div>


	<div class="center">
		 <div id="Qualification">
		 <h2>모집부문 및 자격요건</h2>
		   <div class="box">고용 형태</div>
		  <c:forEach var="jobType" items="${jobTypeList}">
		   	 ${jobType eq 'permanent'? '정규직' : ''}
		   	 ${jobType eq 'contract'? '계약직' : ''} 
		   	 ${jobType eq 'intern'? '인턴직' : ''} 
		   	 ${jobType eq 'partTimeJob'? '아르바이트' : ''} 
		   </c:forEach> 
		   <br><br>
		   <div class="box">담당 업무</div>
			<p>${jobInfo.jobRequiredTask}<p>

		  	<div class="box">지원자격</div><br>
		    <p>${jobInfo.jobQualification}</p>
		  </div>
		  
		  <hr>

		<div id="Condition">
		<h2>근무조건 및 환경</h2>
			<div class="box">근무 지역</div>
			<p>${jobInfo.jobZipcode}&nbsp;|&nbsp;${jobInfo.jobLocation}<p>
			
			<div class="box">근무 시간</div>
			<p>${jobInfo.jobWorkTime}<p>
			
			<div class="box">급여 조건</div>
			<p>
				<c:if test="${jobInfo.jobPayType eq 'year'}">
					연 ${jobInfo.jobPayAmount}
				</c:if>
				
				<c:if test="${jobInfo.jobPayType eq 'month'}">
					월 ${jobInfo.jobPayAmount}
				</c:if>
				
				<c:if test="${jobInfo.jobPayType eq 'day'}">
					일 ${jobInfo.jobPayAmount}
				</c:if>
			</p>
			
			<div class="box">복리 후생</div>
			<p>${jobInfo.jobBenefits}<p>
		</div>
		
		<hr>
		
		<div id="Content">
		<h2>내용</h2>
			<p>${jobInfo.jobContent}</p>
		</div>
		
		<hr>
		
		<div id="Company">
		<h2>기업정보</h2>
			<div class="box">회사 이름</div>
			<p>${comMem.comName}<p>
			
			<div class="box">회사 위치</div>
			<p>${comMem.comAddress}<p>
			
			<div class="box">연락처</div>
			<p>${jobInfo.comCall}<p>
			
			<div class="box">회사 소개</div>
			<p>${jobInfo.comIntroduction}<p>
		</div>
		
		<hr>
		
		<div id="Apply">
		<h2>접수기간 및 방법</h2>
			<div class="box">접수마감 날짜</div>
			<p>${jobInfo.jobDueDate}<p>
			
			<div class="box">접수 방법</div>
			<c:if test="${jobInfo.endedJob == 'N'}">
			<p><c:if test="${jobInfo.jobApplyType eq 'homepageURL'}">
				 <input type="button" value="지원하기" onclick="location.href='<c:url value="${jobInfo.jobHomePageUrl}"/>'">
				</c:if>
				
				<c:if test="${jobInfo.jobApplyType eq 'email'}">
				 <input type="button" value="지원하기" onclick="location.href=''">
				</c:if>
				
				<c:if test="${jobInfo.jobApplyType eq 'etc'}">
				<p>${jobInfo.jobEtc}</p>
				</c:if>
				</p>
			</c:if>
			<c:if test="${jobInfo.endedJob == 'Y'}">
				<span style="color:red; font-size:15px;">이 채용공고는 마감되었습니다.</span>
			</c:if><br><br>
			<div class="box">담당자</div>
			<p>${jobInfo.jobChargerName} | 	${jobInfo.jobChargerEmail}<p>

		</div>
		</div>
		</div>
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

	
	var jobNo = parseInt(${jobInfo.jobNo});
 	var list = new cookieList("visitJobInfo");
 	
 	var cookies  = [];
 	var cookie = null;
 	cookies = getCookie("visitJobInfo").split(",");
 	for(var index in cookies){
 		
 		if(cookies[index]== jobNo){
 			if(index < cookies.length-1){
 				cookie = getCookie("visitJobInfo").replace(jobNo+",", "");
 			} 
 			else{
 				cookie = getCookie("visitJobInfo").replace(","+jobNo, "");
 			}
 			list.clear();
 			list = new cookieList("visitJobInfo");

 			var cookies2  = []; 
 			cookies2  = cookie.split(",");
 			
 			for(var index2 in cookies2){
 				list.add(cookies2[index2]);
 			} 
 			break;
 		}
 	}
 	
 	if(jobNo != getCookie("visitJobInfo")){
  		list.add(jobNo); 
 	}
});

function getCookie(cName) {
cName = cName + "=";
var cookieData = document.cookie;
var start = cookieData.indexOf(cName);
var cValue = "";
if(start != -1){
    start += cName.length;
    var end = cookieData.indexOf(";", start);
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
   $.cookie(cookieName,items.join(','), {path:'/'});
  },
  "clear" : function(){
   items = null;
   $.cookie(cookieName, null, {path:'/'});
  },
  "items" : function(){
   return items; 
  }
};
};
</script>
<!----------------------My Script End--------------------------------------->
</body>
</html>