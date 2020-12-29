<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>إجراءات التقنين</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" /> -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link href="resources/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/fonts.css" rel="stylesheet" type="text/css"
	media="all" />
<!--<link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
 <link rel="stylesheet" href="resources/tooplate-style.css">
<link rel="stylesheet" href="resources/beheira.css"> -->
<style>
.img_slider {
	position: absolute;
}
</style>
</head>
<body>
<jsp:include page="_header.jsp"></jsp:include>
	<div id="wrapper">
	<div id="vouchercontent" dir=rtl>
				<div id="search-row" class="row justify-content-center align-items-center"> 
					<div id="search-column" class="col-md-12">
						<div id="search-box" class="col-md-12">
		
					<h3 class="text-center text-info">طلب إجراءات التقنين(المعاينة/الفحص)</h3><br>
					<table border="0" align="center" style="dir: rtl;">
						<tr>
					
							<td align="right"><label for="vm_gov" class="text-info" style="float: right;">المحافظة</label></td>
							<td align="right"><input class="form-control" type="text"
								id="vm_gov" name="vm_gov" value="" readonly></td>
						</tr>
						<tr>
					
							<td align="right"><label for="vm_farm_ID" class="text-info" style="float: right;">رقم
								المزرعة</label>
							</td>
							<td align="right"><input class="form-control" type="text"
								id="vm_farm_ID" name="vm_farm_ID" value="" readonly></td>
						</tr>
						<tr>
					
							<td align="right"><label for="vm_person_ID" class="text-info" style="float: right;">الرقم
								القومى</label>
							</td>
							<td align="right"><input class="form-control" type="text"
								id="vm_person_ID" name="vm_person_ID" value=""></td>
						</tr>
						<tr>
					
							<td align="right"><label for="vm_site" class="text-info" style="float: right;">الموقع</label>
							</td>
							<td align="right"><input class="form-control" type="text"
								id="vm_site" name="vm_site" value="" readonly></td>
						</tr>
						<tr>
					
							<td align="right"><label for="vm_Person_Name" class="text-info" style="float: right;">مقدم
								الطلب</label>
							</td>
							<td align="right"><input class="form-control" type="text"
								id="vm_Person_Name" name="vm_Person_Name" value="" ></td>
						</tr>
						<tr>
					
							<td align="right">
								<%
									HttpSession addvoucherssession = request.getSession(true);
									String adderrormsg = (String) addvoucherssession.getAttribute("addNewVoucher");
									if (adderrormsg == null) {
								%>
								<%
									} else {
								%>

								<h3 style="color: red;"><%=adderrormsg%></h3>
								<%
									}
								%>
							</td>
						</tr>
					</table>
					<br>
					<h2 align="center">
						<a href='javascript:void(0);'
						onclick='voucher_add(id);' class='btn btn-info btn-md' id='myvoucher'>إضافة
						إيصال</a>
					</h2><br>
					
					
					<div align="center" id="voucher_edit_form">
						<h3 class="text-center text-info">تعديل
							إيصال</h3><br>
						<input type="hidden" id="selectedvoucherid" name="selectedvoucherid">
						<table border="0" align="center" style="dir: rtl;">
							<tr>
								<td align="right"><label for="edit_voucher_Date" class="text-info" style="float: right;">تاريخ الطلب</label>
								</td>
								<td align="right"><input class="form-control" type="date"
								id="edit_voucher_Date" name="edit_voucher_Date" value="" ></td>
							</tr>
							<tr>
								<td align="right"><label for="edit_Fees_Status" class="text-info" style="float: right;">نوع الرسوم</label>
								</td>
								<td align="right"><input class="form-control" type="text"
								id="edit_Fees_Status" name="edit_Fees_Status" value="" ></td>
							</tr>
							<tr>
								<td align="right"><label for="edit_Amount" class="text-info" style="float: right;">المبلغ</label>
								</td>
								<td align="right"><input class="form-control" type="text"
								id="edit_Amount" name="edit_Amount" value="" ></td>
							</tr>
							<tr>
									<td align="right"><label for="edit_Payment_Status" class="text-info">تم الدفع</label>
									</td>
									<td align="right"><input type="checkbox" id="edit_Payment_Status" name="edit_Payment_Status" style="margin-left: 200px;"></td>
							</tr>
							<tr>
								<td align="right"><label for="edit_Issuing_document" class="text-info" style="float: right;">جهة إصدار الوثيقة</label>
								</td>
								<td align="right"><input class="form-control" type="text"
								id="edit_Issuing_document" name="edit_Issuing_document" value="" ></td>
							</tr>
							<tr>
								<td align="right"><label for="edit_Issuing_document_section" class="text-info" style="float: right;">الفرع</label>
								</td>
								<td align="right"><input class="form-control" type="text"
								id="edit_Issuing_document_section" name="edit_Issuing_document_section" value="" ></td>
							</tr>
							<tr>
								<td align="right"><label for="edit_Issuing_document_No" class="text-info" style="float: right;">رقم الوثيقة</label>
								</td>
								<td align="right"><input class="form-control" type="text"
								id="edit_Issuing_document_No" name="edit_Issuing_document_No" value="" ></td>
							</tr>
							<tr>
								<td align="right"><label for="edit_Notes" class="text-info" style="float: right;">ملاحظات</label>
								</td>
								<td align="right"><input class="form-control" type="text"
								id="edit_Notes" name="edit_Notes" value="" ></td>
							</tr>
							<tr>
								<td align="right">
									<%
										HttpSession editvoucherssession = request.getSession(true);
										String editerrormsg = (String) editvoucherssession.getAttribute("editVoucher");
										if (editerrormsg == null) {
									%>
									<%
										} else {
									%>

									<h3 style="color: red;"><%=editerrormsg%></h3>
									<%
										}
									%>
								</td>
							</tr>
						</table>
						<h2 align="center">
							<button onclick="voucherPrint()" class="btn btn-info btn-md"
								id="voucherBtn">طباعة</button>
							<button onclick="voucherAction(1)" class="btn btn-info btn-md"
								id="voucherBtn">تعديل</button>
						</h2><br>
				</div>		
					
					<div align="center" id="voucher_add_form">
						<h3 class="text-center text-info">إضافة
							إيصال جديد</h3><br>
							<table id="add_voucher_table" border="0" align="center" style="dir: rtl;">
								<tr>
									<td align="right"><label for="add_voucher_Date" class="text-info" style="float: right;">تاريخ الطلب</label>
									</td>
									<td align="right"><input class="form-control" type="date"
										id="add_voucher_Date" name="add_voucher_Date" value=""></td>
								</tr>
								<tr>
									<td align="right"><label for="add_Fees_Status" class="text-info" style="float: right;">نوع الرسوم</label>
									</td>
									<td align="right"><input class="form-control" type="text"
										id="add_Fees_Status" name="add_Fees_Status" value=""></td>
								</tr>
								<tr>
									<td align="right"><label for="add_Amount" class="text-info" style="float: right;">المبلغ</label>
									</td>
									<td align="right"><input class="form-control" type="text"
										id="add_Amount" name="add_Amount" value=""></td>
								</tr>
								<tr>
									<td align="right"><label for="add_Payment_Status" class="text-info">تم الدفع</label>
									</td>
									<td align="right"><input type="checkbox" id="add_Payment_Status" name="add_Payment_Status" value="" style="margin-left: 200px;"></td>
								</tr>
								<tr>
									<td align="right"><label for="add_Issuing_document" class="text-info" style="float: right;">جهة إصدار الوثيقة</label>
									</td>
									<td align="right"><input class="form-control" type="text"
										id="add_Issuing_document" name="add_Issuing_document" value="">
									</td>
								</tr>
								<tr>
									<td align="right"><label for="add_Issuing_document_section" class="text-info" style="float: right;">الفرع</label>
									</td>
									<td align="right"><input class="form-control" type="text"
										id="add_Issuing_document_section" name="add_Issuing_document_section" value="">
									</td>
								</tr>
								<tr>
									<td align="right"><label for="add_Issuing_document_No" class="text-info" style="float: right;">رقم الوثيقة</label>
									</td>
									<td align="right"><input class="form-control" type="text"
										id="add_Issuing_document_No" name="add_Issuing_document_No" value="">
									</td>
								</tr>
								<tr>
									<td align="right"><label for="add_Notes" class="text-info" style="float: right;">ملاحظات</label>
									</td>
									<td align="right"><input class="form-control" type="text"
										id="add_Notes" name="add_Notes" value="">
									</td>
								</tr>
								<tr>
									<td align="right">
										<%
										HttpSession addnewvoucherssession = request.getSession(true);
										String addnewerrormsg = (String) addnewvoucherssession.getAttribute("addNewVoucher");
										if (addnewerrormsg == null) {
										%>
										<%
											} else {
										%>
	
										<h2 style="color: red;"><%=addnewerrormsg%></h2>
										<%
											}
										%>
									</td>
								</tr>
							</table>
							<br>
							<h2 align="center">
								<button onclick="voucherPrint()" class="btn btn-info btn-md"
								id="voucherBtn">طباعة</button>
							<button onclick="voucherAction(2)" class="btn btn-info btn-md"
								id="voucherBtn">إضافة</button>
							</h2><br>
					</div>
				</div>
				<div align="center" id='voucher_list'></div>
			</div>
		</div>
	</div>
	</div>
	<jsp:include page="_footer.jsp"></jsp:include>
	<script>
		var operationtype;
		window.onload = function() {
			voucherjson = '${vouchers}';
			selectedfarmid = '${selectedfarmid}';
			parsedselectedfarmid = JSON.parse(selectedfarmid);
			var farmID;
			var num_of_voucher = 0;
			if (voucherjson != 'null') {
				var vouchers = JSON.parse(voucherjson);
				var voucher_notes = "";
				var voucher_amount = "";
				var voucher_feesStatus = "";
				var formattedDate = "";
				var voucher_paymentStatus = "";
				var voucher_issuingDocument = "";
				var voucher_issuingDocumentSection = "";
				var voucher_issuingDocumentNo = "";

				var voucher_header = '<table dir=\"rtl\" class=\"table table-striped table-bordered table-sm\">'
						+'<tbody>'
						+'<tr>'
						+ '<th scope=\"col\" style=\"text-align: center; height: 60px; vertical-align: middle;\">التاريخ</th>'
						+ '<th scope=\"col\" style=\"text-align: center; height: 60px; vertical-align: middle;\">رقم الوثيقة</th>'
						+ '<th scope=\"col\" style=\"text-align: center; height: 60px; vertical-align: middle;\">الفرع</th>'
						+ '<th scope=\"col\" style=\"text-align: center; height: 60px; vertical-align: middle;\">جهة إصدار الوثيقة</th>'
						+ '<th scope=\"col\" style=\"text-align: center; height: 60px; vertical-align: middle;\">تم الدفع</th>'
						+ '<th scope=\"col\" style=\"text-align: center; height: 60px; vertical-align: middle;\">ملاحظات</th>'
						+ '<th scope=\"col\" style=\"text-align: center; height: 60px; vertical-align: middle;\">المبلغ</th>'
						+ '<th scope=\"col\" style=\"text-align: center; height: 60px; vertical-align: middle;\">الرسوم</th>'
						+ '<th scope=\"col\" style=\"text-align: center; height: 60px; vertical-align: middle;\">إعدادات</th>' + '</tr>';
				var voucher_list_html = "";

				for ( var i in vouchers) {

					num_of_voucher = num_of_voucher + 1;
					farmID = vouchers[i].farmID;

					if (vouchers[i].farmID) {
						document.getElementById("vm_farm_ID").value = vouchers[i].farmID;
					} else {
						document.getElementById("vm_farm_ID").value = "غير متوفر";
					}

					if (vouchers[i].gov) {
						document.getElementById("vm_gov").value = vouchers[i].gov;
					} else {
						document.getElementById("vm_gov").value = "غير متوفر";
					}

					if (vouchers[i].site) {
						document.getElementById("vm_site").value = vouchers[i].site;
					} else {
						document.getElementById("vm_site").value = "غير متوفر";
					}

					if (vouchers[i].personID) {
						document.getElementById("vm_person_ID").value = vouchers[i].personID;
					} else {
						document.getElementById("vm_person_ID").value = "غير متوفر";
					}

					if (vouchers[i].personName) {
						document.getElementById("vm_Person_Name").value = vouchers[i].personName;
					} else {
						document.getElementById("vm_Person_Name").value = "غير متوفر";
					}

					if (vouchers[i].notes) {
						voucher_notes = vouchers[i].notes;
					} else {
						voucher_notes = "غير متوفر";
					}

					if (vouchers[i].amount) {
						voucher_amount = vouchers[i].amount;
					} else {
						voucher_amount = "غير متوفر";
					}

					if (vouchers[i].feesStatus) {
						voucher_feesStatus = vouchers[i].feesStatus;
					} else {
						voucher_feesStatus = "غير متوفر";
					}

					if (vouchers[i].voucherDate) {
						var voucherdate = new Date(vouchers[i].voucherDate);
						formattedDate = voucherdate.getFullYear()+'-'+((voucherdate.getMonth() > 8) ? (voucherdate.getMonth() + 1) : ('0' + (voucherdate.getMonth() + 1))) + '-' + ((voucherdate.getDate() > 9) ? voucherdate.getDate() : ('0' + voucherdate.getDate()));
					} else {
						formattedDate = "غير متوفر";
					}

					if (vouchers[i].paymentStatus == "true") {
						voucher_paymentStatus = "نعم";
					} else {
						voucher_paymentStatus = "لا";
					}

					if (vouchers[i].issuingDocument) {
						voucher_issuingDocument = vouchers[i].issuingDocument;
					} else {
						voucher_issuingDocument = "غير متوفر";
					}

					if (vouchers[i].issuingDocumentSection) {
						voucher_issuingDocumentSection = vouchers[i].issuingDocumentSection;
					} else {
						voucher_issuingDocumentSection = "غير متوفر";
					}

					if (vouchers[i].issuingDocumentNo) {
						voucher_issuingDocumentNo = vouchers[i].issuingDocumentNo;
					} else {
						voucher_issuingDocumentNo = "غير متوفر";
					}

					voucher_list_html = voucher_list_html
							+ '<tr>'
							+ '<td>' + formattedDate
							+ '</td>' + '<td>' + voucher_issuingDocumentNo
							+ '</td>' + '<td>' + voucher_issuingDocumentSection
							+ '</td>' + '<td>' + voucher_issuingDocument
							+ '</td>' + '<td>' + voucher_paymentStatus
							+ '</td>' + '<td>' + voucher_notes
							+ '</td>' + '<td>' + voucher_amount
							+ '</td>' + '<td>'
							+ voucher_feesStatus + '</td>' 
							+ '<td align=\"center\">'
							+ '<button onclick=\"voucher_delete(' 
							+ vouchers[i].voucherID 
							+ ')\" class=\"btn btn-success\" id=\"voucher_delete\">حذف</button><span width="\2px\"></span>'
							+ '<button onclick=\"voucher_edit('
							+ vouchers[i].voucherID
							+ ')\" class=\"btn btn-primary\" id=\"voucher_edit\" style="\margin-right: 5px;\">تعديل</button>'
							+'</td>' + '</tr>';

				}
				voucher_list_html = voucher_header + voucher_list_html
						+ "</tbody></table>";

			} else {
				document.getElementById("vm_farm_ID").value = parsedselectedfarmid;
				document.getElementById("vm_gov").value = "البحيرة";
				document.getElementById("vm_site").value = "وادي النطرون";
			}
			if (num_of_voucher > 0) {
				document.getElementById('voucher_list').innerHTML = voucher_list_html;
			} else {
				document.getElementById('voucher_list').innerHTML = '<div align=\"center\"><h3 class=\"text-center text-info\">عفوا ، لا توجد ايصالات</h3></div>';
			}
			document.getElementById("voucher_edit_form").style.display = "none";
			document.getElementById("voucher_add_form").style.display = "none";
			
			
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
		
		function formatJSONDate(jsonDate) {
			  var newDate = dateFormat(jsonDate, "mm/dd/yyyy");
			  return newDate;
		}

		function voucherAction(event) {
			if (event == 1) { // edit
				var gov = document.getElementById('vm_gov').value;
				var site = document.getElementById('vm_site').value;
				var farm_ID = document.getElementById("vm_farm_ID").value;
				var person_ID = document.getElementById('vm_person_ID').value;
				var Person_Name = document.getElementById('vm_Person_Name').value;
				var voucher_Date = document.getElementById('edit_voucher_Date').value;
				var Fees_Status = document.getElementById('edit_Fees_Status').value;
				var Amount = document.getElementById('edit_Amount').value;
				var Payment_Status = document
						.getElementById('edit_Payment_Status').checked;
				var Issuing_document = document
						.getElementById('edit_Issuing_document').value;
				var Issuing_document_section = document
						.getElementById('edit_Issuing_document_section').value;
				var Issuing_document_No = document
						.getElementById('edit_Issuing_document_No').value;
				var Notes = document.getElementById('edit_Notes').value;
				var voucherID = document.getElementById('selectedvoucherid').value;
				operationType = "edit";
				window.location = "${pageContext.request.contextPath}/vouchers?voucher_id=" + encodeURIComponent(voucherID)
																			+"&farm_id=" + encodeURIComponent(farm_ID)
																			+"&operation_type=" + encodeURIComponent(operationType)
																			+"&gov=" + encodeURIComponent(gov)
																			+"&site=" + encodeURIComponent(site)
																			+"&person_id=" + encodeURIComponent(person_ID)
																			+"&person_name=" + encodeURIComponent(Person_Name)
																			+"&voucher_date=" + encodeURIComponent(voucher_Date)
																			+"&fees_status=" + encodeURIComponent(Fees_Status)
																			+"&amount=" + encodeURIComponent(Amount)
																			+"&payment_status=" + encodeURIComponent(Payment_Status)
																			+"&issuing_document=" + encodeURIComponent(Issuing_document)
																			+"&issuing_document_section=" + encodeURIComponent(Issuing_document_section)
																			+"&issuing_document_no=" + encodeURIComponent(Issuing_document_No)
																			+"&notes=" + encodeURIComponent(Notes);
			}
			if (event == 2) { //add
				var gov = document.getElementById('vm_gov').value;
				var site = document.getElementById('vm_site').value;
				var farm_ID = document.getElementById("vm_farm_ID").value;
				var person_ID = document.getElementById('vm_person_ID').value;
				var Person_Name = document.getElementById('vm_Person_Name').value;
				var voucher_Date = document.getElementById('add_voucher_Date').value;
				var Fees_Status = document.getElementById('add_Fees_Status').value;
				var Amount = document.getElementById('add_Amount').value;
				var Payment_Status = document
						.getElementById('add_Payment_Status').checked;
				var Issuing_document = document
						.getElementById('add_Issuing_document').value;
				var Issuing_document_section = document
						.getElementById('add_Issuing_document_section').value;
				var Issuing_document_No = document
						.getElementById('add_Issuing_document_No').value;
				var Notes = document.getElementById('add_Notes').value;
				operationType = "add";
				window.location = "${pageContext.request.contextPath}/vouchers?farm_id=" + encodeURIComponent(farm_ID)
																			+"&operation_type=" + encodeURIComponent(operationType)
																			+"&gov=" + encodeURIComponent(gov)
																			+"&site=" + encodeURIComponent(site)
																			+"&person_id=" + encodeURIComponent(person_ID)
																			+"&person_name=" + encodeURIComponent(Person_Name)
																			+"&voucher_date=" + encodeURIComponent(voucher_Date)
																			+"&fees_status=" + encodeURIComponent(Fees_Status)
																			+"&amount=" + encodeURIComponent(Amount)
																			+"&payment_status=" + encodeURIComponent(Payment_Status)
																			+"&issuing_document=" + encodeURIComponent(Issuing_document)
																			+"&issuing_document_section=" + encodeURIComponent(Issuing_document_section)
																			+"&issuing_document_no=" + encodeURIComponent(Issuing_document_No)
																			+"&notes=" + encodeURIComponent(Notes);
			}
		}

		function voucherPrint() {
			window.print();
		}

		function voucher_delete(id) {
			operationType = "delete";
			var farm_ID = document.getElementById("vm_farm_ID").value;
			window.location = "${pageContext.request.contextPath}/vouchers?voucher_id=" + encodeURIComponent(id)+"&farm_id=" + encodeURIComponent(farm_ID)+"&operation_type=" + encodeURIComponent(operationType);
		}

		function voucher_edit(id) {
			document.getElementById("selectedvoucherid").value = id;
			voucherjson = '${vouchers}';
			if (voucherjson) {
				var vouchers = JSON.parse(voucherjson);
				for ( var i in vouchers) {
					if (vouchers[i].voucherID == id) {
						var selected_voucher = vouchers[i];
						if (selected_voucher.voucherDate) {
							var voucherdate = new Date(selected_voucher.voucherDate);
							formattedDate = voucherdate.getFullYear()+'-'+((voucherdate.getMonth() > 8) ? (voucherdate.getMonth() + 1) : ('0' + (voucherdate.getMonth() + 1))) + '-' + ((voucherdate.getDate() > 9) ? voucherdate.getDate() : ('0' + voucherdate.getDate()));
							document.getElementById("edit_voucher_Date").value = formattedDate;
						} else {
							document.getElementById("edit_voucher_Date").value = "";
						}
						if (selected_voucher.amount) {
							document.getElementById("edit_Amount").value = selected_voucher.amount;
						} else {
							document.getElementById("edit_Amount").value = "";
						}
						if (selected_voucher.feesStatus) {
							document.getElementById("edit_Fees_Status").value = selected_voucher.feesStatus;
						} else {
							document.getElementById("edit_Fees_Status").value = "";
						}
						if (selected_voucher.notes) {
							document.getElementById("edit_Notes").value = selected_voucher.notes;
						} else {
							document.getElementById("edit_Notes").value = "";
						}
						//alert(selected_voucher.paymentStatus);
						if (selected_voucher.paymentStatus == "true") {
							document.getElementById("edit_Payment_Status").checked = true;
						} else {
							document.getElementById("edit_Payment_Status").checked = false;
						}
						if (selected_voucher.issuingDocument) {
							document.getElementById("edit_Issuing_document").value = selected_voucher.issuingDocument;
						} else {
							document.getElementById("edit_Issuing_document").value = "";
						}
						if (selected_voucher.issuingDocumentSection) {
							document
									.getElementById("edit_Issuing_document_section").value = selected_voucher.issuingDocumentSection;
						} else {
							document
									.getElementById("edit_Issuing_document_section").value = "";
						}
						if (selected_voucher.issuingDocumentNo) {
							document.getElementById("edit_Issuing_document_No").value = selected_voucher.issuingDocumentNo;
						} else {
							document.getElementById("edit_Issuing_document_No").value = "";
						}
						document.getElementById("voucher_edit_form").style.display = "block";
						document.getElementById("voucher_add_form").style.display = "none";
					}
				}
			}
		}

		function voucher_add(id) {
			document.getElementById("voucher_add_form").style.display = "block";
			document.getElementById("voucher_edit_form").style.display = "none";
		}
		
		/*$(document).ready(function(){
			var date_input=$('input[name="add_voucher_Date"]'); //our date input has the name "date"
			var container=$('input[name="add_voucher_table"]');
			date_input.datepicker({
				//format: 'mm/dd/yyyy',
				container: container,
				todayHighlight: true,
				autoclose: true,
			})
		});*/
	</script>
</body>
</html>