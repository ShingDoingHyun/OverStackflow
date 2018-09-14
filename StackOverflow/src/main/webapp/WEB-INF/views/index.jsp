<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/index.css" type="text/css" media="all" />
</head>

<body>

	<script>
		
	</script>


	<!----------------------header--------------------------------------->
	
	<%@ include file="commons/header.jspf" %>
	<!----------------------header End--------------------------------------->


	<!----------------------left menu--------------------------------------->
	<%@ include file="commons/left.jspf" %>
	<!----------------------left menu End--------------------------------------->





	<!----------------------main--------------------------------------->
	<div class="main">
		<h2>Sidenav Example</h2>
		<p>This sidenav is always shown.</p>
	</div>
	<!----------------------main End--------------------------------------->


	<!----------------------footer--------------------------------------->
	<%@ include file="commons/footer.jspf" %>
	<!----------------------footer End--------------------------------------->





</body>

</html>