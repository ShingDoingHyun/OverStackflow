<%@page import="com.bit.op.osf.job.model.JobInfoListView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/index.css" type="text/css" media="all" />
<title>채용 공고 관리</title>
<style>
.main {
    display: inline-block;
    height: 100%;
}

.left {
    float: left;
    width: 70%;
}

.leftup{
	border: 1px solid black;
	padding: 3%;
	margin-top: 20px;
	margin-bottom: 20px;
}


.right {
    float: right;
    width: 30%;
}

.main2 {
    display: inline-block;
}

table {
   width: 100%;
   border-collapse: collapse;
 }

th, td {
   border-bottom: 1px solid #777777;
   padding-top: 15px;
   padding-bottom: 15px;
   font-size: 14px;
   width: 10%;
 }
 
.editDate{
 	display:none;
 	
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
	<div class="left">
	 <h2>채용 공고 관리</h2>
	</div>
	
	<div class="right">
	  <button>
	  	<a href="<c:url value="/comJob/writeJobInfo"/>">새로운 채용 공고 작성</a>
	  </button>
    </div>
	
	 <div class="left">
 	 	<div class="leftup">
	     <form action="<%=request.getContextPath()%>/comJob/manageJobInfoList/1" method="get">
	  		<label>제목</label>
	 		<input type="text" name="jobTitle" id="jobTitle" value="${search.jobTitle eq null? '' : search.jobTitle}"><br>
	 		
	 		<label>고용 형태</label>
	 		 <input type="checkbox" name="jobType" class="jobType" value="permanent" ${search.jobTypeList[0] eq 'permanent'? 'checked' : ''}>정규직
			 <input type="checkbox" name="jobType" class="jobType" value="contract" ${search.jobTypeList[0] || search.jobTypeList[1] eq 'contract'? 'checked' : ''}>계약직
			 <input type="checkbox" name="jobType" class="jobType" value="intern" ${search.jobTypeList[0] || search.jobTypeList[1] || search.jobTypeList[2] eq 'intern'? 'checked' : ''}>인턴직
			 <input type="checkbox" name="jobType" value="partTimeJob" ${search.jobTypeList[0] || search.jobTypeList[1] || search.jobTypeList[2] || search.jobTypeList[3] eq 'partTimeJob'? 'checked' : ''}>아르바이트<br>
			 
			<label>근무 지역</label> 
		     <input type="text" name="jobLocation" id="jobLocation" value="${search.jobLocation eq null? '' : search.jobLocation}"><br>
		     
		     <label>급여 조건</label>
			 <input type="radio" name="jobPayType" id="jobPayType" value="year" ${jobInfo.jobPayType eq 'year'? 'checked' : ''}>연(Year)
			 <input type="radio" name="jobPayType" id="jobPayType" value="month" ${jobInfo.jobPayType eq 'month'? 'checked' : ''}>월(Month)
			 <input type="radio" name="jobPayType" id="jobPayType" value="day" ${jobInfo.jobPayType eq 'day'? 'checked' : ''}>일(Day)
			 <input type="text" name="jobPayAmount" id="jobPayAmount" value="${search.jobPayAmount eq null? '' : search.jobPayAmount}"><br>
			 
			 <label>관련 태그</label>
			 <input type="text" name="jobTagList">
			 <input type="button" value="태그선택"  onclick=""><br>
			 
			 <input type="hidden" name="order" id="order">
			 
			 <input type="submit" value="검색">
		</form>
		</div>
		
		<div>
			<select id="select" style="float:right;">
				<option value="jobRegisterDate">등록날짜순</option> 
				<option value="jobTitle">이름순</option>
			</select>
	    </div>
	
	 	
	 	<div>
		<c:if test="${jobInfoListView == null}">
		<p>등록된 회원정보가 없습니다<p>
		</c:if>
		
		<c:if test="${jobInfoListView != null}">
		<table width="100%">
		    <c:forEach var="jobInfo" items="${jobInfoListView.jobInfoList}" >
			    <tr>
					  <%-- <td>${jobInfo.jobNo}</td> --%>
					    <td style="width:20%;"><a href="<c:url value="/comJob/seeJobInfo/${jobInfo.jobNo}"/>">${jobInfo.jobTitle}</a></td>
					    <td>${jobInfo.jobField}</td>
					    <td>${jobInfo.jobRegisterDate}</td>
					    
						<td>${jobInfo.jobLocation}</td>
						<td>${jobInfo.jobWorkTime}</td>
						<td>
							<c:if test="${jobInfo.jobPayType eq 'year'}">
								연 ${jobInfo.jobPayAmount}
							</c:if>
							
							<c:if test="${jobInfo.jobPayType eq 'month'}">
								월 ${jobInfo.jobPayAmount}
							</c:if>
							
							<c:if test="${jobInfo.jobPayType eq 'day'}">
								일 ${jobInfo.jobPayAmount}
							</c:if>
						</td>
						<td>${jobInfo.jobDueDate}</td>
						<%-- <td>${jobInfo.jobZipcode}</td> --%>
			   </tr>
			   <tr>
			   		<td colspan="7"><input type="button" value="지원자 관리" onclick="location.href='<c:url value="/comJob/manageJobAppList/${jobInfo.jobNo}"/>'">
			   		<input type="button" value="수정" onclick="location.href='<c:url value="/comJob/updateJobInfo/${jobInfo.jobNo}"/>'">
		    		<input type="button" class="edit" value="기간 연장" >
			   		<input type="button" value="마감" onclick="return updateClick(${jobInfo.jobNo})">
			   		<input type="button" value="삭제" onclick="return deleteClick(${jobInfo.jobNo})"></td> 
			   </tr>
		   	   <tr>
				   	 <td colspan="7" class="editDate">
						   <form action="<c:url value='/comJob/updateJobInfoPeriod'/>" method="post" enctype="application/x-www-form-urlencoded">
							   <label>마감 수정 날짜</label>
							   <input type="hidden" name="jobNo" value="${jobInfo.jobNo}">
							   <input type="Date" name="jobDueDate" > 
							   <input type="submit" value="확인">
						   </form>
				     </td>
			   </tr> 
			</c:forEach>

				<tr>
					 <td colspan="10">
					   <% JobInfoListView jobInfoListView = (JobInfoListView)request.getAttribute("jobInfoListView");%>
					   <% for(int i=1; i<jobInfoListView.getPageTotalCount(); i++){ %>
					    <a href="<%=request.getContextPath()%>/comJob/manageJobInfoList/<%=i%>">[<%=i%>]</a>
					   <%} %>
					 </td>
				</tr>
		</table>
		</c:if>
		</div>
	</div>
</div>

<!----------------------main end--------------------------------------->

<!----------------------footer--------------------------------------->
	<%@ include file="../commons/footer.jspf" %>
<!----------------------footer End--------------------------------------->
<script>
$(function(){
	$(".edit").each(function(i){
		$(this).click(function(e){
 			if($(this).parent().parent().next().find(".editDate").css("display") == "none"){
				$(this).parent().parent().next().find(".editDate").show();
 			}else{
 				$(this).parent().parent().next().find(".editDate").hide();
 			}
		});
	});
	
 	$("#select").change(function(){
		var jobTitle = $("#jobTitle").val();
		var jobTypeList = [];
		var jobLocation = $("#jobLocation").val();
		var jobPayType = $("#jobPayType").val();
		var jobPayAmount = $("#jobPayAmount").val();
		var order = $(this).val();
		var page = ${page};
		$("#order").attr("value", order);
		alert("되어라");
		alert(jobTitle);
		alert(jobLocation);
		alert(jobPayType);
		alert(jobPayAmount);
		alert(order);
/* 		alert($(".jobType"));
		for(var i=0; i<$(".jobType").length; i++){
			jobTypeList.push($(".jobType").eq(i).val());
		} */
		
		$.ajax({
			type: "GET",
			url: "${pageContext.request.contextPath}/comJob/manageJobInfoList/"+page+"",
			dataType: "json",
			data: {"jobTitle": jobTitle, "jobLocation": jobLocation, 
				"jobPayType": jobPayType, "jobPayAmount":jobPayAmount, "order": order},
			sccuess: function(){
				alert("성공!");
			},
			error: function(){
				alert("오류 발생");
			}
		});
	}); 
});


function updateClick(e){ 
	alert("정말로 마감하시겠습니까?");
 	location.href="<c:url value='/comJob/updateJobInfoPeriodForEnd/"+e+"'/>";
}

function deleteClick(e){ 
	alert("정말로 삭제하시겠습니까?");
 	location.href="<c:url value='/comJob/deleteJobInfo/"+e+"'/>";
}

</script>
</body>
</html>