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

<!--<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" />-->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link href="resources/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/fonts.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- <link rel="stylesheet" href="resources/tooplate-style.css"
	type="text/css" media="all" />
<link rel="stylesheet" href="resources/beheira.css" type="text/css"
	media="all" /> 
<link rel="stylesheet" href="resources/css/bootstrap.min.4.5.0.css"
	type="text/css" media="all" /> -->

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
			document.getElementById("searchcontent").style.display = "block";
			document.getElementById("resultsdiv").style.display = "block";
			document.getElementById("editsearchcontent").style.display = "none";
			farmownershipstatus = '${farm_ownership_status}';
			if (farmownershipstatus) {
				document.getElementById("ownership_status").value = farmownershipstatus;
			} else {
				document.getElementById("ownership_status").value = 	"";
			}
			noofrows = '${noofrows}';
			if (noofrows) {
				document.getElementById("returned_no_of_rows").innerHTML = "<h4 class=\"text-center text-info\" style=\"float: right;\">] عدد المزارع المطابقة لبحثك</h4><h4 class=\"text-center text-info\" style=\"float: right;\">${noofrows}</h4><h4 class=\"text-center text-info\" style=\"float: right;\">مزرعة [</h4>";
			} else {
				document.getElementById("returned_no_of_rows").innerHTML = 	"<h4 class=\"text-center text-info\" style=\"float: right;\">!عفواً، قم بالبحث أولاً</h4>";
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

	function editfarmdata(farmid, farmname, ownername, fileno, ownerid, ownertel, ownership) {
			document.getElementById("editsearchcontent").style.display = "block";
			document.getElementById("resultsdiv").style.display = "none";
			document.getElementById("searchcontent").style.display = "none";
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
		
	function validateeditform() {
			var errordiv=document.getElementById("errormsg");
	        errordiv.style.color ="red";
	        var UserRole="<%=session.getAttribute("userRole")%>";
			if (UserRole != "null") {
				if (UserRole == "2" || UserRole == "3") {
					document.getElementById("resultsdiv").style.display = "block";
					document.getElementById("searchcontent").style.display = "block";
					document.getElementById("editsearchcontent").style.display = "none";
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
		window.history.back();
	}
</script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>
	<div id="wrapper">
		<div id="searchcontent" dir=rtl>
				<div id="search-row" class="row justify-content-center align-items-center"> 
					<div id="search-column" class="col-md-6">
						<div id="search-box" class="col-md-12">
		<form id="searchformid" onsubmit="return validatesearchform()"
			method="post" action="${pageContext.request.contextPath}/search">
				<h3 class="text-center text-info">البحث في المزارع</h3><br>
				<input type="hidden" name="form_type" value="searchform">
				<input type="hidden" name="currentPage" value="1"> 
				<input type="hidden" name="recordsPerPage" value="50">
				<table border="0" align="center" style="dir: rtl;">
					<tr>
					
						<td align="right"><label for="farm_name" class="text-info" style="float: right;">اسم المزرعة /
								الشركة
						</label></td>
						<td align="right"><input class="form-control" type="text"
								id="farm_name" name="farm_name" value=""></td>
					</tr>
					
					<tr>
					
						<td align="right"><label for="file_no" class="text-info" style="float: right;">رقم الملف
						</label></td>
						<td align="right"><input class="form-control" type="text"
								id="file_no" name="file_no" value=""></td>
					</tr>
					
					<tr>
					
						<td align="right"><label for="ownership_status" class="text-info" style="float: right;">نوع الحيازة
						</label></td>
						<td align="right"><select id="ownership_status" class="form-control" name="ownership_status" style="width: 100%; direction: rtl;">
									<option value="">الكل</option>
									<option value="1">عقد محافظة</option>
									<option value="2">تمليك (عقود مسجلة)</option>
									<option value="3">قرار تصرف</option>
									<option value="4">وضع يد</option>
						</select></td>
					</tr>
					
					<tr>
					
						<td align="right"><label for="owner_name" class="text-info" style="float: right;">اسم المالك / واضع
								اليد
						</label></td>
						<td align="right"><input class="form-control" type="text"
								id="owner" name="owner_name" value=""></td>
					</tr>
					
					<tr>
					
						<td align="right"><label for="owner_id" class="text-info" style="float: right;">الرقم القومى
						</label></td>
						<td align="right"><input class="form-control" type="text"
								id="sid" name="owner_id" value=""></td>
					</tr>
					
					<tr>
					
						<td align="right"><label for="owner_telephone" class="text-info" style="float: right;">التليفون
						</label></td>
						<td align="right"><input class="form-control" type="text"
								id="phone" name="owner_telephone" value=""></td>
					</tr>
				</table>	
					<div id="errormsg"></div>
					<h2 align="center">
						<input type="submit" value="بحث" class="btn btn-info btn-md" id="searchBtn">
					</h2>
			
		</form>
		</div></div></div></div>


		<!-- EDIT FARM DATA FORM -->
		<div id="editsearchcontent" dir=rtl>
			
				<div id="editformcontent" class="row justify-content-center align-items-center">
					<div id="search-column" class="col-md-6">
						<div id="search-box" class="col-md-12">
		<form id="editformid" onsubmit="return validateeditform()"
			method="post" action="${pageContext.request.contextPath}/search">
				<h3 class="text-center text-info">تعديل بيانات المزرعة</h3><br>
				<input type="hidden" name="form_type" value="editform">
				<table border="0" align="center" style="dir: rtl;">
					<tr>
						<td align="right"><label for="farm_id" class="text-info" style="float: right;">كود المزرعة</label></td>
						<td align="right"><input class="form-control" type="text"
							id="farmid" name="farm_id" readonly></td>
					</tr>
					<tr>
						<td align="right"><label for="farm_name" class="text-info" style="float: right;">اسم المزرعة /
							الشركة
						</label></td>
						<td align="right"><input class="form-control" type="text"
							id="farmname" name="farm_name"></td>
					</tr>
					<tr>
						<td align="right"><label for="file_no" class="text-info" style="float: right;">رقم الملف</label></td>
						<td align="right"><input class="form-control" type="text"
							id="fileno" name="file_no"></td>
					</tr>
					<tr>
						<td align="right"><label for="ownership_status" class="text-info" style="float: right;">نوع الحيازة
						</label></td>
						<td align="right"><select id="ownership" class="form-control" name="ownership_status" style="width: 100%; direction: rtl;">
								<option value="">الكل</option>
								<option value="1">عقد محافظة</option>
								<option value="2">تمليك (عقود مسجلة)</option>
								<option value="3">قرار تصرف</option>
								<option value="4">وضع يد</option>
						</select></td>
					</tr>
					<tr>
						<td align="right"><label for="owner_name" class="text-info" style="float: right;">اسم المالك</label></td>
						<td align="right"><input class="form-control" type="text"
							id="ownername" name="owner_name"></td>
					</tr>
					<tr>
						<td align="right"><label for="owner_id" class="text-info" style="float: right;">الرقم القومي</label></td>
						<td align="right"><input class="form-control" type="text"
							id="ownerid" name="owner_id"></td>
					</tr>
					<tr>
						<td align="right"><label for="owner_telephone" class="text-info" style="float: right;">التليفون</label></td>
						<td align="right"><input class="form-control" type="text"
							id="ownertel" name="owner_telephone"></td>
					</tr>
				</table>
				<br><br>
				<h2 align="center">
						<input type="submit" value="حفظ" class="btn btn-info btn-md" id="saveBtn">
						<button onclick="cancel()" class="btn btn-info btn-md" id="cancelBtn">الغاء</button>
				</h2>
		</form>
		</div></div></div></div>

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