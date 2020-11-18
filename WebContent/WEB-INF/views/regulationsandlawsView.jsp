<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>اللوائح و القوانين</title>
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
		}
	}
	
	function titlepath(path,name){
            var prntWin = window.open();
            prntWin.document.write("<html><head><title>"+name+"</title></head><body>"
                + '<embed width="100%" height="100%" name="plugin" src="'+ path+ '" '
                + 'type="application/pdf" internalinstanceid="21"></body></html>');
            prntWin.document.close();
        }
</script>
</head>
<body>
<jsp:include page="_header.jsp"></jsp:include>
<div id="wrapper">
	<div id="regulationsandlawscontent">
	<div class="regulations-and-laws_title_div">
		<h1 class="regulations-and-laws_h1">اللوائح والقوانين</h1>
	</div>
			<p dir=rtl>
			يعتبر حصر و تقدير مساحات إستخدامات الأراضى الصحراوية فى مصر متطلبا أساسيا وذو أولوية وطنية عالية للخطط القومية للتنمية المتمثلة فى إدارة الموارد الأرضية والمائية فى مصر ووقف التعديات عليها، وعلاوة على تخطيط الاستخدام الأمثل لتنمية هذه الموارد والتى تعتمد إلى حد كبير على توافر مثل هذه البيانات الدقيقة عن الأراضى ومتابعة التغيرات الحادثة عليها.
			<br>
وفى إطار بروتوكول التعاون بين محافظة البحيرة والهيئة القومية للاستشعار من البعد وعلوم الفضاء تم إبرام عقد اتفاق فى 22 نوفمبر 2017 لإعداد نظام معلوماتى متكامل لاستخدامات أراضى وادى النطرون ولاية محافظة البحيرة والمحددة طبقا للقرار الجمهورى رقم 529 لسنة 2017 لدعم المحافظة فى اتخاذ التدابير اللازمة لإيقاف أى صورة من صور الاعتداء على أراضى الدولة واسترداد حق الشعب فى إطار القانون رقم 144 لسنة 2017 ولائحته التنفيذية رقم 18 لسنة 2017 فى شأن قواعد وإجراءات التصرف فى أملاك الدولة.
			</p>
			
			<ul dir="rtl">
			<li><a href="#" onclick='titlepath("datafiles/pdf/rl_01.pdf","143 قانون");' >قانون رقم 143 لسنة 1981 بشأن الأراضي الصحراوية ولائحته التنفيذية</a></li>
			<li><a href="#" onclick='titlepath("datafiles/pdf/rl_02.pdf","228 قرار");' >قرار رئيس مجلس الوزراء رقم 228 لسنة 1990 بتحديد نطاق مدينة وادي النطرون</a></li>
			<li><a href="#" onclick='titlepath("datafiles/pdf/rl_03.pdf","7 قانون");' >القانون رقم 7 لسنة 1991 بشأن بعض الاحكام المتعلقة بأملاك الدولة الخاصة</a></li>
			<li><a href="#" onclick='titlepath("datafiles/pdf/rl_04.pdf","341 قرار ج");' >قرار رئيس الجمهورية رقم 341 لسنة 2014 بشأن الأراضي المخصصة للاستصلاح والاستزراع</a></li>
			<li><a href="#" onclick='titlepath("datafiles/pdf/rl_05.pdf","75 قرار ج");' >قرار رئيس الجمهورية رقم 75 لسنة 2016 بشأن تشكيل لجنة إسترداد أراضي الدولة</a></li>
			<li><a href="#" onclick='titlepath("datafiles/pdf/rl_06.pdf","378 قرار ج");' >قرار رئيس الجمهورية رقم 378 لسنة 2016 بشأن استرداد أراضي الدولة</a></li>
			<li><a href="#" onclick='titlepath("datafiles/pdf/rl_07.pdf","129 قرار ج");' >قراررئيس الجمهورية رقم 129 لسنة 2017 بإلغاء تخصيص قطعتي أرض</a></li>
			<li><a href="#" onclick='titlepath("datafiles/pdf/rl_08.pdf","144 قرار ج");' >قانون رئيس الجمهورية رقم 144 لسنة 2017 بشأن بعض قواعد التصرف في أملاك الدولة الخاصة</a></li>
			<li><a href="#" onclick='titlepath("datafiles/pdf/rl_15.pdf","اللائحة التنفيذية");' >اللائحة التنفيذية للقانون 144 لسنة 2017</a></li>
			<li><a href="#" onclick='titlepath("datafiles/pdf/rl_09.pdf","529 قرار ج");' >قرار رئيس الجمهورية رقم 529 لسنة 2017</a></li>
			<li><a href="#" onclick='titlepath("datafiles/pdf/rl_10.pdf","خطاب وزير الزراعة");' >خطاب وزير الزراعة لمحافظة البحيرة بشأن قرار رئيس الجمهورية رقم 529 لسنة 2017 بإعادة تخصيص قطع أراضي</a></li>
			<li><a href="#" onclick='titlepath("datafiles/pdf/rl_11.pdf","بروتوكول تعاون");' >بروتوكول التعاون بين محافظة البحيرة والهيئة القومية للاستشعار من البعد</a></li>
			<li><a href="#" onclick='titlepath("datafiles/pdf/rl_13.pdf","41 قرار ج");' >قرار رئيس الجمهورية رقم 41 لسنة 2017</a></li>
			<li><a href="#" onclick='titlepath("datafiles/pdf/rl_14.pdf","233 قرار ج");' >قرار رئيس الجمهورية رقم 233 لسنة 2016</a></li>
			</ul>
			
		</div>
	</div>
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>