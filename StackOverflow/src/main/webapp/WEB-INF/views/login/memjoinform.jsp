<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!----------------------header--------------------------------------->
	<%@ include file="../commons/header.jspf" %>
	<!----------------------header End--------------------------------------->

	<!----------------------left menu--------------------------------------->
	<%@ include file="../commons/left.jspf" %>
	<!----------------------left menu End--------------------------------------->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	#blah{
		width:150px;
	}
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
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" href="css/index.css" type="text/css" media="all" />
<title>Insert title here</title>
<script type="text/javascript">
        
        // 사진첨부시 사진 미리보기
        $(function() {
            $("#imgInp").on('change', function(){
                readURL(this);
            });
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                    $('#blah').attr('src', e.target.result);
                }

              reader.readAsDataURL(input.files[0]);
            }
        }
        
        //생년월일 클릭시 달력
        $(function() {
        	  $( "#datepicker" ).datepicker({
        	    dateFormat: 'yy.mm.dd',
        	    prevText: '이전 달',
        	    nextText: '다음 달',
        	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        	    dayNames: ['일','월','화','수','목','금','토'],
        	    dayNamesShort: ['일','월','화','수','목','금','토'],
        	    dayNamesMin: ['일','월','화','수','목','금','토'],
        	    showMonthAfterYear: true,
        	    changeYear: true,
        	    yearRange: "1920:2025"
        	   
        	  });
        	});

    </script>
</head>
<body>
<div class="main">
<h1>개인회원가입</h1>

<form action="memJoinFormTest" method="POST" enctype="multipart/form-data">
	<input type="text" name="memberId"placeholder="아이디*"><br>
	<input type="password" name="memberPwd" placeholder="비밀번호(6~16자의 영문,숫자,특수기호)*"><br>
	<input type="password" name="memberPwd2" placeholder="비밀번호확인"><br>
	<input type="text" name="memberName" placeholder="이름(실명)*"><br>
	<input type="text" name="memberNickname" placeholder="닉네임*"><br>
	<input type="file" id="imgInp" name="memberPhotoFile">
	<img id="blah" src="#" alt="your image"/><br>
	성별 <input type="radio" name="memberGender" value="남"> 남
	<input type="radio" name="memberGender" value="여"> 여 <br>
	휴대폰번호 <input type="text" name="memberPhone" placeholder="휴대폰 번호 -없이"><br> 
	생년월일<input type="Date" name="memberBirth"><br>
	
	
	<input type="checkbox" id="Allagreebox"> 전체동의 <br>
	<input type="checkbox" id="ageebox1"> 이용약관 <br>
	<input type="checkbox" id="Allagreebox"> 개인정보 수집 및 이용<br>
	<input type="submit" value="동의하고 회원가입">
</form>
</div>

<script>

	

</script>

<%@ include file="../commons/footer.jspf" %>
</body>
</html>