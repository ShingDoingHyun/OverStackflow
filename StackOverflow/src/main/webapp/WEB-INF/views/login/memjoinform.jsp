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
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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

        .redCheck {
            font-size:12px;
            margin-top: 0px;
            margin-bottom: 15px;
}
    #blah{
		width:150px;
	}

 .box2{
            width: 245px;
            background: rgb(255, 255, 255);
            border: 1px solid rgb(218, 218, 218);
            padding: 10px;
            margin-top: 8px;
            margin-bottom: 5px;
        }
 
   #idBox span2 {
            font-family: Dotum;
            font-weight: 100;
            color: #8e8e8e;
            padding-left: 15px;
        }
        
    
        input[type=radio] {
            display: none;
        }

        input[type=radio]+label {
            display: block;
        }

        .gender-box>div {
            width: 223px;
            height: 50px;
            background: white;
            border: 1px solid #D9D9D9;
            display: inline-block;
            float: left;
            text-align: center;
            line-height: 50px;
            color: grey;
        }
        
   input[type=submit]{
    font-weight: 300 !important;
    border-radius: 4px;
    background-color: #f0ad4e;
    display: inline;
    padding: .2em .6em .3em;
    font-size: 95%;
    line-height: 1;
    color: white;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    border: 0;
    outline: 0;
    height: 25px;
   margin-right: 4px;
   font-family: inherit;
}
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

                <span><h5 style="margin-left: 270px; margin-bottom:0px; margin-top: 0px;">*는 필수 입력 정보입니다.</h5></span>
                <div id="idBox" class="box" style="padding-bottom:10px">
              <input type="text" name="memberId" placeholder="아이디 *" class="input" maxlength="20" style="width:250px;">
                   <span style="padding-left:0px;">@overstackflow.com</span>
              </div>
                
        
        <div id="idBox" class="box" style="padding-bottom:10px">
	<input type="password" name="memberPwd" class="input" maxlength="16" placeholder="비밀번호(6~16자의 영문,숫자,특수기호)*"><br>
	</div>
	
	 <div id="idBox" class="box" style="padding-bottom:10px">
	<input type="password" name="memberPwd2" class="input" maxlength="16" placeholder="비밀번호확인"><br>
	</div>
	
	 <div id="idBox" class="box" style="padding-bottom:10px">
	<input type="text" name="memberName" class="input" placeholder="이름(실명)*"><br>
	</div>
	
	 <div id="idBox" class="box" style="padding-bottom:10px">
	<input type="text" name="memberNickname" class="input" placeholder="닉네임*"><br>
	</div>
	
	<div style="margin-top:25px;"><span>사진 업로드</span></div> 
	<div id="idBox" class="box2" style="padding-bottom:10px">
	<input type="file" id="imgInp" name="memberPhotoFile">
								
	
	</div>
	<div style="border:1px;margin-left:280px;margin-top: -90px; width: 155px;height: 180px; margin-bottom:30px;">

	<img id="blah"  style="width: 155px; height: 180px;" src="<c:url value='/resources/uploadFile/memPhoto/${memInfo.memPhoto}'/>"  
						altSrc="<c:url value='/img/default.png'/>" onerror="this.src = $(this).attr('altSrc')">
	<br>
	
	</div>


	생년월일<input type="Date" name="memberBirth" style="width: 355px; height: 49px;margin-left: 20px;"><br>

	
       
                <br><div id="sex">
                    <input type="radio" id="male" name="memberGender" value="남자">
                    <label for="male" style="padding-left: 90px;">남자</label>
                    <input type="radio" id="female" name="memberGender" value="여자">
                    <label for="female" style="padding-left:90px;">여자</label>
                </div>
	
	<div>
	
	
             <div id="idBox" class="box" style="padding-bottom:10px">
            <input type="text" name="memberPhone" class="input" placeholder="휴대폰 번호 &nbsp; &nbsp; &nbsp; &nbsp; -없이">
            </div>
	
	
	
	
<!-- 	
	<input type="checkbox" id="Allagreebox"> 전체동의 <br>
	<input type="checkbox" id="ageebox1"> 이용약관 <br>
	<input type="checkbox" id="Allagreebox"> 개인정보 수집 및 이용<br> -->
	
	
	<input type="submit" value="동의하고 회원가입" style="margin-left: 145px; margin-top: 50px; margin-bottom:100px;">
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