<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.sticky.js"></script>
<script src="resources/js/jquery.stellar.min.js"></script>
<script src="resources/js/wow.min.js"></script>
<script src="resources/js/smoothscroll.js"></script>
<script src="resources/js/owl.carousel.min.js"></script>
<script src="resources/js/custom.js"></script>
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" />
<link href="resources/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/fonts.css" rel="stylesheet" type="text/css"
	media="all" />
<link rel="stylesheet" href="resources/tooplate-style.css" type="text/css"
	media="all"/>
<link rel="stylesheet" href="resources/beheira.css" type="text/css"
	media="all"/>
<title>الرئيسية</title>
<style type="text/css">
 #latlng_floating-panel {
 		position: absolute;
        top: 28%;
        left: 0.6%;
        width: 10.5%;
        padding: 5;
        z-index: 5;
        background-color: #fff;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
 #latValue {
        width: 60%;
        color: gainsboro;
      }
 #lngValue {
        width: 60%;
        color: gainsboro;
      }
 .latlngValueclass1 {
        width: 10%;
        color: gainsboro;
      }
.latlngValueclass2 {
        width: 28%;
        color: gainsboro;
      }
 #floating-panel {
        position: absolute;
        top: 47%;
        left: 0.6%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
        width: 9.7%
      }
</style>
<script>
	var map;
	var infowindow;
	var farmlat;
	var farmlng;
	var farms;
	var centers_layer;
	var districts_layer;
	var landsunionsmohafza_layer;
	var law41_layer;
	var law129_layer;
	var law228_layer;
	var law341_layer;
	var law529_layer;
	var road_layer;
	var roadbuffer_layer;
	var marker;
	
	function initMap() {
		var egyptCenter = {
			lat : 30.2519715,
			lng : 30.2761235
		};
		map = new google.maps.Map(document.getElementById('map-canvas'), {
			zoom : 11,
			center : egyptCenter,
			mapTypeId : 'hybrid'
		});
 		
		farmtozoomto = '${showfarm_id}';
 		if (farmtozoomto) {
 			selectedfarmlat = parseFloat('${selectedlat}');
 			selectedfarmlng = parseFloat('${selectedlng}');
 			map.setCenter({
 				lat : selectedfarmlat,
 				lng : selectedfarmlng
 			});
 			map.setZoom(11);
 		}
			
		var db_layer = new google.maps.Data({
			map : map
		});
		
		
		db_layer.loadGeoJson('http://localhost:8080/JSON/db_1.json');
		//db_layer.loadGeoJson('http://wn.narss.sci.eg:8080/JSON/db_1.json');
		
		
		var db2_layer = new google.maps.Data({
			map : map
		});
		
		
		db2_layer.loadGeoJson('http://localhost:8080/JSON/db_2.json');
		//db2_layer.loadGeoJson('http://wn.narss.sci.eg:8080/JSON/db_2.json');
		
		var db3_layer = new google.maps.Data({
			map : map
		});
		
		
		db3_layer.loadGeoJson('http://localhost:8080/JSON/db_3.json');
		//db3_layer.loadGeoJson('http://wn.narss.sci.eg:8080/JSON/db_3.json');
		
		
		infowindow = new google.maps.InfoWindow();
		
		db_layer.setStyle(function(feature) {
				var color = '#088da5';
				var color_selected = 'red';
				var showfarm_id = "${showfarm_id}";
				if (feature.getProperty('M_ID') == showfarm_id) {
					return ({
						fillColor : color_selected,
						strokeColor : color_selected,
						strokeWeight : 4
					});
				} else {
					return ({
						fillColor : color,
						strokeColor : color,
						strokeWeight : 2
					});
				}
		});
		
		db2_layer.setStyle(function(feature) {
				var color = '#088da5';
				var color_selected = 'red';
				var showfarm_id = "${showfarm_id}";
				if (feature.getProperty('M_ID') == showfarm_id) {
					return ({
						fillColor : color_selected,
						strokeColor : color_selected,
						strokeWeight : 4
					});
				} else {
					return ({
						fillColor : color,
						strokeColor : color,
						strokeWeight : 2
					});
				}
		});
		
		db3_layer.setStyle(function(feature) {
			var color = '#088da5';
			var color_selected = 'red';
			var showfarm_id = "${showfarm_id}";
			if (feature.getProperty('M_ID') == showfarm_id) {
				return ({
					fillColor : color_selected,
					strokeColor : color_selected,
					strokeWeight : 4
				});
			} else {
				return ({
					fillColor : color,
					strokeColor : color,
					strokeWeight : 2
				});
			}
		});

		db_layer
				.addListener(
						'click',
						function(event) {
								db_layer.revertStyle();
								db_layer.overrideStyle(event.feature, {
									strokeWeight : 4,
									strokeColor : 'red',
									fillColor : 'green'
								});
								farmlat = event.latLng.lat();
								farmlng = event.latLng.lng();
								var owner = event.feature
										.getProperty('Farm_Owner');
								if (owner) {
									owner = owner;
								} else {
									owner = "غير متوفر";
								}
								var farm_name = event.feature
										.getProperty('Farm_Name');
								if (farm_name) {
									farm_name = farm_name;
								} else {
									farm_name = "غير متوفر";
								}
								var sid = event.feature
										.getProperty('Owner_ID');
								if (sid) {
									sid = sid;
								} else {
									sid = "غير متوفر";
								}
								var phone = event.feature
										.getProperty('Tel');
								if (phone) {
									phone = phone;
								} else {
									phone = "غير متوفر";
								}
								var ownership = event.feature
										.getProperty('Ownership');
								if (ownership) {
									ownership = ownership;
								} else {
									ownership = "غير متوفر";
								}
								var area_id = event.feature
										.getProperty('M_ID');
								if (area_id) {
									area_id = area_id;
								} else {
									area_id = "0";
								}
								var farm_area = event.feature
										.getProperty('Farm_Area');
								var feddan;
								var qirat;
								var sahm;
								if (farm_area) {
									var area = farm_area.toString();
									var fedarr = area.split("-");
									feddan = fedarr[0];
									qirat = fedarr[1];
									sahm = fedarr[2];
								} else {
									feddan = "غير متوفر";
									qirat = "غير متوفر";
									sahm = "غير متوفر";
								}
								var db_farmname = "";
								var db_ownerid = "";
								var db_ownername = "";
								var db_ownertel = "";
								var db_ownership = "";
								var db_displayedownership = "";
								for ( var i in farms) {
									if (farms[i].farmID === area_id) {
										if (farms[i].farmName) {
											db_farmname = farms[i].farmName;
										} else {
											db_farmname = "غير متوفر";
										}

										if (farms[i].ownerID) {
											db_ownerid = farms[i].ownerID;
										} else {
											db_ownerid = "غير متوفر";
										}

										if (farms[i].ownerName) {
											db_ownername = farms[i].ownerName;
										} else {
											db_ownername = "غير متوفر";
										}

										if (farms[i].telephone) {
											db_ownertel = farms[i].telephone;
										} else {
											db_ownertel = "غير متوفر";
										}

										if (farms[i].ownership) {
											db_ownership = farms[i].ownership;
											db_displayedownership = farms[i].ownership;
										} else {
											db_ownership = "غير متوفر";
											db_displayedownership = "غير متوفر";
										}
									}
								}
								var link0 = "<a href=\'datafiles/mahader/0.png\' target='_blank' class=\'button\'> محضر معاينة </a>";
								if (200 == urlExists('datafiles/mahader/'
										+ area_id + '.png')) {
									link0 = "<a href=\'datafiles/mahader/"+area_id+".png\' target='_blank' class=\'button\'> محضر معاينة </a>";
								}
								var link2 = "<a href=\'javascript:void(0);\' onclick=\'raster("
										+ area_id
										+ ");\' class=\'button\'> مرئيات فضائية </a>";
								var link3 = "<a href=\'javascript:void(0);\' onclick=\'vouchers("
										+ area_id
										+ ");\' class=\'button\'>"
										+ "طلب إجراءات التقنين" + "</a>";
								var link4 = "<a href=\'datafiles/sketch/"+area_id+".jpg\' target='_blank'><img class=\'infowindowimg\' src=\'datafiles/sketch/"+area_id+".jpg\' alt=\'Icon\' style=\"width:300px;height:170px;\"></a>";
								var link1 = "<a href=\'javascript:void(0);\' onclick=\'landuse("
										+ area_id
										+ ");\' class=\'button\'> استخدامات الأراضى </a>";
								var content = "<div style=\"text-align:center; overflow:hidden;\"><h1 style=\"background-color: #44a959;\">"
										+ "بيانات قطعة الأرض" + "</h1>"
										+ link4
										+ "<table class=\"outertable\" style=\"dir: rtl;\"><tr><td class=\'td\'>"
										+ area_id
										+ "</td><td class=\'rightcolumn\'>كود المزرعة / الشركة</td></tr><tr><td class=\'td\'>"
										+ db_farmname
										+ "</td><td class=\'rightcolumn\'>اسم المزرعة / الشركة</td></tr><tr><td class=\'td\'><table class=\"innertable\"><tr><td class=\'td\'>س</td><td class=\'td\'>ط</td><td class=\'td\'>ف</td></tr><tr><td class=\'td\'>"
										+ sahm
										+ "</td><td class=\'td\'>"
										+ qirat
										+ "</td><td class=\'td\'>"
										+ feddan
										+ "</td></tr></table>"
										+ "</td><td class=\'rightcolumn\'>المساحة</td></tr><tr><td class=\'td\'>"
										+ db_displayedownership
										+ "</td><td class=\'rightcolumn\'>رقم الملف</td></tr><tr><td class=\'td\'>"
										+ db_ownername
										+ "</td><td class=\'rightcolumn\'>اسم المالك / واضع اليد</td></tr><tr><td class=\'td\'>"
										+ db_ownerid
										+ "</td><td class=\'rightcolumn\'>الرقم القومى</td></tr><tr><td class=\'td\'>"
										+ db_ownertel
										+ "</td><td class=\'rightcolumn\'>التليفون</td></tr></table><br>"
                                                                                    +"<div id=\"errormsg\"></div>"
										+ "<table><tr><td class=\'td-button\'>"
										+ link0
										+ "</td><td class=\'td-button\'>"
										+ link3
										+ "</td><td class=\'td-button\'>"
										+ link2
										+ "</td><td class=\'td-button\'>"
										+ link1
										+ "</td></tr></table>"
										+ "<span onclick='close_infowindow()' class='searchClose'>[&times;]</span></div>";
								infowindow.setContent(content);
								infowindow.setPosition(event.latLng);
								infowindow.open(map);
						});

		db2_layer
				.addListener(
						'click',
						function(event) {
								db2_layer.revertStyle();
								db2_layer.overrideStyle(event.feature, {
									strokeWeight : 4,
									strokeColor : 'red',
									fillColor : 'green'
								});
								farmlat = event.latLng.lat();
								farmlng = event.latLng.lng();
								var owner = event.feature
										.getProperty('Farm_Owner');
								if (owner) {
									owner = owner;
								} else {
									owner = "غير متوفر";
								}
								var farm_name = event.feature
										.getProperty('Farm_Name');
								if (farm_name) {
									farm_name = farm_name;
								} else {
									farm_name = "غير متوفر";
								}
								var sid = event.feature
										.getProperty('Owner_ID');
								if (sid) {
									sid = sid;
								} else {
									sid = "غير متوفر";
								}
								var phone = event.feature
										.getProperty('Tel');
								if (phone) {
									phone = phone;
								} else {
									phone = "غير متوفر";
								}
								var ownership = event.feature
										.getProperty('Ownership');
								if (ownership) {
									ownership = ownership;
								} else {
									ownership = "غير متوفر";
								}
								var area_id = event.feature
										.getProperty('M_ID');
								if (area_id) {
									area_id = area_id;
								} else {
									area_id = "0";
								}
								var farm_area = event.feature
										.getProperty('Farm_Area');
								var feddan;
								var qirat;
								var sahm;
								if (farm_area) {
									var area = farm_area.toString();
									var fedarr = area.split("-");
									feddan = fedarr[0];
									qirat = fedarr[1];
									sahm = fedarr[2];
								} else {
									feddan = "غير متوفر";
									qirat = "غير متوفر";
									sahm = "غير متوفر";
								}
								var db_farmname = "";
								var db_ownerid = "";
								var db_ownername = "";
								var db_ownertel = "";
								var db_ownership = "";
								var db_displayedownership = "";
								for ( var i in farms) {
									if (farms[i].farmID === area_id) {
										if (farms[i].farmName) {
											db_farmname = farms[i].farmName;
										} else {
											db_farmname = "غير متوفر";
										}

										if (farms[i].ownerID) {
											db_ownerid = farms[i].ownerID;
										} else {
											db_ownerid = "غير متوفر";
										}

										if (farms[i].ownerName) {
											db_ownername = farms[i].ownerName;
										} else {
											db_ownername = "غير متوفر";
										}

										if (farms[i].telephone) {
											db_ownertel = farms[i].telephone;
										} else {
											db_ownertel = "غير متوفر";
										}

										if (farms[i].ownership) {
											db_ownership = farms[i].ownership;
											db_displayedownership = farms[i].ownership;
										} else {
											db_ownership = "غير متوفر";
											db_displayedownership = "غير متوفر";
										}
									}
								}
								var link0 = "<a href=\'datafiles/mahader/0.png\' target='_blank' class=\'button\'> محضر معاينة </a>";
								if (200 == urlExists('datafiles/mahader/'
										+ area_id + '.png')) {
									link0 = "<a href=\'datafiles/mahader/"+area_id+".png\' target='_blank' class=\'button\'> محضر معاينة </a>";
								}
								var link2 = "<a href=\'javascript:void(0);\' onclick=\'raster("
										+ area_id
										+ ");\' class=\'button\'> مرئيات فضائية </a>";
								var link3 = "<a href=\'javascript:void(0);\' onclick=\'vouchers("
										+ area_id
										+ ");\' class=\'button\'>"
										+ "طلب إجراءات التقنين" + "</a>";
								var link4 = "<a href=\'datafiles/sketch/"+area_id+".jpg\' target='_blank'><img class=\'infowindowimg\' src=\'datafiles/sketch/"+area_id+".jpg\' alt=\'Icon\' style=\"width:300px;height:170px;\"></a>";
								var link1 = "<a href=\'javascript:void(0);\' onclick=\'landuse("
										+ area_id
										+ ");\' class=\'button\'> استخدامات الأراضى </a>";
								var content = "<div style=\"text-align:center; overflow:hidden;\"><h1 style=\"background-color: #44a959;\">"
										+ "بيانات قطعة الأرض" + "</h1>"
										+ link4
										+ "<table class=\"outertable\" style=\"dir: rtl;\"><tr><td class=\'td\'>"
										+ area_id
										+ "</td><td class=\'rightcolumn\'>كود المزرعة / الشركة</td></tr><tr><td class=\'td\'>"
										+ db_farmname
										+ "</td><td class=\'rightcolumn\'>اسم المزرعة / الشركة</td></tr><tr><td class=\'td\'><table class=\"innertable\"><tr><td class=\'td\'>س</td><td class=\'td\'>ط</td><td class=\'td\'>ف</td></tr><tr><td class=\'td\'>"
										+ sahm
										+ "</td><td class=\'td\'>"
										+ qirat
										+ "</td><td class=\'td\'>"
										+ feddan
										+ "</td></tr></table>"
										+ "</td><td class=\'rightcolumn\'>المساحة</td></tr><tr><td class=\'td\'>"
										+ db_displayedownership
										+ "</td><td class=\'rightcolumn\'>رقم الملف</td></tr><tr><td class=\'td\'>"
										+ db_ownername
										+ "</td><td class=\'rightcolumn\'>اسم المالك / واضع اليد</td></tr><tr><td class=\'td\'>"
										+ db_ownerid
										+ "</td><td class=\'rightcolumn\'>الرقم القومى</td></tr><tr><td class=\'td\'>"
										+ db_ownertel
										+ "</td><td class=\'rightcolumn\'>التليفون</td></tr></table><br>"
                                                                             +"<div id=\"errormsg\"></div>"
										+ "<table><tr><td class=\'td-button\'>"
										+ link0
										+ "</td><td class=\'td-button\'>"
										+ link3
										+ "</td><td class=\'td-button\'>"
										+ link2
										+ "</td><td class=\'td-button\'>"
										+ link1
										+ "</td></tr></table>"
										+ "<span onclick='close_infowindow()' class='searchClose'>[&times;]</span></div>";
								infowindow.setContent(content);
								infowindow.setPosition(event.latLng);
								infowindow.open(map);
						});

		db3_layer
		.addListener(
				'click',
				function(event) {
						db3_layer.revertStyle();
						db3_layer.overrideStyle(event.feature, {
							strokeWeight : 4,
							strokeColor : 'red',
							fillColor : 'green'
						});
						farmlat = event.latLng.lat();
						farmlng = event.latLng.lng();
						var owner = event.feature
								.getProperty('Farm_Owner');
						if (owner) {
							owner = owner;
						} else {
							owner = "غير متوفر";
						}
						var farm_name = event.feature
								.getProperty('Farm_Name');
						if (farm_name) {
							farm_name = farm_name;
						} else {
							farm_name = "غير متوفر";
						}
						var sid = event.feature
								.getProperty('Owner_ID');
						if (sid) {
							sid = sid;
						} else {
							sid = "غير متوفر";
						}
						var phone = event.feature
								.getProperty('Tel');
						if (phone) {
							phone = phone;
						} else {
							phone = "غير متوفر";
						}
						var ownership = event.feature
								.getProperty('Ownership');
						if (ownership) {
							ownership = ownership;
						} else {
							ownership = "غير متوفر";
						}
						var area_id = event.feature
								.getProperty('M_ID');
						if (area_id) {
							area_id = area_id;
						} else {
							area_id = "0";
						}
						var farm_area = event.feature
								.getProperty('Farm_Area');
						var feddan;
						var qirat;
						var sahm;
						if (farm_area) {
							var area = farm_area.toString();
							var fedarr = area.split("-");
							feddan = fedarr[0];
							qirat = fedarr[1];
							sahm = fedarr[2];
						} else {
							feddan = "غير متوفر";
							qirat = "غير متوفر";
							sahm = "غير متوفر";
						}
						var db_farmname = "";
						var db_ownerid = "";
						var db_ownername = "";
						var db_ownertel = "";
						var db_ownership = "";
						var db_displayedownership = "";
						for ( var i in farms) {
							if (farms[i].farmID === area_id) {
								if (farms[i].farmName) {
									db_farmname = farms[i].farmName;
								} else {
									db_farmname = "غير متوفر";
								}

								if (farms[i].ownerID) {
									db_ownerid = farms[i].ownerID;
								} else {
									db_ownerid = "غير متوفر";
								}

								if (farms[i].ownerName) {
									db_ownername = farms[i].ownerName;
								} else {
									db_ownername = "غير متوفر";
								}

								if (farms[i].telephone) {
									db_ownertel = farms[i].telephone;
								} else {
									db_ownertel = "غير متوفر";
								}

								if (farms[i].ownership) {
									db_ownership = farms[i].ownership;
									db_displayedownership = farms[i].ownership;
								} else {
									db_ownership = "غير متوفر";
									db_displayedownership = "غير متوفر";
								}
							}
						}
						var link0 = "<a href=\'datafiles/mahader/0.png\' target='_blank' class=\'button\'> محضر معاينة </a>";
						if (200 == urlExists('datafiles/mahader/'
								+ area_id + '.png')) {
							link0 = "<a href=\'datafiles/mahader/"+area_id+".png\' target='_blank' class=\'button\'> محضر معاينة </a>";
						}
						var link2 = "<a href=\'javascript:void(0);\' onclick=\'raster("
								+ area_id
								+ ");\' class=\'button\'> مرئيات فضائية </a>";
						var link3 = "<a href=\'javascript:void(0);\' onclick=\'vouchers("
								+ area_id
								+ ");\' class=\'button\'>"
								+ "طلب إجراءات التقنين" + "</a>";
						var link4 = "<a href=\'datafiles/sketch/"+area_id+".jpg\' target='_blank'><img class=\'infowindowimg\' src=\'datafiles/sketch/"+area_id+".jpg\' alt=\'Icon\' style=\"width:300px;height:170px;\"></a>";
						var link1 = "<a href=\'javascript:void(0);\' onclick=\'landuse("
								+ area_id
								+ ");\' class=\'button\'> استخدامات الأراضى </a>";
						var content = "<div style=\"text-align:center; overflow:hidden;\"><h1 style=\"background-color: #44a959;\">"
								+ "بيانات قطعة الأرض" + "</h1>"
								+ link4
								+ "<table class=\"outertable\" style=\"dir: rtl;\"><tr><td class=\'td\'>"
								+ area_id
								+ "</td><td class=\'rightcolumn\'>كود المزرعة / الشركة</td></tr><tr><td class=\'td\'>"
								+ db_farmname
								+ "</td><td class=\'rightcolumn\'>اسم المزرعة / الشركة</td></tr><tr><td class=\'td\'><table class=\"innertable\"><tr><td class=\'td\'>س</td><td class=\'td\'>ط</td><td class=\'td\'>ف</td></tr><tr><td class=\'td\'>"
								+ sahm
								+ "</td><td class=\'td\'>"
								+ qirat
								+ "</td><td class=\'td\'>"
								+ feddan
								+ "</td></tr></table>"
								+ "</td><td class=\'rightcolumn\'>المساحة</td></tr><tr><td class=\'td\'>"
								+ db_displayedownership
								+ "</td><td class=\'rightcolumn\'>رقم الملف</td></tr><tr><td class=\'td\'>"
								+ db_ownername
								+ "</td><td class=\'rightcolumn\'>اسم المالك / واضع اليد</td></tr><tr><td class=\'td\'>"
								+ db_ownerid
								+ "</td><td class=\'rightcolumn\'>الرقم القومى</td></tr><tr><td class=\'td\'>"
								+ db_ownertel
								+ "</td><td class=\'rightcolumn\'>التليفون</td></tr></table><br>"
                                                                     +"<div id=\"errormsg\"></div>"
								+ "<table><tr><td class=\'td-button\'>"
								+ link0
								+ "</td><td class=\'td-button\'>"
								+ link3
								+ "</td><td class=\'td-button\'>"
								+ link2
								+ "</td><td class=\'td-button\'>"
								+ link1
								+ "</td></tr></table>"
								+ "<span onclick='close_infowindow()' class='searchClose'>[&times;]</span></div>";
						infowindow.setContent(content);
						infowindow.setPosition(event.latLng);
						infowindow.open(map);
				});
		
		
		db_layer.addListener('mouseover', function(event) {
				db_layer.revertStyle();
				db_layer.overrideStyle(event.feature, {
					strokeWeight : 4,
					fillColor : 'yellow'
				});
		});

		db_layer.addListener('mouseout', function(event) {
			db_layer.revertStyle();
		});

		db2_layer.addListener('mouseover', function(event) {
				db2_layer.revertStyle();
				db2_layer.overrideStyle(event.feature, {
					strokeWeight : 4,
					fillColor : 'yellow'
				});
		});

		db2_layer.addListener('mouseout', function(event) {
			db2_layer.revertStyle();
		});
		
		
		db3_layer.addListener('mouseover', function(event) {
			db3_layer.revertStyle();
			db3_layer.overrideStyle(event.feature, {
				strokeWeight : 4,
				fillColor : 'yellow'
			});
		});

		db3_layer.addListener('mouseout', function(event) {
			db3_layer.revertStyle();
		});
	
		var geocoder = new google.maps.Geocoder;
		document.getElementById('submitlatlng').addEventListener('click', function() {
	          geocodeLatLng(geocoder, map);
	        });
		document.getElementById('cancellatlng').addEventListener('click', function() {
			document.getElementById('latValue').value="";
	        document.getElementById('lngValue').value="";
	        document.getElementById('latdeg').value="";
	        document.getElementById('latmin').value="";
	        document.getElementById('latsec').value="";
	        document.getElementById('lngdeg').value="";
	        document.getElementById('lngmin').value="";
	        document.getElementById('lngsec').value="";
	        marker.setMap(null);
	        var deflatlng = {lat: parseFloat('30.2519715'), lng: parseFloat('30.2761235')};
	        map.setCenter(deflatlng);
	        map.setZoom(11);
	        });
		
	}
	
	
	
	function landuse(id) 
	{
        var errordiv=document.getElementById("errormsg");
        errordiv.style.color ="red";
        var UserRole="<%=session.getAttribute("userRole")%>";
        if (UserRole!="null"){
            if(UserRole=="2"||UserRole=="3"){
				window.location = "${pageContext.request.contextPath}/landuse?polygon_id=" + encodeURIComponent(id)+"&polygon_lat=" + encodeURIComponent(farmlat)+"&polygon_long=" + encodeURIComponent(farmlng);
			} else {
                errordiv.innerHTML = "غير مسموح بدخول هذه الصفحة";
            }
		} else {
         	errordiv.innerHTML = "برجاء تسجيل الدخول";
        }
    }
	
	
	
	function raster(id) 
    {
        var errordiv=document.getElementById("errormsg");
        errordiv.style.color ="red";
     	var UserRole="<%=session.getAttribute("userRole")%>";
    	if (UserRole!="null"){
        	if(UserRole=="2"||UserRole=="3"){
				window.location = "${pageContext.request.contextPath}/raster?polygon_id=" + encodeURIComponent(id)+"&polygon_lat=" + encodeURIComponent(farmlat)+"&polygon_long=" + encodeURIComponent(farmlng);
			} else{
            	errordiv.innerHTML = "غير مسموح بدخول هذه الصفحة"; 
        	}
		} else {
    		errordiv.innerHTML = "برجاء تسجيل الدخول";
    	}
	}
	
	
	
	function vouchers(id){
		var operationType = "list";
		var errordiv=document.getElementById("errormsg");
        errordiv.style.color ="red";
        var UserRole="<%=session.getAttribute("userRole")%>";
		if (UserRole != "null") {
			if (UserRole == "2" || UserRole == "3") {
				window.location = "${pageContext.request.contextPath}/vouchers?polygon_id=" + encodeURIComponent(id)+"&polygon_lat=" + encodeURIComponent(farmlat)+"&polygon_long=" + encodeURIComponent(farmlng)+"&operation_type=" + encodeURIComponent(operationType);
			} else {
				errordiv.innerHTML = "غير مسموح بدخول هذه الصفحة";
			}
		} else {
			errordiv.innerHTML = "برجاء تسجيل الدخول";
		}
	}

	function close_infowindow() {
		infowindow.close();
	}

	window.onload = function() {
		farmsjson = '${farms}';
		if (farmsjson) {
			farms = JSON.parse(farmsjson);
		} else {
			alert("No Farms Data Retreived!");
		}
		var UserRole="<%=session.getAttribute("userRole")%>";
		if (UserRole != "null") {
			if (UserRole == "2") {
		        document.getElementById("manageusersid").style.display = "block";
			} else {
				document.getElementById("manageusersid").style.display = "none";
			}
		}
	}

	function voucherAction() {
		var voucher_ID = document.getElementById('voucher_ID').value;
		var gov = document.getElementById('gov').value;
		var site = document.getElementById('site').value;
		var person_ID = document.getElementById('person_ID').value;
		var Person_Name = document.getElementById('Person_Name').value;
		var voucher_Date = document.getElementById('voucher_Date').value;
		var Fees_Status = document.getElementById('Fees_Status').value;
		var Amount = document.getElementById('Amount').value;
		var Payment_Status = document.getElementById('Payment_Status').value;
		var Issuing_document = document.getElementById('Issuing_document').value;
		var Issuing_document_section = document
				.getElementById('Issuing_document_section').value;
		var Issuing_Date = document.getElementById('Issuing_Date').value;
		var Issuing_document_No = document
				.getElementById('Issuing_document_No').value;
		var Notes = document.getElementById('Notes').value;
	}

	function voucherPrint() {
		window.print();
	}

	function urlExists(checkedurl) {
		var http = $.ajax({
			type : "HEAD",
			url : checkedurl,
			async : false
		})
		return http.status;
	}
	
	function displayAndHideCenters() {	
		var checkbox = document.getElementById('centers');
		  if (checkbox.checked == true)
		  {
			  centers_layer = new google.maps.Data({
					map : map
				});
			 	centers_layer.loadGeoJson('http://localhost:8080/JSON/centers.geojson');
				//centers_layer.loadGeoJson('http://wn.narss.sci.eg:8080/JSON/centers.geojson');
			 	centers_layer.setStyle(function(feature) {
						return ({
							fillColor : 'transparent',
							strokeColor : '#3300FF',
							strokeWeight : 2
						});
				});
		  } else{
			  centers_layer.setMap(null);
		  }
	}
	
	function displayAndHideDistricts() {	
		var checkbox = document.getElementById('districts');
		  if (checkbox.checked == true)
		  {
			  districts_layer = new google.maps.Data({
					map : map
				});
			  districts_layer.loadGeoJson('http://localhost:8080/JSON/districts.geojson');
			  //districts_layer.loadGeoJson('http://wn.narss.sci.eg:8080/JSON/districts.geojson');
			  districts_layer.setStyle(function(feature) {
						return ({
							fillColor : 'transparent',
							strokeColor : '#5500FF',
							strokeWeight : 2
						});
				});
		  } else{
			  districts_layer.setMap(null);
		  }
	}
	
	function displayAndHideLandsUnionsMohafza() {	
		var checkbox = document.getElementById('landsunionsmohafza');
		  if (checkbox.checked == true)
		  {
			  landsunionsmohafza_layer = new google.maps.Data({
					map : map
				});
			  	landsunionsmohafza_layer.loadGeoJson('http://localhost:8080/JSON/landsunionsmohafza.json');
				//landsunionsmohafza_layer.loadGeoJson('http://wn.narss.sci.eg:8080/JSON/landsunionsmohafza.json');
			  	landsunionsmohafza_layer.setStyle(function(feature) {
						return ({
							fillColor : 'transparent',
							strokeColor : '#ff4400',
							strokeWeight : 3
						});
				});
		  } else{
			  landsunionsmohafza_layer.setMap(null);
		  }
	}
	
	function displayAndHideLaw41() {	
		var checkbox = document.getElementById('law41');
		  if (checkbox.checked == true)
		  {
			  law41_layer = new google.maps.Data({
					map : map
				});
			  	law41_layer.loadGeoJson('http://localhost:8080/JSON/law41.json');
				//law41_layer.loadGeoJson('http://wn.narss.sci.eg:8080/JSON/law41.json');
			  	law41_layer.setStyle(function(feature) {
						return ({
							fillColor : 'transparent',
							strokeColor : '#FFFF00',
							strokeWeight : 3
						});
				});
		  } else{
			  law41_layer.setMap(null);
		  }
	}
	
	function displayAndHideLaw129() {	
		var checkbox = document.getElementById('law129');
		  if (checkbox.checked == true)
		  {
			  law129_layer = new google.maps.Data({
					map : map
				});
			  	law129_layer.loadGeoJson('http://localhost:8080/JSON/law129.json');
				//law129_layer.loadGeoJson('http://wn.narss.sci.eg:8080/JSON/law129.json');
			  	law129_layer.setStyle(function(feature) {
						return ({
							fillColor : 'transparent',
							strokeColor : '#BB0099',
							strokeWeight : 3
						});
				});
		  } else{
			  law129_layer.setMap(null);
		  }
	}
	
	function displayAndHideLaw228() {	
		var checkbox = document.getElementById('law228');
		  if (checkbox.checked == true)
		  {
			  law228_layer = new google.maps.Data({
					map : map
				});
			  	law228_layer.loadGeoJson('http://localhost:8080/JSON/law228.json');
				//law228_layer.loadGeoJson('http://wn.narss.sci.eg:8080/JSON/law228.json');
			  	law228_layer.setStyle(function(feature) {
						return ({
							fillColor : 'transparent',
							strokeColor : '#004488',
							strokeWeight : 2
						});
				});
		  } else{
			  law228_layer.setMap(null);
		  }
	}
	
	function displayAndHideLaw233() {	
		var checkbox = document.getElementById('law233');
		  if (checkbox.checked == true)
		  {
			  road_layer = new google.maps.Data({
					map : map
				});
			  	road_layer.loadGeoJson('http://localhost:8080/JSON/road.json');
				//road_layer.loadGeoJson('http://wn.narss.sci.eg:8080/JSON/road.json');
			  	road_layer.setStyle(function(feature) {
						return ({
							fillColor : '#FFE584',
							strokeColor : '#FFE584',
							strokeWeight : 2
						});
				});
			  	roadbuffer_layer = new google.maps.Data({
					map : map
				});
			  	roadbuffer_layer.loadGeoJson('http://localhost:8080/JSON/roadbuffer.json');
				//roadbuffer_layer.loadGeoJson('http://wn.narss.sci.eg:8080/JSON/roadbuffer.json');
			  	roadbuffer_layer.setStyle(function(feature) {
						return ({
							fillColor : 'transparent',
							strokeColor : 'red',
							strokeWeight : 2
						});
				});
		  } else{
			  road_layer.setMap(null);
			  roadbuffer_layer.setMap(null);
		  }
	}
	
	function displayAndHideLaw341() {	
		var checkbox = document.getElementById('law341');
		  if (checkbox.checked == true)
		  {
			  law341_layer = new google.maps.Data({
					map : map
				});
			  	law341_layer.loadGeoJson('http://localhost:8080/JSON/law341.json');
				//law341_layer.loadGeoJson('http://wn.narss.sci.eg:8080/JSON/law341.json');
			  	law341_layer.setStyle(function(feature) {
						return ({
							fillColor : 'transparent',
							strokeColor : '#ff4466',
							strokeWeight : 2
						});
				});
		  } else{
			  law341_layer.setMap(null);
		  }
	}
	
	function displayAndHideLaw529() {	
		var checkbox = document.getElementById('law529');
		  if (checkbox.checked == true)
		  {
			  law529_layer = new google.maps.Data({
					map : map
				});
			 	law529_layer.loadGeoJson('http://localhost:8080/JSON/law529.json');
				//law529_layer.loadGeoJson('http://wn.narss.sci.eg:8080/JSON/law529.json');
			  	law529_layer.setStyle(function(feature) {
						return ({
							fillColor : 'transparent',
							strokeColor : 'black',
							strokeWeight : 2
						});
				});
		  } else{
			  law529_layer.setMap(null);
		  }
	}
</script>
<script>
function handleClick(myRadio) {
	var currentValue = myRadio.value;
	if(currentValue === '1'){
		document.getElementById('latlng_degrees_id').style.display = "none";
		document.getElementById('latlng_decimal_id').style.display = "block";
	}else{
		document.getElementById('latlng_decimal_id').style.display = "none";
		document.getElementById('latlng_degrees_id').style.display = "block";
	}
}

function geocodeLatLng(geocoder, map) {
	var latlng;
	var inputLat;
	var inputLng;
	if (document.getElementById('decid').checked) {
		 inputLat = document.getElementById('latValue').value;
		 inputLng = document.getElementById('lngValue').value;
		 latlng = {lat: parseFloat(inputLat), lng: parseFloat(inputLng)};
	}
	else if (document.getElementById('degid').checked) {
		  var inputLatDeg = document.getElementById('latdeg').value;
		  var inputLatMin = document.getElementById('latmin').value;
		  var inputLatSec = document.getElementById('latsec').value;
		  
		  var inputLngDeg = document.getElementById('lngdeg').value;
		  var inputLngMin = document.getElementById('lngmin').value;
		  var inputLngSec = document.getElementById('lngsec').value;
		  
		  inputLat = ConvertDMSToDD(inputLatDeg, inputLatMin, inputLatSec, "N");
		  inputLng = ConvertDMSToDD(inputLngDeg, inputLngMin, inputLngSec, "E");
		  latlng = {lat: parseFloat(inputLat), lng: parseFloat(inputLng)};
	}
	geocoder.geocode({'location': latlng}, function(results, status) {
	      if (status === 'OK') {
	        if (results[0]) {
	          map.setCenter(latlng);
	          map.setZoom(11);
	          marker = new google.maps.Marker({
	            position: latlng,
	            map: map
	          });
	        } else {
	          window.alert('عفواً , لا يوجد نتائج!');
	        }
	      } else {
	        window.alert('عفواً , لقد حدث خطأ!: ' + status);
	      }
	    });
  }
  
function ConvertDMSToDD(degrees, minutes, seconds, direction) {
    var dd = Number(degrees) + Number(minutes)/60 + Number(seconds)/(60*60);

    if (direction == "S" || direction == "W") {
        dd = dd * -1;
    } // Don't do anything for N or E
    return dd;
}

</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDxcedr1zrD8h225vpj3hNseos5mHGEDVY&callback=initMap" async defer></script>
</head>
<body>
<jsp:include page="_header.jsp"></jsp:include>
	<div id="wrapper">
		<div id="floating-panel">
	      <b style="float: right;">المراكز</b><input type="checkbox" onclick="displayAndHideCenters();"  id="centers" style="float: left;"/>
	      <br>
	      <b style="float: right;">المناطق</b><input type="checkbox" onclick="displayAndHideDistricts();"  id="districts" style="float: left;"/>
	      <br>
	      <b style="float: right;">أراضي مضافة للمحافظة</b><input type="checkbox" onclick="displayAndHideLandsUnionsMohafza();"  id="landsunionsmohafza" style="float: left;"/>
	      <br>
	      <b style="float: right;">(41/2017) .قرار ج</b><input type="checkbox" onclick="displayAndHideLaw41();"  id="law41" style="float: left;"/>
	      <br>
	      <b style="float: right;">(129/2017) .قرار ج</b><input type="checkbox" onclick="displayAndHideLaw129();"  id="law129" style="float: left;"/>
	      <br>
	      <b style="float: right;">(228/1990) قرار</b><input type="checkbox" onclick="displayAndHideLaw228();"  id="law228" style="float: left;"/>
	      <br>
	      <b style="float: right;">(233/2016) .قرار ج</b><input type="checkbox" onclick="displayAndHideLaw233();"  id="law233" style="float: left;"/>
	      <br>
	      <b style="float: right;">(341/2014) .قرار ج</b><input type="checkbox" onclick="displayAndHideLaw341();"  id="law341" style="float: left;"/>
	      <br>
	      <b style="float: right;">(529/2017) .قرار ج</b><input type="checkbox" onclick="displayAndHideLaw529();"  id="law529" style="float: left;"/>
	    </div>
	    <div id="latlng_floating-panel">
  			<input type="radio" name="latlngRadios"  id="decid" onclick="handleClick(this);" value="1" checked="checked"/>Dec.
  			<input type="radio" name="latlngRadios"  id="degid" onclick="handleClick(this);" value="2" />Deg.<br>
  			
  			<div id="latlng_decimal_id" style="display: block;">
      		<b>Lat: </b><input id="latValue" type="text"  onfocus="if(this.value == '30.170996') { this.value = ''; this.style.color = '#000'}" value="30.170996">&nbsp;<b>N</b><br>
      		<b>Lng: </b><input id="lngValue" type="text"  onfocus="if(this.value == '30.187959') { this.value = ''; this.style.color = '#000'}" value="30.187959">&nbsp;<b>E</b><br>
      		</div>
      		
      		<div id="latlng_degrees_id" style="display: none;">
      		<b>Lat: </b><input class="latlngValueclass1" id="latdeg" type="text"  onfocus="if(this.value == '30') { this.value = ''; this.style.color = '#000'}" value="30"><b><sup>o</sup></b>
      					<input class="latlngValueclass1" id="latmin" type="text"  onfocus="if(this.value == '10') { this.value = ''; this.style.color = '#000'}" value="10">&nbsp;<b><sup>'</sup></b>
      					<input class="latlngValueclass2" id="latsec" type="text"  onfocus="if(this.value == '15.5856') { this.value = ''; this.style.color = '#000'}" value="15.5856">&nbsp;<b><sup>"</sup> N</b><br>
      		<b>Lng: </b><input class="latlngValueclass1" id="lngdeg" type="text"  onfocus="if(this.value == '30') { this.value = ''; this.style.color = '#000'}" value="30"><b><sup>o</sup></b>
      					<input class="latlngValueclass1" id="lngmin" type="text"  onfocus="if(this.value == '11') { this.value = ''; this.style.color = '#000'}" value="11">&nbsp;<b><sup>'</sup></b>
      					<input class="latlngValueclass2" id="lngsec" type="text"  onfocus="if(this.value == '16.6524') { this.value = ''; this.style.color = '#000'}" value="16.6524">&nbsp;<b><sup>"</sup> E</b><br>
      		</div>
      		
      		<input id="cancellatlng" type="button" value="إلغاء">
      		<input id="submitlatlng" type="button" value="بحث">
    	</div>
		<div id="map-canvas"></div>
	</div>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>