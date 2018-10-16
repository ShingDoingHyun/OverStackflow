<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/index.css" type="text/css" media="all" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="<%=request.getContextPath()%>/summernote/summernote.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/summernote/summernote.min.js"></script>
<script src="<%=request.getContextPath()%>/summernote/lang/summernote-ko-KR.js"></script>

<title>채용 공고 작성</title>
 <style>
	 .main {
	    display: inline-block;
	    height: 100%;
	    width: 70%;
	    margin-top: 20px;
	}
	
	#accordian li{ 
	 list-style:none; 
	}
	
    /*  li > div{ display:none;}  */
	
	#accordian li >h1{ 
	cursor:pointer;
	font-size: 30px;
	border: 1px solid black;
	}
	
	#accordian ul{
	 padding-left: 0px;
	}
	
	#accordian{
	border: 1px solid black;
	width: 100%;
	}
	
	#accordian #title{
	margin: 0px auto;
	text-align: center;
	}

</style>
</head>
<body>
<div>
<!----------------------header--------------------------------------->
<%@ include file="../commons/header.jspf" %>
<!----------------------header End--------------------------------------->


<!----------------------left menu--------------------------------------->
<%@ include file="../commons/left.jspf" %>
<!----------------------left menu End--------------------------------------->

<!----------------------main--------------------------------------->

<div class="main">
	<form action="<%=request.getContextPath()%>/comJob/writeJobInfo" method="post" name="jobForm" >
	<div id="accordian">
	 	<h1 id="title"> 채용 공고 작성</h1>
		<ul>
			<li>
				<h1>모집 부문 및 자격 요건<span class="ico_ar">▼</span></h1>
					<div>
					 <label>채용 제목</label>
					 <input type="text" name="jobTitle"><br>
					 
					 <label>모집 분야</label>
					 <input type="text" name="jobField"><br>
					 
					 <label>고용 형태</label>
					 <input type="checkbox" name="jobType" value="permanent">정규직
					 <input type="checkbox" name="jobType" value="contract">계약직
					 <input type="checkbox" name="jobType" value="intern">인턴직
					 <input type="checkbox" name="jobType" value="partTimeJob">아르바이트<br>
					 
					 <label>담당 업무</label>
					 <textarea name="jobRequiredTask" ></textarea><br>
					 
					 <label>지원 자격</label>
					 <textarea name="jobQualification" ></textarea><br>
					 
					 <label>관련 태그</label>
					 <input type="text" name="jobTagList">
					 <input type="button" value="태그선택"  onclick="" ><br>
					</div>
			</li>
			
			<li>
				<h1>근무 조건 및 환경<span class="ico_ar">▼</span></h1>
					<div>
					 <label>근무 지역</label> 
					 <input type="checkbox" value="기본 회사 주소와 동일">기본 회사 주소와 동일<br> 
					 <input type="text" name="jobLocation" id="jobLocation">
					 <input type="text" name="jobZipcode" id="jobZipcode">
					 <input type="button" value="위치 찾기" id="jobLo" onclick="findJobLocation()"><br>
					 
					 <label>근무 시간</label>
					 <input type="text" name="jobWorkTime"><br>
					 
					 <label>급여 조건</label>
					 <input type="radio" name="jobPayType" value="year">연(Year)
					 <input type="radio" name="jobPayType" value="month">월(Month)
					 <input type="radio" name="jobPayType" value="day">일(Day)<br>
					 <input type="text" name="jobPayAmount"><br>
					 
					 <label>복리 후생</label>
					 <textarea name="jobBenefits" ></textarea><br>
					</div>
			</li>
			
			<li>
				<h1>내용 작성 및 첨부 파일 업로드<span class="ico_ar">▼</span></h1>
					<div>
				      <label>채용 공고 내용</label>
				      <textarea name="jobContent" class="summernote"></textarea> 
					</div>
			</li>
			
			<li>
				<h1>기업 정보<span class="ico_ar">▼</span></h1>
					<div>
					  <label>회사 아이디</label>
					  <input type="text"  name="comId" value="${comMember.comId}"><br>  <!-- hidden -->
						
					  <label>회사 이름</label>
					  <input type="text" value="${comMember.comName}" readonly="readonly"><br>
					  
					  <label>회사 위치</label>
					  <input type="text"  value="${comMember.comAddress}" readonly="readonly">
					  <input type="text"  value="${comMember.comZipcode}" readonly="readonly"><br>
					  
					  <label>연락처</label>
					  <input type="text" value="${comMember.comCall}" readonly="readonly"><br>
					  
					  <label>회사 소개</label>
					 <textarea name="comIntroduction" class="summernote" value="${comMember.comIntroduction}"></textarea><br>
					</div>
			</li>
			
			<li>
				<h1>접수 기간 및 방법<span class="ico_ar">▼</span></h1>
					<div>
					  <label>접수 마감 날짜</label>
					  <input type="Date" name="jobDueDate"><br>
					  
					  <label>접수 방법</label>
					  <input type="radio" name="jobApplyType" value="homepageURL">자사 홈페이지에서 접수
					  <input type="text" name="jobHomePageUrl" value="${comMember.comHomePageUrl}"><br>
					  
					  <input type="radio" name="jobApplyType" value="email">담당자 이메일로 바로 접수
					  <input type="text" name="jobChargerSendEmail" value="${comMember.comChargerEmail}"><br>
					  
					  <input type="radio" name="jobApplyType" value="etc">기타
					  <textarea name="jobEtc"></textarea><br>
					  
					  <label>담당자 이름</label>
					  <input type="text" name="jobChargerName" value="${comMember.comChargerName}"><br>
					  
					  <label>담당자 이메일</label>
					  <input type="text" name="jobChargerEmail"  value="${comMember.comChargerEmail}">
					  
					</div>
			</li>
		</ul>
	<input type="submit" value="확인"> 
	<input type="button" onclick="" value="취소">
	</div>
	</form>
	</div>
</div>


<!----------------------main end--------------------------------------->

<!----------------------footer--------------------------------------->
	<%@ include file="../commons/footer.jspf" %>
<!----------------------footer End--------------------------------------->
<script>

$(function(){
	//아코디언 형식
	$("#accordian h1").click(function(){
		$("#accordian ul div").slideUp();
		/* $('.ico_ar').css('transform','none'); */
		if(!$(this).next().is(":visible"))
		{
			$(this).next().slideDown(); 
		} 
	})
	
	var str1 = document.jobForm.jobRequiredTask.val();
	var str2 = document.jobForm.jobQualification.val();
	var str3 = document.jobForm.jobBenefits.val();
	var str5 = document.jobForm.jobEtc.val();
	
	alert(str1);
	alert(str2);
	
	$(".summernote").summernote({
				lang : "ko-KR",
				height : 300,
				width : 600,
				fontNames : [ "맑은고딕", "Arial", "Arial Black",
						"Comic Sans MS", "Courier New", ],
				fontNamesIgnoreCheck : [ "맑은고딕" ],
				focus : true,
				callbacks: {
					onImageUpload: function(files, editor, welEditable) {
			            for (var i = files.length - 1; i >= 0; i--) {

			            	sendFile(files[i], this);
			            }
			        }
				}
				
	});
});

function sendFile(file, el) {
	var form_data = new FormData();
	form_data.append("file", file);

  	$.ajax({
    	data: form_data,
    	type: "POST",
    	url: "imageUpload",
    	cache: false,
    	contentType: false,
    	enctype: "multipart/form-data",
    	processData: false,
    	dataType:"text",
    	success: function(img_name) {

    		$(".summernote").summernote("insertImage", getContextPath()+img_name);
    	}
  	});
}

function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf("/", hostIndex + 1) );
};
 
 
//Daum 주소 API
function findJobLocation(){   
	    var width=500;
	    var height=600;
	    
	    daum.postcode.load(function(){
	        new daum.Postcode({
	            oncomplete: function(data){
	                $("#jobZipcode").val(data.postcode);
	                $("#jobLocation").val(data.address);
	            }
	        }).open({
	            left: (window.screen.width/2)-(width/2),
	            top: (window.screen.height/2)-(height/2)
	        });
	    });
	}
	

</script>

<!-- 우편번호 찾기 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	 
</div>
</body>
</html>


