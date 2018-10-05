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
 
 #accordian tr:nth-child(2n){
 	display: none;
 }
 
 #accordian tr:nth-child(2n+1){
 	cursor:pointer;
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
		<table width="100%"  id="accordian">
		    <c:forEach var="jobApp" items="${jobAppList}" varStatus="status" >
			    <tr> 
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
		  				<c:if test="${jobApp.appResult == '-'}">
		  				<span style="color:gray" id="appResultTitle${status.count}"> 미평가 </span>
		  				</c:if>
		  			 </td>
				    <td><span id="appInterviewDateTitle${status.count}">${jobApp.appInterviewDate}</span></td>
				    <td>${jobApp.appName}(${jobApp.appGender}, ${jobApp.appAge}세)</td>
					<td style="width:20%;">${jobApp.appEduName}(${jobApp.appMajor}, ${jobApp.appMinor})</td>
					<td></td>  
					<td>${jobApp.appRegisterDate}</td>
			   </tr>
			   
			   <!-- 이력서 내용 -->
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
					  				<span style="color:green" id="appResult${status.count}">서류 합격</span>
					  				</c:if>
					  				<c:if test="${jobApp.appResult == 'failure'}">
					  				<span style="color:red" id="appResult${status.count}">불합격</span>
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
					 	 </div>
					 </td>
			   </tr>
			</c:forEach>
		</table>
		</c:if>
	 </div>
</div>

<!----------------------main end--------------------------------------->
3
<!----------------------footer--------------------------------------->
	<%@ include file="../commons/footer.jspf" %>
<!----------------------footer End--------------------------------------->

<script>

//면접 결과 통보
$(function(){
	//아코디언 형식
	$("#accordian").find("tr:nth-child(2n+1)").click(function(){
		$(this).next().slideUp();
		/* $('.ico_ar').css('transform','none'); */
		if(!$(this).next().is(":visible"))
		{
			$(this).next().slideDown(); 
		} 
	})
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
</script>
</body>
</html>