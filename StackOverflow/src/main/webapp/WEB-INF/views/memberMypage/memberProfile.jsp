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

	<%-- <!----------------------header--------------------------------------->
		<%@ include file="../commons/header.jspf" %>
		<!----------------------header End--------------------------------------->
	
		<!----------------------left menu--------------------------------------->
		<%@ include file="../commons/left.jspf" %>
		<!----------------------left menu End---------------------------------------> --%>
		
		
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
	margin-Left: 140px;
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
        margin-top: 20px;
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
    border: 1px solid black;
    padding: 8%;
    margin-top: 20px;
    margin-bottom: 20px;
}

</style>


<body>
	<!----------------------header--------------------------------------->

	<%@ include file="/WEB-INF/views/commons/header.jspf"%>
	<!----------------------header End--------------------------------------->


	<!----------------------left menu--------------------------------------->
	<%@ include file="/WEB-INF/views/commons/left.jspf"%>
	<!----------------------left menu End--------------------------------------->





	<!----------------------main--------------------------------------->
	<div class="main">

		<div style="margin-top: 20px;"></div>

		<div class="bluebTabDesign">
			<ul>
				<li class="selected"><a href="#"><span>프로필</span></a></li>
				<li><a href="#"><span>활동정보</span></a></li>
				<li><a href="<c:url value='/memberUpdate'/>"><span>지원관리</span></a></li>
				<li><a href="#"><span>프로필 설정</span></a></li>

			</ul>
		</div>
		<div class="main_2">
			<div style="margin-top: 20px;"></div>
			<h3>프로필정보</h3>
		<!-- 	     <div class="ProfileMain">
        <table>
			
						<td></td>



    </table>
        </div> -->
		<div>
        <div id="mainbar-full" class="user-show-new">

            <div id="user-panel-answers" class="user-panel">
                <div class="subheader p0 grid ai-center" style="min-height: 36px;">
                    <h3 class="grid--cell mb0 mr-auto px2 profile-section-title"><a href="/users/10257271/jam?tab=answers">
                            답변 <span>(0)</span>
                        </a></h3>
                    <div class="grid--cell subtabs user-panel-subtabs" >
                        <a href="javascript:void(0)" class="d-flex ai-center fs-caption bbw2 youarehere" data-sort-id="votes">
                            최신
                        </a>
                        <a href="javascript:void(0)" class="d-flex ai-center fs-caption bbw2" data-sort-id="activity">
                            활동
                        </a>
                        <a href="javascript:void(0)" class="d-flex ai-center fs-caption bbw2" data-sort-id="newest">
                            투표
                        </a>
                    </div>
                </div>

                <div class="user-panel-content">

                    <div class="empty">너는<a href="/questions/how-to-answer">어떠한질문에도</a> 대답하지않았다능</div>

                </div>

                <div class="user-panel-footer">

                </div>
            </div>
            <div id="user-panel-reputation" class="user-panel">
                <div class="subheader p0 grid ai-center" style="min-height: 36px;">
                    <h3 class="grid--cell mb0 mr-auto px2 profile-section-title"><a href="/users/10257271/jam?tab=reputation">
                            Reputation <span>(1)</span>
                        </a></h3>

                </div>

                <div class="user-panel-content">



                    <div class="empty">
                        You have no recent <a href="/help/whats-reputation">reputation changes</a> </div>

                </div>

                <div class="user-panel-footer">

                </div>
            </div>
            <div id="user-panel-questions" class="user-panel">
                <div class="subheader p0 grid ai-center" style="min-height: 36px;">
                    <h3 class="grid--cell mb0 mr-auto px2 profile-section-title"><a href="/users/10257271/jam?tab=questions">
                            Questions <span>(0)</span>
                        </a></h3>
                    <div class="grid--cell subtabs user-panel-subtabs">
                        <a href="javascript:void(0)" class="d-flex ai-center fs-caption bbw2 youarehere" data-sort-id="votes">
                            votes
                        </a>
                        <a href="javascript:void(0)" class="d-flex ai-center fs-caption bbw2" data-sort-id="activity">
                            activity
                        </a>
                        <a href="javascript:void(0)" class="d-flex ai-center fs-caption bbw2" data-sort-id="newest">
                            newest
                        </a>
                    </div>
                </div>

                <div class="user-panel-content">

                    <div class="empty">
                        You have not <a href="/questions/how-to-ask">asked</a> any questions
                    </div>

                </div>

                <div class="user-panel-footer">

                </div>
            </div>
            <div id="user-panel-tags" class="user-panel">
                <div class="subheader p0 grid ai-center" style="min-height: 36px;">
                    <h3 class="grid--cell mb0 mr-auto px2 profile-section-title"><a href="/users/10257271/jam?tab=tags">
                            Tags <span>(0)</span>
                        </a></h3>
                </div>

                <div class="user-panel-content">

                    <div class="empty">You have not participated in any <a href="/tags">tags</a></div>

                </div>

                <div class="user-panel-footer">

                </div>
            </div>
            <div id="user-panel-accounts" class="user-panel">
                <div class="subheader p0 grid ai-center" style="min-height: 36px;">
                    <h3 class="grid--cell mb0 mr-auto px2 profile-section-title"><a href="https://stackexchange.com/users/14198814/jam?tab=accounts">
                            Account <span>(1)</span>
                        </a></h3>
                </div>

                <div class="user-panel-content">

                    <table class="user-accounts lines">
                        <tbody>
                            <tr>
                                <td class="icon-cell">
                                    <div class="favicon favicon-stackoverflow favicon" title="Stack Overflow"></div>
                                </td>
                                <td>
                                    <a class="site-hyperlink" href="https://stackoverflow.com/users/10257271/">Stack Overflow</a>
                                </td>
                                <td class="reputation">
                                    <span class="reputation-score">1</span> rep
                                </td>
                                <td class="badges">

                                </td>
                            </tr>
                        </tbody>
                    </table>

                </div>

                <div class="user-panel-footer">

                </div>
            </div>
            <div id="user-panel-badges" class="user-panel">
                <div class="subheader p0 grid ai-center" style="min-height: 36px;">
                    <h3 class="grid--cell mb0 mr-auto px2 profile-section-title"><a href="/users/10257271/jam?tab=badges">
                            Badges <span>(0)</span>
                        </a></h3>
                    <div class="grid--cell subtabs user-panel-subtabs">
                        <a href="javascript:void(0)" class="d-flex ai-center fs-caption bbw2 youarehere" data-sort-id="recent">
                            recent
                        </a>
                        <a href="javascript:void(0)" class="d-flex ai-center fs-caption bbw2" data-sort-id="class">
                            class
                        </a>
                        <a href="javascript:void(0)" class="d-flex ai-center fs-caption bbw2" data-sort-id="name">
                            name
                        </a>
                    </div>
                </div>

                <div class="user-panel-content">

                    <div class="empty">You have not earned any <a href="/help/badges">badges</a></div>

                </div>

                <div class="user-panel-footer">

                </div>
            </div>
            <div id="user-panel-bounties" class="user-panel">
                <div class="subheader p0 grid ai-center" style="min-height: 36px;">
                    <h3 class="grid--cell mb0 mr-auto px2 profile-section-title"><a href="/users/10257271/jam?tab=bounties">
                            Active bounties <span>(0)</span></a></h3>
                    <div class="grid--cell subtabs user-panel-subtabs">
                        <a href="javascript:void(0)" class="d-flex ai-center fs-caption bbw2 youarehere" data-sort-id="active">
                            active
                        </a>
                        <a href="javascript:void(0)" class="d-flex ai-center fs-caption bbw2" data-sort-id="offered">
                            offered
                        </a>
                        <a href="javascript:void(0)" class="d-flex ai-center fs-caption bbw2" data-sort-id="earned">
                            earned
                        </a>
                    </div>
                </div>

                <div class="user-panel-content">

                    You have no active <a href="/help/bounty">bounties</a>
                </div>

                <div class="user-panel-footer">

                </div>
            </div>
            <div id="user-panel-votes" class="user-panel">
                <div class="subheader p0 grid ai-center" style="min-height: 36px;">
                    <h3 class="grid--cell mb0 mr-auto px2 profile-section-title">
                        Votes Cast <span>(0)</span>
                    </h3>
                









<!----------------------main End--------------------------------------->


	<!----------------------footer--------------------------------------->
	<%@ include file="/WEB-INF/views/commons/footer.jspf"%>
	<!----------------------footer End--------------------------------------->





</body>
</html>