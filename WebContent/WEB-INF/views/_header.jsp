<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="header" class="container">
	<div id="logo">
		<a href="${pageContext.request.contextPath}/home" accesskey="1"
			title="home"><img src="resources/images/projectname.png"
			alt="الشعار"></a>
	</div>
	<h1>تنمية أراضي محافظة البحيرة</h1>
	<div id="menu">
		<ul>
			<li>
				<%
					HttpSession sessions = request.getSession(true);
					String username = (String) sessions.getAttribute("userName");
					String userRole = (String) sessions.getAttribute("userRole");
					if (username == null) {
				%> 
				<a href="${pageContext.request.contextPath}/login" accesskey="8" title="login">تسجيل الدخول</a> 
				<%
 					} else {
 				%>
				<div class="dropdown">
					<button class="dropbtn"><%=username%></button>
					<div class="dropdown-content">
						<a href="${pageContext.request.contextPath}/userInfo?loggedinuser=<%=username%>">بياناتي</a>
						<%
							if (userRole.equals("2")) {
						%>
						<a id="manageusersid" href="${pageContext.request.contextPath}/manageusers?operation_type=list">إدارة
							المستخدمين</a>
						<%
							}
						%>
						<a href="${pageContext.request.contextPath}/logout">تسجيل
							الخروج</a>
					</div>
				</div> 
				<%
 					}
 				%>
			</li>
			<li><a href="${pageContext.request.contextPath}/search"
				accesskey="5" title="Search"><img
					src="resources/images/search.png" alt="بحث"></a></li>
			<li><a href="${pageContext.request.contextPath}/aboutus"
				accesskey="4" title="About us"><img
					src="resources/images/aboutus.png" alt="من نحن"></a></li>
			<li><a
				href="${pageContext.request.contextPath}/regulationsandlaws"
				accesskey="3" title="Regulations and Laws"><img
					src="resources/images/regulationsandlaws.png" alt="القوانين"></a></li>
			<li><a href="${pageContext.request.contextPath}/statistics"
				accesskey="2" title="Statistics"><img
					src="resources/images/statistics.png" alt="إحصائيات"></a></li>
			<li><a href="${pageContext.request.contextPath}/timechanges"
				accesskey="7" title="Time Changes"><img
					src="resources/images/timechanges.png" alt="التسلسل الزمني"></a></li>
			<li><a href="${pageContext.request.contextPath}/cropmonitoring"
				accesskey="6" title="Crop Monitoring"><img
					src="resources/images/cropmonitoring.png" alt="مراقبة المحاصيل"></a></li>
			<li class="current_page_item"><a
				href="${pageContext.request.contextPath}/home" accesskey="1"
				title="Home"><img src="resources/images/home.png" alt="الرئيسية"></a></li>
		</ul>
	</div>
</div>