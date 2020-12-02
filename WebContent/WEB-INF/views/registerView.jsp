<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>مستخدم جديد</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link href="resources/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/fonts.css" rel="stylesheet" type="text/css"
	media="all" />
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
		<div id="registercontent">
			<div class="container">
				<div id="login-row"
					class="row justify-content-center align-items-center">
					<div id="login-column" class="col-md-6">
						<div id="login-box" class="col-md-12">
							<form id="login-form" class="form" method="POST"
								action="${pageContext.request.contextPath}/register">
								<h3 class="text-center text-info">مستخدم جديد</h3>
								<div class="form-group">
									<label for="username" class="text-info" style="float: right;">اسم
										المستخدم</label><br> <input type="text" name="name" id="username"
										class="form-control">
								</div>
								<div class="form-group">
									<label for="password" class="text-info" style="float: right;">كلمة
										المرور</label><br> <input type="password" name="password"
										id="password" class="form-control">
								</div>
								<div class="form-group">
									<label for="email" class="text-info" style="float: right;">البريد
										الإلكتروني</label><br> <input type="text" name="email" id="email"
										class="form-control">
								</div>
								<div class="form-group">
									<label for="identification_id" class="text-info"
										style="float: right;">الرقم القومي</label><br> <input
										type="text" name="identication_id" id="identication_id"
										class="form-control">
								</div>
								<div class="form-group">
									<label for="telephone" class="text-info" style="float: right;">رقم
										الهاتف</label><br> <input type="text" name="telephone"
										id="telephone" class="form-control">
								</div>
								<div class="form-group">
									<input type="submit" name="submit" class="btn btn-info btn-md"
										value="تسجيل" style="float: right;">
									<input type="reset" name="reset" class="btn btn-info btn-md"
										value="مسح" style="float: right; margin-right: 10px;"> 
									<a href="${pageContext.request.contextPath}/login"
										class="text-info" style="float: left; margin-top: 10px;">لدي حساب؟</a>
								</div>
								
								<div class="form-group">
									<%
										HttpSession sessions = request.getSession(true);
										String code = (String) sessions.getAttribute("message");
										String message = "";
										if (code == null) {
											message = new String("");
 										} else {
 											if(code.equals("1r")){
 												message = new String("اسم المستخدم موجود مسبقاً!");
 											}if(code.equals("3r")){
 												message = new String("حدث خطأ أثناء محاولة اضافة المستخدم, برجاء المحاولة في وقت لاحق!");
 											}if(code.equals("4r")){
 												message = new String("برجاء ادخال كل الحقول!");
 											}
 									%>
										<label for="errors" style="float: right; color: red; padding-left:10em"><%=message%></label>
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