<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>إحصائيات</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/bootstrap.min.3.4.1.css">
<script src="resources/js/jquery.js"></script>
<script src="resources/js/jquery.min.3.4.1.js"></script>

<script src="resources/js/bootstrap.min.3.4.1.js"></script>
<link href="resources/css/googlefonts.css" rel="stylesheet" />
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" />
<link href="resources/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/fonts.css" rel="stylesheet" type="text/css"
	media="all" />

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDxcedr1zrD8h225vpj3hNseos5mHGEDVY"
	async defer></script>
<script>
	var farms;
	// 0: allReclamedArea1, 1: allUrbanArea1, 2: allUnusedArea1, 3: allFieldCropsArea1, 4: allCropsArea1
	var allGovernorateContractDetails1 = [0.0, 0.0, 0.0, 0.0, 0.0 ];
	var allOwnershipDetails1 = [ 0.0, 0.0, 0.0, 0.0, 0.0 ];
	var allActionDecisionDetails1 = [ 0.0, 0.0, 0.0, 0.0, 0.0 ];
	var allHandDetails1 = [ 0.0, 0.0, 0.0, 0.0, 0.0 ];
	var allOtherDetails1 = [ 0.0, 0.0, 0.0, 0.0, 0.0 ];

	var allGovernorateContractDetails2 = [0.0, 0.0, 0.0, 0.0, 0.0 ];
	var allOwnershipDetails2 = [ 0.0, 0.0, 0.0, 0.0, 0.0 ];
	var allActionDecisionDetails2 = [ 0.0, 0.0, 0.0, 0.0, 0.0 ];
	var allHandDetails2 = [ 0.0, 0.0, 0.0, 0.0, 0.0 ];
	var allOtherDetails2 = [ 0.0, 0.0, 0.0, 0.0, 0.0 ];

	var allGovernorateContract1 = 0;
	var allOwnership1 = 0;
	var allActionDecision1 = 0;
	var allHand1 = 0;
	var allOther1 = 0;
	
	/*var allOwnership1 = 0;
	var allRent1 = 0;
	var allHand1 = 0;
	var allOther1 = 0;*/

	var allGovernorateContract2 = 0;
	var allOwnership2 = 0;
	var allActionDecision2 = 0;
	var allHand2 = 0;
	var allOther2 = 0;

	var options3;
	var options4;

	var chart2;
	var options2;
	var data2;

	var chart1;
	var options1;
	var data1;

	window.onload = function() {
		document.getElementById('details1').textContent = 'تمليك';
		document.getElementById('details2').textContent = 'تمليك';
		farmsjson = '${farms}';
		if (farmsjson) {
			farms = JSON.parse(farmsjson);

			var curReclamedArea = 0.0;
			var curUrbanArea = 0.0;
			var curUnusedArea = 0.0;
			var curFieldCropsArea = 0.0;
			var curCropsArea = 0.0;
			var curState = 0;

			for ( var i in farms) {

				if (farms[i].reclamedArea) {
					curReclamedArea = parseFloat(farms[i].reclamedArea);
				} else {
					curReclamedArea = 0.0;
				}

				if (farms[i].urbanArea) {
					curUrbanArea = parseFloat(farms[i].urbanArea);
				} else {
					curUrbanArea = 0.0;
				}

				if (farms[i].unusedArea) {
					curUnusedArea = parseFloat(farms[i].unusedArea);
				} else {
					curUnusedArea = 0.0;
				}

				if (farms[i].fieldCropsArea) {
					curFieldCropsArea = parseFloat(farms[i].fieldCropsArea);
				} else {
					curFieldCropsArea = 0.0;
				}

				if (farms[i].cropsArea) {
					curCropsArea = parseFloat(farms[i].cropsArea);
				} else {
					curCropsArea = 0.0;
				}
				//خاص بالمنطقة و
				if (parseInt(farms[i].farmID, 10) <= 264) {

					if (farms[i].ownership) {
						curState = farms[i].ownership;
						
						if (curState === '1') {
							allGovernorateContract1 = allGovernorateContract1 + 1;

							allGovernorateContractDetails1[0] = allGovernorateContractDetails1[0]
									+ curReclamedArea;
							allGovernorateContractDetails1[1] = allGovernorateContractDetails1[1]
									+ curUrbanArea;
							allGovernorateContractDetails1[2] = allGovernorateContractDetails1[2]
									+ curUnusedArea;
							allGovernorateContractDetails1[3] = allGovernorateContractDetails1[3]
									+ curFieldCropsArea;
							allGovernorateContractDetails1[4] = allGovernorateContractDetails1[4]
									+ curCropsArea;
						}
						
						if (curState === '2') {
							allOwnership1 = allOwnership1 + 1;

							allOwnershipDetails1[0] = allOwnershipDetails1[0]
									+ curReclamedArea;
							allOwnershipDetails1[1] = allOwnershipDetails1[1]
									+ curUrbanArea;
							allOwnershipDetails1[2] = allOwnershipDetails1[2]
									+ curUnusedArea;
							allOwnershipDetails1[3] = allOwnershipDetails1[3]
									+ curFieldCropsArea;
							allOwnershipDetails1[4] = allOwnershipDetails1[4]
									+ curCropsArea;
						}
						if (curState === '3') {
							allActionDecision1 = allActionDecision1 + 1;

							allActionDecisionDetails1[0] = allActionDecisionDetails1[0]
									+ curReclamedArea;
							allActionDecisionDetails1[1] = allActionDecisionDetails1[1]
									+ curUrbanArea;
							allActionDecisionDetails1[2] = allActionDecisionDetails1[2]
									+ curUnusedArea;
							allActionDecisionDetails1[3] = allActionDecisionDetails1[3]
									+ curFieldCropsArea;
							allActionDecisionDetails1[4] = allActionDecisionDetails1[4]
									+ curCropsArea;
						}
						if (curState === '4') {
							allHand1 = allHand1 + 1;

							allHandDetails1[0] = allHandDetails1[0]
									+ curReclamedArea;
							allHandDetails1[1] = allHandDetails1[1]
									+ curUrbanArea;
							allHandDetails1[2] = allHandDetails1[2]
									+ curUnusedArea;
							allHandDetails1[3] = allHandDetails1[3]
									+ curFieldCropsArea;
							allHandDetails1[4] = allHandDetails1[4]
									+ curCropsArea;
						}
						if (curState === '5') {
							allOther1 = allOther1 + 1;

							allOtherDetails1[0] = allOtherDetails1[0]
									+ curReclamedArea;
							allOtherDetails1[1] = allOtherDetails1[1]
									+ curUrbanArea;
							allOtherDetails1[2] = allOtherDetails1[2]
									+ curUnusedArea;
							allOtherDetails1[3] = allOtherDetails1[3]
									+ curFieldCropsArea;
							allOtherDetails1[4] = allOtherDetails1[4]
									+ curCropsArea;
						}
					}
				} 
				// خاص بالمنطقة هـــ 
				else {
					if (farms[i].ownership) {
						curState = farms[i].ownership;
						
						if (curState === '1') {
							allGovernorateContract2 = allGovernorateContract2 + 1;

							allGovernorateContractDetails2[0] = allGovernorateContractDetails2[0]
									+ curReclamedArea;
							allGovernorateContractDetails2[1] = allGovernorateContractDetails2[1]
									+ curUrbanArea;
							allGovernorateContractDetails2[2] = allGovernorateContractDetails2[2]
									+ curUnusedArea;
							allGovernorateContractDetails2[3] = allGovernorateContractDetails2[3]
									+ curFieldCropsArea;
							allGovernorateContractDetails2[4] = allGovernorateContractDetails2[4]
									+ curCropsArea;
						}
						
						if (curState === '2') {
							allOwnership2 = allOwnership2 + 1;

							allOwnershipDetails2[0] = allOwnershipDetails2[0]
									+ curReclamedArea;
							allOwnershipDetails2[1] = allOwnershipDetails2[1]
									+ curUrbanArea;
							allOwnershipDetails2[2] = allOwnershipDetails2[2]
									+ curUnusedArea;
							allOwnershipDetails2[3] = allOwnershipDetails2[3]
									+ curFieldCropsArea;
							allOwnershipDetails2[4] = allOwnershipDetails2[4]
									+ curCropsArea;
						}
						if (curState === '3') {
							allActionDecision2 = allActionDecision2 + 1;

							allActionDecisionDetails2[0] = allActionDecisionDetails2[0]
									+ curReclamedArea;
							allActionDecisionDetails2[1] = allActionDecisionDetails2[1]
									+ curUrbanArea;
							allRentDetails2[2] = allRentDetails2[2]
									+ curUnusedArea;
							allActionDecisionDetails2[3] = allActionDecisionDetails2[3]
									+ curFieldCropsArea;
							allActionDecisionDetails2[4] = allActionDecisionDetails2[4]
									+ curCropsArea;
						}
						if (curState === '4') {
							allHand2 = allHand2 + 1;

							allHandDetails2[0] = allHandDetails2[0]
									+ curReclamedArea;
							allHandDetails2[1] = allHandDetails2[1]
									+ curUrbanArea;
							allHandDetails2[2] = allHandDetails2[2]
									+ curUnusedArea;
							allHandDetails2[3] = allHandDetails2[3]
									+ curFieldCropsArea;
							allHandDetails2[4] = allHandDetails2[4]
									+ curCropsArea;
						}
						if (curState === '5') {
							allOther2 = allOther2 + 1;

							allOtherDetails2[0] = allOtherDetails2[0]
									+ curReclamedArea;
							allOtherDetails2[1] = allOtherDetails2[1]
									+ curUrbanArea;
							allOtherDetails2[2] = allOtherDetails2[2]
									+ curUnusedArea;
							allOtherDetails2[3] = allOtherDetails2[3]
									+ curFieldCropsArea;
							allOtherDetails2[4] = allOtherDetails2[4]
									+ curCropsArea;
						}
					}
				}
			}
		}
		
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

	//Pie Chart Code
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart1);
	google.charts.setOnLoadCallback(drawChart2);
	google.charts.setOnLoadCallback(drawChart3);
	google.charts.setOnLoadCallback(drawChart4);

	function drawChart1() {

		data1 = google.visualization.arrayToDataTable([ [ 'Type', 'Ratio' ],
				[ 'أراضي مستصلحة', allOwnershipDetails1[0] ],
				[ 'مباني', allOwnershipDetails1[1] ],
				[ 'أراضي غير مستغلة', allOwnershipDetails1[2] ],
				[ 'محاصيل حقلية', allOwnershipDetails1[3] ],
				[ 'محاصيل بستانية', allOwnershipDetails1[4] ] ]);

		options1 = {
			titleTextStyle : {
				color : '#0000FF',
				fontName : 'arial',
				fontSize : 50,
				bold : true,
				italic : true,
			},
			tooltip : {
				text : 'both',
				fontName : 'arial',
				fontSize : 50,
				bold : true,
				italic : true,
				isHtml : false
			},
			pieSliceTextStyle : {
				fontName : 'arial',
				fontSize : 16
			},
			legend : {
				maxLines : 3,
				position : 'top',
				textStyle : {
					color : 'blue',
					fontSize : 16
				},
				alignment : 'center'
			},
			backgroundColor : "#8FE2F1",
			//reverseCategories: true,
			pieStartAngle : 0,
			is3D: true,
		};

		chart1 = new google.visualization.PieChart(document
				.getElementById('piechart1'));

		function selectHandler() {
			var selectedItem = chart1.getSelection()[0];
			if (selectedItem) {
				var value1 = data1.getValue(selectedItem.row, 0);
				var value2 = data1.getValue(selectedItem.row, 1);
			}
		}
		google.visualization.events
				.addListener(chart1, 'select', selectHandler);
		chart1.draw(data1, options1);
	}

	//================================

	function drawChart2() {

		data2 = google.visualization.arrayToDataTable([ [ 'Type', 'Ratio' ],
				[ 'أراضي مستصلحة', allOwnershipDetails2[0] ],
				[ 'مباني', allOwnershipDetails2[1] ],
				[ 'أراضي غير مستغلة', allOwnershipDetails2[2] ],
				[ 'محاصيل حقلية', allOwnershipDetails2[3] ],
				[ 'محاصيل بستانية', allOwnershipDetails2[4] ] ]);

		options2 = {
			titleTextStyle : {
				color : '#0000FF',
				fontName : 'arial',
				fontSize : 50,
				bold : true,
				italic : true,
			},
			tooltip : {
				text : 'both',
				fontName : 'arial',
				fontSize : 50,
				bold : true,
				italic : true,
				isHtml : false
			},
			pieSliceTextStyle : {
				fontName : 'arial',
				fontSize : 16
			},
			legend : {
				maxLines : 3,
				position : 'top',
				textStyle : {
					color : 'blue',
					fontSize : 16
				},
				alignment : 'center'
			},
			backgroundColor : "#8FE2F1",
			//reverseCategories: true,
			pieStartAngle : 0,
			is3D: true,
		};

		chart2 = new google.visualization.PieChart(document
				.getElementById('piechart2'));

		function selectHandler() {
			var selectedItem = chart2.getSelection()[0];
			if (selectedItem) {
				var value1 = data2.getValue(selectedItem.row, 0);
				var value2 = data2.getValue(selectedItem.row, 1);
			}
		}
		google.visualization.events
				.addListener(chart2, 'select', selectHandler);
		chart2.draw(data2, options2);
	}

	function drawChart3() {

		var data3 = google.visualization.arrayToDataTable([
				[ 'Type', 'Ratio' ], [ 'عقد محافظة', allGovernorateContract1 ],
				[ "تمليك", allOwnership1 ], [ "قرار تصرف", allActionDecision1 ],
				[ "وضع يد", allHand1 ],[ 'أخري', allOther1 ] ]);

		options3 = {
			titleTextStyle : {
				color : '#0000FF',
				fontName : 'arial',
				fontSize : 50,
				bold : true,
				italic : true,
			},
			tooltip : {
				text : 'both',
				fontName : 'arial',
				fontSize : 50,
				bold : true,
				italic : true,
				isHtml : false
			},
			pieSliceText : 'label',
			pieSliceTextStyle : {
				fontName : 'arial',
				fontSize : 16
			},
			legend : {
				maxLines : 3,
				position : 'top',
				textStyle : {
					color : 'blue',
					fontSize : 16
				},
				alignment : 'center'
			},
			backgroundColor : "#8FE2F1",
			//reverseCategories: true,
			pieStartAngle : 0,
			is3D: true,
		};

		var chart3 = new google.visualization.PieChart(document
				.getElementById('piechart3'));

		function selectHandler() {

			var selectedItem = chart3.getSelection()[0];
			//if (selectedItem) {
				//var value1 = data3.getValue(selectedItem.row, 0);
				//var value2 = data3.getValue(selectedItem.row, 1);
				var value1 = 'وضع يد';
				if (value1 === 'تمليك') {
					document.getElementById('details1').textContent = 'تمليك';
					data1 = google.visualization.arrayToDataTable([
							[ 'Type', 'Ratio' ],
							[ 'أراضي مستصلحة', allOwnershipDetails1[0] ],
							[ 'مباني', allOwnershipDetails1[1] ],
							[ 'أراضي غير مستغلة', allOwnershipDetails1[2] ],
							[ 'محاصيل حقلية', allOwnershipDetails1[3] ],
							[ 'محاصيل بستانية', allOwnershipDetails1[4] ] ]);
				} else if (value1 === 'عقد محافظة') {
					document.getElementById('details1').textContent = 'عقد محافظة';
					data1 = google.visualization.arrayToDataTable([
							[ 'Type', 'Ratio' ],
							[ 'أراضي مستصلحة', allGovernorateContractDetails1[0] ],
							[ 'مباني', allGovernorateContractDetails1[1] ],
							[ 'أراضي غير مستغلة', allGovernorateContractDetails1[2] ],
							[ 'محاصيل حقلية', allGovernorateContractDetails1[3] ],
							[ 'محاصيل بستانية', allGovernorateContractDetails1[4] ] ]);
				} else if (value1 === 'وضع يد') {
					document.getElementById('details1').textContent = 'وضع يد';
					data1 = google.visualization.arrayToDataTable([
							[ 'Type', 'Ratio' ],
							[ 'أراضي مستصلحة', allHandDetails1[0] ],
							[ 'مباني', allHandDetails1[1] ],
							[ 'أراضي غير مستغلة', allHandDetails1[2] ],
							[ 'محاصيل حقلية', allHandDetails1[3] ],
							[ 'محاصيل بستانية', allHandDetails1[4] ] ]);
				} else if (value1 === 'قرار تصرف') {
					document.getElementById('details1').textContent = 'قرار تصرف';
					data1 = google.visualization.arrayToDataTable([
							[ 'Type', 'Ratio' ],
							[ 'أراضي مستصلحة', allActionDecisiionDetails1[0] ],
							[ 'مباني', allActionDecisiionDetails1[1] ],
							[ 'أراضي غير مستغلة', allActionDecisiionDetails1[2] ],
							[ 'محاصيل حقلية', allActionDecisiionDetails1[3] ],
							[ 'محاصيل بستانية', allActionDecisiionDetails1[4] ] ]);
				} else {
					document.getElementById('details1').textContent = 'أخري';
					data1 = google.visualization.arrayToDataTable([
							[ 'Type', 'Ratio' ],
							[ 'أراضي مستصلحة', allOtherDetails1[0] ],
							[ 'مباني', allOtherDetails1[1] ],
							[ 'أراضي غير مستغلة', allOtherDetails1[2] ],
							[ 'محاصيل حقلية', allOtherDetails1[3] ],
							[ 'محاصيل بستانية', allOtherDetails1[4] ] ]);
				}

				chart1.draw(data1, options1);
			//}
		}
		google.visualization.events
				.addListener(chart3, 'ready', selectHandler);
		chart3.draw(data3, options3);
	}

	function drawChart4() {

		var data4 = google.visualization.arrayToDataTable([
			[ 'Type', 'Ratio' ], [ 'عقد محافظة', allGovernorateContract2 ],
			[ "تمليك", allOwnership2 ], [ "قرار تصرف", allActionDecision2 ],
			[ "وضع يد", allHand2 ],[ 'أخري', allOther2 ] ]);

		options4 = {
			titleTextStyle : {
				color : '#0000FF',
				fontName : 'arial',
				fontSize : 50,
				bold : true,
				italic : true,
			},
			tooltip : {
				text : 'both',
				fontName : 'arial',
				fontSize : 50,
				bold : true,
				italic : true,
				isHtml : false
			},
			pieSliceText : 'label',
			pieSliceTextStyle : {
				fontName : 'arial',
				fontSize : 16
			},
			legend : {
				maxLines : 3,
				position : 'top',
				textStyle : {
					color : 'blue',
					fontSize : 16
				},
				alignment : 'center'
			},
			backgroundColor : "#8FE2F1",
			//reverseCategories: true,
			pieStartAngle : 0,
			is3D: true,
		};

		var chart4 = new google.visualization.PieChart(document
				.getElementById('piechart4'));

		function selectHandler() {
			var selectedItem = chart4.getSelection()[0];
			//if (selectedItem) {
				//var value1 = data4.getValue(selectedItem.row, 0);
				//var value2 = data4.getValue(selectedItem.row, 1);
				var value1 = 'وضع يد';
				if (value1 === 'تمليك') {
					document.getElementById('details2').textContent = 'تمليك';
					//options4['slices'] = {  1: {offset: 0.2}, 2: {offset: 0.0}, 3: {offset: 0.0}, 4: {offset: 0.0} };
					data2 = google.visualization.arrayToDataTable([
							[ 'Type', 'Ratio' ],
							[ 'أراضي مستصلحة', allOwnershipDetails2[0] ],
							[ 'مباني', allOwnershipDetails2[1] ],
							[ 'أراضي غير مستغلة', allOwnershipDetails2[2] ],
							[ 'محاصيل حقلية', allOwnershipDetails2[3] ],
							[ 'محاصيل بستانية', allOwnershipDetails2[4] ] ]);
				} else if (value1 === 'عقد محافظة') {
					document.getElementById('details2').textContent = 'عقد محافظة';
					//options4['slices'] = {  1: {offset: 0.0}, 2: {offset: 0.2}, 3: {offset: 0.0}, 4: {offset: 0.0} };
					data2 = google.visualization.arrayToDataTable([
							[ 'Type', 'Ratio' ],
							[ 'أراضي مستصلحة', allGovernorateContractDetails2[0] ],
							[ 'مباني', allGovernorateContractDetails2[1] ],
							[ 'أراضي غير مستغلة', allGovernorateContractDetails2[2] ],
							[ 'محاصيل حقلية', allGovernorateContractDetails2[3] ],
							[ 'محاصيل بستانية', allGovernorateContractDetails2[4] ] ]);
				} else if (value1 === 'وضع يد') {
					document.getElementById('details2').textContent = 'وضع يد';
					//options4['slices'] = {  1: {offset: 0.0}, 2: {offset: 0.0}, 3: {offset: 0.2}, 4: {offset: 0.0} };
					data2 = google.visualization.arrayToDataTable([
							[ 'Type', 'Ratio' ],
							[ 'أراضي مستصلحة', allHandDetails2[0] ],
							[ 'مباني', allHandDetails2[1] ],
							[ 'أراضي غير مستغلة', allHandDetails2[2] ],
							[ 'محاصيل حقلية', allHandDetails2[3] ],
							[ 'محاصيل بستانية', allHandDetails2[4] ] ]);
				} else if (value1 === 'قرار تصرف') {
					document.getElementById('details2').textContent = 'قرار تصرف';
					//options4['slices'] = {  1: {offset: 0.0}, 2: {offset: 0.0}, 3: {offset: 0.2}, 4: {offset: 0.0} };
					data2 = google.visualization.arrayToDataTable([
							[ 'Type', 'Ratio' ],
							[ 'أراضي مستصلحة', allActionDecisionDetails2[0] ],
							[ 'مباني', allActionDecisionDetails2[1] ],
							[ 'أراضي غير مستغلة', allActionDecisionDetails2[2] ],
							[ 'محاصيل حقلية', allActionDecisionDetails2[3] ],
							[ 'محاصيل بستانية', allActionDecisionDetails2[4] ] ]);
				} else {
					document.getElementById('details2').textContent = 'أخري';
					//options4['slices'] = {  1: {offset: 0.0}, 2: {offset: 0.0}, 3: {offset: 0.0}, 4: {offset: 0.2} };
					data2 = google.visualization.arrayToDataTable([
							[ 'Type', 'Ratio' ],
							[ 'أراضي مستصلحة', allOtherDetails2[0] ],
							[ 'مباني', allOtherDetails2[1] ],
							[ 'أراضي غير مستغلة', allOtherDetails2[2] ],
							[ 'محاصيل حقلية', allOtherDetails2[3] ],
							[ 'محاصيل بستانية', allOtherDetails2[4] ] ]);
				}

				chart2.draw(data2, options2);
			//}
		}
		google.visualization.events
				.addListener(chart4, 'ready', selectHandler);
		chart4.draw(data4, options4);
	}
</script>
</head>
<body>
<div class="beh_container">
	<jsp:include page="_header.jsp"></jsp:include>
	<div class="beh_main2">
		<div id="statisticscontent" align="center">
			<h1>إحصائيات</h1>
			<div class="stats_chart_div_l">
				<div class="stats_chart_title" style="display: none;">
					<h2>
						<p style="padding: 0 0.75vw;">البيانات الإحصائية الخاصة بالمنطقة -
							و</p>
					</h2>
				</div>
				<div id="piechart3" class="stats_chart_pie" style="display: none;"></div>
				<br>
				<div class="stats_chart_title">
					<h2>
						<p style="padding: 0 0.75vw;">
							<span>البيانات الإحصائية التفصيلية الخاصة بالمنطقة - و - </span><span
								id='details1'></span>
						</p>
					</h2>
				</div>
				<div id="piechart1" class="stats_chart_pie"></div>
	
	
			</div>
			<div class="stats_chart_div_r">
	
				<div class="stats_chart_title" style="display: none;">
					<h2>
						<p style="padding: 0 0.75vw;">البيانات الإحصائية الخاصة بالمنطقة -
							هـــ</p>
					</h2>
				</div>
				<div id="piechart4" class="stats_chart_pie" style="display: none;"></div>
				<br>
				<div class="stats_chart_title">
					<h2>
						<p style="padding: 0 0.75vw;">
							<span>البيانات الإحصائية التفصيلية الخاصة بالمنطقة - هــ -
							</span><span id='details2'></span>
						</p>
					</h2>
				</div>
				<div id="piechart2" class="stats_chart_pie"></div>
			</div>
		</div>
	</div>
	<jsp:include page="_footer.jsp"></jsp:include>
</div>
</body>
</html>