<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>مراقبة المحاصيل</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="resources/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/Image-Slider-Pager.css" rel="stylesheet"
	type="text/css" />
<script src="resources/js/Image-Slider-Pager.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>
	<div id="wrapper">
		<div id="cropmonitoringcontent">
				<div class="slider_wrapper">
					<ul id="image_slider">
						<li><img src="datafiles/cropmonitoring/db1_NDVI_20160212.jpg" alt="db1_2016-02-12"/></li>
						<li><img src="datafiles/cropmonitoring/db1_NDVI_20160502.jpg" alt="db1_2016-05-02"/></li>
						<li><img src="datafiles/cropmonitoring/db1_NDVI_20160621.jpg" alt="db1_2016-06-21"/></li>
						<li><img src="datafiles/cropmonitoring/db1_NDVI_20160721.jpg" alt="db1_2016-07-21"/></li>
						<li><img src="datafiles/cropmonitoring/db1_NDVI_20160820.jpg" alt="db1_2016-08-20"/></li>
						<li><img src="datafiles/cropmonitoring/db1_NDVI_20161009.jpg" alt="db1_2016-10-09"/></li>
						
						<li><img src="datafiles/cropmonitoring/db1_NDVI_20170107.jpg" alt="db1_2017-01-07"/></li>
						<li><img src="datafiles/cropmonitoring/db1_NDVI_20170226.jpg" alt="db1_2017-02-26"/></li>
						<li><img src="datafiles/cropmonitoring/db1_NDVI_20170308.jpg" alt="db1_2017-03-08"/></li>
						<li><img src="datafiles/cropmonitoring/db1_NDVI_20170417.jpg" alt="db1_2017-04-17"/></li>
						<li><img src="datafiles/cropmonitoring/db1_NDVI_20170527.jpg" alt="db1_2017-05-27"/></li>
						<li><img src="datafiles/cropmonitoring/db1_NDVI_20170626.jpg" alt="db1_2017-06-26"/></li>
						
						<li><img src="datafiles/cropmonitoring/db2_NDVI_20160212.jpg" alt="db2_2016-02-12"/></li>
						<li><img src="datafiles/cropmonitoring/db2_NDVI_20160502.jpg" alt="db2_2016-05-02"/></li>
						<li><img src="datafiles/cropmonitoring/db2_NDVI_20160621.jpg" alt="db2_2016-06-21"/></li>
						<li><img src="datafiles/cropmonitoring/db2_NDVI_20160721.jpg" alt="db2_2016-07-21"/></li>
						<li><img src="datafiles/cropmonitoring/db2_NDVI_20160820.jpg" alt="db2_2016-08-20"/></li>
						<li><img src="datafiles/cropmonitoring/db2_NDVI_20161009.jpg" alt="db2_2016-10-09"/></li>
						
						<li><img src="datafiles/cropmonitoring/db2_NDVI_20170107.jpg" alt="db2_2017-01-07"/></li>
						<li><img src="datafiles/cropmonitoring/db2_NDVI_20170226.jpg" alt="db2_2017-02-26"/></li>
						<li><img src="datafiles/cropmonitoring/db2_NDVI_20170308.jpg" alt="db2_2017-03-08"/></li>
						<li><img src="datafiles/cropmonitoring/db2_NDVI_20170417.jpg" alt="db2_2017-04-17"/></li>
						<li><img src="datafiles/cropmonitoring/db2_NDVI_20170527.jpg" alt="db2_2017-05-27"/></li>
						<li><img src="datafiles/cropmonitoring/db2_NDVI_20170626.jpg" alt="db2_2017-06-26"/></li>
					</ul>
					<span class="nvgt" id="prev"></span> 
					<span class="nvgt" id="next"></span>
				</div>
				<div id="pager"></div>
		</div>
	</div>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>