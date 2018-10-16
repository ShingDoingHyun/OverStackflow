<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<link rel="stylesheet" href="css/index.css" type="text/css" media="all" />
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
.main_2 {
	margin-Left: 20px;
}
 .ProfileMain{
    margin-left: 300px;
    margin-top: 50px;
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
.user-page .row {
    max-width: 1060px;
}
.user-page .row {
    max-width: 1100px;
}
.row {
    max-width: 1080px;
    width: 100%;
}
    
.row::before, .row::after {
    display: table;
    content: " ";
}
body *, body *:before, body *:after {
    box-sizing: inherit;
}
    body.user-page #content * {
    box-sizing: border-box;
}
.col-3 {
    width: 25%;
    float: left;
}
body *, body *:before, body *:after {
    box-sizing: inherit;
}
    body.user-page #content * {
    box-sizing: border-box;
}
    .edit-profile .first-row .col-9 input {
    max-width: none;
}
.col-9 {
    width: 75%;
    float: left;
}
body *, body *:before, body *:after {
    box-sizing: inherit;
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
body *, body *:before, body *:after {
    box-sizing: inherit;
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
    margin-bottom: 18px;
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
 #blah{
		width:150px;
	}
.input {
            border: none;
            width: 310px;
            height: 30px;
            padding: 0 3px;
            font-size: 15px;
 }
#mainbar h3{
    font-weight: 400;
}

</style>
<script>
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
<body>
	<!----------------------header--------------------------------------->

	<%@ include file="/WEB-INF/views/commons/header.jspf"%>
	<!----------------------header End--------------------------------------->


	<!----------------------left menu--------------------------------------->
	<%@ include file="/WEB-INF/views/commons/left.jspf"%>
	<!----------------------left menu End--------------------------------------->
	

	<div class="main" style="margin-bottom:65%;">

		<div style="margin-top: 20px;"></div>

		<div class="bluebTabDesign">
			<ul>
				<li><a href="<c:url value='/memberProfile'/>"><span>프로필</span></a></li>
				<li><a href="<c:url value='/memberUpdate'/>"><span>지원관리</span></a></li>
				<li class="selected"><a href="#"><span>프로필 설정</span></a></li>

			</ul>
		</div>
	
			<div class="main_2">
			<div style="margin-top: 20px;"></div>
			<h3 style="margin-left: 150px;">프로필수정</h3>
			
		</div>
	
	<div class="ProfileMain">
	
        <div id="user-edit-table" class="inner-container">
            <div class="row first-row">
            
                <div class="col-3">
              <!--   <div style="border: 1px; float: left; width: 40%; padding:10px;height: 200px;"><br> -->
                  <input type="file" id="imgInp" name="memberPhotoFile">
	                    <img id="blah" src="#" alt="your image" style="width: 200px;height: 200px;"/><br>
	                    </div>
                    <div id="picture-popup"></div>
                    <div id="change-picture-progress">&nbsp;</div>
                </div>
               
                <div class="col-9">
                
                    <label style="padding-right: 53px;">아이디</label>
                    <input name="Id" type="text" value="Id" maxlength="50" tabindex="1"/><br>
                    
                    <label style="padding-right: 38px;">비밀번호</label>
                    <input name="password" type="password" value="비밀번호"  maxlength="50" tabindex="1" /><br>
                    
                    <label>비밀번호 확인</label>
                    <input name="repassword" type="password" value="비밀번호확인" maxlength="50" tabindex="1"/><br>
                </div>
          
         
        
  
            <div class="row">

                        <div class="wmd-container">
                   <div class="col-12">&nbsp;</div>
            </div>
            <div class="row">
            
                <div class="col-12">
                    <h3>자기소개</h3>
</div>
                        <textarea id="wmd-input" class="wmd-input" name="AboutMe" cols="92" rows="15" tabindex="4" style="width: 850px;margin-top: 20px;"></textarea>
                        <div id="wmd-preview" class="wmd-preview"></div>
                        
                </div> 
            </div>
       </div>
      </div>
        </div>
       </div>
       
       
    
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!----------------------main End--------------------------------------->


	<!----------------------footer--------------------------------------->
	<%@ include file="/WEB-INF/views/commons/footer.jspf"%>
	<!----------------------footer End--------------------------------------->


</body>
</html>