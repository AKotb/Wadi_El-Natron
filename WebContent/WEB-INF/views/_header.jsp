<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="beh_header">
	<div class="beh_header_login">
		
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
	</div>
	
	<div class="beh_header_nav">
		
		<a href="${pageContext.request.contextPath}/search"
				accesskey="5" title="Search">
			<img class="beh_nav_item" src="resources/images/search.png" alt="بحث">
		</a>		
		<a href="${pageContext.request.contextPath}/aboutus"
				accesskey="4" title="About us">
			<img class="beh_nav_item" src="resources/images/aboutus.png" alt="من نحن">
		</a>
		<a href="${pageContext.request.contextPath}/regulationsandlaws"
				accesskey="3" title="Regulations and Laws">
			<img class="beh_nav_item" src="resources/images/regulationsandlaws.png" alt="القوانين">
		</a>
		<a href="${pageContext.request.contextPath}/statistics"
				accesskey="2" title="Statistics">
			<img class="beh_nav_item" src="resources/images/statistics.png" alt="إحصائيات">
		</a>
		<a href="${pageContext.request.contextPath}/timechanges"
				accesskey="7" title="Time Changes">
			<img class="beh_nav_item" src="resources/images/timechanges.png" alt="التسلسل الزمني">
		</a>
		<a href="${pageContext.request.contextPath}/cropmonitoring"
				accesskey="6" title="Crop Monitoring">
			<img class="beh_nav_item" src="resources/images/cropmonitoring.png" alt="مراقبة المحاصيل">
		</a>
		<a href="${pageContext.request.contextPath}/home" accesskey="1"
				title="Home">
			<img class="beh_nav_item" src="resources/images/home.png" alt="الرئيسية">
		</a>
		
	</div>
	
	<div class="beh_header_title">
		<span class="beh_title_decorated">تنمية أراضى محافظة البحيرة</span>
	</div>
	
	<a href="${pageContext.request.contextPath}/home" accesskey="1" title="home">
		<img class="beh_header_banner" src="resources/images/projectname.png" alt="الشعار">
	</a>
</div>