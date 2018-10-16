<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>OverStackFlow</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Novus Admin Panel Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- font CSS -->
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
 <!-- js-->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/modernizr.custom.js"></script>
<!--webfonts-->
<link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<!--//webfonts--> 
<!--animate-->
<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="js/wow.min.js"></script>
	<script>
		 new WOW().init();
	</script>
<!--//end-animate-->
<!-- chart -->
<script src="js/Chart.js"></script>
<!-- //chart -->
<!--Calender-->

<!--End Calender-->
<!-- Metis Menu -->
<script src="js/metisMenu.min.js"></script>
<script src="js/custom.js"></script>
<link href="css/custom.css" rel="stylesheet">
<!--//Metis Menu -->
</head> 
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

		
			<div class="main-page" style="margin-right: 100px;">
			<div id="container">
<h2 style="margin-bottom:30px; margin-bottom:-10px; margin-bottom: 20px;">개인회원가입</h2>


      <form action="memJoinFormTest" method="POST" enctype="multipart/form-data">

                <span style="margin-left: 250px;margin-bottom:0px;margin-top: 0px;">*는 필수 입력 정보입니다</span>
                <div id="idBox" class="box" style="padding-bottom:10px">
              <input type="text" name="memberId" placeholder="아이디 *" class="input" style="width:250px;">
                   <span style="padding-left:0px;">@overstackflow.com</span>
              </div>
                
                <p id="redCheck_id" class="redCheck"></p>
        <div id="idBox" class="box" style="padding-bottom:10px">
	<input type="password" name="memberPwd" class="input" placeholder="비밀번호(6~16자의 영문,숫자,특수기호)*"><br>
	</div>
	
	 <div id="idBox" class="box" style="padding-bottom:10px">
	<input type="password" name="memberPwd2" class="input" placeholder="비밀번호확인"><br>
	</div>
	
	 <div id="idBox" class="box" style="padding-bottom:10px">
	<input type="text" name="memberName" class="input" placeholder="이름(실명)*"><br>
	</div>
	
	 <div id="idBox" class="box" style="padding-bottom:10px">
	<input type="text" name="memberNickname" class="input" placeholder="닉네임*"><br>
	</div>
	
	<br><div><span>사진 업로드</span></div>
	<input type="file" id="imgInp" name="memberPhotoFile">
	
	<div style= float: right;">
	<img id="blah" src="#" alt="your image"/><br>
	</div>
	
	
	성별 <input type="radio" name="memberGender" value="남"> 남
	<input type="radio" name="memberGender" value="여"> 여 <br>
	
	
	휴대폰번호 <input type="text" name="memberPhone" class="input" placeholder="휴대폰 번호 -없이"><br> 
	
	생년월일<input type="Date" name="memberBirth"><br>
	
	
	
	<input type="checkbox" id="Allagreebox"> 전체동의 <br>
	<input type="checkbox" id="ageebox1"> 이용약관 <br>
	<input type="checkbox" id="Allagreebox"> 개인정보 수집 및 이용<br>
	<input type="submit" value="동의하고 회원가입">
</form>
</div>
			
			
			
			
			
			</div>
			
		</div>
		<!--footer-->
		
		
		
		
		
		
		<%@ include file="../commons/bfooter.jspf" %>
        <!--//footer-->
	</div>
	<!-- Classie -->
		<script src="js/classie.js"></script>
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
	<script src="js/jquery.nicescroll.js"></script>
	<script src="js/scripts.js"></script>
	<!--//scrolling js-->
	<!-- Bootstrap Core JavaScript -->
   <script src="js/bootstrap.js"> </script>
</body>
</html>