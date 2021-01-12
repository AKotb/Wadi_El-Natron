<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>التسلسل الزمني</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin=""/>
		<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js" integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA==" crossorigin=""></script>
		    
		<link href="resources/default.css" rel="stylesheet" type="text/css"
			media="all" />
		<link href="resources/fonts.css" rel="stylesheet" type="text/css"
			media="all" />
			
		<link rel="stylesheet" href="resources/css/bootstrap.min.3.4.1.css">
		<script src="resources/js/jquery.js"></script>
		<script src="resources/js/jquery.min.3.4.1.js"></script>
		<script type="text/javascript" src="resources/js/image-slider2.js"></script>
		<script src="resources/js/bootstrap.min.3.4.1.js"></script>
		<link href="resources/css/googlefonts.css" rel="stylesheet" />
		<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="resources/css/image-slider2.css">
		
		<style>
			#map_db1 {
				width: 70vw;
				height: 32vw;
				margin: 1vw 10vw 4vw 15vw;
			}
			#map_db2 {
				width: 70vw;
				height: 32vw;
				margin: 1vw 10vw 1vw 15vw;
			}
		</style>
	</head>
	<body>
	<div class="beh_container">
		<jsp:include page="_header.jsp"></jsp:include>
		<div class="beh_main2">
			<div class="beh_main_timeseries">
				<h1>التسلسل الزمنى للمنطقة هـ</h1>
				<div id='map_db1'></div>
				<h1>التسلسل الزمنى للمنطقة و</h1>
				<div id='map_db2'></div>
			</div>
		</div>
		<script>
			// First Area
			var map1 = L.map('map_db1');
		
			L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
				maxZoom: 18,
				attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
					'<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
					'Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
				id: 'mapbox/satellite-v9',
				tileSize: 512,
				zoomOffset: -1
			}).addTo(map1);
		
			var videoUrls1 = [
		        'datafiles/timechanges/DB1/db1.mp4'
				//'https://www.mapbox.com/bites/00188/patricia_nasa.mp4'
			],
			bounds1 = L.latLngBounds([[ 30.325079467004333, 29.900983488842993], [ 30.09692354435601, 30.422662399996863]]);
		
			map1.fitBounds(bounds1);
		
			var overlay1 = L.videoOverlay(videoUrls1, bounds1, {
				opacity: 0.7,
				interactive: false,
				autoplay: false
			});
			map1.addLayer(overlay1);
		
			overlay1.on('load', function () {
				var MyPauseControl1 = L.Control.extend({
					onAdd: function() {
						var button = L.DomUtil.create('button');
						button.innerHTML = '⏸';
						L.DomEvent.on(button, 'click', function () {
							overlay1.getElement().pause();
						});
						return button;
					}
				});
				var MyPlayControl1 = L.Control.extend({
					onAdd: function() {
						var button = L.DomUtil.create('button');
						button.innerHTML = '▶️';
						L.DomEvent.on(button, 'click', function () {
							overlay1.getElement().play();
						});
						return button;
					}
				});
		
				var pauseControl1 = (new MyPauseControl1()).addTo(map1);
				var playControl1 = (new MyPlayControl1()).addTo(map1);
			});
		</script>
		<script>
			// Second Area
			var map2 = L.map('map_db2');
			
			L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
				maxZoom: 18,
				attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
					'<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
					'Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
				id: 'mapbox/satellite-v9',
				tileSize: 512,
				zoomOffset: -1
			}).addTo(map2);
		
			var videoUrls2 = [
		        'datafiles/timechanges/DB2/db2.mp4'
				//'https://www.mapbox.com/bites/00188/patricia_nasa.mp4'
			],
			bounds2 = L.latLngBounds([[ 30.61802327062327, 29.717134154942258], [ 30.25096459040346, 30.553468374597816]]);
		
			map2.fitBounds(bounds2);
		
			var overlay2 = L.videoOverlay(videoUrls2, bounds2, {
				opacity: 0.7,
				interactive: false,
				autoplay: false
			});
			map2.addLayer(overlay2);
		
			overlay2.on('load', function () {
				var MyPauseControl2 = L.Control.extend({
					onAdd: function() {
						var button = L.DomUtil.create('button');
						button.innerHTML = '⏸';
						L.DomEvent.on(button, 'click', function () {
							overlay2.getElement().pause();
						});
						return button;
					}
				});
				var MyPlayControl2 = L.Control.extend({
					onAdd: function() {
						var button = L.DomUtil.create('button');
						button.innerHTML = '▶️';
						L.DomEvent.on(button, 'click', function () {
							overlay2.getElement().play();
						});
						return button;
					}
				});
		
				var pauseControl2 = (new MyPauseControl2()).addTo(map2);
				var playControl2 = (new MyPlayControl2()).addTo(map2);
			});
		</script>
		<jsp:include page="_footer.jsp"></jsp:include>
	</div>
	</body>
</html>