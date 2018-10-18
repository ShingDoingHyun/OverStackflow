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


.main_2 {
	margin-Left: 20px;
}

 body.user-page #content * {
        box-sizing: border-box;
    }

    body {
        line-height: 1;
    }

    div {
        margin: 0;
        padding: 0;
        border: 0;
        font: inherit;
        font-size: 100%;
        vertical-align: baseline;
    }

    div {
        display: block;
    }

    .user-show-new .user-panel:nth-child(odd) {
        margin-right: 30px;
    }

    .user-show-new .user-panel {
        width: calc((100% - 30px) / 2);
        float: left;
        margin-bottom: 30px;
        margin-top: 60px;
    }

    .container {
        position: relative;
        width: 100%;
        flex: 1 0 auto;
        margin: 0 auto;
        text-align: left;
    }

    #content {
        max-width: 1100px;
        width: calc(100% - 164px);
        background-color: #FFF;
        border-radius: 0;
        border: 1px solid #d6d9dc;
        border-top-width: 0;
        border-bottom-width: 0;
        border-left-width: 1px;
        border-right-width: 0;
        padding: 24px;
        box-sizing: border-box;
    }

    body>.container {
        max-width: 1264px;
        width: 100%;
        background: none;
        display: flex;
        justify-content: space-between;
        margin: 0 auto;
    }

    .container {
        position: relative;
        width: 100%;
        flex: 1 0 auto;
        margin: 0 auto;
        text-align: left;
    }

    #content:before,
    #content:after {
        content: "";
        display: table;
    }

    .profile-section-title {
        font-weight: 700;
        color: #0C0D0E;
    }

    .px2 {
        padding-left: 2px !important;
        padding-right: 2px !important;
    }
    .user-show-new .user-panel .subheader {
    border-bottom: 1px solid #c8ccd0;
    height: auto;
    padding-bottom: 6px;
}

    .user-show-new .user-panel-content {
    padding-top: 5px;
}
    .user-show-new .user-panel .user-panel-content {
    margin-bottom: 10px;
}
.user-show-new .empty {
    margin-bottom: 10px;
}
    .user-show-new .subheader {
    margin-bottom: 12px;
}
    .user-show-new .user-panel.user-panel:nth-child(odd):before {
    display: table;
    content: " ";
    clear: both;
}
    .user-show-new .user-panel #leagueRank, .user-show-new .user-panel .user-panel-subtabs {
    float: right;
    width: auto;
    margin: 0;
    margin-top: -35px;
}
    .user-show-new .user-panel #leagueRank a, .user-show-new .user-panel .user-panel-subtabs a {
    float: left;
    font-size: 11px;
    font-weight: normal;
    margin-left: 10px;
}
    .subtabs a.youarehere  {
border-color: #F48024;
    font-weight: 700;
}
    .subtabs a.youarehere {
    border-color: rgba(244,128,36,0.5);
    color: #3b4045;
    text-decoration: none;
}
    .subtabs a {
    display: block;
    margin: 0 0 0 2px;
    padding: 8px;
    border-bottom: 1px solid transparent;
    color: #6a737c;
    font-size: 12px;
    line-height: 1.53333333;
    text-decoration: none;
    transition: all 150ms cubic-bezier(.19, 1, .22, 1);
}

.d-flex {
    display: flex !important;
}
.fs-caption, .fs-category {
    font-size: .92307692rem !important;
}
.ai-center {
    align-items: center !important;
}
.bbw2 {
    border-bottom-width: 2px !important;
}
 
 .ProfileMain{
    margin-top: 20px;
    margin-bottom: 30px;
}
.photo3{
		width:180px;
	}
.ProfileMain div{
text-align:flot;
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
				
					<div class="main"">
			
						<div style="margin-top: 20px;"></div>
				
						<div class="bluebTabDesign">
							<ul>
								<li><a href="<c:url value='/selectTagList'/>"><span>태그</span></a></li>
								<li class="selected"><a href="<c:url value='/selectMemberList'/>"><span>유저</span></a></li>				
							</ul>
						</div>
						<div class="main_2">
							<div style="margin-top: 15px;"></div>
							<div style="position: absolute; right: 130px;">
								<span style="font-size: 14px;margin-left:19%;">
									<a href="<c:url value='/selectTagList'/>">랭킹</a> > 
									<a href="<c:url value='/selectMemberList'/>">유저</a>
								</span>
							</div>
							<div style="margin-top: 20px;"></div>
							<h3>유저</h3>
							<br><br>
							<table style="margin: auto;">
								<c:set var="index" value="0" />
								<c:forEach items="${memberRackList }" var="member" varStatus="status">
									<c:if test="${index == 0}">
										<tr style="height: 170px; border-bottom: 1px solid #cecbcb;">
									</c:if>
										<td width="300px;" style="padding-top: 0;">
											<div style="margin-left: 8px;">
												<span style="font-size: 30px; font-weight: bord;">${status.count }</span><br>	
												<c:if test="${member.memberPhoto != null && member.memberPhoto != ''}">
												<img class='photo2' src="<c:url value='/resources/uploadFile/memberPhoto/${member.memberPhoto}'/>"  altSrc="<c:url value='/img/default.png'/>" onerror="this.src = $(this).attr('altSrc')">
												</c:if>
												<c:if test="${member.memberPhoto == null || member.memberPhoto == ''}">
												<img class='photo2' src="<c:url value='/resources/img/default.png'/>">
												</c:if>
												${member.memberId }<br>
												작성글 : ${member.count}
											</div>
										</td>
								<c:if test="${index < 4}">
									<c:set var="index" value="${index+1 }" />
								</c:if>
								<c:if test="${index >= 4}">
									</tr>
									<c:set var="index" value="0" />
								</c:if>
								</c:forEach>
						
							</table>
							
							
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
   <script>
   $(".tagDetail").click(function() {
	
	   $(this).next().show();
	   $(this).prev().hide();
	   $(this).hide();
	   
	});
   
   $(".cancelTagFix").click(function() {
		
	   $(this).parent().prev().show();
	   $(this).parent().prev().prev().show();
	   $(this).parent().hide();
	});
   
   function getContextPath() {
		var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};
		

   
    function updateTagDetail(obj) {
    	
      	var tagNo = obj.find("input[name=tagNo]").val();
    	var tagDetail = obj.find(".tagD").val();
  
    	
    	 $.ajax({
	            type : 'post',
	            url : getContextPath() +'/tagDetailUpdate',
	            data : { "tagNo" : tagNo ,  "tagDetail": tagDetail},
	            dataType : 'text',
	            contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	            success : function(data){
	   		
	            	obj.find(".tagD").val(tagDetail);
	            	
	            	obj.prev().prev().text(tagDetail);
	            	obj.prev().prev().show();
	            	obj.prev().show();
	            	obj.hide();
	            }
	        }); 
    
    	 
 	   return false;
    
    };
	

   </script>
   
</body>

</html>