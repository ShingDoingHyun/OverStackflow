<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/index.css" type="text/css" media="all" />
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
	padding-bottom: 10px;
}

.box{
 	border: 1px solid black;
 	padding: 3px;
 	font-weight: bold;
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
<body>
<!----------------------header--------------------------------------->
<%@ include file="../commons/header.jspf" %>
<!----------------------header End--------------------------------------->


<!----------------------left menu--------------------------------------->
<%@ include file="../commons/left.jspf" %>
<!----------------------left menu End--------------------------------------->

<!----------------------main--------------------------------------->

<div class="main">

   <div class="rightbar">
   	  <a href="#mainofmain"><img src="http://icons.iconarchive.com/icons/graphicloads/100-flat-2/256/arrow-up-icon.png" width="30%"></a>
   </div>
	
   <div class="mainofmain" id="mainofmain">
	<div class="centerup">
		<c:if test="${jobInfo.comPhoto!=null}">
		<img src="<c:url value="/resources/jobimage/${jobInfo.comPhoto}"/>" width="6%;">
		</c:if>
		<div>
		<h1>${jobInfo.jobTitle}
		<c:if test="${jobInfo.endedJob == 'Y'}">
			<span style="color:red; font-size:15px;">이 채용공고는 마감되었습니다.</span>
		</c:if></h1>  
		${jobInfo.comName}<br>
		${jobInfo.jobField} <br> 
		${jobInfo.comCall}
		${jobInfo.jobLocation} <br> 
		${jobInfo.jobRegisterDate}<br>
		
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
			<p><p>
			
			<div class="box">회사 위치</div>
			<p><p>
			
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


<!----------------------main end--------------------------------------->

<!----------------------footer--------------------------------------->
	<%@ include file="../commons/footer.jspf" %>
<!----------------------footer End--------------------------------------->

<script>
$(function(){
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
</body>
</html>