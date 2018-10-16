<%@page import="com.bit.op.osf.job.model.JobInfoListView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/index.css" type="text/css" media="all" />
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<title>지원서 관리</title>
<style>
.main {
    display: inline-block;
    height: 100%;
    width: 70%;
    margin-left: 15%;
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
 
 .appcontent img{
  float: left;
 }
 
 .appcontent div:nth-child(1){
  float: left;
 }
 
 #accordian tr:nth-child(2n){
 	display: none;
 }
 
 #accordian tr:nth-child(2n+1){
 	cursor:pointer;
 }
 
 .border{
 	border: 1px solid black;
 	padding: 5%;
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
 
</style>
</head>
<body>

<!----------------------header--------------------------------------->
<%@ include file="../commons/header.jspf" %>
<!----------------------header End--------------------------------------->


<!----------------------left menu--------------------------------------->
<%@ include file="../commons/left.jspf" %>
<!----------------------left menu End--------------------------------------->

<!----------------------main--------------------------------------->

<div class="leftleft" style="float:left; width:9%; height:100%; margin-left:120px; margin-right:15px; padding-top:90px; position:fixed; top:0;">

	<a href="#" style="font-weight:bold;color:orange;">결과 유형</a>
	<a href="<%=request.getContextPath()%>/comJob/manageJobAppListByAppResult/${job.jobNo == null? 0: job.jobNo}/all">전체</a>
	<a href="<%=request.getContextPath()%>/comJob/manageJobAppListByAppResult/${job.jobNo == null?  0: job.jobNo}/yet">미평가</a>
	<a href="<%=request.getContextPath()%>/comJob/manageJobAppListByAppResult/${job.jobNo == null?  0: job.jobNo}/passDocu">서류합격</a>
	<a href="<%=request.getContextPath()%>/comJob/manageJobAppListByAppResult/${job.jobNo == null?  0: job.jobNo}/passFinal">최종합격</a>
	<a href="<%=request.getContextPath()%>/comJob/manageJobAppListByAppResult/${job.jobNo == null?  0: job.jobNo}/failure">불합격</a>
</div>


<div class="right">
	<input type="button" value="채용 공고 관리" onclick="location.href='<c:url value="/comJob/manageJobInfoList/1"/>'">
	<input type="button" value="새로운 채용 공고 작성" onclick="location.href='<c:url value="/comJob/writeJobInfo"/>'">
   	<a href="#appForm"><img src="http://icons.iconarchive.com/icons/graphicloads/100-flat-2/256/arrow-up-icon.png" width="4%" 
   	style="position:fixed; bottom: 10px;"></a>
</div>

<div class="main">

    
    <!-- 채용공고 선택 -->
    <form id="appForm">
	<select id="appselect">
		<option value="0">전체</option>
		<c:forEach var="jobInfo" items="${jobInfoList}">
		<option value="${jobInfo.jobNo}" ${jobInfo.jobNo == job.jobNo? 'selected': ''}>${jobInfo.jobTitle} - ${jobInfo.jobRegisterDate}</option>
		</c:forEach>
	</select>
	<input type="button" value="확인" onclick="return appSelect()">
	</form>
	
	<!-- 지원서 관리 -->
	<div class="left">
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
							고졸이하 : ${eduLevel.appEduCount} <br>
						</c:if>
						<c:if test="${eduLevel.appEduLevel == 'col'}">
							대학(2/3) : ${eduLevel.appEduCount} <br>
						</c:if>
						<c:if test="${eduLevel.appEduLevel == 'univ'}">
							대학(4) : ${eduLevel.appEduCount} <br>
						</c:if>
						<c:if test="${eduLevel.appEduLevel == 'master'}">
							석사 : ${eduLevel.appEduCount} <br>
						</c:if>
						<c:if test="${eduLevel.appEduLevel == 'doctor'}">
							박사 : ${eduLevel.appEduCount} <br>
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
			   
							  <c:if test="${jobInfo.comPhoto != null and jobInfo.comPhoto !=''}">
								<img src="<c:url value="/resources/jobimage/${jobApp.appPhoto}"/>" width="15%;" style="margin: 10px;float:left;">
							  </c:if>
			    	  	      <c:if test="${jobInfo.comPhoto == null || jobInfo.comPhoto == '' }">
								<img src="<c:url value="/resources/jobimage/appprofile.PNG"/>" width="15%;" style="margin: 10px;float:left;">
							  </c:if>
							  
							  <div style="margin: 10px;float:left;z-index:1;">
					    	  ${jobApp.appName}(${jobApp.appGender}, ${jobApp.appAge}세)<br>
							    ${jobApp.appBirth}<br>
							    ${jobApp.appEmail}   ${jobApp.appPhone}  ${jobApp.appCall} <br>
								${jobApp.appEduName}(${jobApp.appEduLevel}) ${jobApp.appEduEntraDate} - ${jobApp.appEduGraduDate}  ${jobApp.appEduState}<br>
								${jobApp.appMajor}, ${jobApp.appMinor}  ${jobApp.appScore}/${jobApp.appTotalScore}<br>
								${jobApp.appRegisterDate}<br>
							  </div>
							  
							  <div>
							  	<label>자기소개<br>
							  	<div class="border" style="margin-top: 18%;"> ${jobApp.appIntroduction}<br></div>
							  	
							  	<label style="margin-top: 3%;">입사 포부</labe><br>
							  	<div class="border"> ${jobApp.appAmbition}<br> </div>
							  	
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
					  			<span id="appResultDate${status.count}">결과 통보일: ${jobApp.appResultDate}</span>
					  			</c:if>


								<br>
							    <!-- 면접 날짜 -->
							    <c:if test="${jobApp.appInterviewDateDate == null}">
					  			   면접 날짜 지정:
					  			</c:if>
					  			<c:if test="${jobApp.appInterviewDateDate != null}">
								   면접 날짜 수정: <span style="color:red" id="appInterviewDate${status.count}">${jobApp.appInterviewDate}</span>
 								</c:if>
								<form onsubmit="return updateAppInterviewDate($(this), ${status.count})" accept-charset="utf-8" >
									<input type="hidden" name="appNo" value="${jobApp.appNo}">
									<input type="date" name="appInterviewDate"><input type="submit" value="확인">
								</form>
								<c:if test="${jobApp.appInterviewDateDate != null}">
								   면접 날짜 통보일: <span id="appInterviewDateDate${status.count}">${jobApp.appInterviewDateDate}</span>
								</c:if>
								<br>
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

<!----------------------main end--------------------------------------->

<!----------------------footer--------------------------------------->
	<%@ include file="../commons/footer.jspf" %>
<!----------------------footer End--------------------------------------->

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
</body>
</html>