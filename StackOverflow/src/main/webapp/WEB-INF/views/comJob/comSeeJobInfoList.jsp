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
<title>채용 공고 목록</title>
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
 
 #fav{
   cursor: pointer;
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
	 <h2>채용 공고 찾기</h2>
	</div>
	
	<div class="right">
	  <input type="button" value="채용 공고 관리" onclick="location.href='<c:url value="/comJob/manageJobInfoList/1"/>'">
	  <input type="button" value="새로운 채용 공고 작성" onclick="location.href='<c:url value="/comJob/writeJobInfo"/>'">
    </div>


	 <div class="left">
	 	<div class="leftup">
	 		<form action="<%=request.getContextPath()%>/comJob/seeJobInfoList/1" id="searchForm" method="get">
	 		<label>제목</label>
	 		<input type="text" name="jobTitle" value="${search.jobTitle eq null? '' : search.jobTitle}"><br>
	 		
	 		<label>고용 형태</label>
	 		 <input type="checkbox" name="jobType" value="permanent" ${search.jobTypeList[0] eq 'permanent'? 'checked' : ''}>정규직
			 <input type="checkbox" name="jobType" value="contract" ${search.jobTypeList[0] || search.jobTypeList[1] eq 'contract'? 'checked' : ''}>계약직
			 <input type="checkbox" name="jobType" value="intern" ${search.jobTypeList[0] || search.jobTypeList[1] || search.jobTypeList[2] eq 'intern'? 'checked' : ''}>인턴직
			 <input type="checkbox" name="jobType" value="partTimeJob" ${search.jobTypeList[0] || search.jobTypeList[1] || search.jobTypeList[2] || search.jobTypeList[3] eq 'partTimeJob'? 'checked' : ''}>아르바이트<br>
			 
			<label>근무 지역</label> 
		     <input type="text" name="jobLocation" id="jobLocation" value="${search.jobLocation eq null? '' : search.jobLocation}"><br>
		     
		     <label>급여 조건</label>
			 <input type="radio" name="jobPayType" value="year" ${jobInfo.jobPayType eq 'year'? 'checked' : ''}>연(Year)
			 <input type="radio" name="jobPayType" value="month" ${jobInfo.jobPayType eq 'month'? 'checked' : ''}>월(Month)
			 <input type="radio" name="jobPayType" value="day" ${jobInfo.jobPayType eq 'day'? 'checked' : ''}>일(Day)
			 <input type="text" name="jobPayAmount" value="${search.jobPayAmount eq null? '' : search.jobPayAmount}"><br>
			 
			 <label>관련 태그</label>
			 <input type="text" name="jobTagList">
			 <input type="button" value="태그선택"  onclick=""><br>
			 <input type="hidden" name="order" id="order">
			 
			 <input type="submit" value="검색">
			 </form>
	    </div>
	    <div>
			<select id="select" style="float:right;">
				<option value="jobRegisterDate" ${search.order eq 'jobRegisterDate'? 'selected' : ''}>등록날짜순</option> 
				<option value="jobTitle"  ${search.order eq 'jobTitle'? 'selected' : ''}>이름순</option>
			</select>
	    </div>
	
	 
	   <div>
		<c:if test ="${jobInfoListView == null}">
		<p>등록된 회원정보가 없습니다<p>
		</c:if>
		
		<c:if test = "${jobInfoListView != null}">
		<table width="100%">
		    <c:forEach var="jobInfo" items="${jobInfoListView.jobInfoList}" >
			    <tr>
					  <%-- <td>${jobInfo.jobNo}</td> --%>
					  	<td style="width:5%;"><img src="<c:url value='/jobimage/unfav.png'/>" width="30px;" id="fav" value="${jobInfo.jobNo}"/></td>
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
			   <tr>
			</c:forEach>
			
				<tr>
					 <td colspan="11">
					   <% JobInfoListView jobInfoListView = (JobInfoListView)request.getAttribute("jobInfoListView");%>
					   <% for(int i=1; i<jobInfoListView.getPageTotalCount(); i++){ %>
					    <a href="<%=request.getContextPath()%>/comJob/seeJobInfoList/<%=i%>">[<%=i%>]</a>
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
</body>
</html>

<script>
$(function(){
	
	$("#select").change(function(){
 		
		var order = $(this).val();
		$("#order").attr("value", order);
		document.getElementById("searchForm").submit();
		/* $("#searchForm").submit(); */
		/* documnet.searchForm.submit(); */
	}); 
	
});
</script>