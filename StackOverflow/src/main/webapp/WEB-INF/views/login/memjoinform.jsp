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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Archivo+Black" rel="stylesheet">
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
p
{
margin-left:14px; font-size:14px;
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


      <form action="memJoinFormTest" method="POST" enctype="multipart/form-data" class="joinForm">

                <span><h5 style="margin-left: 270px; margin-bottom:0px; margin-top: 0px;">*는 필수 입력 정보입니다.</h5></span>
                <div id="idBox" class="box" style="padding-bottom:10px">
              
              <input type="text" name="memberId" id="mId" placeholder="아이디 *" class="input" maxlength="20" style="width:250px;">
                   <span style="padding-left:0px;">@overstackflow.com</span>
              </div>
                 <p class="red-alert" id="idP"></p>
                
        
        <div id="idBox" class="box" style="padding-bottom:10px">
	<input type="password" name="memberPwd"  id="pwd1" class="input" maxlength="16" placeholder="비밀번호 &nbsp; &nbsp;&nbsp; &nbsp;(6~16자의 영문,숫자,특수기호)*">
	 <i class="material-icons" id="lock1" style="margin-left: 70px;">&#xe899;</i>
	
	</div>
	<p class="red-alert" id="pw1P"></p>
	
	 <div id="idBox" class="box" style="padding-bottom:10px">
	<input type="password" name="memberPwd2" id="pwd2" class="input" maxlength="16" placeholder="비밀번호확인*">
	<i class="material-icons" id="lock2" style="margin-left: 70px;">&#xe899;</i>
	
	</div>
	<p class="red-alert" id="pw2P"></p>
	
	 <div id="idBox" class="box" style="padding-bottom:10px">
	<input type="text" name="memberName" class="input" placeholder="이름(실명)*"><br>
	</div>
	<p class="red-alert"></p>
	
	 <div id="idBox" class="box" style="padding-bottom:10px">
	<input type="text" name="memberNickname" class="input" placeholder="닉네임*"><br>
	</div>
	<p class="red-alert"></p>
	
	<div style="margin-top:25px;"><span>사진 업로드</span></div> 
	<div id="idBox" class="box2" style="padding-bottom:10px">
	<input type="file" id="imgInp" name="memberPhotoFile">
								
	
	</div>
	<div style="border:1px;margin-left:280px;margin-top: -90px; width: 155px;height: 180px; margin-bottom:30px;">

	<img id="blah"  style="width: 155px; height: 180px;" src="<c:url value='/resources/uploadFile/memPhoto/${memInfo.memPhoto}'/>"  
						altSrc="<c:url value='/img/default.png'/>" onerror="this.src = $(this).attr('altSrc')">
	<br>
	
	</div>


	<span style="margin-right:20px;">생년월일</span><span><input type="Date" name="memberBirth" style="width: 355px; height: 49px;"></span><br>

	
       
                <br>
                <div id="sex">
	                <input type="radio" id="male" name="memberGender" value="남자">
	                <label for="male" style="padding-left: 90px;">남자</label>
	                <input type="radio" id="female" name="memberGender" value="여자">
	                <label for="female" style="padding-left:90px;">여자</label>
                </div>
	
	
             <div id="idBox" class="box" style="padding-bottom:10px">
            <input type="text" name="memberPhone" class="input" id="phone" placeholder="휴대폰 번호 &nbsp; &nbsp; &nbsp; &nbsp; -없이">
            </div>
	
	
	

	
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
			
			
			
			 $('input[type=radio]').change(function() {
		            $('input[type=radio]').each(function() {
		                if ($(this).prop('checked'))
		                    $(this).next().css('border', '1px solid #00BB40');
		                else
		                    $(this).next().css('border', '1px solid #D9D9D9');
		            });

		        });
			 
			 //        포커스가 잡히면 테두리에 효과를준다.
		        $('.joinForm input').focusin(function() {
		            $(this).parent().css('border', '1px solid #00BB40');
		        });
			 
//		        포커스를 잃으면 테두리에 효과를 제거한다.
		        $('.joinForm input').focusout(function() {
		        	var idCheck = /^[A-Za-z0-9_-]{5,20}$/;
		        	var passCheck = /^.*(?=^.{6,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=*]).*$/;
		        
		            $(this).parent().css('border', '1px solid #D9D9D9');
		            var id = $(this).attr('id');
		        	console.log(id);
		            /*날짜,  비밀번호는 아래쪽 스위치문에서 공백체크, 이메일은 공백체크 안함*/
		            if ($(this).val() === '' && id !== 'email' && id !== 'pwd1' && id !== 'pwd2' && id !=='phone') {
		                $(this).parent().next().text("필수 입력 정보입니다.").css('color', 'red');
		            } else {
		            	
		            	
		                /*해당 div 조건에따라 유효성 체크*/
		                switch (id) {

		                    case 'mId':
		                        if (!idCheck.test($(this).val()))
		                            $('#idP').text("5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.").css('color', 'red');
		                        else
		                            $('#idP').text("멋진아이디네요!").css('color', '#00BB40');
		                        break;
		                    case 'pwd1':
		                        if (!passCheck.test($(this).val())) {
		                            if($(this).val()===""){
		                                $('#pw1P').text("필수 정보입니다.").css('color', 'red');
		                            }
		                            else{
		                                $('#pw1P').text("6~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.").css('color', 'red');
		                             
		                           
		                            }
		                            $('#lock1').css('color', 'red');
		                        } else {
		                            $('#pw1P').text("");
		                            $('#lock1').css('color', '#00BB40');
		                          
		                        }
		                        break;
		                    case 'pwd2':
		                        if($(this).val()===""){
		                                $('#pw2P').text("필수 정보입니다.").css('color', 'red');
		                                $('#lock2').css('color', 'red');
		                                
		                        }
		                        else{
		                            if ($('#pwd1').val() !== $(this).val()) {
		                                $('#pw2P').text("비밀번호가 일치하지 않습니다.").css('color', 'red');
		                                $('#lock2').css('color', 'red');
		                                $(this).val('');
		                            } else {
		                                $('#pwd2').text("");
		                                $('#lock2').css('color', '#00BB40');
		                            }
		                        
		                        }
		                        break;
		                    
		                    default:
		                        /*2경우 경고 공백으로*/
		                        $(this).parent().parent().find('.red-alert').text("");
		                        $(this).parent().parent().parent().find('.red-alert').text("");
		                }
		            }

		        });

			
		</script>
	<!--scrolling js-->
	<script src="js/jquery.nicescroll.js"></script>
	<script src="js/scripts.js"></script>
	<!--//scrolling js-->
	<!-- Bootstrap Core JavaScript -->
   <script src="js/bootstrap.js"> </script>
</body>
</html>