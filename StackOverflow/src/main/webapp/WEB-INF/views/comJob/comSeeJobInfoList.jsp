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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.cookie.js"></script>	
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
	 
     <div style="border:1px solid black; width:300px; height:200px;margin-left:80px; margin-top:63px">
     <p style="text-align: center; border-bottom:1px solid black; padding: 10px 0 10px 0; margin-top: 0; margin-bottom:0; font-size: 14px;">나의 채용 공고</p>
       <c:if test="${myJobInfoListView != null}">	
     	<c:forEach var="myJobInfo" items="${myJobInfoListView.jobInfoList}">
     	 <td style="width:20%;"><a href="<c:url value="/comJob/seeJobInfo/${myJobInfo.jobNo}"/>" style="font-size:14px;">${myJobInfo.jobTitle}</a></td><br>
     	</c:forEach>
       </c:if>
     </div>
     <div style="border:1px solid black; width:300px; height:200px;margin-left:80px; margin-top:30px">
     <p style="text-align: center; border-bottom:1px solid black; padding: 10px 0 10px 0; margin-top: 0; margin-bottom:0; font-size: 14px;">즐겨찾기한 채용 공고</p>
     	<div id="jobFavList">
     	<c:if test="${myFavJobInfoList != null}">	
	     	<c:forEach var="myFavJobInfo" items="${myFavJobInfoList}">
	     	 <td style="width:20%;"><a href="<c:url value="/comJob/seeJobInfo/${myFavJobInfo.jobNo}"/>" style="font-size:14px;">${myFavJobInfo.jobTitle}</a></td><br>
	     	</c:forEach>
     	</c:if>
     	</div>
     </div>
     <div style="border:1px solid black; width:300px; height:200px;margin-left:80px; margin-top:30px">
     <p style="text-align: center; border-bottom:1px solid black; padding: 10px 0 10px 0; margin-top: 0; margin-bottom:0; font-size: 14px;">방문한 채용공고</p>
   	    <c:if test="${visitJobInfoList != null}">	
	     	<c:forEach var="visitJobInfo" items="${visitJobInfoList}">
	     	 <td style="width:20%;"><a href="<c:url value="/comJob/seeJobInfo/${visitJobInfo.jobNo}"/>" style="font-size:14px;">${visitJobInfo.jobTitle}</a></td><br>
	     	</c:forEach>
     	</c:if>
     </div>
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
	   	<table width="100%">
	   		<tr> 
	   			<td style="width:5%;"></td>
	   			<td style="width:20%;">채용공고 제목</td>
	   			<td>모집분야</td>
	   			<td>등록일</td>
	   			<td>근무 지역</td>
	   			<td>근무 시간</td>
	   			<td>급여 조건</td>
	   			<td>마감일</td>
	   			
	   		</tr>
	   	</table>
		<c:if test ="${jobInfoListView == null}">
		<p>등록된 회원정보가 없습니다<p>
		</c:if>
		
		<c:if test = "${jobInfoListView != null}">
		<table width="100%">
		    <c:forEach var="jobInfo" items="${jobInfoListView.jobInfoList}" varStatus="status">
		    	<c:if test="${jobInfo.endedJob == 'N'}" >
			    <tr>
					  <%-- <td>${jobInfo.jobNo}</td> --%>
					    <!-- 즐겨찾기 -->
					  	<td style="width:5%;">
						  	<a href="javascript:clickFav('${jobInfo.jobNo}','${status.index}');">
						  		<c:if test="${jobInfo.favJobInfo > 0}">
						  		 <img src="<c:url value='/img/fav.png'/>" width="30px;" style="cursor:pointer;" class="fav${status.index}" name="fav"/>
						  		</c:if>
						  		<c:if test="${jobInfo.favJobInfo <= 0}">
						  		 <img src="<c:url value='/img/unFav.png'/>" width="30px;" style="cursor:pointer;" class="fav${status.index}" name="unFav"/>
						  		</c:if>
						  	</a>
					  	</td>
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
	
						<%-- <td>${jobInfo.jobZipcode}</td>  --%>
				</tr>
				</c:if>
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