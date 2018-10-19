<%@page import="com.bit.op.osf.job.model.JobInfoListView"%>
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
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<title>지원서 관리</title>
<style>
.main {
    display: inline-block;
    height: 100%;
    width: 70%;
    margin-left: 3%;
}

.left {
    float: left;
    width: 70%;
    margin-bottom: 3%;
}

.right {
    float: right;
    width: 30%;
}

.right a:hover{
	opacity: 0.5;
}

table {
  /*  width: 80%; */
   border-collapse: collapse;
   border: 1px solid black;
   padding: 10px;
 }

td, .th tr td {
   border-bottom: 1px solid #777777;
   padding-top: 15px;
   padding-bottom: 15px;
   font-size: 14px;
   width: 10%;
 }
 
/*  .appcontent img{
  float: left;
 } */
 
/*  .appcontent div:nth-child(1){
  float: left;
 } */
 
 #accordian tr:nth-child(2n){
 	display: none;
 }
 
 #accordian tr:nth-child(2n+1){
 	cursor:pointer;
 }
 
 .border{
 	border: 1px solid black;
 	padding: 3%;
 	margin-bottom: 15px;
 	width: 80%;
 }

 .leftleft a{
 	font-size: 15px;
 	color: #818181;
 	display: block;
 	padding: 6px 6px 6px 32px;
 	
 }
 
 .graph{
 	padding-left: 100px;
    padding-right: 100px;
    padding-top: 38px;
    padding-bottom: 40px;
    margin-right: 10%;
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


<div class="bluebTabDesign" style="margin-bottom: 3%;">
	<ul>
		<li><a href="<c:url value="/comProfile"/>"><span>프로필</span></a></li>
		<li><a href="<c:url value="/comJob/writeJobInfo"/>"><span>채용공고 작성</span></a></li>
		<li><a href="<c:url value="/comJob/manageJobInfoList/1"/>"><span>채용공고 관리</span></a></li>
		<li class="selected"><a href="#"><span>지원서 관리</span></a></li>
		<li><a href="<c:url value="/comProSet"/>"><span>프로필 설정</span></a></li>
	</ul>
</div>
<div class="leftleft" style="float:left; width:9%; height:100%; margin-right:15px; position:relative; top: 2%; ">

	<a href="#" style="font-weight:bold;color:orange;">결과 유형</a>
	<a href="<%=request.getContextPath()%>/comJob/manageJobAppListByAppResult/${job.jobNo == null? 0: job.jobNo}/all">전체</a>
	<a href="<%=request.getContextPath()%>/comJob/manageJobAppListByAppResult/${job.jobNo == null?  0: job.jobNo}/yet">미평가</a>
	<a href="<%=request.getContextPath()%>/comJob/manageJobAppListByAppResult/${job.jobNo == null?  0: job.jobNo}/passDocu">서류합격</a>
	<a href="<%=request.getContextPath()%>/comJob/manageJobAppListByAppResult/${job.jobNo == null?  0: job.jobNo}/passFinal">최종합격</a>
	<a href="<%=request.getContextPath()%>/comJob/manageJobAppListByAppResult/${job.jobNo == null?  0: job.jobNo}/failure">불합격</a>
</div>

<div class="right">
	<span style="font-size: 14px;"><a href="<c:url value="/comJob/seeJobInfoList/1"/>">채용 정보</a> > <a href="<c:url value="/comJob/manageJobInfoList/1"/>">채용 공고 관리</a> > <a href="<c:url value="/comJob/manageJobAppList/0"/>">지원자 관리</a></span><br>
	<input type="button" style="background-color:#f0ad4e;margin-top:3%;" value="새로운 채용 공고 작성" onclick="location.href='<c:url value="/comJob/writeJobInfo"/>'">
	<input type="button" style="background-color:#f0ad4e;margin-top:3%;" value="채용 공고 관리" onclick="location.href='<c:url value="/comJob/manageJobInfoList/1"/>'">
   	<a href="#m"><img src="http://icons.iconarchive.com/icons/graphicloads/100-flat-2/256/arrow-up-icon.png" width="4%" 
   	style="position:fixed; bottom: 10px;"></a>
</div>

<div class="main" id="m">

    
    <!-- 채용공고 선택 -->
    <form id="appForm">
	<select id="appselect" style="padding: 1%; width: 60%;">
		<option value="0">전체</option>
		<c:forEach var="jobInfo" items="${jobInfoList}">
		<option value="${jobInfo.jobNo}" ${jobInfo.jobNo == job.jobNo? 'selected': ''}>${jobInfo.jobTitle} - ${jobInfo.jobRegisterDate}</option>
		</c:forEach>
	</select>
	<input type="button" value="확인" onclick="return appSelect()">
	</form>
	
	<!-- 지원서 관리 -->
	<div class="left" style="margin-top:3%;">
	 <h2>지원자 관리</h2>
	 <c:if test="${job.jobTitle != null and job.jobTitle != ''}">
	 	<span style="font-size:15px;">${job.jobTitle}(${jobAppNum})</span>
     </c:if>
     <c:if test="${job== null || job== ''}">
      <span style="font-size:15px;">전체(${jobAppNum})</span>
     </c:if> 
	</div>
	
	<!-- <div id="chart_div" style="width:100%; height:200px; border: 1px solid black; margin-top:8%; margin-bottom:2%; " > -->
		<table style="margin-bottom: 3%; width:100%; height: 30%;">
			<tr>
				<td style="padding: 15px 100px; ">
					<p style="color:orange; font-weight:bold; font-size: 15px;">지원자 수</p>
					<span style="font-size:50px; font-weight:bold; text-align:center;" >${graph.allNum == null ? 0: graph.allNum}</span>
				</td>
				<td>	
					<p style="color:orange; font-weight:bold; font-size: 15px;">평균 연령</p>
					<span style="font-size:50px; font-weight:bold;">${graph.avgAge == null? 0 : graph.avgAge}</span>
				</td>
				<td>
					<p style="color:orange; font-weight:bold; font-size: 15px;">성별(여 / 남)</p>
					<span style="font-size:50px; font-weight:bold;">${graph.sumF == null? 0:graph.sumF} / ${graph.sumM == null? 0 : graph.sumM}</span>
				</td>
				<td>
					<p style="color:orange; font-weight:bold; font-size: 15px;">학력</p>
					<c:forEach  var="eduLevel" items="${graph.eduLevel}">
						<c:if test="${eduLevel.appEduLevel == 'highschool'}">
							고졸이하 : <span style="font-size:20px; font-weight:bold;">${eduLevel.appEduCount}</span><br>
						</c:if>
						<c:if test="${eduLevel.appEduLevel == 'col'}">
							대학(2/3) : <span style="font-size:20px; font-weight:bold;">${eduLevel.appEduCount}</span><br>
						</c:if>
						<c:if test="${eduLevel.appEduLevel == 'univ'}">
							대학(4) : <span style="font-size:20px; font-weight:bold;">${eduLevel.appEduCount}</span><br>
						</c:if>
						<c:if test="${eduLevel.appEduLevel == 'master'}">
							석사 : <span style="font-size:20px; font-weight:bold;">${eduLevel.appEduCount}</span><br>
						</c:if>
						<c:if test="${eduLevel.appEduLevel == 'doctor'}">
							박사 : <span style="font-size:20px; font-weight:bold;">${eduLevel.appEduCount}</span><br>
						</c:if>
					</c:forEach>
				</td>
			</tr>
		</table>
		
	<!-- </div> -->
	
	<div>
		<c:if test ="${jobAppList == null}">
		<p>등록된 회원정보가 없습니다<p>
		</c:if>
		<table width="100%" class="th">
			<tr>	
				<td>결과</td>
				<td>채용공고 제목</td>
				<td>면접날짜</td>
				<td>이름(성별,나이)</td>
				<td>학교(주전공,부전공)</td>
				<td></td>
				<td>지원날짜</td>
			</tr>
		</table>
		<c:if test = "${jobAppList != null}">
		<table width="100%"  id="accordian">
		    <c:forEach var="jobApp" items="${jobAppList}" varStatus="status" >
			    <tr> 
<%-- 			    	 <td width="5%">
			    	 	<input type="checkbox" name="checkJAppNo" value="${jobApp.appNo}">
			    	 </td> --%>
					 <td>
		    		   <c:if test="${jobApp.appResult == 'passFinal'}">
		  				<span style="color:blue" id="appResultTitle${status.count}"> 최종 합격 </span>
		  				</c:if>
		  				<c:if test="${jobApp.appResult == 'passDocu'}">
		  				<span style="color:green" id="appResultTitle${status.count}"> 서류 합격 </span>
		  				</c:if>
		  				<c:if test="${jobApp.appResult == 'failure'}">
		  				<span style="color:red" id="appResultTitle${status.count}"> 불합격 </span>
		  				</c:if>
		  				<c:if test="${jobApp.appResult == null || jobApp.appResult == '' || jobApp.appResult == '-'}">
		  				<span style="color:gray" id="appResultTitle${status.count}"> 미평가 </span>
		  				</c:if>
		  			 </td>
		  			<td><a href="<c:url value="/comJob/seeJobInfo/${jobApp.jobNo}"/>">${jobApp.jobTitle}</a></td>
				    <td><span id="appInterviewDateTitle${status.count}">${jobApp.appInterviewDate}</span></td>
				    <td>${jobApp.appName}(${jobApp.appGender}, ${jobApp.appAge}세)</td>
					<td style="width:20%;">${jobApp.appEduName}(${jobApp.appMajor}, ${jobApp.appMinor})</td>
					<td>${jobApp.appRegisterDate}</td>
			   </tr>
			   
			   <!-- 이력서 내용 -->
			   <tr>
			    	  <td colspan="6">
			    	  	 <div class="appcontent">
			    	  	 <table>
							  <c:if test="${jobApp.appPhoto != null and jobApp.appPhoto !=''}">
								<img src="<c:url value="/resources/jobimage/${jobApp.appPhoto}"/>" width="15%;" style="margin: 0 1%;float:left;">
							  </c:if>
			    	  	      <c:if test="${jobApp.appPhoto == null || jobApp.appPhoto == '' }">
								<img src="<c:url value="/resources/jobimage/appprofile.PNG"/>" width="15%;" style="margin: 0 1%;float:left;">
							  </c:if>
							  
							  <div style="margin: 10px; position:relative; z-index:1;">
					    	   <h2>${jobApp.appName}(${jobApp.appGender}, ${jobApp.appAge}세)</h2>
							    ${jobApp.appBirth}<br>
							    ${jobApp.appEmail}   ${jobApp.appPhone}  ${jobApp.appCall} <br>
								${jobApp.appEduName}(${jobApp.appEduLevel}) ${jobApp.appEduEntraDate} - ${jobApp.appEduGraduDate}  ${jobApp.appEduState}<br>
								${jobApp.appMajor}, ${jobApp.appMinor}  ${jobApp.appScore}/${jobApp.appTotalScore}<br>
								${jobApp.appRegisterDate}<br>
							  </div>
							  
							  <div style="margin-top: 7%; margin-left:1%; position:relative;" >
							  	<label>자기소개</label><br>
							  	<div class="border" > ${jobApp.appIntroduction}<br></div>
							  	
							  	<label style="margin-top: 1%;">입사 포부</labe><br>
							  	<div class="border" style="font-weight: normal;"> ${jobApp.appAmbition}<br></div>
							  	
							  	<div style="float:left; margin-right: 10%;">
							  	<!-- 면접 결과 -->
					  	 		<c:if test="${jobApp.appResult == '-'}">
					  			   결과 통보:
					  			</c:if>
					  			<c:if test="${jobApp.appResult != '-'}">
					  				결과 수정:   		
					  				<c:if test="${jobApp.appResult == 'passFinal'}">
					  				<span style="color:blue" id="appResult${status.count}">최종 합격</span>
					  				</c:if>
					  				<c:if test="${jobApp.appResult == 'passDocu'}">
					  				<span style="color:green;" id="appResult${status.count}">서류 합격</span>
									</c:if>
									<c:if test="${jobApp.appResult == 'failure'}">
									<span style="color:red;" id="appResult${status.count}">불합격</span>
							</c:if>
					  			</c:if>
					  				<form onsubmit="return updateAppResult($(this), ${status.count})" accept-charset="utf-8" >
					  					<input type="hidden" name="appNo" value="${jobApp.appNo}">
					  					<select name="appResult">
					  					  <option value="passFinal">최종 합격</option>
					  					  <option value="passDocu">서류 합격</option>
					  					  <option value="failure">불합격</option>
						  				</select>
						  				<input type="submit" value="확인">
					  			 	</form>
					  			<c:if test="${jobApp.appResultDate != null}">
					  			<span id="appResultDate${status.count}" style="width:90%;">결과 통보일: ${jobApp.appResultDate}</span>
					  			</c:if>
								</div>

								<div style="margin-top: 3px;">
							    <!-- 면접 날짜 -->
							    <c:if test="${jobApp.appInterviewDateDate == null}">
					  			  면접 날짜 지정:
					  			</c:if>
					  			
					  			<c:if test="${jobApp.appInterviewDateDate != null}">
								 <br> 면접 날짜 수정: <span style="color:red" id="appInterviewDate${status.count}">${jobApp.appInterviewDate}</span>
 								</c:if>
								<form onsubmit="return updateAppInterviewDate($(this), ${status.count})" accept-charset="utf-8" >
									<input type="hidden" name="appNo" value="${jobApp.appNo}">
									<input type="date" name="appInterviewDate"><input type="submit" value="확인">
								</form>
								<c:if test="${jobApp.appInterviewDateDate != null}">
								  <br> 면접 날짜 통보일: <span id="appInterviewDateDate${status.count}">${jobApp.appInterviewDateDate}</span>
								</c:if>
								</div>
							  </div>
							 </table>
					 	 </div>
					 </td>
			   </tr>
			</c:forEach>
		</table>
		</c:if>
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
//면접 결과 통보
$(function(){
	$jobInfo = $("#jobInfo");
	//아코디언 형식
	$("#accordian").find("tr:nth-child(2n+1)").click(function(event){
	
		$(this).next().slideUp();
		/* $('.ico_ar').css('transform','none'); */
		if(!$(this).next().is(":visible")){
			$(this).next().slideDown(); 
		} 
	});
	
/*  	$("#jobInfo").click(function(e){
		e.preventDefault();
	});  */
});

function updateAppResult(e,index){

	var queryString = e.serialize();

	$.ajax({
		type: "POST",
		url: getContextPath()  + "/comJob/updateAppResult",
		data: queryString,
		dataType: "json", 
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		cache: false,
		success : function(data){
		 	if(data.appResult == "passFinal"){
				alert("결과가 통보되었습니다.");
				$("#appResult"+index).text("최종 합격").css("color", "blue");
				$("#appResultTitle"+index).text("최종 합격").css("color", "blue");
				$("#appResultDate"+index).text("결과 통보일: " + data.appResultDate);
				
			}else if(data.appResult == "passDocu"){
				alert("결과가 통보되었습니다.");
				$("#appResult"+index).text("서류 합격").css("color", "green");
				$("#appResultTitle"+index).text("서류 합격").css("color", "green");
				$("#appResultDate"+index).text("결과 통보일: " + data.appResultDate);

			}else if(data.appResult == "failure"){
				alert("결과가 통보되었습니다.");
				$("#appResult"+index).text("불합격").css("color", "red");
				$("#appResultTitle"+index).text("불합격").css("color", "red");
				$("#appResultDate"+index).text("결과 통보일: " + data.appResultDate);
				
			}else{
				alert("결과 통보에 실패했습니다. 다시 시도해주세요.");  
			}  
        },
        error:function(data){
        	alert("오류가 발생했습니다. 다시 시도해주세요.");
        }
	});
	return false;
}

function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf("/", hostIndex + 1) );
};

//면접 날짜 수정
function updateAppInterviewDate(e, index){
	
	var queryString = e.serialize();
		
		$.ajax({
			type: "POST",
			url: getContextPath()  + "/comJob/updateAppInterviewDate",
			data: queryString,
			dataType: "json", 
			contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			cache: false,
			success : function(data){
				if(data.appInterviewDate !=null){
					alert("면접 날짜가 통보되었습니다.");
					$("#appInterviewDate"+index).text(data.appInterviewDate);
					$("#appInterviewDateTitle"+index).text(data.appInterviewDate);
					if(data.appInterviewDateDate !=null){
						$("#appInterviewDateDate"+index).text(data.appInterviewDateDate);
					}
				}
	        },
	        error:function(){
	        	alert("오류가 발생했습니다. 다시 시도해주세요.");
	        }
		});
	return false;
};

//채용 공고 선택
function appSelect(){
	var jobNo = $("#appselect").val();
	
	$("#appForm").attr("action", "<%=request.getContextPath()%>/comJob/manageJobAppList/"+jobNo+"");
	$("#appForm").submit();

}


/* //구글 차트
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawVisualization);

function drawVisualization(){
	var data = google.visualization.arrayToDataTable([
		['gender', 'rate'],
		['여자', 100],
		['남자', 80]
	]);
	var options = {
		title: "성별".
		vAxis: {title: "rate"},
		hAxis: {title: "gender"},
		seriesType: "bars",
		series: {5: {type: "line"}}
	};
	var chart = new google.visualization.ComboChart(document.getElementById("chart_div"));
	chart.draw(data, options);
}

 */
</script>
<!----------------------My Script End--------------------------------------->
</body>
</html>