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
<%
 
    String clientId = "2LiTXcNGWvrdztpMNXZd";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost/op/", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
   System.out.println(apiURL);
    session.setAttribute("state", state);  
 %>
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
<link href="css/loginStyle.css" rel="stylesheet" tyoe="text/css" media="all">
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
		
			
			
		<div class="main-page" style="
    margin-right: 300px;
    margin-top: 100px;
">
				
				
					<div class="forms">
	    <ul class="tab-group">
	        <li class="tab active"><a href="#login">개인로그인</a></li>
	        <li class="tab"><a href="#signup">기업로그인</a></li>
	    </ul>
	    <form action="memLoginForm" method="post" id="login">
	        <div class="input-field">
	
	            <table>
	                <tr>
	                    <td>
	                        <input type="hidden" name="page" value="">
	                        <input type="text" class="jam9" name="memberId" placeholder="아이디" value="" />
	                    </td>
	                </tr>
	                <tr>
	                    <td><input type="password" class="jam9" name="memberPwd" placeholder="비밀번호" /></td>
	                </tr>
	            </table>
	
	            <div id="loginDiv"><input type="submit" id="loginBtn" value="로그인" /></div><br>
	            <div id="footer">
	                <div id="checkDiv"><input type="checkbox" name="remember" value="1">아이디 저장</div>
	                <div style="float:left;">
	                    <div style="border-top:1px solid gray; width:182px; display:inline-block"></div>
	                    <div style="display:inline-block">or</div>
	                    <div id="a" style="border-top:1px solid gray; width:186px;display:inline-block"></div>
	                </div><br>
	                <label for="snslogin"><font size="2">SNS으로 로그인 </font></label><br><br>
	            </div>
	            <div class="form-group text-center"> 
			  <a href="<%=apiURL%>"><img height="50px" src="resources/img/naver_Green.png" style="height:55px;width:400px;"/></a>
			</div>
	            
	            <br>
	            
	            
	            <div id="signUpDiv"><span><a href="../op/joinChoiceForm">회원가입</a></span></div>
	        </div>
	    </form>
	      <form action="comLoginForm" method="post" id="signup">
	        <div class="input-field">
	            <table>
	                <tr>
	                    <td>
	                        <input type="hidden" name="page" value="">
	                        <input type="text" class="jam9" name="comId" placeholder="아이디" value="" />
	                    </td>
	                </tr>
	                <tr>
	                    <td><input type="password" class="jam9" name="comPw" placeholder="비밀번호" /></td>
	                </tr>
	            </table>
	
	            <div id="loginDiv"><input type="submit" id="loginBtn" value="로그인" /></div>
	            <div id="footer"><br>
	                <div id="checkDiv"><input type="checkbox" name="remember" value="1"> 아이디 저장</div>
	                <div id="signUpDiv"><span><a href="../op/joinChoiceForm">회원가입</a></span></div>
	            </div>
	           
	        </div>
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
			
			
			 $(document).ready(function() {
			        $('.tab a').on('click', function(e) {
			            e.preventDefault();

			            $(this).parent().addClass('active');
			            $(this).parent().siblings().removeClass('active');

			            var href = $(this).attr('href');
			            $('.forms > form').hide();
			            $(href).fadeIn(500);
			        });
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