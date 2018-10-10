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
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>

<link rel="stylesheet" href="css/index.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/loginStyle.css" type="text/css" media="all" />

<title>Insert title here</title>
</head>

 <%
 
    String clientId = "2LiTXcNGWvrdztpMNXZd";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost/op/", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
/*     System.out.println(apiURL); */
    session.setAttribute("state", state);  
 %>
<body>
		
	
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
                        <input type="text" class="input" name="memberId" placeholder="아이디" value="" />
                    </td>
                </tr>
                <tr>
                    <td><input type="password" class="input" name="memberPwd" placeholder="비밀번호" /></td>
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
            
          <!--  <div class=""><a href="#">계정을잊으셨나요?</a></div> -->
            
            <div id="signUpDiv"><span><a href="../op/joinChoiceForm">회원가입</a></span></div>
        </div>
    </form>
      <form action="comLoginForm" method="post" id="signup">
        <div class="input-field">
            <table>
                <tr>
                    <td>
                        <input type="hidden" name="page" value="">
                        <input type="text" class="input" name="comId" placeholder="아이디" value="" />
                    </td>
                </tr>
                <tr>
                    <td><input type="password" class="input" name="comPw" placeholder="비밀번호" /></td>
                </tr>
            </table>

            <div id="loginDiv"><input type="submit" id="loginBtn" value="로그인" /></div>
            <div id="footer"><br>
                <div id="checkDiv"><input type="checkbox" name="remember" value="1"> 아이디 저장</div>
                <div id="signUpDiv"><span><a href="../op/joinChoiceForm">회원가입</a></span></div>
            </div>
                    <!--     <p class="text-p"> <a href="#">계정을잊으셨나요?</a> </p> -->
        </div>
    </form>
</div>
</html>

	
	
	
	<!----------------------main End--------------------------------------->


	<!----------------------left menu--------------------------------------->
	<%@ include file="../commons/footer.jspf" %>
	<!----------------------left menu End--------------------------------------->
	
<script type="text/javascript">

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
</body>
</html>