<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>إدارة المستخدمين</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="AKotb">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">



<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" />
<link href="resources/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/fonts.css" rel="stylesheet" type="text/css"
	media="all" />
<link rel="stylesheet" href="resources/tooplate-style.css" type="text/css"
	media="all"/>
<link rel="stylesheet" href="resources/beheira.css" type="text/css"
	media="all"/>
	<script type="text/javascript">
	window.onload = function() {
		document.getElementById("edituserdatacontent").style.display = "none";
		var UserRole="<%=session.getAttribute("userRole")%>";
		if (UserRole != "null") {
			if (UserRole == "2") {
				document.getElementById("manageusersid").style.display = "block";
			} else {
				document.getElementById("manageusersid").style.display = "none";
			}
		}

		usersjson = '${users}';
		var num_of_items = 0;
		var results = "";
		if (usersjson) {
			var users = JSON.parse(usersjson);
			var userName = "";
			var userMail = "";
			var userIdentifyNumber = "";
			var userPhoneNumber = "";
			var userRole = "";
			var displayedRole = "";
			for ( var i in users) {
				num_of_items = num_of_items + 1;
				if (users[i].name) {
					userName = users[i].name;
				} else {
					userName = "غير متوفر";
				}
				if (users[i].email) {
					userMail = users[i].email;
				} else {
					userMail = "غير متوفر";
				}
				if (users[i].identifynumber) {
					userIdentifyNumber = users[i].identifynumber;
				} else {
					userIdentifyNumber = "غير متوفر";
				}
				if (users[i].phoneNumber) {
					userPhoneNumber = users[i].phoneNumber;
				} else {
					userPhoneNumber = "غير متوفر";
				}
				if (users[i].roleid) {
					userRole = users[i].roleid;
					if (userRole === 1) {
						displayedRole = "زائر";
					}
					if (userRole === 2) {
						displayedRole = "مشرف الموقع";
					}
					if (userRole === 3) {
						displayedRole = "موظف";
					}
					if (userRole === null) {
						displayedRole = "غير متوفر";
					}
					if (userRole === 'غير متوفر') {
						displayedRole = "غير متوفر";
					}
				} else {
					userRole = "غير متوفر";
					displayedRole = "غير متوفر";
				}
				results = results
						+ '<tr class=\"resulttr\">'
						+ '<td style=\"width:5%;\"><div>'
						+ '<button onclick=\"edituserdata(\''
						+ userName
						+ '_'
						+ userMail
						+ '_'
						+ userIdentifyNumber
						+ '_'
						+ userPhoneNumber
						+ '_'
						+ userRole
						+ '_'
						+ i
						+ '\')\" class=\"button\" id=\"editselectedBtn\">تعديل</button>'
						+ '<button onclick=\"removeuserdata(\''
						+ userName
						+ '\')\" class=\"button\" id=\"removeselectedBtn\">حذف</button>'
						+ '</div></td>'
						+ '<td align=\"right\" style=\"width:15%;\"><div style=\"word-break:break-all;\">'
						+ displayedRole
						+ '</div></td>'
						+ '<td align=\"right\" style=\"width:15%;\"><div style=\"word-break:break-all;\">'
						+ userPhoneNumber
						+ '</div></td>'
						+ '<td align=\"right\" style=\"width:10%;\"><div style=\"word-break:break-all;\">'
						+ userIdentifyNumber
						+ '</div></td>'
						+ '<td align=\"right\" style=\"width:25%;\"><div style=\"word-break:break-all;\">'
						+ userMail
						+ '</div></td>'
						+ '<td style=\"width:5%;\">'
						+ '<input class=\"input-box\" type=\"text\"id=\"usernametxt'+i+'\" value=\"'+ userName+'\" readonly>'
						+ '</input></td>' + '</tr>';
			}
		}
		if (num_of_items > 0) {
			var search_header = '<div align=\"center\"><h3 align=\"center\">تم إيجاد '
					+ num_of_items
					+ ' من نتائج البحث </h3><br><table border=\"0\" align=\"center\" style=\"width:100%;\">'
					+ '<tr>'
					+ '<th class=\"resultth\">تعديل</th>'
					+ '<th class=\"resultth\"> الوظيفة </th>'
					+ '<th class=\"resultth\"> رقم التليفون </th>'
					+ '<th class=\"resultth\">الرقم القومي</th>'
					+ '<th class=\"resultth\">البريد الالكتروني</th>'
					+ '<th class=\"resultth\"> اسم المستخدم </th>'
					+ '</tr>';
			results = search_header + results + '</td></tr>'
					+ '</table></div><br><br><br><br>';
			document.getElementById('user_list').innerHTML = results;
		} else {
		}
	}

	
	function edituserdata(selecteduserdata) {
		document.getElementById("edituserdatacontent").style.display = "block";
		document.getElementById("user_list").style.display = "none";
		var res = selecteduserdata.split("_");
		userName = res[0];
		if (userName) {
			document.getElementById("username").value = userName;
		} else {
			document.getElementById("username").value = "غير متوفر";
		}
		userEmail = res[1];
		if (userEmail) {
			document.getElementById("useremail").value = userEmail;
		} else {
			document.getElementById("useremail").value = "غير متوفر";
		}
		userId = res[2];
		if (userId) {
			document.getElementById("userid").value = userId;
		} else {
			document.getElementById("userid").value = "غير متوفر";
		}
		userTelephone = res[3];
		if (userTelephone) {
			document.getElementById("usertelephone").value = userTelephone;
		} else {
			document.getElementById("usertelephone").value = "غير متوفر";
		}
		userRole = res[4];
		if (userRole) {
			document.getElementById("userrole").value = userRole;
		} else {
			document.getElementById("userrole").value = "غير متوفر";
		}
	}
	
	function removeuserdata(selectedusername) {
		var operationtype="remove"
		window.location = "${pageContext.request.contextPath}/manageusers?selectedusername=" + encodeURIComponent(selectedusername)+"&operation_type=" + encodeURIComponent(operationtype);
	}
	
	function cancel() {
		window.location = "${pageContext.request.contextPath}/manageusers?operation_type=list";
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
	<div id="manageuserscontent">
	<h1>إدارة المستخدمين</h1>
	<form id="edituserdata" method="post" onsubmit="return validateForm();" action="${pageContext.request.contextPath}/manageusers">
	<input type="hidden" name="operation_type" value="update">
			<div id="edituserdatacontent" align="center">
				<table border="0" style="dir: rtl;">
					<tr>
						<td align="right"><input class="input-box" type="text"
							id="username" name="user_name" readonly></td>
						<td align="right" style="color: #396266;">اسم المستخدم</td>
					</tr>
					<tr>
						<td align="right"><input class="input-box" type="text"
							id="useremail" name="user_email"></td>
						<td align="right" style="color: #396266;">البريد الالكتروني</td>
					</tr>
					<tr>
						<td align="right"><input class="input-box" type="text"
							id="userid" name="user_id"></td>
						<td align="right" style="color: #396266;">الرقم القومي</td>
					</tr>
					<tr>
						<td align="right"><input class="input-box" type="text"
							id="usertelephone" name="user_telephone"></td>
						<td align="right" style="color: #396266;">التليفون</td>
					</tr>
					<tr>
						<td align="right"><input class="input-box" type="password"
							id="userpassword" name="user_password"></td>
						<td align="right" style="color: #396266;">كلمة المرور الجديدة</td>
					</tr>
					<tr>
						<td align="right"><input class="input-box" type="password"
							id="userpasswordconfirm" name="user_password_confirm"></td>
						<td align="right" style="color: #396266;">تأكيد كلمة المرور</td>
					</tr>
					<tr>
								<td colspan="2"><span id='confirmpassmessage'></span></td>
					</tr>
					<tr>
						<td align="right"><select id="userrole"
							name="user_role" size="1" style="width: 80px;">
								<option value='2'>مشرف موقع</option>
								<option value='3'>موظف</option>
								<option value='1'>زائر</option>
						</select></td>
						<td align="right" style="color: #3d6266;">الوظيفة</td>
					</tr>
				</table>
				<br> <br>
				<h2 align="center">
					<input type="button" value="الغاء" onclick="cancel()" class="btnsearch" id="cancelBtn">
					<input type="submit" value="حفظ" class="btnsearch" id="saveBtn">
				</h2>
			</div>
	</form>
	
	<div align="center" id='user_list' style="padding-top: 10em;"></div>
		<div class="form-group">
			<%
				HttpSession sessions = request.getSession(true);
				String code = (String) sessions.getAttribute("adminmessage");
				String message = "";
				String color = "red";
				if (code == null) {
					message = new String("");
 				} else {
 					if(code.equals("1um")){
 						message = new String("تم الحذف بنجاح");
 						color = "green";
 					}if(code.equals("2um")){
 						message = new String("حدث خطأ أثناء محاولة حذف المستخدم, برجاء المحاولة في وقت لاحق!");
 					}if(code.equals("3um")){
 						message = new String("تم التحديث بنجاح");
 						color = "green";
 					}if(code.equals("4um")){
 						message = new String("حدث خطأ أثناء محاولة التحديث, برجاء المحاولة في وقت لاحق!");
 					}if(code.equals("5um")){
 						message = new String("نأسف , ليس لديك صلاحيات بدخول هذه الصفحة !");
 					}
 			%>
			<label for="errors" style="color:<%=color%>; padding-left:55em"><%=message%></label>
			<%
				}
			%>
		</div>
	</div>
	</div>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>