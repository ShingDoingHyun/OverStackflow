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
<title>지원서 관리</title>
<style>
.main {
    display: inline-block;
    height: 100%;
    width: 70%;
}

.left {
    float: left;
    width: 70%;
}

.right {
    float: right;
    width: 30%;
}


table {
  /*  width: 80%; */
   border-collapse: collapse;
   border: 1px solid black;
   padding: 10px;
 }

th, td {
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
<div class="main">

	<div class="right">
	  <input type="button" value="채용 공고 관리" onclick="location.href='<c:url value="/comJob/manageJobInfoList/1"/>'">
	  <input type="button" value="새로운 채용 공고 작성" onclick="location.href='<c:url value="/comJob/writeJobInfo"/>'">
    </div>
    
	<div class="left">
	 <h2>지원서 관리</h2>
	</div>
	

	<div>
		<c:if test ="${jobAppList == null}">
		<p>등록된 회원정보가 없습니다<p>
		</c:if>
		
		<c:if test = "${jobAppList != null}">
		<table width="100%">
		    <c:forEach var="jobApp" items="${jobAppList}" >
			    <tr>
					    <td >${jobApp.appResult}</td>
					    <td>${jobApp.appInterviewDate}</td>
					    <td>${jobApp.appName}(${jobApp.appGender}, ${jobApp.appAge}세)</td>
						<td style="width:20%;">${jobApp.appEduName}(${jobApp.appMajor}, ${jobApp.appMinor})</td>
						<td></td>  
						<td>${jobApp.appRegisterDate}</td>
			   <tr>
			   <tr>
			    	  <td colspan="6">
			    	  	 <div class="appcontent">
			    	  	 
							  <c:if test="${jobInfo.comPhoto != null and jobInfo.comPhoto !=''}">
								<img src="<c:url value="/resources/jobimage/${jobApp.appPhoto}"/>" width="15%;" style="margin: 10px;">
							  </c:if>
			    	  	      <c:if test="${jobInfo.comPhoto == null || jobInfo.comPhoto == '' }">
								<img src="<c:url value="/resources/jobimage/appprofile.PNG"/>" width="15%;" style="margin: 10px;">
							  </c:if>
							  
							  <div>
					    	  ${jobApp.appName}(${jobApp.appGender}, ${jobApp.appAge}세)<br>
							    ${jobApp.appBirth}<br>
							    ${jobApp.appEmail}   ${jobApp.appPhone}  ${jobApp.appCall} <br>
								${jobApp.appEduName}(${jobApp.appEduLevel}) ${jobApp.appEduEntraDate} - ${jobApp.appEduGraduDate}  ${jobApp.appEduState}<br>
								${jobApp.appMajor}, ${jobApp.appMinor}  ${jobApp.appScore}/${jobApp.appTotalScore}<br>
								${jobApp.appRegisterDate}<br>
							  </div>
							  
							  <div>
							  	자기소개<br>
							  	${jobApp.appIntroduction}<br>
							  	
							  	입사 포부<br>
							  	${jobApp.appAmbition}<br>
							  	
							  	결과 통보: <form onsubmit="updateAppResult($(this))" accept-charset="utf-8">
							  					<input type="hidden" name="appNo" value="${jobApp.appNo}">
							  					<input type="text" name="appResult" class="appResult"><input type="submit" value="확인">
							  			   </form><br>
								면접 날짜 지정: <input type="date"><input type="button" value="확인"><br>
							  </div>
					 	 </div>
					 </td>
			   </tr>
			</c:forEach>
		</table>
		</c:if>
	 </div>
	</div>
</div>

<!----------------------main end--------------------------------------->
3
<!----------------------footer--------------------------------------->
	<%@ include file="../commons/footer.jspf" %>
<!----------------------footer End--------------------------------------->

<script>
function updateAppResult(e){
	
	alert(e.serialize());
	alert(1);
	var queryString = e.serialize();
	
	alert(2);
	
	$.ajax({
		type: "POST",
		url: getContextPath()  + "/comJob/updateAppResult",
		data: queryString,
		dataType: "text", 
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success : function(result){
			if(result == "success"){
			alert("결과가 통보되었습니다.");
			}else{
			alert("결과 통보에 실패했습니다. 다시 시도해주세요.");
			}
        },
        error:function(){
        	alert("오류발생");
        }
	});
	return false;
}

function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf("/", hostIndex + 1) );
};
</script>
</body>
</html>