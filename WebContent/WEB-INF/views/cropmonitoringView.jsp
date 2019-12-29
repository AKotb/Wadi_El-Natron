<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>مراقبة المحاصيل</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" />
<link href="resources/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/fonts.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/js-image-slider.css" rel="stylesheet"
	type="text/css" />
<link href="resources/generic.css" rel="stylesheet" type="text/css" />
<script src="resources/js/js-image-slider.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>
	<div id="wrapper">
		<div id="cropmonitoringcontent">
			<div id="sliderFrame">
				<div id="slider">
					<img src="datafiles/cropmonitoring/NDVI/db1/2016/db1_NDVI_20160212.jpg" /> 
					<img src="datafiles/cropmonitoring/NDVI/db1/2016/db1_NDVI_20160502.jpg" />
					<img src="datafiles/cropmonitoring/NDVI/db1/2016/db1_NDVI_20160621.jpg" /> 
					<img src="datafiles/cropmonitoring/NDVI/db1/2016/db1_NDVI_20160721.jpg" />
					<img src="datafiles/cropmonitoring/NDVI/db1/2016/db1_NDVI_20160820.jpg" />
					<img src="datafiles/cropmonitoring/NDVI/db1/2016/db1_NDVI_20161009.jpg" />
					<img src="datafiles/cropmonitoring/NDVI/db1/2016/db1_NDVI_201602121.jpg" />
				</div>
				<!--Custom navigation buttons on both sides-->
				<div class="group1-Wrapper">
					<a onclick="imageSlider.previous()" class="group1-Prev"></a> <a
						onclick="imageSlider.next()" class="group1-Next"></a>
				</div>
				<!--nav bar-->
				<div style="text-align: center; padding: 20px; z-index: 20;">
					<a onclick="imageSlider.previous()" class="group2-Prev"></a> 
					<a id='auto' onclick="switchAutoAdvance()"></a> 
					<a onclick="imageSlider.next()" class="group2-Next"></a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="_footer.jsp"></jsp:include>
	 <script type="text/javascript">
        //The following script is for the group 2 navigation buttons.
        function switchAutoAdvance() {
            imageSlider.switchAuto();
            switchPlayPauseClass();
        }
        function switchPlayPauseClass() {
            var auto = document.getElementById('auto');
            var isAutoPlay = imageSlider.getAuto();
            auto.className = isAutoPlay ? "group2-Pause" : "group2-Play";
            auto.title = isAutoPlay ? "Pause" : "Play";
        }
        switchPlayPauseClass();
    </script>
</body>
</html>