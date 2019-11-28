<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>إجراءات التقنين</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" />
<link href="resources/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/fonts.css" rel="stylesheet" type="text/css"
	media="all" />
<link rel="stylesheet" href="resources/tooplate-style.css">
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
		<div class="extra_noheight" id="voucherscontent">
		<h1>طلب إجراءات التقنين(المعاينة/الفحص)</h1>
			<div class="modal-content">
				<div align="center">

					<table border="0" align="center">
						<tr>
							<td align="right"><input class="readonly-box" type="text"
								id="vm_gov" value="" readonly></td>
							<td align="right" style="color: #396266; font: bold 24px Arial;">المحافظة</td>

							<td align="right"><input class="readonly-box" type="text"
								id="vm_farm_ID" value="" readonly></td>
							<td align="right" style="color: #396266; font: bold 24px Arial;">رقم
								المزرعة</td>
						</tr>
						<tr>
							<td align="right"><input class="input-box" type="text"
								id="vm_person_ID"></td>
							<td align="right" style="color: #396266; font: bold 24px Arial;">الرقم
								القومى</td>

							<td align="right"><input class="readonly-box" type="text"
								id="vm_site" value="" readonly></td>
							<td align="right" style="color: #396266; font: bold 24px Arial;">الموقع</td>
						</tr>
						<tr>
							<td align="right"><p></p></td>
							<td align="right" style="color: #396266; font: bold 24px Arial;"><p></p></td>
							<td align="right"><input class="input-box" type="text"
								id="vm_Person_Name"></td>
							<td align="right" style="color: #396266; font: bold 24px Arial;">مقدم
								الطلب</td>
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

								<h2 style="color: red;"><%=adderrormsg%></h2>
								<%
									}
								%>
							</td>
						</tr>
					</table>
					<br> <br> <a href='javascript:void(0);'
						onclick='voucher_add(id);' class='btnsearch' id='myvoucher'>إضافة
						إيصال</a> <br> <br>

					<div align="center" id='voucher_list'></div>

					<div align="center" id="voucher_edit_form">
						<h2 id='form_header_edit' class="formheader" align="center">تعديل
							إيصال</h2>
						<input type="hidden" id="selectedvoucherid"
							name="selectedvoucherid">
						<table border="0" style="dir: rtl;">
							<tr>
								<td align="right"><input class="input-box" type="date"
									id="edit_voucher_Date" value=""></td>
								<td align="right" style="color: #3d6266;">تاريخ الطلب</td>
							</tr>
							<tr>
								<td align="right"><input class="input-box" type="text"
									id="edit_Fees_Status" value=""></td>
								<td align="right" style="color: #3d6266;">نوع الرسوم</td>
							</tr>
							<tr>
								<td align="right"><input class="input-box" type="text"
									id="edit_Amount" value=""></td>
								<td align="right" style="color: #3d6266;">المبلغ</td>
							</tr>
							<tr>
								<td align="right"><input type="checkbox"
									id="edit_Payment_Status" value=""></td>
								<td align="right" style="color: #3d6266;">تم الدفع</td>
							</tr>
							<tr>
								<td align="right"><input class="input-box" type="text"
									id="edit_Issuing_document" value=""></td>
								<td align="right" style="color: #3d6266;">جهة إصدار الوثيقة</td>
							</tr>
							<tr>
								<td align="right"><input class="input-box" type="text"
									id="edit_Issuing_document_section" value=""></td>
								<td align="right" style="color: #3d6266;">الفرع</td>
							</tr>
							<tr>
								<td align="right"><input class="input-box" type="text"
									id="edit_Issuing_document_No" value=""></td>
								<td align="right" style="color: #3d6266;">رقم الوثيقة</td>
							</tr>
							<tr>
								<td align="right"><textarea class="voucherTA" rows="5"
										id="edit_Notes" value=""></textarea></td>
								<td align="right" style="color: #3d6266;">ملاحظات</td>
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

									<h2 style="color: red;"><%=editerrormsg%></h2>
									<%
										}
									%>
								</td>
							</tr>
						</table>

						<h2 align="center">
							<button onclick="voucherPrint()" class="btnsearch"
								id="voucherBtn">طباعة</button>
							<button onclick="voucherAction(1)" class="btnsearch"
								id="voucherBtn">تعديل</button>
						</h2>

					</div>

					<div align="center" id="voucher_add_form">
						<h2 id='form_header_add' class="formheader" align="center">إضافة
							إيصال جديد</h2>

						<table border="0" style="dir: rtl;">
							<tr>
								<td align="right"><input class="input-box" type="date"
									id="add_voucher_Date" value=""></td>
								<td align="right" style="color: #3d6266;">تاريخ الطلب</td>
							</tr>
							<tr>
								<td align="right"><input class="input-box" type="text"
									id="add_Fees_Status" value=""></td>
								<td align="right" style="color: #3d6266;">نوع الرسوم</td>
							</tr>
							<tr>
								<td align="right"><input class="input-box" type="text"
									id="add_Amount" value=""></td>
								<td align="right" style="color: #3d6266;">المبلغ</td>
							</tr>
							<tr>
								<td align="right"><input type="checkbox"
									id="add_Payment_Status" value=""></td>
								<td align="right" style="color: #3d6266;">تم الدفع</td>
							</tr>
							<tr>
								<td align="right"><input class="input-box" type="text"
									id="add_Issuing_document" value=""></td>
								<td align="right" style="color: #3d6266;">جهة إصدار الوثيقة</td>
							</tr>
							<tr>
								<td align="right"><input class="input-box" type="text"
									id="add_Issuing_document_section" value=""></td>
								<td align="right" style="color: #3d6266;">الفرع</td>
							</tr>
							<tr>
								<td align="right"><input class="input-box" type="text"
									id="add_Issuing_document_No" value=""></td>
								<td align="right" style="color: #3d6266;">رقم الوثيقة</td>
							</tr>
							<tr>
								<td align="right"><textarea class="voucherTA" rows="5"
										id="add_Notes" value=""></textarea></td>
								<td align="right" style="color: #3d6266;">ملاحظات</td>
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

						<h2 align="center">
							<button onclick="voucherPrint()" class="btnsearch"
								id="voucherBtn">طباعة</button>
							<button onclick="voucherAction(2)" class="btnsearch"
								id="voucherBtn">إضافة</button>
						</h2>
					</div>
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

				var voucher_header = '<table border=\"0\" align=\"center\"><tr>'
						+ '<th class=\"resultth\">إعدادات</th>'
						+ '<th class=\"resultth\">رقم الوثيقة</th>'
						+ '<th class=\"resultth\">الفرع</th>'
						+ '<th class=\"resultth\">جهة إصدار الوثيقة</th>'
						+ '<th class=\"resultth\">تم الدفع</th>'
						+ '<th class=\"resultth\">ملاحظات</th>'
						+ '<th class=\"resultth\">المبلغ</th>'
						+ '<th class=\"resultth\">الرسوم</th>'
						+ '<th class=\"resultth\">التاريخ</th>' + '</tr>';
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
							+ '<tr class=\"resulttr\">'
							+ '<td align=\"right\">'
							+ '<button onclick=\"voucher_delete('
							+ vouchers[i].voucherID
							+ ')\" class=\"btnsearch\" id=\"voucher_delete\">حذف</button>'
							+ '<button onclick=\"voucher_edit('
							+ vouchers[i].voucherID
							+ ')\" class=\"btnsearch\" id=\"voucher_edit\">تعديل</button>'
							+ '</td>' + '<td>' + voucher_issuingDocumentNo
							+ '</td>' + '<td>' + voucher_issuingDocumentSection
							+ '</td>' + '<td>' + voucher_issuingDocument
							+ '</td>' + '<td>' + voucher_paymentStatus
							+ '</td>' + '<td align=\"right\">' + voucher_notes
							+ '</td>' + '<td align=\"right\">' + voucher_amount
							+ '</td>' + '<td align=\"right\">'
							+ voucher_feesStatus + '</td>' + '<td>'
							+ formattedDate + '</td>' + '</tr>';

				}
				voucher_list_html = voucher_header + voucher_list_html
						+ "</table>";

			} else {
				document.getElementById("vm_farm_ID").value = parsedselectedfarmid;
				document.getElementById("vm_gov").value = "البحيرة";
				document.getElementById("vm_site").value = "وادي النطرون";
			}
			if (num_of_voucher > 0) {
				document.getElementById('voucher_list').innerHTML = voucher_list_html;
			} else {
				document.getElementById('voucher_list').innerHTML = '<div align=\"center\"><h3>عفوا ، لا توجد ايصالات</h3></div>';
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
						alert(selected_voucher.paymentStatus);
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
	</script>
</body>
</html>