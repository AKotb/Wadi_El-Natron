<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>المرئيات الفضائية</title>
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
<style>
.img_slider {
	position: absolute;
}
</style>
</head>
<body>
<jsp:include page="_header.jsp"></jsp:include>
<div id="wrapper">
		<div id="raster_extra">
		<div id="floating-panel" align='center'>
			<input class="slider" type="range" min="0" max="100" value="0"
				id="myRange">
		</div>
		<div id="raster_view">
			<img id='img1' class='img_slider' src='datafiles/rasterimages/0.png'>
			<div id='img1_title' class='legend'>
				<p class='img_title bottom_title'>Pleiades March 2017</p>
			</div>
			<img id='img2' class='img_slider' src='datafiles/rasterimages/0.png'>
			<div id='img2_title' class='legend'>
				<p class='img_title top_title'>Sentinel2 Septemper 2018</p>
			</div>
			<div id='controlbuttons' class='control_buttons'>
				<a href="javascript:void(0);" onclick="landuse();" class="button">استخدامات الأراضى</a> 
				<a href="javascript:void(0);" onclick="vouchers();" class="button">طلب إجراءات التقنين</a> 
				<a href="javascript:void(0);" onclick="gotoMahdar();" class="button">محضر معاينة</a> 
				<a href="javascript:void(0);" onclick="back();" class="button">رجوع</a>
			</div>
		</div>
	</div>
	</div>
	<jsp:include page="_footer.jsp"></jsp:include>
	
	<script>
	var id = "${polygonID}";
	var lat = "${lat}";
	var lng = "${lng}";
	document.getElementById('img1').src = 'datafiles/rasterimages/png_new/'+ id + '.png';
	document.getElementById('img2').src = 'datafiles/rasterimages/png_old/'+ id + '.png';
	var img_height = 500;
	var img_width = 800;
	window.onload = function() {
		new_width = document.getElementById("img2").width;
		new_height = document.getElementById("img2").height;
		img_height = new_height;
		img_width = new_width;
		document.getElementById("img1").width = new_width;
		document.getElementById("img1").height = new_height;
		if(new_width > 800){
			ratio = new_height / new_width;
			new_height = ratio * 800;
			new_width = 800;
		}
		
		ratio = new_width / new_height;
		new_height = 500;
		new_width = ratio * 500;
		
		img_height = new_height;
		img_width = new_width;
	
		document.getElementById("img2").width = img_width;
		document.getElementById("img2").height = img_height;
		document.getElementById("img1").width = img_width;
		document.getElementById("img1").height = img_height;
		
		document.getElementById("img2_title").width = img_width;
		document.getElementById("img2_title").height = img_height;
		document.getElementById("img1_title").width = img_width;
		document.getElementById("img1_title").height = img_height;
		
		shift = (document.getElementById("img2").parentElement.clientWidth - img_width) / 2;
		document.getElementById("img1").style.left = shift + 'px';
		document.getElementById("img2").style.left = shift + 'px';
		
		document.getElementById("img1_title").style.left = shift + 'px';
		document.getElementById("img2_title").style.left = shift + 'px';
		
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
	};

	var slider = document.getElementById("myRange");
	slider.oninput = function() {
		document.getElementById("img1").style.clip = "rect(0," + img_width
				+ "px, " + img_height + "px, " + "0px)";
		document.getElementById("img2").style.clip = "rect(0," + img_width
				+ "px, " + img_height + "px, " + 0.01 * img_width
				* this.value + "px)";

		document.getElementById("img1_title").style.clip = "rect(0,"
				+ img_width + "px, " + img_height + "px, " + "0px)";
		document.getElementById("img2_title").style.clip = "rect(0,"
				+ img_width + "px, " + img_height + "px, " + 0.01
				* img_width * this.value + "px)";

	}

	function vouchers() {
		var operationType = "list";
		window.location = "${pageContext.request.contextPath}/vouchers?polygon_id=" + encodeURIComponent(id)+"&polygon_lat=" + encodeURIComponent(lat)+"&polygon_long=" + encodeURIComponent(lng)+"&operation_type=" + encodeURIComponent(operationType);
	}

	function landuse() {
		window.location = "${pageContext.request.contextPath}/landuse?polygon_id=" + encodeURIComponent(id)+"&polygon_lat=" + encodeURIComponent(lat)+"&polygon_long=" + encodeURIComponent(lng);
	}

	function back() {
		window.location = "${pageContext.request.contextPath}/search?polygon_id=" + encodeURIComponent(id)+"&polygon_lat=" + encodeURIComponent(lat)+"&polygon_long=" + encodeURIComponent(lng);
	}
	
	function gotoMahdar() {
		var location = "${pageContext.request.contextPath}"+"/datafiles/mahader/0.png";
		if (200 == urlExists("${pageContext.request.contextPath}"+"/datafiles/mahader/" + id + ".png")) {
			location = "${pageContext.request.contextPath}"+"/datafiles/mahader/" + id + ".png";
		}
		//window.location.href = location;
		window.open(location, '_blank');
	}
	
	function urlExists(checkedurl) {
		var http = $.ajax({
			type : "HEAD",
			url : checkedurl,
			async : false
		})
		return http.status;
	}
	</script>
	<script src="resources/js/jquery.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.sticky.js"></script>
	<script src="resources/js/jquery.stellar.min.js"></script>
	<script src="resources/js/wow.min.js"></script>
	<script src="resources/js/smoothscroll.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/custom.js"></script>
</body>
</html>