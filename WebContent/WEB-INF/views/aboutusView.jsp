<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>من نحن</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" />
<link href="resources/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="resources/fonts.css" rel="stylesheet" type="text/css"
	media="all" />
<script type="text/javascript">
	window.onload = function() {
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
</script>
</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>
	<div id="wrapper">
		<div id="aboutuscontent">
			<h1>عن الهيئة</h1>
			<p dir=rtl>
				بدأ نشاط الإستشعار من البعد فى مصر مع بداية السبعينات وتحديدا عام
				1971 من خلال مشروع بحثى مشترك بأكاديمية البحث العلمى والتكنولوجيا مع
				جامعة أكلاهوما الأمريكية ثم تطور إلى إنشاء مركز للاستشعار من البعد
				تابعا لأكاديمية البحث العلمى والتكنولوجيا عام 1972. أنشئت الهيئة
				القومية للاستشعار من البعد وعلوم الفضاء عام 1991 كهيئة عامة تتبع
				وزارة البحث العلمى، ثم أعيد تنظيمها عام 1994 كهيئة قومية <span
					style='color: blue'> بقرار رئيس الجمهورية رقم 261 لسنة 1994
					.</span> <br> تهدف الهيئة القومية للاستشعار من البعد وعلوم الفضاء إلى
				متابعة ونقل وتقديم أحدث التقنيات فى مجالات الاستشعار من البعد
				والتطبيقات السلمية لعلوم الفضاء، وبناء القدرات الذاتية لتطبيقها ونشر
				الاستفادة منها والتعاون مع مختلف مؤسسات الدولة لخدمة خطط وأهداف
				التنمية . <a href="https://www.narss.sci.eg/" target="_blank">للمزيد
					اضغط هنا</a>
			</p>
		</div>
	</div>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>