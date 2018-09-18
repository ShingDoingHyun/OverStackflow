<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<!----------------------header--------------------------------------->
	<%@ include file="../commons/header.jspf" %>
	<!----------------------header End--------------------------------------->


	<!----------------------left menu--------------------------------------->
	<%@ include file="../commons/left.jspf" %>
	<!----------------------left menu End--------------------------------------->

<html>
<head>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/index.css" type="text/css" media="all" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>채용 공고 작성</title>
 <style>
	#accordian li{ 
	list-style:none;
	}
	
	li > div{ display:none;}
	
	#accordian li >h1{ 
	cursor:pointer;
	font-size: 30px;
	border: 1px solid black;
	}
	
	#accordian ul{
	 padding-left: 0px;
	}
	
	#accordian{
	margin: 0px auto;
	width: 50%;
	border: 1px solid black;
	}
	
	#accordian #title{
	margin: 0px auto;
	text-align: center;
	}

</style>
</head>
<body>
<div>
<form action="<%=request.getContextPath()%>/comJob/writeJobInfo" method="post" >
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
				 <textarea  name="jobRequiredTask"></textarea><br>
				 
				 <label>지원 자격</label>
				 <textarea name="jobQualification"></textarea><br>
				 
				 <label>관련 태그</label>
				 <input type="text" name="jobTagList">
				 <input type="button" value="태그선택"  onclick="" ><br>
				</div>
		</li>
		
		<li>
			<h1>근무 조건 및 환경<span class="ico_ar">▼</span></h1>
				<div>
				 <label>근무 지역</label> 
				 <lnput type="checkbox" value="기본 회사 주소와 동일">기본 회사 주소와 동일<br> 
				 <input type="text" name="jobLocation" id="jobLocation">
				 <input type="text" name="jobZipcode" id="jobZipcode">
				 <input type="button" value="위치 찾기" id="jobLo" onclick="findJobLocation()"><br>
				 
				 <label>근무 시간</label>
				 <input type="text" name="jobWorkTime"><br>
				 
				 <label>급여 조건</label>
				 <input type="radio" name="jobPayType" value="year">연(Year)
				 <input type="radio" name="jobPayType" value="month">월(Month)
				 <input type="radio" name="jobPayType" value="Day">일(Day)<br>
				 <input type="text" name="jobPayAmount"><br>
				 
				 <label>복리 후생</label>
				 <textarea name="jobBenefits"></textarea><br>
				</div>
		</li>
		
		<li>
			<h1>내용 작성 및 첨부 파일 업로드<span class="ico_ar">▼</span></h1>
				<div>
			      <label>채용 공고 내용</label>
			      <textarea name="jobContent"></textarea>
				</div>
		</li>
		
		<li>
			<h1>기업 정보<span class="ico_ar">▼</span></h1>
				<div>
				  <label>회사 이름</label>
				  <input type="text"  readonly="readonly"><br>
				  
				  <label>회사 위치</label>
				  <input type="text"  readonly="readonly">
				  <input type="text"  readonly="readonly"><br>
				  
				  <label>연락처</label>
				  <input type="text" name="comCall" readonly="readonly"><br>
				  
				  <label>회사 소개</label>
				 <textarea name="comIntroduction"></textarea><br>
				</div>
		</li>
		
		<li>
			<h1>접수 기간 및 방법<span class="ico_ar">▼</span></h1>
				<div>
				  <label>접수 마감 날짜</label>
				  <input type="Date" name="jobDueDate"><br>
				  
				  <label>접수 방법</label>
				  <input type="radio" name="jobApplyType" value="homepageURL">자사 홈페이지에서 접수
				  <input type="text" name="jobHomePageUrl" value=""><br>
				  
				  <input type="radio" name="jobApplyType" value="email">담당자 이메일로 바로 접수
				  <input type="text" name="jobChargerEmail" value=""><br>
				  
				  <input type="radio" name="jobApplyType" value="etc">기타
				  <textarea name="jobEtc"></textarea><br>
				  
				  <label>담당자 이름</label>
				  <input type="text" name="jobChargerEmail"><br>
				  
				  <label>담당자 이메일</label>
				  <input type="text" name="jobChargerName">
				  
				</div>
		</li>
	</ul>
<input type="submit" value="확인"> 
<input type="button" onclick="" value="취소">
</div>
</form>
</div>
<script>
              
$(function(){
	//아코디언 형식
	$("#accordian h1").click(function(){
		$("#accordian ul div").slideUp();
		/* $('.ico_ar').css('transform','none'); */
		if(!$(this).next().is(":visible"))
		{
			$(this).next().slideDown(); 
			/* $(this).find('.ico_ar:eq(0)').css('transform','-');  */
		} 
	})
	
	//고용 형태
/* 	var jobTypeList = [];
	$("input[name='jobType']:checked").each(function(i){
		jobTypeList.push($(this).val());
	});
	
	if(jobTypeList.length==0){
		alert("고용 형태를 선택해주세요.");
	}else{
		$.ajax({
			type:'POST',
			url: 'insertJobType.do',
			data:{jobTypeList: jobTypeList},
			success:{},
			error: function(data){
				alert('죄송합니다. 잠시 후 다시 시도해주세요.');
				return false;
			}
		});
	} */
})

//Daum 주소 API
function findJobLocation(){   
	    var width=500;
	    var height=600;
	    
	    daum.postcode.load(function(){
	        new daum.Postcode({
	            oncomplete: function(data){
	                $('#jobZipcode').val(data.postcode);
	                $('#jobLocation').val(data.address);
	            }
	        }).open({
	            left: (window.screen.width/2)-(width/2),
	            top: (window.screen.height/2)-(height/2)
	        });
	    });
	}

</script>

<!-- 우편번호 찾기 -->
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	 
</div>
</body>
</html>

<!----------------------footer--------------------------------------->
	<%@ include file="../commons/footer.jspf" %>
<!----------------------footer End--------------------------------------->


