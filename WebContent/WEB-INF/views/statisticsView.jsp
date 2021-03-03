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
	var db2FarmsID = [265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299, 300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 318, 319, 320, 321, 322, 323, 324, 325, 326, 327, 328, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339, 340, 341, 342, 343, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 380, 381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 399, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 419, 420, 421, 422, 423, 424, 425, 426, 427, 428, 429, 430, 431, 432, 433, 434, 435, 436, 437, 438, 439, 440, 441, 442, 443, 444, 445, 446, 447, 448, 449, 450, 451, 452, 453, 454, 455, 456, 457, 458, 459, 460, 461, 462, 463, 464, 465, 466, 467, 468, 469, 470, 471, 472, 473, 474, 475, 476, 477, 478, 479, 480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 491, 492, 493, 494, 495, 496, 497, 498, 499, 500, 501, 502, 503, 504, 505, 506, 507, 508, 509, 510, 511, 512, 513, 514, 515, 516, 517, 518, 519, 520, 521, 522, 523, 524, 525, 526, 527, 528, 529, 530, 531, 532, 533, 534, 535, 536, 537, 538, 539, 540, 541, 542, 543, 544, 545, 546, 547, 548, 549, 550, 551, 552, 553, 554, 555, 556, 557, 685, 705, 1110, 1111, 1112, 1113, 1114, 1115, 1116];
	var db2_farms_count;
	var db1_farms_count;
	
	var db2_farms_area = 337.527; //in KM square (منطقة هـــ);
	var db1_farms_area = 509.727 //in KM square (منطقة و);
	// 0: allReclamedArea1, 1: allUrbanArea1, 2: allUnusedArea1, 3: allFieldCropsArea1, 4: allCropsArea1
	var allGovernorateContractDetails1 = [ 0.0, 0.0, 0.0, 0.0, 0.0 ];
	var allOwnershipDetails1 = [ 0.0, 0.0, 0.0, 0.0, 0.0 ];
	var allActionDecisionDetails1 = [ 0.0, 0.0, 0.0, 0.0, 0.0 ];
	var allHandDetails1 = [ 0.0, 0.0, 0.0, 0.0, 0.0 ];
	var allOtherDetails1 = [ 0.0, 0.0, 0.0, 0.0, 0.0 ];

	var allGovernorateContractDetails2 = [ 0.0, 0.0, 0.0, 0.0, 0.0 ];
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
			db2_farms_count = db2FarmsID.length;
			db1_farms_count = farms.length - db2_farms_count;
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
				//DB1 خاص بالمنطقة  و
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
				// DB2 خاص بالمنطقة هـــ 
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

	}

	//Google Chart Code
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart1);
	google.charts.setOnLoadCallback(drawChart2);
	google.charts.setOnLoadCallback(drawChart3);
	google.charts.setOnLoadCallback(drawChart4);
    google.charts.setOnLoadCallback(drawTotalNumberFamrsBarChart);
    google.charts.setOnLoadCallback(drawTotalAreaBarChart);

	function drawChart1() {

		/*data1 = google.visualization.arrayToDataTable([ [ 'Type', 'Ratio' ],
			[ 'أراضي مستصلحة', allOwnershipDetails1[0] ],
			[ 'مباني', allOwnershipDetails1[1] ],
			[ 'أراضي غير مستغلة', allOwnershipDetails1[2] ],
			[ 'محاصيل حقلية', allOwnershipDetails1[3] ],
			[ 'محاصيل بستانية', allOwnershipDetails1[4] ] ]);*/
		
		// Static version
		data1 = google.visualization.arrayToDataTable([ [ 'Ratio', 'Type' ],
			[46548.4880405823 , 'اراضي  مستزرعة محاصيل بستانية'],
			[23030.5735096032 , 'اراضي  مستزرعة محاصيل حولية'],
			[0.0 , 'اراضي متخللات الري المحوري'],
			[0.0 , 'اراضي خدمات مناطق الانتاج الزراعى'],
			[20418.6108822442 , 'اراضي مستصلحة سبق زراعتها'],
			[437.93801661849 , 'اراضي مستصلحة لم يسبق زراعتها'],
			[18919.1990412627 , 'اراضي غير مستغله'],
			[14.126820182318 , 'مباني انتاج زراعى'],
			[0.0 , 'مباني انتاج حيوانى'],
			[34.9711638379839 , 'مباني انتاج داجنى'],
			[1502.50570706165 , 'مباني ادارية وسكنية']
			]);

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
				fontSize : 20,
				bold: true,
				color : '#000000'
			},
			legend : {
				maxLines : 4,
				position : 'top',
				textStyle : {
					color : '#000000',
					fontSize : 12,
					bold: true
				},
				alignment : 'center'
			},
			backgroundColor : "#8FE2F1",
			//reverseCategories: true,
			pieStartAngle : 0,
			is3D : true,
			sliceVisibilityThreshold: 0.0,
			colors : ['#55FF00', '#41A800', '#FF7373', '#C00000', '#FFAA00', '#FFD966', '#FFFF00', '#FF0066', '#FFBEE8', '#FF00FF', '#FF0000']
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
				fontSize : 20,
				bold: true,
				color : '#000000'
			},
			legend : {
				maxLines : 4,
				position : 'top',
				textStyle : {
					color : '#000000',
					fontSize : 12,
					bold: true
				},
				alignment : 'center'
			},
			backgroundColor : "#8FE2F1",
			//reverseCategories: true,
			pieStartAngle : 0,
			is3D : true,
			sliceVisibilityThreshold: 0.0,
			colors : ['#55FF00', '#41A800', '#FF7373', '#C00000', '#FFAA00', '#FFD966', '#FFFF00', '#FF0066', '#FFBEE8', '#FF00FF', '#FF0000', '#4169E1']
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
				[ "تمليك", allOwnership1 ],
				[ "قرار تصرف", allActionDecision1 ], [ "وضع يد", allHand1 ],
				[ 'أخري', allOther1 ] ]);

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
			is3D : true
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
				data1 = google.visualization
						.arrayToDataTable([
								[ 'Type', 'Ratio' ],
								[ 'أراضي مستصلحة',
										allGovernorateContractDetails1[0] ],
								[ 'مباني', allGovernorateContractDetails1[1] ],
								[ 'أراضي غير مستغلة',
										allGovernorateContractDetails1[2] ],
								[ 'محاصيل حقلية',
										allGovernorateContractDetails1[3] ],
								[ 'محاصيل بستانية',
										allGovernorateContractDetails1[4] ] ]);
			} else if (value1 === 'وضع يد') {
				document.getElementById('details1').textContent = 'وضع يد';
				data1 = google.visualization.arrayToDataTable([
						[ 'Type', 'Ratio' ],
						[ 'اراضي  مستزرعة محاصيل بستانية',  46548],
						[ 'اراضي  مستزرعة محاصيل حولية', 23031],
						[ 'اراضي متخللات الري المحوري', 0],
						[ 'اراضي خدمات مناطق الانتاج الزراعى', 0],
						[ 'اراضي مستصلحة سبق زراعتها', 20419],
						[ 'اراضي مستصلحة لم يسبق زراعتها', 438],
						[ 'اراضي غير مستغله', 18919],
						[ 'مباني انتاج زراعى', 14],
						[ 'مباني انتاج حيوانى', 0],
						[ 'مباني انتاج داجنى', 35],
						[ 'مباني ادارية وسكنية', 1503]
						]);
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
		google.visualization.events.addListener(chart3, 'ready', selectHandler);
		chart3.draw(data3, options3);
	}

	function drawChart4() {

		var data4 = google.visualization.arrayToDataTable([
				[ 'Type', 'Ratio' ], [ 'عقد محافظة', allGovernorateContract2 ],
				[ "تمليك", allOwnership2 ],
				[ "قرار تصرف", allActionDecision2 ], [ "وضع يد", allHand2 ],
				[ 'أخري', allOther2 ] ]);

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
			is3D : true
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
				data2 = google.visualization
						.arrayToDataTable([
								[ 'Type', 'Ratio' ],
								[ 'أراضي مستصلحة',
										allGovernorateContractDetails2[0] ],
								[ 'مباني', allGovernorateContractDetails2[1] ],
								[ 'أراضي غير مستغلة',
										allGovernorateContractDetails2[2] ],
								[ 'محاصيل حقلية',
										allGovernorateContractDetails2[3] ],
								[ 'محاصيل بستانية',
										allGovernorateContractDetails2[4] ] ]);
			} else if (value1 === 'وضع يد') {
				document.getElementById('details2').textContent = 'وضع يد';
				//options4['slices'] = {  1: {offset: 0.0}, 2: {offset: 0.0}, 3: {offset: 0.2}, 4: {offset: 0.0} };
				data2 = google.visualization.arrayToDataTable([
						[ 'Type', 'Ratio' ],
						[ 'اراضي  مستزرعة محاصيل بستانية',  13292],
						[ 'اراضي  مستزرعة محاصيل حولية', 961],
						[ 'اراضي متخللات الري المحوري', 0],
						[ 'اراضي خدمات مناطق الانتاج الزراعى', 0],
						[ 'اراضي مستصلحة سبق زراعتها', 7813],
						[ 'اراضي مستصلحة لم يسبق زراعتها', 0],
						[ 'اراضي غير مستغله', 34805],
						[ 'مباني انتاج زراعى', 24],
						[ 'مباني انتاج حيوانى', 2],
						[ 'مباني انتاج داجنى', 323],
						[ 'مباني ادارية وسكنية', 118],
						[ 'أراضي بدون ارشاد', 23331]
						]);
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
		google.visualization.events.addListener(chart4, 'ready', selectHandler);
		chart4.draw(data4, options4);
	}
	
	//For # of Farms Bra Chart Drawing
    function drawTotalNumberFamrsBarChart() {
    	var data = google.visualization.arrayToDataTable([
            ["Element", "عدد المزارع", { role: "style" } ],
            ["منطقة و", 806, "#F80"],
            ["منطقة هــ", 301, "#8F0"],
            ["خارج حدود القرار", 5, "#FF0"]
          ]);

          var view = new google.visualization.DataView(data);
          view.setColumns([0, 1,
                           { calc: "stringify",
                             sourceColumn: 1,
                             type: "string",
                             role: "annotation" },
                           2]);

          var options = {
            title: "",
            width: 675,
            height: 600,
            vAxis: {
                title: 'عدد المزارع',
				titleTextStyle: {
					color: "#000",
					fontName: "arial",
					fontSize: 30,
					bold: true,
					italic: false
				}
            },
            bar: {groupWidth: "40%"},
            legend: { position: "none" },
            backgroundColor: {
				fill: 'rgb(143, 226, 241)',
				fillOpacity: 0.8
			}
          };
          var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
          chart.draw(view, options);
    }
	
  	//For Areas Bra Chart Drawing
    function drawTotalAreaBarChart() {
    	var data2 = google.visualization.arrayToDataTable([
            ["Element", "المساحة بالفدان", { role: "style" } ],
            ["المنطقة و", 110907, "#F80"],
            ["المنطقة هـ", 80669, "#8F0"],
            ["خارج حدود القرار", 20275, "#FF0"]
          ]);

          var view2 = new google.visualization.DataView(data2);
          view2.setColumns([0, 1,
                           { calc: "stringify",
                             sourceColumn: 1,
                             type: "string",
                             role: "annotation" },
                           2]);

          var options2 = {
            title: "",
            width: 675,
            height: 600,
            vAxis: {
                title: 'المساحة بالفدان',
				titleTextStyle: {
					color: "#000",
					fontName: "arial",
					fontSize: 30,
					bold: true,
					italic: false
				}
              },
            bar: {groupWidth: "40%"},
            legend: { position: "none" },
            backgroundColor: {
				fill: 'rgb(143, 226, 241)',
				fillOpacity: 0.8
			}
          };
          var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values2"));
          chart.draw(view2, options2);
    }
</script>
</head>
<body>
	<div class="beh_container">
		<jsp:include page="_header.jsp"></jsp:include>
		<div class="beh_main2">
			<div id="statisticscontent" align="center">
				<h1>إحصائيات</h1>
				<div class="stats_chart_div_r">
					<div class="stats_chart_title" style="display: none;">
						<h2>
							<p style="padding: 0 0.75vw;">البيانات الإحصائية الخاصة
								بالمنطقة - و</p>
						</h2>
					</div>
					<div id="piechart3" class="stats_chart_pie" style="display: none;"></div>
					<br>
					<div class="stats_chart_title">
						<h2>
							<p style="padding: 0 0.75vw;">
								<span>البيانات الإحصائية التفصيلية الخاصة بالمنطقة - و -
								</span><span id='details1'></span>
							</p>
						</h2>
					</div>
					<div id="piechart1" class="stats_chart_pie"></div>


				</div>
				<div class="stats_chart_div_l">

					<div class="stats_chart_title" style="display: none;">
						<h2>
							<p style="padding: 0 0.75vw;">البيانات الإحصائية الخاصة
								بالمنطقة - هـــ</p>
						</h2>
					</div>
					<div id="piechart4" class="stats_chart_pie" style="display: none;"></div>
					<br>
					<div class="stats_chart_title">
						<h2>
							<p style="padding: 0 0.75vw;">
								<span>البيانات الإحصائية التفصيلية الخاصة بالمنطقة - هــ
									- </span><span id='details2'></span>
							</p>
						</h2>
					</div>
					<div id="piechart2" class="stats_chart_pie"></div>
				</div>
				
				<div style="float: right; height: 5px;"></div>
				<!-- Bar Chart for Total Number of Farms for Regions (هــــ - ,) -->
				<div class="stats_chart_div_farms_no_r">

					<div class="stats_chart_title">
						<h2>
							<p style="padding: 0 0.75vw;">إجمالي عمليات الرفع المساحي للمنطقتين و - هــ</p>
						</h2>
					</div>
					
    				<div id="columnchart_values" class="stats_chart_bar"></div>

				</div>
				
				<!-- Bar Chart for Total Areas for Regions (هــــ - ,) -->
				<div class="stats_chart_div_farms_area_l">

					<div class="stats_chart_title">
						<h2>
							<p style="padding: 0 0.75vw;">إجمالي المساحات للمنطقتين و - هـــ</p>
						</h2>
					</div>
					
    				<div id="columnchart_values2" class="stats_chart_bar"></div>

				</div>
				<!-- ---------------------------------------------------------------- -->
			</div>
		</div>
		<jsp:include page="_footer.jsp"></jsp:include>
	</div>
</body>
</html>