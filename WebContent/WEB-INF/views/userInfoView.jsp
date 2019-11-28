<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>بيانات المستخدم</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<meta name="description" content="" />

<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" />
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link href="resources/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/fonts.css" rel="stylesheet" type="text/css"
	media="all" />
<link rel="stylesheet" href="resources/tooplate-style.css" type="text/css"
	media="all"/>
<link rel="stylesheet" href="resources/beheira.css" type="text/css"
	media="all"/>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var userName = "";
	var userMail = "";
	var userIdentifyNumber = "";
	var userPhoneNumber = "";
	var role = "";
	window.onload = function() {
		document.getElementById("edituserdata").style.display = "none";
		userjson = '${user}';
		if (userjson) {
			var user = JSON.parse(userjson);
			if (user.name) {
				userName = user.name;
			} else {
				userName = "غير متوفر";
			}
			if (user.email) {
				userMail = user.email;
			} else {
				userMail = "غير متوفر";
			}
			if (user.identifynumber) {
				userIdentifyNumber = user.identifynumber;
			} else {
				userIdentifyNumber = "غير متوفر";
			}
			if (user.phoneNumber) {
				userPhoneNumber = user.phoneNumber;
			} else {
				userPhoneNumber = "غير متوفر";
			}
			if (user.roleid) {
				role = user.roleid;
			} else {
				role = "غير متوفر";
			}
		}
		document.getElementById("usernameviewhead").innerHTML = userName;
		document.getElementById("usernameview").innerHTML = userName;
		document.getElementById("userroleview").innerHTML = role;
		document.getElementById("useremailview").innerHTML = userMail;
		document.getElementById("useridview").innerHTML = userIdentifyNumber;
		document.getElementById("usertelephoneview").innerHTML = userPhoneNumber;
	}

	function edituserdata() {
		document.getElementById("viewuserdata").style.display = "none";
		
		document.getElementById("username").value = userName;
		document.getElementById("userrole").value = role;
		document.getElementById("useremail").value = userMail;
		document.getElementById("userid").value = userIdentifyNumber;
		document.getElementById("usertelephone").value = userPhoneNumber;
		
		document.getElementById("edituserdata").style.display = "block";
	}

	function cancel() {
		window.location = "${pageContext.request.contextPath}/userInfo?loggedinuser="+userName;
	}

	function validateForm() {
		if (document.getElementById('userpassword').value == document.getElementById('userpasswordconfirm').value) {
			return true;
		} else {
			document.getElementById('confirmpassmessage').style.color = 'red';
			document.getElementById('confirmpassmessage').innerHTML = 'فشل تطابق كلمة المرور';
			return false;
		}
	}
</script>
</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>
	<div id="wrapper">
		<div id="userinfocontent" dir="rtl">
			<div class="container">
				<div class="row" id="viewuserdata">
					<div class="col-md-7 "
						style="width: 60%; float: none; position: absolute;">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4>بيانات المستخدم</h4>
								<input type="button" style="float: left; margin-top: -1.5em"
									value="تعديل" class="btnsearch" id="editBtn"
									onclick="edituserdata();">
							</div>
							<div class="panel-body">
								<div class="box box-info">
									<div class="box-body">

										<div class="col-sm-6" style="text-align: left;">
											<h4 style="color: #00b1b1;" id="usernameviewhead"></h4>
										</div>
										<hr style="margin: 5px 0 5px 0;">

										<div class="col-sm-6" style="width:15%; float: right;">
											<div align="center">
												<img alt="User Pic"
													src="https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg"
													id="profile-image1" class="img-circle img-responsive">
											</div>
											<br>
										</div>
										<div class="clearfix"></div>


										<div class="col-sm-7 col-xs-6 " style="text-align: left;" id="usernameview"></div>
										<div class="col-sm-5 col-xs-6 tital "
											style="text-align: right;">اسم المستخدم</div>
										<div class="clearfix"></div>
										<div class="bot-border"></div>

										<div class="col-sm-7" style="text-align: left;" id="useremailview"></div>
										<div class="col-sm-5 col-xs-6 tital "
											style="text-align: right;">البريد الإلكتروني</div>
										<div class="clearfix"></div>
										<div class="bot-border"></div>
										
										<div class="col-sm-7 col-xs-6 " style="text-align: left;" id="useridview"></div>
										<div class="col-sm-5 col-xs-6 tital "
											style="text-align: right;">الرقم القومي</div>
										<div class="clearfix"></div>
										<div class="bot-border"></div>

										<div class="col-sm-7" style="text-align: left;" id="usertelephoneview"></div>
										<div class="col-sm-5 col-xs-6 tital "
											style="text-align: right;">الهاتف</div>
										<div class="clearfix"></div>
										<div class="bot-border"></div>

										<div class="col-sm-7" style="text-align: left;" id="userroleview"></div>
										<div class="col-sm-5 col-xs-6 tital "
											style="text-align: right;">الكود الوظيفي</div>
										<div class="clearfix"></div>
										<div class="bot-border"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="edituserdata">
					<form method="post" onsubmit="return validateForm();"
						action="${pageContext.request.contextPath}/manageusers">
						<input type="hidden" name="operation_type" value="updatemyprofile">
						<h1>بيانات المستخدم</h1>
						<table border="0" style="margin-right:21em;">
							<tr>
								<td align="right" style="color: #396266;">اسم المستخدم</td>
								<td align="right"><input class="input-box" type="text"
									id="username" name="user_name"
									readonly="readonly"></td>
							</tr>
							<tr>
								<td align="right" style="color: #396266;">الكود الوظيفي</td>
								<td align="right"><input class="input-box" type="text"
									id="userrole" name="user_role"
									readonly="readonly"></td>
							</tr>
							<tr>
								<td align="right" style="color: #396266;">البريد الالكتروني</td>
								<td align="right"><input class="input-box" type="text"
									id="useremail" name="user_email"></td>
							</tr>
							<tr>
								<td align="right" style="color: #396266;">الرقم القومي</td>
								<td align="right"><input class="input-box" type="text"
									id="userid" name="user_id" ></td>
							</tr>
							<tr>
								<td align="right" style="color: #396266;">التليفون</td>
								<td align="right"><input class="input-box" type="text"
									id="usertelephone" name="user_telephone"></td>
							</tr>
							<tr>
								<td align="right" style="color: #396266;">كلمة المرور
									الجديدة</td>
								<td align="right"><input class="input-box" type="password"
									id="userpassword" name="user_password"></td>
							</tr>
							<tr>
								<td align="right" style="color: #396266;">تأكيد كلمة المرور</td>
								<td align="right"><input class="input-box" type="password"
									id="userpasswordconfirm" name="user_password_confirm"></td>
							</tr>
							<tr>
								<td colspan="2"><span id='confirmpassmessage'></span></td>
							</tr>
						</table>
						<br> <br>
						<h2 align="center">
							<input type="submit" value="حفظ" class="btnsearch" id="saveBtn">
							<input type="button" onclick="cancel()" value="الغاء" class="btnsearch" id="cancelBtn">
						</h2>
					</form>
				</div>
			</div>
			<div class="form-group">
				<%
					HttpSession sessions = request.getSession(true);
					String code = (String) sessions.getAttribute("adminmessage");
					String message = "";
					String color = "red";
					if (code == null) {
						message = new String("");
					} else {
						if (code.equals("3um")) {
							message = new String("تم التحديث بنجاح");
							color = "green";
						}
						if (code.equals("4um")) {
							message = new String("حدث خطأ أثناء محاولة التحديث, برجاء المحاولة في وقت لاحق!");
						}
						if (code.equals("5um")) {
							message = new String("نأسف , ليس لديك صلاحيات بدخول هذه الصفحة !");
						}
				%>
				<label for="errors"
					style="color:<%=color%>; padding-right: 55em;padding-top: 30em;"><%=message%></label>
				<%
					}
				%>
			</div>
		</div>
	</div>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>