<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>البحث في المزارع</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<meta name="description" content="" />

<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" />
<link href="resources/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/fonts.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- <link rel="stylesheet" href="resources/tooplate-style.css"
	type="text/css" media="all" />
<link rel="stylesheet" href="resources/beheira.css" type="text/css"
	media="all" /> -->
<link rel="stylesheet" href="resources/css/bootstrap.min.4.5.0.css"
	type="text/css" media="all" />

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

<script>
		window.onload = function() {
			document.getElementById("resultsdiv").style.display = "block";
			document.getElementById("searchformcontent").style.display = "block";
			document.getElementById("searchresultscontent").style.display = "block";
			document.getElementById("searchcontent").style.display = "block";
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
				var fileno = "";
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
						if(ownership == "1"){
							displayedownership = "عقد محافظة";
						}
						if(ownership == "2"){
							displayedownership = "تمليك (عقود مسجلة)";
						}
						if(ownership == "3"){
							displayedownership = "قرار تصرف";
						}
						if(ownership == "4"){
							displayedownership = "وضع يد";
						}
					} else {
						ownership = "غير متوفر";
						displayedownership = "غير متوفر";
					}
					
					if (farms[i].fileNo) {
						fileno = farms[i].fileNo;
					} else {
						fileno = "غير متوفر";
					}

					results = results
							+'<tbody>'
							+ '<tr>'
							+ '<td>'
							+ '<button onclick=\"editfarmdata(\''
							+ farmid
							+ '_'
							+ farmname
							+ '_'
							+ ownername
							+ '_'
							+ fileno
							+ '_'
							+ ownerid
							+ '_'
							+ ownertel
							+ '_'
							+ ownership
							+ '\')\" class=\"btnsearch\" id=\"editselectedfarmBtn\">تعديل</button><br>'
							+ '<button onclick=\"displayonmap('
							+ farmid
							+ ')\" class=\"btnsearch\" id=\"showSearchResultsBtn\">الخريطة</button>'
							+ '</td>' + '<td>' + fileno
							+ '</td>' + '<td>' + displayedownership
							+ '</td>'+ '<td>' + ownername
							+ '</td>' + '<td>' + farmname
							+ '</td>' + '<td>' + farmid + '</td>' + '</tr></tbody>';
				}
			
			farmownershipstatus = '${farm_ownership_status}';
			if (farmownershipstatus) {
				document.getElementById("ownership_status").value = farmownershipstatus;
			} else {
				document.getElementById("ownership_status").value = 	"";
			
			farmownershipstatus = '${farm_ownership_status}';
			if (farmownershipstatus) {
				document.getElementById("ownership_status").value = farmownershipstatus;
			} else {
				document.getElementById("ownership_status").value = 	"";
			}
			if (num_of_items > 0) {
				var search_header = '<div class=\"col-md-12\"><h3 class=\"text-center text-info\">تم إيجاد '
						+ num_of_items
						+ ' من نتائج البحث </h3><br>'
						+ '<form action="${pageContext.request.contextPath}/search" method="post">'
						+ '<input type="hidden" name="form_type" value="paging">'
						+ '<input type="hidden" name="firstrow" value="${firstrow}">'
						+ '<input type="hidden" name="rowcount" value="${rowcount}">'
					    + '</form>'
						+'<table class=\"table table-hover\">'
						+'<thead class=\"thead-light\">'
						+ '<tr>'
						+ '<th scope=\"col\">إعدادات</th>'
						+ '<th scope=\"col\"> رقم الملف </th>'
						+ '<th scope=\"col\"> نوع الحيازة </th>'
						+ '<th scope=\"col\">اسم المالك / واضع اليد</th>'
						+ '<th scope=\"col\">اسم المزرعة / الشركة</th>'
						+ '<th scope=\"col\"> كود المزرعة </th>' + '</tr></thead>';

				results = search_header + results
						+ '</table></div><br><br><br><br><br><br><br><br>';
				document.getElementById('searchresultscontent').innerHTML = results;
			noofrows = '${noofrows}';
			if (noofrows) {
				document.getElementById("returned_no_of_rows").innerHTML = "<h5 style=\'float: right;\'>] عدد المزارع المطابقة لبحثك</h5><h5 style=\'float: right;\'>${noofrows}</h5><h5 style=\'float: right;\'>مزرعة [</h5>";
			} else {
				document.getElementById('searchresultscontent').innerHTML = '<div align=\"center\"><h3 class=\"text-center text-info\">عفوا ، لا توجد نتائج</h3></div>';
				document.getElementById("returned_no_of_rows").innerHTML = 	"<h5 style=\'float: right;\'>!عفواً، قم بالبحث أولاً</h5>";
			}
		}

		function validatesearchform() {
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
		window.location = "${pageContext.request.contextPath}/search?polygon_id=" + encodeURIComponent(id)
				+"&polygon_lat=" + encodeURIComponent(lat)
				+"&polygon_long=" + encodeURIComponent(lng)
				+"&form_type=" + encodeURIComponent("displayonmap");
	}

	function editfarmdata(selectedfarmdata) {
		document.getElementById("editformcontent").style.display = "block";
		document.getElementById("searchresultscontent").style.display = "none";
		document.getElementById("searchcontent").style.display = "none";
		var res = selectedfarmdata.split("_");
		farmid = res[0];
		if (farmid) {
			document.getElementById("farmid").value = farmid;
		} else {
			document.getElementById("farmid").value = "غير متوفر";
		
		function editfarmdata(farmid, farmname, ownername, fileno, ownerid, ownertel, ownership) {
			document.getElementById("editformcontent").style.display = "block";
			document.getElementById("resultsdiv").style.display = "none";
			document.getElementById("searchformcontent").style.display = "none";
			if (farmid) {
				document.getElementById("farmid").value = farmid;
			} else {
				document.getElementById("farmid").value = "غير متوفر";
			}
			if (farmname) {
				document.getElementById("farmname").value = farmname;
			} else {
				document.getElementById("farmname").value = "غير متوفر";
			}
			if (ownername) {
				document.getElementById("ownername").value = ownername;
			} else {
				document.getElementById("ownername").value = "غير متوفر";
			}
			if (fileno) {
				document.getElementById("fileno").value = fileno;
			} else {
				document.getElementById("fileno").value = "غير متوفر";
			}
			if (ownerid) {
				document.getElementById("ownerid").value = ownerid;
			} else {
				document.getElementById("ownerid").value = "غير متوفر";
			}
			if (ownertel) {
				document.getElementById("ownertel").value = ownertel;
			} else {
				document.getElementById("ownertel").value = "غير متوفر";
			}
			if (ownership) {
				document.getElementById("ownership").value = ownership;
			} else {
				document.getElementById("ownership").value = "";
			}
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
		fileno = res[3];
		if (fileno) {
			document.getElementById("fileno").value = fileno;
		} else {
			document.getElementById("fileno").value = "غير متوفر";
		}
		ownerid = res[4];
		if (ownerid) {
			document.getElementById("ownerid").value = ownerid;
		} else {
			document.getElementById("ownerid").value = "غير متوفر";
		}
		ownertel = res[5];
		if (ownertel) {
			document.getElementById("ownertel").value = ownertel;
		} else {
			document.getElementById("ownertel").value = "غير متوفر";
		}
		ownership = res[6];
		if (ownership) {
			document.getElementById("ownership").value = ownership;
		} else {
			document.getElementById("ownership").value = "";
		}
	}

	function validateEditForm() {
		var errordiv=document.getElementById("errormsg");
        errordiv.style.color ="red";
        var UserRole="<%=session.getAttribute("userRole")%>";
		if (UserRole != "null") {
			if (UserRole == "2" || UserRole == "3") {
				document.getElementById("searchresultscontent").style.display = "block";
				//document.getElementById("searchformcontent").style.display = "block";
				document.getElementById("editformcontent").style.display = "none";
				return true;
	
		function validateeditform() {
			var errordiv=document.getElementById("errormsg");
	        errordiv.style.color ="red";
	        var UserRole="<%=session.getAttribute("userRole")%>";
			if (UserRole != "null") {
				if (UserRole == "2" || UserRole == "3") {
					document.getElementById("resultsdiv").style.display = "block";
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
	}

	function cancel() {
		/* window.location = "${pageContext.request.contextPath}/search?farm_name=" + encodeURIComponent(farmname)
				+"&owner_id=" + encodeURIComponent(ownerid)
				+"&owner_name=" + encodeURIComponent(ownername)
				+"&owner_telephone=" + encodeURIComponent(ownertel)
				+"&ownership_status=" + encodeURIComponent(ownership)
				+"&file_no=" + encodeURIComponent(fileno)
				+"&form_type=" + encodeURIComponent("searchform"); */
		window.history.back();
	}
</script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDxcedr1zrD8h225vpj3hNseos5mHGEDVY"
	async defer></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<!-- <script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script> -->
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

		<!-- SEARCH FOR FARMS FORM -->
		<form id="searchformid" onsubmit="return validatesearchform()"
			method="post" action="${pageContext.request.contextPath}/search">
			<div id="searchformcontent" align="center">
				<h1>البحث في المزارع</h1>
				<input type="hidden" name="form_type" value="searchform"> 
				<input type="hidden" name="currentPage" value="1"> 
				<input type="hidden" name="recordsPerPage" value="50">
				<div class="form-group">
					<label for="farm_name" class="text-info" style="float: right;">اسم المزرعة /
							الشركة
					</label>
					<br> 
					<input class="form-control" type="text"
							id="farm_name" name="farm_name" value="">
				</div>
				
				<div class="form-group">
					<label for="file_no" class="text-info" style="float: right;">رقم الملف
					</label>
					<br> 
					<input class="form-control" type="text"
							id="file_no" name="file_no" value="">
				</div>
				
				<div class="form-group">
					<label for="ownership_status" class="text-info" style="float: right;">نوع الحيازة
					</label>
					<br> 
					<select id="ownership_status" class="form-control" name="ownership_status" style="width: 100%; direction: rtl;">
								<option value="">اختر</option>
				<table border="0" style="dir: rtl;">
					<tr>
						<td align="right"><input class="input-box" type="text"
							id="farm_name" name="farm_name" value=""></td>
						<td align="right" style="color: #3d6266;">اسم المزرعة /
							الشركة</td>
					</tr>
					<tr>
						<td align="right"><input class="input-box" type="text"
							id="file_no" name="file_no" value=""></td>
						<td align="right" style="color: #3d6266;">رقم الملف</td>
					</tr>
					<tr>
						<td align="right"><select id="ownership_status"
							name="ownership_status" style="width: 100%; direction: rtl;">
								<option value="">الكل</option>
				<table border="0" style="dir: rtl;">
					<tr>
						<td align="right"><input class="input-box" type="text"
							id="farm_name" name="farm_name" value=""></td>
						<td align="right" style="color: #3d6266;">اسم المزرعة /
							الشركة</td>
					</tr>
					<tr>
						<td align="right"><input class="input-box" type="text"
							id="file_no" name="file_no" value=""></td>
						<td align="right" style="color: #3d6266;">رقم الملف</td>
					</tr>
					<tr>
						<td align="right"><select id="ownership_status"
							name="ownership_status" style="width: 100%; direction: rtl;">
								<option value="">الكل</option>
				<table border="0" style="dir: rtl;">
					<tr>
						<td align="right"><input class="input-box" type="text"
							id="farm_name" name="farm_name" value=""></td>
						<td align="right" style="color: #3d6266;">اسم المزرعة /
							الشركة</td>
					</tr>
					<tr>
						<td align="right"><input class="input-box" type="text"
							id="file_no" name="file_no" value=""></td>
						<td align="right" style="color: #3d6266;">رقم الملف</td>
					</tr>
					<tr>
						<td align="right"><select id="ownership_status"
							name="ownership_status" style="width: 100%; direction: rtl;">
								<option value="">الكل</option>
				<table border="0" style="dir: rtl;">
					<tr>
						<td align="right"><input class="input-box" type="text"
							id="farm_name" name="farm_name" value=""></td>
						<td align="right" style="color: #3d6266;">اسم المزرعة /
							الشركة</td>
					</tr>
					<tr>
						<td align="right"><input class="input-box" type="text"
							id="file_no" name="file_no" value=""></td>
						<td align="right" style="color: #3d6266;">رقم الملف</td>
					</tr>
					<tr>
						<td align="right"><select id="ownership_status"
							name="ownership_status" style="width: 100%; direction: rtl;">
								<option value="">الكل</option>
								<option value="1">عقد محافظة</option>
								<option value="2">تمليك (عقود مسجلة)</option>
								<option value="3">قرار تصرف</option>
								<option value="4">وضع يد</option>
					</select>
				</div>
				
				<div class="form-group">
					<label for="owner_name" class="text-info" style="float: right;">اسم المالك / واضع
							اليد
					</label>
					<br> 
					<input class="form-control" type="text"
							id="owner" name="owner_name" value="">
				</div>
				
				<div class="form-group">
					<label for="owner_id" class="text-info" style="float: right;">الرقم القومى
					</label>
					<br> 
					<input class="form-control" type="text"
							id="sid" name="owner_id" value="">
				</div>
				
				<div class="form-group">
					<label for="owner_telephone" class="text-info" style="float: right;">التليفون
					</label>
					<br> 
					<input class="form-control" type="text"
							id="phone" name="owner_telephone" value="">
				</div>
				
						</select></td>
						<td align="right" style="color: #396266;">نوع الحيازة</td>
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

				<div class="form-group">
				<br> 
					<input type="submit" value="بحث" class="btn btn-info btn-md" style="margin-left: 120px;" id="searchBtn">
				</div>
			
		</form>


		<!-- EDIT FARM DATA FORM -->
		<form id="editformid" onsubmit="return validateeditform()"
			method="post" action="${pageContext.request.contextPath}/search">
			<div id="editformcontent" align="center">
				<h1>تعديل بيانات المزرعة</h1>
				<input type="hidden" name="form_type" value="editform">
				
				<div class="form-group">
					<label for="farm_id" class="text-info" style="float: right;">كود المزرعة</label>
					<br> 
					<input class="form-control" type="text"
							id="farmid" name="farm_id" readonly>
				</div>
				
				<div class="form-group">
					<label for="farm_name" class="text-info" style="float: right;">اسم المزرعة /
							الشركة
					</label>
					<br> 
					<input class="form-control" type="text"
							id="farmname" name="farm_name">
				</div>
				
				<div class="form-group">
					<label for="file_no" class="text-info" style="float: right;">رقم الملف</label>
					<br> 
					<input class="form-control" type="text"
							id="fileno" name="file_no">
				</div>
				
				<div class="form-group">
					<label for="ownership_status" class="text-info" style="float: right;">نوع الحيازة
					</label>
					<br> 
					<select id="ownership" class="form-control" name="ownership_status" style="width: 100%; direction: rtl;">
								<option value="">اختر</option>
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
							id="fileno" name="file_no"></td>
						<td align="right" style="color: #396266;">رقم الملف</td>
					</tr>
					<tr>
						<td align="right"><select id="ownership"
							name="ownership_status" style="width: 100%; direction: rtl;">
								<option value="">الكل</option>
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
							id="fileno" name="file_no"></td>
						<td align="right" style="color: #396266;">رقم الملف</td>
					</tr>
					<tr>
						<td align="right"><select id="ownership"
							name="ownership_status" style="width: 100%; direction: rtl;">
								<option value="">الكل</option>
								<option value="1">عقد محافظة</option>
								<option value="2">تمليك (عقود مسجلة)</option>
								<option value="3">قرار تصرف</option>
								<option value="4">وضع يد</option>
					</select>
				</div>
				
				<div class="form-group">
					<label for="owner_name" class="text-info" style="float: right;">اسم المالك</label>
					<br> 
					<input class="form-control" type="text"
							id="ownername" name="owner_name">
				</div>
				
				<div class="form-group">
					<label for="owner_id" class="text-info" style="float: right;">الرقم القومي</label>
					<br> 
					<input class="form-control" type="text"
							id="ownerid" name="owner_id">
				</div>
				
				<div class="form-group">
					<label for="owner_telephone" class="text-info" style="float: right;">التليفون</label>
					<br> 
					<input class="form-control" type="text"
							id="ownertel" name="owner_telephone">
				</div>
				
				<div class="form-group">
				<br>
					<input type="submit" value="حفظ" class="btn btn-info btn-md" id="saveBtn">
					<button onclick="cancel()" class="btn btn-info btn-md" id="cancelBtn" style="margin-left: 120px;">الغاء</button>
				</div>
						</select></td>
						<td align="right" style="color: #396266;">نوع الحيازة</td>
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

		<!-- Div to Display Search Results -->
		<div id="resultsdiv" style="border: 1px solid #007bff;">
			<div style="width: 100%;">
				<div style="margin-right: 45%;" id="returned_no_of_rows"></div>
			</div>
			<br>
			<main class="m-3">
			<nav aria-label="Navigation for farms"
				style="margin: auto; width: 70%;">
				<ul class="pagination">
					<c:if test="${currentPage != 1}">
						<li class="page-item"><a class="page-link"
							href="${pageContext.request.contextPath}/search?ownership_status=${farm_ownership_status}&form_type=searchform&recordsPerPage=${recordsPerPage}&currentPage=${currentPage-1}">السابق</a>
						</li>
					</c:if>

					<c:forEach begin="1" end="${noOfPages}" var="i">
						<c:choose>
							<c:when test="${currentPage eq i}">
								<li class="page-item active"><a class="page-link"> ${i}
										<span class="sr-only">(current)</span>
								</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/search?ownership_status=${farm_ownership_status}&form_type=searchform&recordsPerPage=${recordsPerPage}&currentPage=${i}">${i}</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${currentPage lt noOfPages}">
						<li class="page-item"><a class="page-link"
							href="${pageContext.request.contextPath}/search?ownership_status=${farm_ownership_status}&form_type=searchform&recordsPerPage=${recordsPerPage}&currentPage=${currentPage+1}">التالي</a>
						</li>
					</c:if>
				</ul>
			</nav>
			<div class="row col-md-6" style="max-width: 100%;">
				<table class="table table-striped table-bordered table-sm" dir="rtl"
					style="width: 100%;">
					<tr>
						<th
							style="text-align: center; height: 60px; vertical-align: middle;">كود
							المزرعة</th>
						<th
							style="text-align: center; height: 60px; vertical-align: middle;">اسم
							المزرعة</th>
						<th
							style="text-align: center; height: 60px; vertical-align: middle;">اسم
							المالك</th>
						<th
							style="text-align: center; height: 60px; vertical-align: middle;">نوع
							الحيازة</th>
						<th
							style="text-align: center; height: 60px; vertical-align: middle;">رقم
							الملف</th>
						<th
							style="text-align: center; height: 60px; vertical-align: middle;">اعدادات</th>
					</tr>

					<c:forEach items="${farmspg}" var="farm">
						<tr>
							<td align="right">${farm.getFarmID()}</td>
							<td align="right">${farm.getFarmName()}</td>
							<td align="right">${farm.getOwnerName()}</td>
							<c:choose>
								<c:when test="${farm.getOwnership()=='1'}">
									<td align="right">عقد محافظة</td>
								</c:when>
								<c:when test="${farm.getOwnership()=='2'}">
									<td align="right">تمليك (عقود مسجلة)</td>
								</c:when>
								<c:when test="${farm.getOwnership()=='3'}">
									<td align="right">قرار تصرف</td>
								</c:when>
								<c:when test="${farm.getOwnership()=='4'}">
									<td align="right">وضع يد</td>
								</c:when>
								<c:otherwise>
									<td align="right">غير متوفر</td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${farm.getFileNo() == 'undefined'}">
									<td align="right">غير متوفر</td>
								</c:when>
								<c:when test="${farm.getFileNo() == 'null'}">
									<td align="right">غير متوفر</td>
								</c:when>
								<c:when test="${farm.getFileNo() == '0'}">
									<td align="right">غير متوفر</td>
								</c:when>
								<c:when test="${farm.getFileNo() == ''}">
									<td align="right">غير متوفر</td>
								</c:when>
								<c:otherwise>
									<td align="right">${farm.getFileNo()}</td>
								</c:otherwise>
							</c:choose>
							<td align="center">
								<button type="button" class="btn btn-success"
									onclick="editfarmdata('${farm.getFarmID()}', '${farm.getFarmName()}', '${farm.getOwnerName()}', '${farm.getFileNo()}', '${farm.getOwnerID()}', '${farm.getTelephone()}', '${farm.getOwnership()}');">تعديل</button>
								<button type="button" class="btn btn-primary"
									onclick="displayonmap(${farm.getFarmID()});">عرض</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>

			<nav aria-label="Navigation for farms"
				style="margin: auto; width: 70%;">
				<ul class="pagination">
					<c:if test="${currentPage != 1}">
						<li class="page-item"><a class="page-link"
							href="${pageContext.request.contextPath}/search?ownership_status=${farm_ownership_status}&form_type=searchform&recordsPerPage=${recordsPerPage}&currentPage=${currentPage-1}">السابق</a>
						</li>
					</c:if>

					<c:forEach begin="1" end="${noOfPages}" var="i">
						<c:choose>
							<c:when test="${currentPage eq i}">
								<li class="page-item active"><a class="page-link"> ${i}
										<span class="sr-only">(current)</span>
								</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/search?ownership_status=${farm_ownership_status}&form_type=searchform&recordsPerPage=${recordsPerPage}&currentPage=${i}">${i}</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${currentPage lt noOfPages}">
						<li class="page-item"><a class="page-link"
							href="${pageContext.request.contextPath}/search?ownership_status=${farm_ownership_status}&form_type=searchform&recordsPerPage=${recordsPerPage}&currentPage=${currentPage+1}">التالي</a>
						</li>
					</c:if>
				</ul>
			</nav>
			</main>
		</div>

		<!-- <div id="searchresultscontent"></div> -->

	</div>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>