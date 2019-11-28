<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>استخدامات الأراضي</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" />
<link href="resources/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/fonts.css" rel="stylesheet" type="text/css"
	media="all" />
<link rel="stylesheet"	href="resources/tooplate-style.css">
<link rel="stylesheet" href="resources/beheira.css">

	<script>
		id = "${polygonID}";
		lat = "${lat}";
		lng = "${lng}";
		farmjson = '${farmdata}';
		farmdata = JSON.parse(farmjson);
		var map;
		var infowindow;
		var color;
		var colorcode;
		function initMap() {
			var Egypt = {
				lat : 30.2519715,
				lng : 30.2761235
			};
			map = new google.maps.Map(document.getElementById('map-canvas'), {
				zoom : 11,
				center : Egypt,
				mapTypeId : 'hybrid'
			});
			map.setZoom(15);
			map.setCenter(new google.maps.LatLng(lat, lng));
			var admin_layer = new google.maps.Data({map: map});
			var landuse_layer = new google.maps.Data({map: map});
			
			
			// for development server
			if (200 == urlExists('http://localhost:8080/JSON/admin/admin_'+id+'.json')) {
				admin_layer.loadGeoJson('http://localhost:8080/JSON/admin/admin_'+id+'.json');
			}
			if (200 == urlExists('http://localhost:8080/JSON/landuse/landuse_'+id+'.json')) {
				landuse_layer.loadGeoJson('http://localhost:8080/JSON/landuse/landuse_'+id+'.json');
			}
			
			// for production server
			/*if (200 == urlExists('http://wn.narss.sci.eg:8080/JSON/admin/admin_'+id+'.json')) {
				admin_layer.loadGeoJson('http://wn.narss.sci.eg:8080/JSON/admin/admin_'+id+'.json');
			}
			if (200 == urlExists('http://wn.narss.sci.eg:8080/JSON/landuse/landuse_'+id+'.json')) {
				landuse_layer.loadGeoJson('http://wn.narss.sci.eg:8080/JSON/landuse/landuse_'+id+'.json');
			}*/
			
			
			
			infowindow = new google.maps.InfoWindow();
			admin_layer.setStyle(function(feature) {
					return ({
						fillColor : 'transparent',
						strokeColor : 'black',
						strokeWeight : 2
					});
			});
			landuse_layer.setStyle(function(feature) {
				var landusecode = feature.getProperty('LanduseCod');
				
				if(landusecode == '1'){
					color = 'red';
					return ({
						fillColor : color,
						strokeColor : color,
						strokeWeight : 2
					});
				}
				if(landusecode == '2' || landusecode == '3'){
					color='lightgreen';
					return ({
						fillColor : color,
						strokeColor : color,
						strokeWeight : 2
					});
				}
				if(landusecode == '4'){
					color='orange';
					return ({
						fillColor : color,
						strokeColor : color,
						strokeWeight : 2
					});
				}
				if(landusecode == '5'){
					color='lightgray';
					return ({
						fillColor : color,
						strokeColor : color,
						strokeWeight : 2
					});
				}
				if(landusecode == '6'){
					color='#FF0000';
					return ({
						fillColor : color,
						strokeColor : color,
						strokeWeight : 2
					});
				}
				if(landusecode == '7'){
					color='#FF00FF';
					return ({
						fillColor : color,
						strokeColor : color,
						strokeWeight : 2
					});
				}
				if(landusecode == '8'){
					color='#FFBEE8';
					return ({
						fillColor : color,
						strokeColor : color,
						strokeWeight : 2
					});
				}
				if(landusecode == '9'){
					color='#E64C00';
					return ({
						fillColor : color,
						strokeColor : color,
						strokeWeight : 2
					});
				}
			});
			landuse_layer.addListener('click', function(event) {
				landuse_layer.revertStyle();
				landuse_layer.overrideStyle(event.feature, {
					strokeWeight : 4,
					fillColor : 'yellow'
				});
				var arname = 'غير متوفر';
				var landusecode = event.feature.getProperty('LanduseCod');
				if(landusecode == '1'){
					colorcode = '#FF0000';
					arname = 'مباني';
				}
				if(landusecode == '2' || landusecode == '3'){
					colorcode = '#90EE90';
					arname = 'أراضي منزرعة';
				}
				if(landusecode == '4'){
					colorcode = '#FFA500';
					arname = 'أراضي مستصلحة';
				}
				if(landusecode == '5'){
					colorcode = '#D3D3D3';
					arname = 'أراضي غير مستغلة';
				}
				if(landusecode == '6'){
					colorcode = '#FF0000';
					arname = 'مباني ادارية وسكنية';
				}
				if(landusecode == '7'){
					colorcode = '#FF00FF';
					arname = 'مباني انتاج داجني';
				}
				if(landusecode == '8'){
					colorcode = '#FFBEE8';
					arname = 'مباني انتاج حيواني';
				}
				if(landusecode == '9'){
					colorcode = '#E64C00';
					arname = 'مباني انتاج زراعي';
				}
				if (farmdata.farmID) {
					db_farmid = farmdata.farmID;
				} else {
					db_farmid = "غير متوفر";
				}
				if (farmdata.farmName) {
					db_farmname = farmdata.farmName;
				} else {
					db_farmname = "غير متوفر";
				}
				if (farmdata.reclamedArea) {
					db_reclamedArea = farmdata.reclamedArea;
				} else {
					db_reclamedArea = "لا يوجد";
				}
				if (farmdata.urbanArea) {
					db_urbanArea = farmdata.urbanArea;
				} else {
					db_urbanArea = "لا يوجد";
				}
				if (farmdata.unusedArea) {
					db_unusedArea = farmdata.unusedArea;
				} else {
					db_unusedArea = "لا يوجد";
				}
				if (farmdata.fieldCropsArea) {
					db_fieldCropsArea = farmdata.fieldCropsArea;
				} else {
					db_fieldCropsArea = "لا يوجد";
				}
				if (farmdata.cropsArea) {
					db_cropsArea = farmdata.cropsArea;
				} else {
					db_cropsArea = "لا يوجد";
				}
				if (farmdata.managBuildings) {
					db_managBuildings = farmdata.managBuildings;
				} else {
					db_managBuildings = "لا يوجد";
				}
				if (farmdata.poulBuildings) {
					db_poulBuildings = farmdata.poulBuildings;
				} else {
					db_poulBuildings = "لا يوجد";
				}
				if (farmdata.animBuildings) {
					db_animBuildings = farmdata.animBuildings;
				} else {
					db_animBuildings = "لا يوجد";
				}
				if (farmdata.agriBuildings) {
					db_agriBuildings = farmdata.agriBuildings;
				} else {
					db_agriBuildings = "لا يوجد";
				}
				
				var link0 = "<a href=\'datafiles/mahader/0.png\' target='_blank' class=\'button\'> محضر معاينة </a>";
				if (200 == urlExists('datafiles/mahader/'+db_farmid+'.png')) {
					link0 = "<a href=\'datafiles/mahader/"+db_farmid+".png\' target='_blank' class=\'button\'> محضر معاينة </a>";
				}
				var link1 = "<a href=\'javascript:void(0);\' onclick=\'back();\' class=\'button\'> رجوع </a>";
				var link2 = "<a href=\'javascript:void(0);\' onclick=\'raster("
							+ db_farmid
							+ ");\' class=\'button\'> مرئيات فضائية </a>";
				var link3 = "<a href=\'javascript:void(0);\' onclick=\'vouchers("
						+ db_farmid
						+ ");\' class=\'button\'>"
						+ "طلب إجراءات التقنين"
						+ "</a>";
				var link4 = "<a href=\'datafiles/landuse/"+db_farmid+".jpg\' target='_blank'><img class=\'infowindowimg\' src=\'datafiles/landuse/"+db_farmid+".jpg\' alt=\'Icon\' style=\"width:300px;height:170px;\"></a>";
				var content = "<div style=\"text-align:center; overflow:hidden;\"><h1 style=\"background-color: #44a959;\">"
					+ "بيانات قطعة الأرض" + "</h1><br>"
					+ link4
					+ "<br>"
					+ "<table class=\"outertable\" style=\"dir: rtl;\"><tr><td class=\'td\'>"
					+ db_farmid
					+ "</td><td class=\'rightcolumn\'>كود المزرعة / الشركة</td></tr><tr><td class=\'td\'>"
					+ db_farmname
					+ "</td><td class=\'rightcolumn\'>اسم المزرعة / الشركة</td></tr></table>"
					+"<h2 style=\"background-color: #44a959;\">استخدامات الأرض / فدان</h2>"
					+"<table class=\"outertable\" style=\"dir: rtl;\"><tr><td class=\'td\'>"
					+ db_fieldCropsArea
					+ "</td><td class=\'rightcolumn\'>محاصيل حقلية</td></tr><tr><td class=\'td\'>"
					+ db_cropsArea
					+ "</td><td class=\'rightcolumn\'>محاصيل بستانية</td></tr><tr><td class=\'td\'>"
					+ db_reclamedArea
					+ "</td><td class=\'rightcolumn\'>أراضي مستصلحة ومعدة للزراعة</td></tr><tr><td class=\'td\'>"
					+ db_unusedArea
					+ "</td><td class=\'rightcolumn\'>أراضي غير مستغلة</td></tr><tr><td class=\'td\'>"
					+ db_urbanArea
					+ "</td><td class=\'rightcolumn\'>مباني قائمة</td></tr><tr><td class=\'td\'>"
					+ db_managBuildings
					+ "</td><td class=\'rightcolumn\'>مباني ادارية وسكنية</td></tr><tr><td class=\'td\'>"
					+ db_poulBuildings
					+ "</td><td class=\'rightcolumn\'>مباني انتاج داجني</td></tr><tr><td class=\'td\'>"
					+ db_animBuildings
					+ "</td><td class=\'rightcolumn\'>مباني انتاج حيواني</td></tr><tr><td class=\'td\'>"
					+ db_agriBuildings
					+ "</td><td class=\'rightcolumn\'>مباني انتاج زراعي</td></tr></table>"
					+ "<br><h2 style=\"background-color: "+colorcode+";\">"
					+ arname
					+ "</h2>"
					+ "<table style= \"margin: auto;\"><tr><td class=\'td-button\'>"
					+ link1
					+ "</td><td class=\'td-button\'>"
					+ link0
					+ "</td><td class=\'td-button\'>"
					+ link3
					+ "</td><td class=\'td-button\'>"
					+ link2
					+ "</td></tr></table>"
					+ "<span onclick='close_infowindow()' class='searchClose'>[&times;]</span></div>";
				infowindow.setContent(content);
				infowindow.setPosition(event.latLng);
				infowindow.open(map);
			});

			landuse_layer.addListener('mouseover',function(event) {});
			landuse_layer.addListener('mouseout', function(event) {
				landuse_layer.revertStyle();
			});
		}

		function urlExists(checkedurl) {
			var http = $.ajax({
				type : "HEAD",
				url : checkedurl,
				async : false
			})
			return http.status;
		}
		
		function raster(id) {
			window.location = "${pageContext.request.contextPath}/raster?polygon_id=" + encodeURIComponent(id)+"&polygon_lat=" + encodeURIComponent(lat)+"&polygon_long=" + encodeURIComponent(lng);
		}

		function vouchers(id) {
			var operationType = "list";
			window.location = "${pageContext.request.contextPath}/vouchers?polygon_id=" + encodeURIComponent(id)+"&polygon_lat=" + encodeURIComponent(lat)+"&polygon_long=" + encodeURIComponent(lng)+"&operation_type=" + encodeURIComponent(operationType);
		}
		
		function close_infowindow() {
			infowindow.close();
		}
		
		function back() {
			window.location = "${pageContext.request.contextPath}/search?polygon_id=" + encodeURIComponent(id)+"&polygon_lat=" + encodeURIComponent(lat)+"&polygon_long=" + encodeURIComponent(lng);
		}
		
		window.onload = function() {
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
	</script>
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDxcedr1zrD8h225vpj3hNseos5mHGEDVY&callback=initMap"></script>
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
	<div id="map-canvas"></div>
	</div>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>