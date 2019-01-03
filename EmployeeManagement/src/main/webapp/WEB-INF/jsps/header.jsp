<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="<c:url value="/resources/js/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Menu.css">
</head>
<body>
	<div class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<ul class="nav navbar-nav">
				<li><a style="color: white; border-right: 2px solid white;"
					id="analitics" href="analytics">Analytics</a></li>
				<li><a id="config"
					style="color: white; border-right: 2px solid white;"
					href="configure">Configure</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a style="color: white;" id="userlogout" href="logoutuser"><span
						class="glyphicon glyphicon-log-out"></span> Logout</a></li>
			</ul>
		</div>
	</div>
</body>
</html>