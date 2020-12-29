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
<script type="text/javascript">
	window.onload = function() {
		var UserRole="<%=session.getAttribute("userRole")%>";
		if (UserRole != "null") {
			if (UserRole == "2") {
				document.getElementById("manageusersid").style.display = "block";
			} else {
				document.getElementById("manageusersid").style.display = "none";
			}
		}
	}
</script>

</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>
	<div id="wrapper">
		<div id="logincontent" dir=rtl>
			<div class="container">
				<div id="login-row"
					class="row justify-content-center align-items-center">
					<div id="login-column" class="col-md-6">
						<div id="login-box" class="col-md-12">
							<form id="login-form" class="form" method="POST"
								action="${pageContext.request.contextPath}/login">
								<h3 class="text-center text-info">تسجيل الدخول</h3>
								<div class="form-group">
									<label for="username" class="text-info" style="float: right;">اسم
										المستخدم</label><br> <input type="text" name="userName"
										id="username" class="form-control">
								</div>
								<div class="form-group">
									<label for="password" class="text-info" style="float: right;">كلمة
										المرور</label><br> <input type="password" name="password"
										id="password" class="form-control">
								</div>
								<div class="form-group">
									<%-- <label for="forget-password" class="text-info" style="float: right;">
										<span>
											<a href="${pageContext.request.contextPath}/resetpassword">forget password</a>
										</span>
									</label> --%>
									<br>
									<input type="submit" name="submit" class="btn btn-info btn-md"
										value="دخول" style="float: right; margin-right: 100px;">
								</div>
								<div id="register-link" class="text-right" style="float: left;">
									<a href="${pageContext.request.contextPath}/register"
										class="text-info">مستخدم جديد</a>
								</div>
								<br><br>
								<div class="form-group">
									<%
										HttpSession sessions = request.getSession(true);
										String errorcode = (String) sessions.getAttribute("errorCode");
										String errormessage = "";
										if (errorcode == null) {
											errormessage = new String("");
 										} else {
 											if(errorcode.equals("1l")){
 												errormessage = new String("من فضلك قم بادخال اسم المستخدم و كلمة المرور!");
 											}if(errorcode.equals("2l")){
 												errormessage = new String("من فضلك تحقق من اسم المستخدم وكلمة المرور!");
 											}
 									%>
										<label for="errors" style="float: right; color: red; padding-left:10em"><%=errormessage%></label>
									<%
										}
									%>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>