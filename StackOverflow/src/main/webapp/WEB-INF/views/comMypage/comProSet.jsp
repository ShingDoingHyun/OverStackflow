<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


.bluebTabDesign {
	padding: 0 0 0px 0px;
}

.bluebTabDesign ul {
	margin: 0;
	padding-left: 10px;
	list-style: none;
	border-bottom: 1px solid #2390ff;
	font-family: dotum, Sans-serif;
	font-size: 12px;
	*zoom: 1;
}

.bluebTabDesign ul:after {
	content: "";
	display: block;
	clear: both;
}

.bluebTabDesign li {
	float: left;
	margin: 0px 1px -1px 1px;
}

.bluebTabDesign li a {
	position: relative;
	float: left;
	text-decoration: none;
	border-top: 1px solid #c0c0c0;
	border-right: 1px solid #c0c0c0;
	border-left: 1px solid #c0c0c0;
	background: #efefef;
	color: #666;
}

.bluebTabDesign li a span {
	display: inline-block;
	padding: 6px 7px;
	letter-spacing: -1px;
	cursor: pointer;
	border-top: 1px solid #fff;
	border-left: 1px solid #fff;
}

.bluebTabDesign li a:hover {
	background: #fff;
	color: #2390ff;
	border: 1px solid #2390ff;
}

.bluebTabDesign li ul {
	display: none;
	width: 100%;
	top: 40px;
	left: 0;
	list-style: none;
	border: 0;
	margin: 0;
	padding: 0;
	white-space: nowrap;
	overflow: hidden;
	*zoom: 1;
}

.bluebTabDesign li ul:after {
	content: "";
	display: block;
	clear: both;
}

.bluebTabDesign li.selected a {
	border: 2px solid #2390ff;
	padding: 1px;
	border-bottom: 0px solid #fff;
	margin-top: -3px;
	background-color: #fff;
	color: #2390ff;
}

.bluebTabDesign li.selected a span {
	display: inline-block;
	padding-top: 7px;
	font-weight: bold;
	background-color: #fff;
}

.bluebTabDesign li.selected a:hover {
	border: 2px solid #2390ff;
	padding: 1px;
	border-bottom: 0px solid #fff;
	margin-top: -3px;
	background-color: #fff;
	color: #2390ff;
}


body.user-page #content * {
    box-sizing: border-box;
}


.inner-container:first-child {
    margin-top: 0;
}


.inner-container {
    margin: 20px 0;
    padding: 13px 0 40px 0;
    border-bottom: 1px solid #eaeaea;
}


body *, body *:before, body *:after {
    box-sizing: inherit;
}


     div{
    margin: 0;
    padding: 0;
    border: 0;
    font: inherit;
    font-size: 100%;
    vertical-align: baseline;
}
    
form{
    margin: 0;
    padding: 0;
    border: 0;
    font: inherit;
    font-size: 100%;
    vertical-align: baseline;
}


user agent stylesheet
div {
    display: block;
}
   
    
body.user-page #content * {
    box-sizing: border-box;
}


    body.user-page #content * {
    box-sizing: border-box;
}


.col-3 {
    width: 25%;
    float: left;
}

   
    body.user-page #content * {
    box-sizing: border-box;
}

    
    body.user-page #content * {
    box-sizing: border-box;
}


    .edit-profile .avatar-wrapper {
    position: relative;
    width: 164px;
    height: 164px;
    overflow: hidden;
}


.edit-profile .first-row .col-9>label:first-child {
    margin-top: 0;
}


.edit-profile .first-row label {
    margin-top: 18px;
}


.edit-profile label:not(.btn) {
    display: block;
}

label {
    margin: 0;
    padding: 0;
    border: 0;
    font: inherit;
    font-size: 100%;
    vertical-align: baseline;
}
    
    body.user-page #content * {
    box-sizing: border-box;
}


.edit-profile .first-row input[type="text"] {
    margin-bottom: 6px;
}


.edit-profile .first-row .col-9 input {
    max-width: none;
}


.edit-profile input[type="text"]{
    display: block;
    width: 100%;
    max-width: 390px;
}



.inner-container input[type="text"]{
    margin-bottom: 18px;
}



input[type="text"]:not(.s-input){
    box-shadow: 0 1px 2px rgba(12,13,14,0.1) inset;
}


input[type="text"]:not(.s-input){
    padding: 13px 100px;
    font-family: Arial,"Helvetica Neue",Helvetica,sans-serif;
    font-size: 14px;
    color: #3b4045;
    background: #FFF;
    border: 1px solid #c8ccd0;
    padding-left: 20px;
    padding-right: 200px;
}

input[type="password"]:not(.s-input){
    padding: 13px 100px;
    font-family: Arial,"Helvetica Neue",Helvetica,sans-serif;
    font-size: 14px;
    color: #3b4045;
    background: #FFF;
    border: 1px solid #c8ccd0;
    padding-left: 20px;
    padding-right: 200px;
}
input {
    margin: 5px 0;
    
}

.edit-profile .first-row label {
    margin-top: 18px;
}

.edit-profile label:not(.btn) {
    display: block;
}

body {
    line-height: 1;
}

user agent stylesheet
body {
    display: block;
    margin: 8px;
}

 #blah
 {
	width:150px;
}
.input2
{
   border: none;
   width: 450px;
   height: 50px;
   padding: 0 3px;
   font-size: 15px;
 }  
#mainbar h3{
    font-weight: 400;
}
.col-8
{ 
width:45%;
height:300px;
float:left;
margin-left: 50px;
margin-top: 35px;
}

.col-9
{
    width: 55%;
    height:50px;
    float:right;
}
.col-10
{
clear:both; 
  height:100px;
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
		
		
		
			<div class="main-page">
			
			
			<div class="main" style="margin-bottom:65%;">

		<div style="margin-top: 20px;"></div>

		<div class="bluebTabDesign">
			<ul>
				<li><a href="<c:url value='/comProfile'/>"><span>프로필</span></a></li>
				<li><a href="<c:url value="/comJob/writeJobInfo"/>"><span>채용공고 작성</span></a></li>
				<li><a href="<c:url value="/comJob/manageJobInfoList/1"/>"><span>채용공고 관리</span></a></li>
				<li><a href="<c:url value="/comJob/manageJobAppList/0"/>"><span>지원서 관리</span></a></li>
                <li class="selected"><a href="#"><span>프로필 설정</span></a></li>
			</ul>
		</div>
	
			<div class="main_2">
			<div style="margin-top: 20px;"></div>
			<h3 style="margin-left:20px;margin-bottom: 50px;">프로필수정</h3>
		</div>
	

           <form action="<c:url value="/comProfileUpdate"/>"   method="POST" enctype="multipart/form-data">
           
           <div class="col-8"style="width:252px;  margin-left:320px; height:282px; margin-top: 60px; margin-bottom:10px;">
           
           		<img class='photo3' id="blah" alt="your image" src="<c:url 
           		value='/resources/uploadFile/comPhoto/${comInfo.comPhoto}'/>"style=" width:250px; height:250px;"> 	
           				
           </div>
          
                <div class="col-9">

                    <span>아이디</span><br><input type="text" disabled="disabled" name="comId" value="${comInfo.comId}" class="input2"><br>
                    
                    <br><span>닉네임</span><br><input type="text"  name="comChargerName"  maxlength="20" value="${comInfo.comChargerName}" class="input2"/><br>
                    
                    <br><span>담당자 이메일</span><br><input type="text" name="comChargerEmail" maxlength="20" value="${comInfo.comChargerEmail}" class="input2"/><br>
                   
                    <br><span>핸드폰번호</span><br><input type="text" name="comChargerPhone" maxlength="20" value="${comInfo.comChargerPhone}" class="input2"/><br>
                   
                    <br><span>비밀번호</span><br><input type="password"  name="comPwd"  maxlength="20" class="input2" /><br>
                    
                    <br><span>비밀번호 확인</span><br><input type="password" name="comPwd2" maxlength="15" class="input2"/><br>
                    
                    
      
                </div>
               
                


<div class="col-10">

<!-- 이미지 수정 버튼  -->
<input type="file" id="imgInp" name="comPhotoFile" style="margin-left: 400px;">

            <div class="row">
            
                    <br><h3 style="margin-top:130px; margin-left:300px;">자기소개</h3>

                        <textarea id="wmd-input" class="wmd-input" name="comIntro" cols="92" rows="15" tabindex="4" 
                        style="width: 850px;margin-top:25px;margin-left:300px;">${comInfo.comIntro}</textarea>
                        
                        
                        <br><button type="submit"  class="label label-warning"
                                  style="margin-top: 40px;margin-left:660px;width: 93.4px;height: 35px;">수정</button>
                         </div> 
            </div>
            </form>
           
        </div>
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