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
<style>
	#blah{
		width:150px;
	}
	#accordian li{ 
	list-style:none;
	}
	
	li > div{ display:none;}
	
	#accordian li >h1{ 
	cursor:pointer;
	font-size: 30px;
	border: 1px solid black;
	}
	
	#accordian ul{
	 padding-left: 0px;
	}
	
	#accordian{
	margin: 0px auto;
	width: 50%;
	border: 1px solid black;
	}
	
	#accordian #title{
	margin: 0px auto;
	text-align: center;
	}
</style>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" href="css/index.css" type="text/css" media="all" />
<title>Insert title here</title>
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
</head>
<body>
<div class="main">
<h1>기업회원가입</h1>
<form action="comJoinForm" method="post" enctype="multipart/form-data">
	<input type="text" name="comId"placeholder="아이디*"><br>
	<input type="password" name="comPwd" placeholder="비밀번호(6~16자의 영문,숫자,특수기호)*"><br>
	<input type="password" name="comPwd2" placeholder="비밀번호확인"><br>
	기업정보<br><input type="text" name="comNum" placeholder="사업자등록번호 -없이 10자리숫자 입력"><br>
	<input type="text" name="comName"placeholder="기업명*"><br>
	<input type="text" name="comAddress"placeholder="기업주소*"><br> 
	<input type="file" id="imgInp" name="comPhotoFile">
	<img id="blah" src="#" alt="your image"/><br>
	담당자정보<br>
	<input type="text" name="comHomePageUrl" placeholder="회사 Url"><br>
	<input type="text" name="comChargerName" placeholder="이름*"><br>
	휴대폰번호 <input type="text" name="comChargerPhone" placeholder="휴대폰 번호 -없이"><br> 
	담당자 이메일<input type="text" name="comChargerEmail" placeholder="이메일"><br> 
	
	
	<input type="checkbox" id="Allagreebox"> 전체동의 <br>
	<input type="checkbox" id="ageebox1"> 이용약관 <br>
	<input type="checkbox" id="Allagreebox"> 개인정보 수집 및 이용<br>
	<input type="submit" value="동의하고 회원가입">
</form>
</div>

<%@ include file="../commons/footer.jspf" %>
</body>
</html>