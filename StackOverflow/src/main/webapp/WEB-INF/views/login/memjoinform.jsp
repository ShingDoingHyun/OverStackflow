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

    body {
            margin: 0px;
            background: #f5f6f7;
        }
 
        #naver {
            width: 768px;
            margin: 0 auto;
        }
 
        #header img {
            display: block;
            width: 240px;
            height: 44px;
            padding: 64px 0 59px;
            margin: 0 auto;
        }
 
        #container {
            width: 460px;
            margin: 0 auto;
        }
 
        #container label {
            font-size: 14px;
            font-weight: bold;
            margin-top: 30px;
        }
 
        .box {
            width: 438px;
            background: rgb(255, 255, 255);
            border: 1px solid rgb(218, 218, 218);
            padding: 10px;
            margin-top: 8px;
            margin-bottom: 5px;
        }
 
        .input {
            border: none;
            width: 310px;
            height: 30px;
            padding: 0 3px;
            font-size: 15px;
        }
 
        #idBox span {
            font-family: Dotum;
            font-weight: 100;
            color: #8e8e8e;
            padding-left: 15px;
        }
 
        #pwdBox img,
        #pwdCheckBox img {
            float: right;
            margin-right: 10px;
            margin-top: 3px;
        }
 
        #pwdCheckBox {
            margin-bottom: 5px;
        }
        #redCheck_pwdCheck{
            margin-bottom: 30px;
        }
 
        #birth input {
            font-size: 15px;
            width: 116px;
            height: 27px;
            padding: 12px 15px;
            margin: 8px 0;
 
            background: rgb(255, 255, 255);
            border: 1px solid rgb(218, 218, 218);
 
            margin-bottom: 5px;
        }
 
        #birth input:nth-child(1) {
            margin-right: 5px;
        }
 
        #birth select {
            font-size: 15px;
            width: 142px;
            height: 54px;
            margin-top:8px;
            margin-bottom: 5px;
            margin-right: 5px;
 
            background: rgb(255, 255, 255);
            border: 1px solid rgb(218, 218, 218);
 
            color: #8e8e8e;
 
        }
 
 
        #sex input {
            display: none;
        }
 
        #sex label {
            background: white;
            padding: 15px 98px;
            display: inline-block;
 
            margin-top: 8px;
            margin-bottom: 15px;
            cursor: pointer;
 
            border: 1px solid rgb(218, 218, 218);
 
            color: #8e8e8e;
            font-weight: normal;
        }
 
        #phoneSel {
            width: 100%;
            height: 50px;
            display: block;
            padding: 10px 0;
 
            font-size: 15px;
            border: 1px solid rgb(218, 218, 218);
 
            margin-top: 8px;
 
        }
 
        #phoneBox {
            margin: 10px 0;
            width: 304px;
        }
 
        #phoneBox input {
            color: #8e8e8e;
        }
 
        #phoneBtn {
            padding: 16px 13px;
            float: right;
            margin-top: 10px;
            color: #fff;
            background: #08a600;
            border: none;
            font-size: 15px;
 
            cursor: pointer;
        }
 
        #phone{
        width: 300px;
        }
 
        #serialBox,
        #serialBox input {
            background: rgb(247, 247, 247);
            color: #8e8e8e;
        }
 
        #send {
            width: 100%;
            height: 55px;
            border: none;
 
            font-size: 20px;
            font-weight: normal;
            color: #fff;
            background: #08a600;
 
            margin-top: 10px;
        }
 
 
        #footer {
            margin: 0px;
            margin-bottom:10px;
            padding: 0px;
            text-align: center;
        }
 
        #footer ul {
            padding: 0px;
            margin-top: 30px;
            margin-bottom: 9px;
        }
 
        #footer ul li {
            list-style: none;
            display: inline;
        }
 
        #footer ul li a {
            text-decoration: none;
            padding: 0 4px;
            border-right: 1px solid #ccc;
 
            font-size: 12px;
            color: #333;
        }
 
        #footer img {
            width: 63px;
            margin-bottom: -4px;
        }
 
        #footer label {
            font-size: 10px;
            color: #333;
        }
 
        .redCheck {
            font-size:12px;
            margin-top: 0px;
            margin-bottom: 15px;
}
    #blah{
		width:150px;
	}
/* 	h5{
float:auto;
} */
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

<div id="container">
<h2 style="margin-bottom:30px; margin-bottom:-10px;">개인회원가입</h2>
<h5 style="margin-left:300px;margin-bottom:0px">*는 필수 입력 정보입니다</h5><br>


<form action="memJoinFormTest" method="POST" enctype="multipart/form-data">

                <div id="idBox" class="box" style="padding-bottom:10px">
                    <input type="text" name="memberId" placeholder="아이디 *" class="input" style="width:250px;">
                    <span>@overstackflow.com</span>
                </div>
                <p id="redCheck_id" class="redCheck"></p>
                
                
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