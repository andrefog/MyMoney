<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title><spring:message code="app.title"/></title>
	<link rel="shortcut icon" type="image/svg" href="${pageContext.request.contextPath}/resources/icons/favicon.svg">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-reboot.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/popper-1.12.9.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<meta charset="UTF-8"/>
</head>

<body class="text-center">
	<c:import url="user/userModal.jsp" />
	<div class="form-signin">
		<img class="mb-4" src="resources/icons/logo.svg" alt="MyMoney" width="72" height="72">
		<h1 class="h3 mb-3 font-weight-normal"><spring:message code="msg.please.signin"/></h1>
		
		<form action="login" method="post">
			<label for="email" class="sr-only"><spring:message code="email"/></label>
			<input type="email" name="email" class="form-control" placeholder="<spring:message code="email"/>" required autofocus>
			
			<label for="password" class="sr-only"><spring:message code="password"/></label>
			<input type="password" name="password" class="form-control" placeholder="<spring:message code="password"/>" required>
			
			<button type="submit" class="btn btn-lg btn-primary btn-block"><spring:message code="login"/></button>
		</form>
		
		<c:if test="${message.type eq \"ERRO\"}">
			<div class="alert alert-danger">${message.text}</div>
		</c:if>
		<p class="mt-5 mb-3 text-muted">
			<spring:message code="msg.create.new.user"/>
			<a data-toggle="modal" data-target="#userModal"><spring:message code="here"/></a>
		</p>
	</div>
</body>
</html>
