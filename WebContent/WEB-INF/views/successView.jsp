<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>تسجيل الدخول</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link href="resources/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/fonts.css" rel="stylesheet" type="text/css"
	media="all" />
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>
	<div id="wrapper">
		<div id="logincontent" dir=rtl>
			<div class="container">
						<div class="form-group">
									<%
										HttpSession sessions = request.getSession(true);
										String code = (String) sessions.getAttribute("message");
										String message = null;
										if (code == null) {
											message = new String("");
 										} else {
 											if(code.equals("2r")){
 												message = new String("لقد تم اضافة المستخدم بنجاح");
 											}
 									%>
										<h3 class="text-center text-info"><%=message%></h3>
										<a href="${pageContext.request.contextPath}/login" style="padding-left: 32em;">تسجيل الدخول</a>
									<%
										}
									%>
								</div>
			</div>
		</div>
	</div>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>