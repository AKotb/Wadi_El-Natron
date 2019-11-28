<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>البحث</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" />
<link href="resources/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/fonts.css" rel="stylesheet" type="text/css"
	media="all" />
<link rel="stylesheet" href="resources/tooplate-style.css"
	type="text/css" media="all" />
<link rel="stylesheet" href="resources/beheira.css" type="text/css"
	media="all" />
<script>
		window.onload = function() {
			document.getElementById("searchresultscontent").style.display = "block";
			document.getElementById("searchformcontent").style.display = "block";
			document.getElementById("editformcontent").style.display = "none";
			farmsjson = '${farms}';
			var num_of_items = 0;
			var results = "";
			if (farmsjson) {
				var farms = JSON.parse(farmsjson);
				var farmid = "";
				var farmname = "";
				var ownerid = "";
				var ownername = "";
				var ownertel = "";
				var ownership = "";
				var displayedownership = "";
				for ( var i in farms) {
					num_of_items = num_of_items + 1;
					if (farms[i].farmID) {
						farmid = farms[i].farmID;
					} else {
						farmid = "غير متوفر";
					}
					if (farms[i].farmName) {
						farmname = farms[i].farmName;
					} else {
						farmname = "غير متوفر";
					}

					if (farms[i].ownerID) {
						ownerid = farms[i].ownerID;
					} else {
						ownerid = "غير متوفر";
					}

					if (farms[i].ownerName) {
						ownername = farms[i].ownerName;
					} else {
						ownername = "غير متوفر";
					}

					if (farms[i].telephone) {
						ownertel = farms[i].telephone;
					} else {
						ownertel = "غير متوفر";
					}

					if (farms[i].ownership) {
						ownership = farms[i].ownership;
						displayedownership = farms[i].ownership;
					} else {
						ownership = "غير متوفر";
						displayedownership = "غير متوفر";
					}

					results = results
							+ '<tr class=\"resulttr\">'
							+ '<td align=\"center\" style=\"width:20%;\">'
							+ '<button onclick=\"editfarmdata(\''
							+ farmid
							+ '_'
							+ farmname
							+ '_'
							+ ownername
							+ '_'
							+ ownerid
							+ '_'
							+ ownertel
							+ '_'
							+ ownership
							+ '\')\" class=\"button\" id=\"editselectedfarmBtn\">تعديل</button>'
							+ '<button onclick=\"displayonmap('
							+ farmid
							+ ')\" class=\"button\" id=\"showSearchResultsBtn\">عرض على الخريطة</button>'
							+ '</td>' + '<td align=\"right\" style=\"width:5%;\">' + displayedownership
							+ '</td>' + '<td align=\"right\" style=\"width:40%;\"><div style=\"word-break:break-all;\">' + ownername
							+ '</div></td>' + '<td align=\"right\" style=\"width:30%;\"><div style=\"word-break:break-all;\">' + farmname
							+ '</div></td>' + '<td style=\"width:5%;\">' + farmid + '</td>' + '</tr>';
				}

			}
			/*
			
			
						+ '<input type="submit" class="button" name="previous" value="السابق">'
					    + '<input type="submit" class="button" name="next" value="التالي">'
					    
			*/
			if (num_of_items > 0) {
				var search_header = '<div align=\"center\"><h3 align=\"center\">تم إيجاد '
						+ num_of_items
						+ ' من نتائج البحث </h3><br>'
						+ '<form action="${pageContext.request.contextPath}/search" method="post">'
						+ '<input type="hidden" name="form_type" value="paging">'
						+ '<input type="hidden" name="firstrow" value="${firstrow}">'
						+ '<input type="hidden" name="rowcount" value="${rowcount}">'
					    + '</form>'
						+'<table border=\"0\" align=\"center\" style=\"width:90%;\">'
						+ '<tr>'
						+ '<th class=\"resultth\">إعدادات</th>'
						+ '<th class=\"resultth\"> رقم الملف </th>'
						+ '<th class=\"resultth\">اسم المالك / واضع اليد</th>'
						+ '<th class=\"resultth\">اسم المزرعة / الشركة</th>'
						+ '<th class=\"resultth\"> كود المزرعة </th>' + '</tr>';

				results = search_header + results
						+ '</table></div><br><br><br><br><br><br><br><br>';
				document.getElementById('searchresultscontent').innerHTML = results;
			} else {
				document.getElementById('searchresultscontent').innerHTML = '<div align=\"center\"><h3>عفوا ، لا توجد نتائج</h3></div>';
			}
			
			
				var UserRole="<%=session.getAttribute("userRole")%>";
				if (UserRole != "null") {
					if (UserRole == "2") {
						document.getElementById("manageusersid").style.display = "block";
					} else {
						document.getElementById("manageusersid").style.display = "none";
					}
				} else {
					document.getElementById("manageusersid").style.display = "none";
				}
		}

		function validateSearchForm() {
			var errordiv=document.getElementById("errormsg");
            errordiv.style.color ="red";
            var UserRole="<%=session.getAttribute("userRole")%>";
			if (UserRole != "null") {
				if (UserRole == "2" || UserRole == "3") {
			        return true;
				} else {
					errordiv.innerHTML = "غير مسموح بدخول هذا الصفحة";
					return false;
				}
			} else {
				errordiv.innerHTML = "برجاء تسجيل الدخول";
				return false;
			}
		}

	function displayonmap(id) {
		var lat= "30.2519715";
		var lng= "30.2761235";
		window.location = "${pageContext.request.contextPath}/search?polygon_id=" + encodeURIComponent(id)+"&polygon_lat=" + encodeURIComponent(lat)+"&polygon_long=" + encodeURIComponent(lng);
	}

	function editfarmdata(selectedfarmdata) {
		document.getElementById("editformcontent").style.display = "block";
		document.getElementById("searchresultscontent").style.display = "none";
		document.getElementById("searchformcontent").style.display = "none";
		var res = selectedfarmdata.split("_");
		farmid = res[0];
		if (farmid) {
			document.getElementById("farmid").value = farmid;
		} else {
			document.getElementById("farmid").value = "غير متوفر";
		}
		farmname = res[1];
		if (farmname) {
			document.getElementById("farmname").value = farmname;
		} else {
			document.getElementById("farmname").value = "غير متوفر";
		}
		ownername = res[2];
		if (ownername) {
			document.getElementById("ownername").value = ownername;
		} else {
			document.getElementById("ownername").value = "غير متوفر";
		}
		ownerid = res[3];
		if (ownerid) {
			document.getElementById("ownerid").value = ownerid;
		} else {
			document.getElementById("ownerid").value = "غير متوفر";
		}
		ownertel = res[4];
		if (ownertel) {
			document.getElementById("ownertel").value = ownertel;
		} else {
			document.getElementById("ownertel").value = "غير متوفر";
		}
		ownership = res[5];
		if (ownership) {
			document.getElementById("ownership").value = ownership;
		} else {
			document.getElementById("ownership").value = "غير متوفر";
		}
	}

	function validateEditForm() {
		var errordiv=document.getElementById("errormsg");
        errordiv.style.color ="red";
        var UserRole="<%=session.getAttribute("userRole")%>";
		if (UserRole != "null") {
			if (UserRole == "2" || UserRole == "3") {
				document.getElementById("searchresultscontent").style.display = "block";
				document.getElementById("searchformcontent").style.display = "block";
				document.getElementById("editformcontent").style.display = "none";
				return true;
			} else {
				errordiv.innerHTML = "غير مسموح بدخول هذا الصفحة";
				return false;
			}
		} else {
			errordiv.innerHTML = "برجاء تسجيل الدخول";
			return false;
		}
	}

	function cancel() {
		document.getElementById("searchresultscontent").style.display = "block";
		document.getElementById("searchformcontent").style.display = "block";
		document.getElementById("editformcontent").style.display = "none";
	}
</script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDxcedr1zrD8h225vpj3hNseos5mHGEDVY"
	async defer></script>
<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.sticky.js"></script>
<script src="resources/js/jquery.stellar.min.js"></script>
<script src="resources/js/wow.min.js"></script>
<script src="resources/js/smoothscroll.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/custom.js"></script>
</head>
<body>
<jsp:include page="_header.jsp"></jsp:include>
	<div id="wrapper">
		
		<form id="searchformid" onsubmit="return validateSearchForm()"
			method="post" action="${pageContext.request.contextPath}/search">
			<div id="searchformcontent" align="center">
			<h1>البحث عن المزارع</h1>
				<input type="hidden" name="form_type" value="searchform">
				<table border="0" style="dir: rtl;">
					<tr>
						<td align="right"><input class="input-box" type="text"
							id="farm_name" name="farm_name" value=""></td>
						<td align="right" style="color: #3d6266;">اسم المزرعة /
							الشركة</td>
					</tr>
					<tr>
						<td align="right"><input class="input-box" type="text"
							id="ownership_status" name="ownership_status"></td>
						<td align="right" style="color: #396266;">رقم الملف</td>
					</tr>
					<tr>
						<td align="right"><input class="input-box" type="text"
							id="owner" name="owner_name" value=""></td>
						<td align="right" style="color: #3d6266;">اسم المالك / واضع
							اليد</td>
					</tr>
					<tr>
						<td align="right"><input class="input-box" type="text"
							id="sid" name="owner_id" value=""></td>
						<td align="right" style="color: #3d6266;">الرقم القومى</td>
					</tr>
					<tr>
						<td align="right"><input class="input-box" type="text"
							id="phone" name="owner_telephone" value=""></td>
						<td align="right" style="color: #3d6266;">التليفون</td>
					</tr>
				</table>
				<div id="errormsg"></div>

				<h2 align="center">
					<input type="submit" value="بحث" class="button btnsearch"
						id="searchBtn">
				</h2>
			</div>
		</form>

		<form id="editformid" onsubmit="return validateEditForm()"
			method="post" action="${pageContext.request.contextPath}/search">
			<div id="editformcontent" align="center">
			<h1>تعديل بيانات المزرعة</h1>
				<input type="hidden" name="form_type" value="editform">
				<table border="0" style="dir: rtl;">
					<tr>
						<td align="right"><input class="input-box" type="text"
							id="farmid" name="farm_id" readonly></td>
						<td align="right" style="color: #396266;">كود المزرعة</td>
					</tr>
					<tr>
						<td align="right"><input class="input-box" type="text"
							id="farmname" name="farm_name"></td>
						<td align="right" style="color: #396266;">اسم المزرعة</td>
					</tr>
					<tr>
						<td align="right"><input class="input-box" type="text"
							id="ownership" name="ownership_status"></td>
						<td align="right" style="color: #396266;">رقم الملف</td>
					</tr>
					<tr>
						<td align="right"><input class="input-box" type="text"
							id="ownername" name="owner_name"></td>
						<td align="right" style="color: #396266;">اسم المالك</td>
					</tr>
					<tr>
						<td align="right"><input class="input-box" type="text"
							id="ownerid" name="owner_id"></td>
						<td align="right" style="color: #396266;">الرقم القومي</td>
					</tr>
					<tr>
						<td align="right"><input class="input-box" type="text"
							id="ownertel" name="owner_telephone"></td>
						<td align="right" style="color: #396266;">التليفون</td>
					</tr>
				</table>
				<br> <br>
				<h2 align="center">
					<button onclick="cancel()" class="btnsearch" id="cancelBtn">الغاء</button>
					<input type="submit" value="حفظ" class="btnsearch" id="saveBtn">
				</h2>
			</div>
		</form>

		<div id="searchresultscontent"></div>

	</div>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>