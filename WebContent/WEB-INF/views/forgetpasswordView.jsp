<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>اعادة تعيين كلمة المرور</title>
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
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>
	<div id="wrapper">
		<div id="forget_passwordcontent" dir=rtl>
			<div class="container">
				<div id="forget_password-row"
					class="row justify-content-center align-items-center">
					<div id="forget_password-column" class="col-md-6">
						<div id="forget_password-box" class="col-md-12">
							<form id="forget_password-form" class="form" method="POST"
								action="${pageContext.request.contextPath}/resetpassword">
								<h1 class="text-center text-info">اعادة تعيين كلمة المرور</h1>
								<p class="text-center text-info">من فضلك أدخل البريد
									الألكتروني المسجل به حسابك, سوف نقوم بإرسال كلمة المرور الجديدة
									إليكم</p>
								<div class="form-group">
									<label for="email" class="text-info" style="float: right;">البريد
										الألكتروني</label><br> <input type="text" name="email" id="email"
										class="form-control"> <input type="submit"
										name="submit" class="btn btn-info btn-md"
										value="ارسال كلمة المرور الجديدة"
										style="float: right; margin-right: 100px; margin-top: 2em;">
								</div>
								<br> <br>
								<div class="form-group">
									<%
										HttpSession sessions = request.getSession(true);
										String errorcode = (String) sessions.getAttribute("errorCode");
										String errormessage = "";
										if (errorcode == null) {
											errormessage = new String("");
										} else {
											if (errorcode.equals("1fp")) {
												errormessage = new String("من فضلك تحقق من البريد الألكتروني!");
											}
									%>
									<label for="errors"
										style="float: right; color: red; padding-left: 10em"><%=errormessage%></label>
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
	<script type="text/javascript">
		$(document).ready(function() {
			$("#forget_password-form").validate({
				rules : {
					email : {
						required : true,
						email : true
					}
				},
				messages : {
					email : {
						required : "من فضلك أدخل البريد الإلكتروني!",
						email : "من فضلك أدخل عنوان بريدإلكتروني صحيح!"
					}
				}
			});
		});
	</script>
</body>
</html>