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
	 .member_wrap {
            width: 556px;
            margin: 0 auto;
        }

        .member_wrap .member_gate .member_gate_join {
            padding: 50px 0 40px 0;
            background: #fff;
        }

        .tit.t_join {
            width: 105px;
            height: 29px;
            background-position: 0 0;
            font-size: 26px;
        }

        .ico {
            display: inline-block;
            overflow: hidden;
            /* background: url(com.JPG) no-repeat 0 0; */
            text-indent: -9999px;
        }


        .member_wrap .member_gate a {
            display: block;
            margin-top: 20px;
            border: 1px solid #ddd;
            text-align: center;
        }

        .member_wrap .ico_person {
            width: 35px;
            height: 38px;
            background-position: 0 -1013px;
        }

        .member_wrap .ico_company {
            width: 39px;
            height: 38px;

        }

        a {
            color: #333;
            text-decoration: none;
            cursor: pointer;
            }
            
   #joincheck{
    width: 250px;
    height: 50px;
    background:#fb8c00;
    color: white;
    font-size: 20px;
    margin-top: 15px;
}
       
</style> 
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
			
			<div class="main">

	  <div class="container_inner">

        <div id="_contents" class="contents_wrap ">
            <div class="content_wide member" style="
                  margin-right: 270px;
                   margin-top: 150px;">
                   
                <div class="member_wrap">
                    <h2 class="tit t_join">회원가입</h2>
                    <div class="member_gate">
                        <a href="../op/memJoinForm">
                        
                            <div class="member_gate_join">
                                <span><img src="resources/img/mem_join.png"></span><br>
                                <p class="title">개인 회원</p>
                                <p class="text_small">만 14세 이상 가능</p>
    
                               <div id="memjoincheck"><input type="submit" id="joincheck" value="회원가입" /></div>
                            
                            </div>
                        </a>
                        
                        <a href="../op/comJoinForm" style="
                              margin-bottom: 50px;
                              margin-top: 30px;">
                            <div class="member_gate_join">
                                <span><img src="resources/img/com_join.png"></span><br>
                                <p class="title">기업 회원</p>                   
                                <p class="text_small">사업자등록증을 보유한 회원</p>
               
                                <div id="comjoincheck"><input type="submit" id="joincheck" value="회원가입" /></div>
                              
                            </div>
                        </a>
                        
                    </div>
                </div>
            </div>

        </div>
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