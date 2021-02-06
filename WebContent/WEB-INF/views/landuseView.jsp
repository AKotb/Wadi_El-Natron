<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>استخدامات الأراضي</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" />
<link href="resources/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/fonts.css" rel="stylesheet" type="text/css"
	media="all" />
<link rel="stylesheet"	href="resources/tooplate-style.css">
<link rel="stylesheet" href="resources/beheira.css">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

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
			/*if (200 == urlExists('http://localhost:8080/JSON/admin/admin_'+id+'.json')) {
				admin_layer.loadGeoJson('http://localhost:8080/JSON/admin/admin_'+id+'.json');
			}
			if (200 == urlExists('http://localhost:8080/JSON/landuse/landuse_'+id+'.json')) {
				landuse_layer.loadGeoJson('http://localhost:8080/JSON/landuse/landuse_'+id+'.json');
			}*/
			
			// for azure production server
			if (200 == urlExists('http://wn-narss.centralus.cloudapp.azure.com:8080/JSON/admin/admin_'+id+'.json')) {
				admin_layer.loadGeoJson('http://wn-narss.centralus.cloudapp.azure.com:8080/JSON/admin/admin_'+id+'.json');
			}
			if (200 == urlExists('http://wn-narss.centralus.cloudapp.azure.com:8080/JSON/landuse/landuse_'+id+'.json')) {
				landuse_layer.loadGeoJson('http://wn-narss.centralus.cloudapp.azure.com:8080/JSON/landuse/landuse_'+id+'.json');
			}
			
			// for narss production server
			/*if (200 == urlExists('http://wn.narss.sci.eg:8080/JSON/admin/admin_'+id+'.json')) {
				admin_layer.loadGeoJson('http://wn.narss.sci.eg:8080/JSON/admin/admin_'+id+'.json');
			}
			if (200 == urlExists('http://wn.narss.sci.eg:8080/JSON/landuse/landuse_'+id+'.json')) {
				landuse_layer.loadGeoJson('http://wn.narss.sci.eg:8080/JSON/landuse/landuse_'+id+'.json');
			}*/
			
			// for Beheira production server
			/*if (200 == urlExists('http://41.65.224.229:8080/JSON/admin/admin_'+id+'.json')) {
				admin_layer.loadGeoJson('http://41.65.224.229:8080/JSON/admin/admin_'+id+'.json');
			}
			if (200 == urlExists('http://41.65.224.229:8080/JSON/landuse/landuse_'+id+'.json')) {
				landuse_layer.loadGeoJson('http://41.65.224.229:8080/JSON/landuse/landuse_'+id+'.json');
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
				var landusecode = feature.getProperty('LU_code');
				if(landusecode == '1'){
					color = '#55FF00';
					return ({
						fillColor : color,
						strokeColor : color,
						strokeWeight : 2
					});
				}
				if(landusecode == '2'){
					color='#41A800';
					return ({
						fillColor : color,
						strokeColor : color,
						strokeWeight : 2
					});
				}
				if(landusecode == '3'){
					color='#FF7373';
					return ({
						fillColor : color,
						strokeColor : color,
						strokeWeight : 2
					});
				}
				if(landusecode == '4'){
					color='#C00000';
					return ({
						fillColor : color,
						strokeColor : color,
						strokeWeight : 2
					});
				}
				if(landusecode == '5'){
					color='#FFAA00';
					return ({
						fillColor : color,
						strokeColor : color,
						strokeWeight : 2
					});
				}
				if(landusecode == '6'){
					color='#FFD966';
					return ({
						fillColor : color,
						strokeColor : color,
						strokeWeight : 2
					});
				}
				if(landusecode == '7'){
					color='#FFFF00';
					return ({
						fillColor : color,
						strokeColor : color,
						strokeWeight : 2
					});
				}
				if(landusecode == '8'){
					color='#FF0066';
					return ({
						fillColor : color,
						strokeColor : color,
						strokeWeight : 2
					});
				}
				if(landusecode == '9'){
					color='#FFBEE8';
					return ({
						fillColor : color,
						strokeColor : color,
						strokeWeight : 2
					});
				}
				if(landusecode == '10'){
					color='#FF00FF';
					return ({
						fillColor : color,
						strokeColor : color,
						strokeWeight : 2
					});
				}
				if(landusecode == '11'){
					color='#FF0000';
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
				
				var landusecode = event.feature.getProperty('LU_code');
				if(landusecode == '1'){
					colorcode = '#55FF00';
					arname = 'اراضي  مستزرعة محاصيل بستانية';
				}
				if(landusecode == '2'){
					colorcode = '#41A800';
					arname = 'اراضي  مستزرعة محاصيل حولية';
				}
				if(landusecode == '3'){
					colorcode = '#FF7373';
					arname = 'اراضي متخللات الري المحوري';
				}
				if(landusecode == '4'){
					colorcode = '#C00000';
					arname = 'اراضي خدمات مناطق الانتاج الزراعى';
				}
				if(landusecode == '5'){
					colorcode = '#FFAA00';
					arname = 'اراضي مستصلحة سبق زراعتها';
				}
				if(landusecode == '6'){
					colorcode = '#FFD966';
					arname = 'اراضي مستصلحة لم يسبق زراعتها';
				}
				if(landusecode == '7'){
					colorcode = '#FFFF00';
					arname = 'اراضي غير مستغله';
				}
				if(landusecode == '8'){
					colorcode = '#FF0066';
					arname = 'مباني انتاج زراعى';
				}
				if(landusecode == '9'){
					colorcode = '#FFBEE8';
					arname = 'مباني انتاج حيوانى';
				}
				if(landusecode == '10'){
					colorcode = '#FF00FF';
					arname = 'مباني انتاج داجنى';
				}
				if(landusecode == '11'){
					colorcode = '#FF0000';
					arname = 'مباني ادارية وسكنية';
				}
				if (farmdata.farmID && farmdata.farmID !== '0') {
					db_farmid = farmdata.farmID;
				} else {
					db_farmid = "غير متوفر";
				}
				if (farmdata.farmName && farmdata.farmName !== '0') {
					db_farmname = farmdata.farmName;
				} else {
					db_farmname = "غير متوفر";
				}
				if (farmdata.reclamedArea && farmdata.reclamedArea !== '0') {
					db_reclamedArea = farmdata.reclamedArea;
					db_reclamedArea = Math.round(db_reclamedArea * 100) / 100
				} else {
					db_reclamedArea = "لا يوجد";
				}
				if (farmdata.urbanArea && farmdata.urbanArea !== '0') {
					db_urbanArea = farmdata.urbanArea;
					db_urbanArea = Math.round(db_urbanArea * 100) / 100
				} else {
					db_urbanArea = "لا يوجد";
				}
				if (farmdata.unusedArea && farmdata.unusedArea !== '0') {
					db_unusedArea = farmdata.unusedArea;
					db_unusedArea = Math.round(db_unusedArea * 100) / 100
				} else {
					db_unusedArea = "لا يوجد";
				}
				if (farmdata.fieldCropsArea && farmdata.fieldCropsArea !== '0') {
					db_fieldCropsArea = farmdata.fieldCropsArea;
					db_fieldCropsArea = Math.round(db_fieldCropsArea * 100) / 100
				} else {
					db_fieldCropsArea = "لا يوجد";
				}
				if (farmdata.cropsArea && farmdata.cropsArea !== '0') {
					db_cropsArea = farmdata.cropsArea;
					db_cropsArea = Math.round(db_cropsArea * 100) / 100
				} else {
					db_cropsArea = "لا يوجد";
				}
				if (farmdata.managBuildings && farmdata.managBuildings !== '0') {
					db_managBuildings = farmdata.managBuildings;
					db_managBuildings = Math.round(db_managBuildings * 100) / 100
				} else {
					db_managBuildings = "لا يوجد";
				}
				if (farmdata.poulBuildings && farmdata.poulBuildings !== '0') {
					db_poulBuildings = farmdata.poulBuildings;
					db_poulBuildings = Math.round(db_poulBuildings * 100) / 100
				} else {
					db_poulBuildings = "لا يوجد";
				}
				if (farmdata.animBuildings && farmdata.animBuildings !== '0') {
					db_animBuildings = farmdata.animBuildings;
					db_animBuildings = Math.round(db_animBuildings * 100) / 100
				} else {
					db_animBuildings = "لا يوجد";
				}
				if (farmdata.agriBuildings && farmdata.agriBuildings !== '0') {
					db_agriBuildings = farmdata.agriBuildings;
					db_agriBuildings = Math.round(db_agriBuildings * 100) / 100
				} else {
					db_agriBuildings = "لا يوجد";
				}
				if (farmdata.reclamedLandNotUsedBefore && farmdata.reclamedLandNotUsedBefore !== '0') {
					db_reclamedLandNotUsedBefore = farmdata.reclamedLandNotUsedBefore;
					db_reclamedLandNotUsedBefore = Math.round(db_reclamedLandNotUsedBefore * 100) / 100
				} else {
					db_reclamedLandNotUsedBefore = "لا يوجد";
				}
				
				var link0 = "<a href=\'datafiles/mahader/0.png\' target='_blank' class=\'btn btn-info btn-md\'> محضر معاينة </a>";
				if (200 == urlExists('datafiles/mahader/'+db_farmid+'.png')) {
					link0 = "<a href=\'datafiles/mahader/"+db_farmid+".png\' target='_blank' class=\'btn btn-info btn-md\'> محضر معاينة </a>";
				}
				var link1 = "<a href=\'javascript:void(0);\' onclick=\'back();\' class=\'btn btn-info btn-md\'> رجوع </a>";
				var link2 = "<a href=\'javascript:void(0);\' onclick=\'raster("
							+ db_farmid
							+ ");\' class=\'btn btn-info btn-md\'> مرئيات فضائية </a>";
				var link3 = "<a href=\'javascript:void(0);\' onclick=\'vouchers("
						+ db_farmid
						+ ");\' class=\'btn btn-info btn-md\'>"
						+ "طلب إجراءات التقنين"
						+ "</a>";
				var link4 = "<a href=\'datafiles/landuse/"+db_farmid+".jpg\' target='_blank'><img class=\'infowindowimg\' src=\'datafiles/landuse/"+db_farmid+".jpg\' alt=\'Icon\' style=\"width:280px;height:200px;\"></a>";
				var content = "<div style=\"text-align:center; overflow:hidden;\"><h1 style=\"background-color: #17a2b8; color:#fff;\">"
					+ "بيانات قطعة الأرض" + "</h1><br>"
					+ "<table class=\"outertable\" style=\"dir: rtl;\"><tr><td class=\'td\'>"
					+ db_farmid
					+ "</td><td class=\'rightcolumn\'>كود المزرعة / الشركة</td></tr><tr><td class=\'td\'>"
					+ db_farmname
					+ "</td><td class=\'rightcolumn\'>اسم المزرعة / الشركة</td></tr></table>"
					+"<h2 style=\"background-color: #17a2b8; color: #fff;\">استخدامات الأرض / فدان</h2>"
					+"<table class=\"outertable\" style=\"dir: rtl;\"><tr><td rowspan='12'>"+link4+"</td><td class=\'td\'>"
					+ db_fieldCropsArea
					+ "</td><td class=\'rightcolumn\'>محاصيل حقلية</td></tr><tr><td class=\'td\'>"
					+ db_cropsArea
					+ "</td><td class=\'rightcolumn\'>محاصيل بستانية</td></tr><tr><td class=\'td\'>"
					+ db_reclamedArea
					+ "</td><td class=\'rightcolumn\'>أراضي مستصلحة ومعدة للزراعة</td></tr><tr><td class=\'td\'>"
					+ db_reclamedLandNotUsedBefore
					+ "</td><td class=\'rightcolumn\'>أراضي مستصلحة لم يسبق زراعتها</td></tr><tr><td class=\'td\'>"
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
					+ "</td></tr></table></div>";
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
 			//window.location = "${pageContext.request.contextPath}/search?polygon_id=" + encodeURIComponent(id)+"&polygon_lat=" + encodeURIComponent(lat)+"&polygon_long=" + encodeURIComponent(lng)+"&form_type=" + encodeURIComponent("displayonmap");
			window.history.back();
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
<div class="beh_container">
	<jsp:include page="_header.jsp"></jsp:include>
	<div class="beh_main">
		<div class="beh_main_other" id="map-canvas">
			<!-- <div id="map-canvas"></div> -->
		</div>
		<!-- 
		<div id="wrapper">
			<div id="map-canvas"></div>
			</div>
		-->
	</div>
	<jsp:include page="_footer.jsp"></jsp:include>
</div>
</body>
</html>