<%@page import="com.bit.op.osf.job.model.JobInfoListView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<!--//Metis Menu -->

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.cookie.js"></script>	
<title>채용 공고 목록</title>
<style>
	/* 우리가 추가한 스타일 */
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
	
	table{
	   width: 100%;
	   border-collapse: collapse;
	 }
	 
	 #ttable{
	   padding-top: 15px;
	   padding-bottom: 15px;
	 }
	 
	 #ttable:hover{
	 	opacity: 0.5;
	 }
	 
	 .hover:hover{
	 	opacity: 0.5;
	 }
	 
	 #fav{
	   cursor: pointer;
	 }
	 
/*  	input[type=button]{
		border: 0;
		outline: 0;
		height: 25px;
		margin-right: 4px;
	}  */
	 
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
<div class="main-page" style="margin-right:6%;">
<div class="main">
	<div class="left">
	 <h2>채용 공고 찾기</h2>
	</div>
	
	<div class="right">
	  <input type="button" value="채용 공고 관리" onclick="location.href='<c:url value="/comJob/manageJobInfoList/1"/>'">
	  <input type="button" value="새로운 채용 공고 작성" onclick="location.href='<c:url value="/comJob/writeJobInfo"/>'">
	 
     <div style="border:1px solid black; width:300px; height:200px;margin-left:80px; margin-top:63px">
     <p style="text-align: center; border-bottom:1px solid black; padding: 10px 0 10px 0; margin-top: 0; margin-bottom:0; font-size: 14px; padding-right: 1%;">나의 채용 공고</p>
       <c:if test="${myJobInfoListView != null}">	
     	<c:forEach var="myJobInfo" items="${myJobInfoListView.jobInfoList}">
     	 <td style="width:20%;"><a href="<c:url value="/comJob/seeJobInfo/${myJobInfo.jobNo}"/>" style="font-size:14px;" class="hover">${myJobInfo.jobTitle}</a></td><br>
     	</c:forEach>
       </c:if>
     </div>
     <div style="border:1px solid black; width:300px; height:200px;margin-left:80px; margin-top:30px">
     <p style="text-align: center; border-bottom:1px solid black; padding: 10px 0 10px 0; margin-top: 0; margin-bottom:0; font-size: 14px;">즐겨찾기한 채용 공고</p>
     	<div id="jobFavList">
     	<c:if test="${myFavJobInfoList != null}">	
	     	<c:forEach var="myFavJobInfo" items="${myFavJobInfoList}">
	     	 <td style="width:20%;"><a href="<c:url value="/comJob/seeJobInfo/${myFavJobInfo.jobNo}"/>" style="font-size:14px; padding-right: 1%;" class="hover">${myFavJobInfo.jobTitle}</a></td><br>
	     	</c:forEach>
     	</c:if>
     	</div>
     </div>
     <div style="border:1px solid black; width:300px; height:200px;margin-left:80px; margin-top:30px">
     <p style="text-align: center; border-bottom:1px solid black; padding: 10px 0 10px 0; margin-top: 0; margin-bottom:0; font-size: 14px; padding-right: 1%;">방문한 채용공고</p>
   	    <c:if test="${visitJobInfoList != null}">	
	     	<c:forEach var="visitJobInfo" items="${visitJobInfoList}">
	     	 <td style="width:20%;"><a href="<c:url value="/comJob/seeJobInfo/${visitJobInfo.jobNo}"/>" style="font-size:14px;" class="hover">${visitJobInfo.jobTitle}</a></td><br>
	     	</c:forEach>
     	</c:if>
     </div>
    </div>


	 <div class="left">
	 	<div class="leftup">
	 		<form action="<%=request.getContextPath()%>/comJob/seeJobInfoList/1" id="searchForm" method="get">
	 		<table>
	 		<tr style="margin-top: 2%; margin-bottom:2%;">
	 		<td><label>제목</label></td>
	 		<td><input type="text" name="jobTitle" style="width:60%; margin-bottom: 1%;" value="${search.jobTitle eq null? '' : search.jobTitle}"></td>
	 		</tr>

	 		<tr>
	 		<td><label>고용 형태</label></td>
	 		<td>
	 		 <input type="checkbox" name="jobType" value="permanent" ${search.jobTypeList[0] eq 'permanent'? 'checked' : ''}> 정규직 &nbsp;
			 <input type="checkbox" name="jobType" value="contract" ${search.jobTypeList[0] || search.jobTypeList[1] eq 'contract'? 'checked' : ''}> 계약직 &nbsp;
			 <input type="checkbox" name="jobType" value="intern" ${search.jobTypeList[0] || search.jobTypeList[1] || search.jobTypeList[2] eq 'intern'? 'checked' : ''}> 인턴직 &nbsp;
			 <input type="checkbox" name="jobType" value="partTimeJob" style="margin-bottom:1%;" ${search.jobTypeList[0] || search.jobTypeList[1] || search.jobTypeList[2] || search.jobTypeList[3] eq 'partTimeJob'? 'checked' : ''}> 아르바이트 &nbsp;<br>
			</td>
			</tr>
			
			<tr>
			<td><label>근무 지역</label></td>
		    <td><input type="text" name="jobLocation" id="jobLocation" style="width:60%; margin-bottom: 1%;" value="${search.jobLocation eq null? '' : search.jobLocation}"></td>
		    </tr>

		    <tr>
		     <td><label>급여 조건</label></td>
		     <td>
			 <input type="radio" name="jobPayType" value="year" ${jobInfo.jobPayType eq 'year'? 'checked' : ''}>연(Year) &nbsp;
			 <input type="radio" name="jobPayType" value="month" ${jobInfo.jobPayType eq 'month'? 'checked' : ''}>월(Month) &nbsp;
			 <input type="radio" name="jobPayType" value="day" ${jobInfo.jobPayType eq 'day'? 'checked' : ''}>일(Day) &nbsp;&nbsp;&nbsp;
			 <input type="text" name="jobPayAmount" style="margin-bottom: 1%;" value="${search.jobPayAmount eq null? '' : search.jobPayAmount}">&nbsp;&nbsp;<span style="color:gray;">만원+</span>
			 <input type="hidden" name="order" id="order">
			 </td>
			</tr>
			
		     <tr>
			 <td colspan="2" style="text-align:center;"><input type="submit"  value="검색" ></td>
			 <tr>
			 </table>
			 </form>
	    </div>
	    <div>
			<select id="select" style="float:right; margin-bottom: 2%;">
				<option value="jobRegisterDate" ${search.order eq 'jobRegisterDate'? 'selected' : ''}>등록날짜순</option> 
				<option value="jobTitle"  ${search.order eq 'jobTitle'? 'selected' : ''}>이름순</option>
			</select>
	    </div>
	
	 <!-- 본격 -->
	   <div>
		<c:if test ="${jobInfoListView == null}">
		<p>등록된 회원정보가 없습니다<p>
		</c:if>
		
		<c:if test = "${jobInfoListView != null}">
		    <c:forEach var="jobInfo" items="${jobInfoListView.jobInfoList}" varStatus="status">
		    	<c:if test="${jobInfo.endedJob == 'N'}" >
		    	<div style="padding-top:30px; padding-bottom: 30px; padding-right:5%; border-bottom: 1px solid gray;">
				<table width="100%" id="ttable">
			  	  <tr>
					  <%-- <td>${jobInfo.jobNo}</td> --%>
					    <!-- 즐겨찾기 -->
					  	<td style="width:5%;">
						  	<a href="javascript:clickFav('${jobInfo.jobNo}','${status.index}');">
						  		<c:if test="${jobInfo.favJobInfo > 0}">
						  		 <img src="<c:url value='/img/fav.png'/>" width="30px;" style="cursor:pointer; padding-right:1%;" class="fav${status.index}" name="fav"/>
						  		</c:if>
						  		<c:if test="${jobInfo.favJobInfo <= 0}">
						  		 <img src="<c:url value='/img/unFav.png'/>" width="30px;" style="cursor:pointer; padding-right:1%;" class="fav${status.index}" name="unFav"/>
						  		</c:if>
						  	</a>
						  	<a href="<c:url value="/comJob/seeJobInfo/${jobInfo.jobNo}"/>" style="font-size: 20px;font-weight:bold; color:#005999">${jobInfo.jobTitle}</a> &nbsp; <span style="font-size:14px;">${jobInfo.jobField}</span>
					    	<span style="float:right;right:3%;">${jobInfo.jobRegisterDate}</span>
					  	</td>
					</tr>
					<tr>
						<td colspan="2"><span style="color:black; font-size:14px;">${jobInfo.comName}</span> - <span style="color:gray;font-size:14px;">${jobInfo.jobLocation}</span></td>
					</tr>   
					<tr>
						<td colspan="2">
						 	<span style="color:#5fba7d; font-size:14px;">${jobInfo.jobWorkTime}</span>  
 							&nbsp;&nbsp;   
 							<span style="color:#F98C71; font-size:14px;">
							<c:if test="${jobInfo.jobPayType eq 'year'}">
								연 ${jobInfo.jobPayAmount}
							</c:if> 
							
							<c:if test="${jobInfo.jobPayType eq 'month'}">
								월 ${jobInfo.jobPayAmount}
							</c:if>
							
							<c:if test="${jobInfo.jobPayType eq 'day'}">
								일 ${jobInfo.jobPayAmount}
							</c:if>
							</span>
						</td>
					  </tr>
					  <tr style="padding-bottom:5%;">
						<td colspan="2"><span style="color:#71a5cb; font-size:14px;">마감일 ${jobInfo.jobDueDate}</span></td>
					 </tr>
				</table>
				</div>
				</c:if>
			</c:forEach>
		<table>
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
	
	$("#select").change(function(){
 		
		var order = $(this).val();
		$("#order").attr("value", order);
		document.getElementById("searchForm").submit();
		/* $("#searchForm").submit(); */
		/* documnet.searchForm.submit(); */
	}); 
	
	
	
});

var clickFav = function(jobNo, value){
    /* var value = parseInt(value) + parseInt(1);  */
	var comId = "${comInfo.comId}";
	if( comId == null || comId == "" ){
		alert("로그인 후 이용해주세요.");
	}else{
		$.ajax({
			type: "POST",
			url: getContextPath()+ "/comJob/checkJobInfoFav",
			data: {"comId": comId, "jobNo": jobNo},
			dataType: "json",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success: function(data){
				 if($(".fav"+value).attr("name")=="fav"){
	                    $(".fav"+value).attr("src" , getContextPath()+"/img/unFav.png");
	                    $(".fav"+value).attr("name", "unFav");
	                 }else{
	                    $(".fav"+value).attr("src" , getContextPath()+"/img/fav.png");
	                    $(".fav"+value).attr("name", "fav");    
	                 }
				 
				 $("#jobFavList").html("");
					$.each( data, function( key, value ) {
						$("#jobFavList").css("border", "none");
		           		$("#jobFavList").append("<a href='<c:url value='/comJob/seeJobInfo/"+value.jobNo+"'/>' style='font-size:14px;'>"+value.jobTitle+"</a><br>");
		           	});  
		    }, 
			error:function(){
				alert("오류 발생. 잠시후 다시 시도해주세요.");
			}
		}); 
	}
};

function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf("/", hostIndex + 1) );
};


//쿠키 사용
$(function(){
 	var list = new cookieList("visitJobInfo");
	console.log(getCookie("visitJobInfo")); 

});

function getCookie(cName) {
	   cName = cName + "=";
	   var cookieData = document.cookie;
	   var start = cookieData.indexOf(cName);
	   var cValue = "";
	   if(start != -1){
	       start += cName.length;
	       var end = cookieData.indexOf(';', start);
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