<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>الغطاء الخضري</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/bootstrap.min.3.4.1.css">
<link href="resources/css/googlefonts.css" rel="stylesheet" />
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" />
<link href="resources/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/fonts.css" rel="stylesheet" type="text/css"
	media="all" />
<link rel="stylesheet" type="text/css"
	href="resources/css/image-slider2.css">
<script src="resources/js/jquery.js"></script>
<script src="resources/js/jquery.min.3.4.1.js"></script>
<script type="text/javascript" src="resources/js/image-slider2.js"></script>
<script src="resources/js/bootstrap.min.3.4.1.js"></script>
</head>
<body>
	<div class="beh_container">
		<jsp:include page="_header.jsp"></jsp:include>
		<div class="beh_main2">
			<div class="beh_main_regulations">
				<div style="height: 31vw;">
					<div id="cf7" class="shadow">
							<img class='opaque' src="datafiles/cropmonitoring/ndvi_20140322.jpg" alt="2014-03-22" /> 
							<img src="datafiles/cropmonitoring/ndvi_20140626.jpg" alt="2014-06-26" /> 
							<img src="datafiles/cropmonitoring/ndvi_20140914.jpg" alt="2014-09-14" /> 
							<img src="datafiles/cropmonitoring/ndvi_20150104.jpg" alt="2015-01-04" /> 
							<img src="datafiles/cropmonitoring/ndvi_20150426.jpg" alt="2015-04-26" /> 
							<img src="datafiles/cropmonitoring/ndvi_20150715.jpg" alt="2015-07-15" /> 
							<img src="datafiles/cropmonitoring/ndvi_20150917.jpg" alt="2015-09-17" /> 
							<img src="datafiles/cropmonitoring/ndvi_20160428.jpg" alt="2016-04-28" /> 
							<img src="datafiles/cropmonitoring/ndvi_20160717.jpg" alt="2016-07-17" /> 
							<img src="datafiles/cropmonitoring/ndvi_20160919.jpg" alt="2016-09-19" /> 
							<img src="datafiles/cropmonitoring/ndvi_20161224.jpg" alt="2016-12-24" /> 
							<img src="datafiles/cropmonitoring/ndvi_20170330.jpg" alt="2017-03-30" /> 
							<img src="datafiles/cropmonitoring/ndvi_20170618.jpg" alt="2017-06-18" /> 
							<img src="datafiles/cropmonitoring/ndvi_20170922.jpg" alt="2017-09-22" /> 
							<img src="datafiles/cropmonitoring/ndvi_20180128.jpg" alt="2018-01-28" /> 
							<img src="datafiles/cropmonitoring/ndvi_20180402.jpg" alt="2018-04-02" /> 
							<img src="datafiles/cropmonitoring/ndvi_20180707.jpg" alt="2018-07-07" /> 
							<img src="datafiles/cropmonitoring/ndvi_20180925.jpg" alt="2018-09-25" /> 
							<img src="datafiles/cropmonitoring/ndvi_20181230.jpg" alt="2018-12-30" /> 
							<img src="datafiles/cropmonitoring/ndvi_20190320.jpg" alt="2019-03-20" /> 
							<img src="datafiles/cropmonitoring/ndvi_20190624.jpg" alt="2019-06-24" /> 
							<img src="datafiles/cropmonitoring/ndvi_20190912.jpg" alt="2019-09-12" /> 
							<img src="datafiles/cropmonitoring/ndvi_20200118.jpg" alt="2020-01-18" /> 
							<img src="datafiles/cropmonitoring/ndvi_20200423.jpg" alt="2020-04-23" />
							<img src="datafiles/cropmonitoring/ndvi_20200626.jpg" alt="2020-06-26" />
							<img src="datafiles/cropmonitoring/ndvi_20200914.jpg" alt="2020-09-14" />
							<img src="datafiles/cropmonitoring/ndvi_20201219.jpg" alt="2020-12-19" />
					</div>
				</div>
				<div class="rowcropmonitor">
					<div style="align: center;">
						<div class="nvgt" id="prev"></div> <div class="nvgt" id="play"></div> <div class="nvgt" id="next"></div>
					</div>
					<br> <span id="cf7_controls"> 
						<span class="selected">2014-03</span> <span>2014-06</span> <span>2014-09</span> 
						<span>2015-01</span> <span>2015-04</span> <span>2015-07</span> 
						<span>2015-09</span> <span>2016-04</span> <span>2016-07</span>
						<span>2016-09</span> <span>2016-12</span> <span>2017-03</span> 
						<span>2017-06</span> <span>2017-09</span> <span>2018-01</span> 
						<span>2018-04</span> <span>2018-07</span> <span>2018-09</span> 
						<span>2018-12</span> <span>2019-03</span> <span>2019-06</span>
						<span>2019-09</span> <span>2020-01</span> <span>2020-04</span>
						<span>2020-06</span> <span>2020-09</span> <span>2020-12</span>
					</span>
				</div>
			</div>
		</div>
		<jsp:include page="_footer.jsp"></jsp:include>
	</div>
</body>
</html>