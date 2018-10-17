<%@page import="com.bit.op.osf.job.model.JobInfoListView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
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

#tttable th, #tttable td {
   border-bottom: 1px solid #777777;
   padding-top: 15px;
   padding-bottom: 15px;
   font-size: 14px;
   width: 10%;
 }
	 
#tttable tr:hover{
	opacity: 0.5;
}

.hover:hover{
	opacity: 0.5;
}

.editDate{
 	display:none;
 	
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
	<div class="left">
	 <h2>채용 공고 관리</h2>
	</div>
	
	<div class="right">
	  <button>
	  	<a href="<c:url value="/comJob/writeJobInfo"/>">새로운 채용 공고 작성</a>
	  </button>
	  <button>
	  	<a href="<c:url value="/comJob/manageJobAppList/0"/>">지원자 관리</a>
	  </button>
    </div>
	
	 <div class="left">
 	 	<div class="leftup">
	     <form action="<%=request.getContextPath()%>/comJob/manageJobInfoList/1" id="searchForm" method="get">
	  		<table>
	 		<tr>
	 		<td><label>제목</label></td>
	 		<td><input type="text" name="jobTitle" style="width:60%;margin-bottom: 1%;" value="${search.jobTitle eq null? '' : search.jobTitle}"></td>
	 		</tr>
	 		
	 		<tr>
	 		<td><label>고용 형태</label></td>
	 		<td>
	 		 <input type="checkbox" name="jobType" value="permanent" ${search.jobTypeList[0] eq 'permanent'? 'checked' : ''}>정규직 &nbsp;
			 <input type="checkbox" name="jobType" value="contract" ${search.jobTypeList[0] || search.jobTypeList[1] eq 'contract'? 'checked' : ''}>계약직 &nbsp;
			 <input type="checkbox" name="jobType" value="intern" ${search.jobTypeList[0] || search.jobTypeList[1] || search.jobTypeList[2] eq 'intern'? 'checked' : ''}>인턴직 &nbsp;
			 <input type="checkbox" name="jobType" value="partTimeJob" style="margin-bottom:1%;" ${search.jobTypeList[0] || search.jobTypeList[1] || search.jobTypeList[2] || search.jobTypeList[3] eq 'partTimeJob'? 'checked' : ''}>아르바이트 &nbsp;
			</td>
			</tr>
			
			<tr>
			<td><label>근무 지역</label></td>
		    <td><input type="text" name="jobLocation"  style="width:60%; margin-bottom: 1%;" value="${search.jobLocation eq null? '' : search.jobLocation}"></td>
		    </tr>
		    
		    <tr>
		     <td><label>급여 조건</label></td>
		     <td>
			 <input type="radio" name="jobPayType" value="year" ${jobInfo.jobPayType eq 'year'? 'checked' : ''}>연(Year) &nbsp;
			 <input type="radio" name="jobPayType" value="month" ${jobInfo.jobPayType eq 'month'? 'checked' : ''}>월(Month) &nbsp;
			 <input type="radio" name="jobPayType" value="day" ${jobInfo.jobPayType eq 'day'? 'checked' : ''}>일(Day) &nbsp;
			 <input type="text" name="jobPayAmount" style="margin-bottom: 1%;" value="${search.jobPayAmount eq null? '' : search.jobPayAmount}"><br>
		     <input type="hidden" name="order" id="order">
			</td>
			</tr>
			
<!-- 	    <tr>
			 <td><label>관련 태그</label></td>
			 <td>
			 <input type="text" name="jobTagList">
			 <input type="button" value="태그선택"  onclick=""><br>
			 <input type="hidden" name="order" id="order">
			 </td>
			</tr> -->
			 
			<tr>
			 <td colspan="2" style="text-align:center;"><input type="submit" value="검색"></td>
			 </tr>
			</table>
		</form>
		</div>
		
		<div>
			<select id="select" style="float:right;">
				<option value="jobRegisterDate" ${search.order eq 'jobRegisterDate'? 'selected' : ''}>등록날짜순</option> 
				<option value="jobTitle"  ${search.order eq 'jobTitle'? 'selected' : ''}>이름순</option>
			</select>
	    </div>
	
	 	
	 	<div>
		<c:if test="${jobInfoListView == null}">
		<p>등록된 정보가 없습니다<p>
		</c:if>
		
		<c:if test="${jobInfoListView != null}">
		<table width="100%" id="tttable">
			<tr>
				<td style="width:20%;">채용공고 제목</td>
				<td>모집분야</td>
				<td>등록일</td>
				<td>근무 지역</td>
				<td>근무 시간</td>
				<td>급여 조건</td>
				<td>마감일</td>
			</tr>
		
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
						<c:if test="${jobInfo.endedJob == 'N'}">
						<td><span class="end">${jobInfo.jobDueDate}</span></td>
						</c:if>
						<c:if test="${jobInfo.endedJob == 'Y'}">
						<td><span class="end" style="color:red; text-align:center;">마감</span></td>
						</c:if> 
						<%-- <td>${jobInfo.jobDueDate}</td> --%>
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
 		
		var order = $(this).val();
		$("#order").attr("value", order);
		document.getElementById("searchForm").submit();
		/* $("#searchForm").submit(); */
		/* documnet.searchForm.submit(); */
	}); 
});


/* function submit(){
	var order = $(this).val();
	$("#order").attr("value", order);
	documnet.searchForm.submit();
} */

function updateClick(e){ 
	alert("정말로 마감하시겠습니까?");
 	location.href="<c:url value='/comJob/updateJobInfoPeriodForEnd/"+e+"'/>";
}

function deleteClick(e){ 
	alert("정말로 삭제하시겠습니까?");
 	location.href="<c:url value='/comJob/deleteJobInfo/"+e+"'/>";
}

</script>
<!----------------------My Script End--------------------------------------->
</body>
</html>