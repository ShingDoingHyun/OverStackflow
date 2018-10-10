<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>개인/기업회원가입페이지</title>
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
</head>
<body>
<div class="main">

	  <div class="container_inner">

        <div id="_contents" class="contents_wrap ">
            <div class="content_wide member" style="
                  margin-right: 270px;
                   margin-top: 150px;">
                   
                <div class="member_wrap">
                    <h4 class="tit t_join">회원가입</h4>
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

<%@ include file="../commons/footer.jspf" %>
</body>
</html>