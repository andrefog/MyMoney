<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

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
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/home"><spring:message code="app.title"/></a>
		<!-- <input class="form-control form-control-dark w-100" placeholder="Search" aria-label="Search" type="text"> -->
		<div class="collapse navbar-collapse mr-auto" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="userMenuDropdown" data-toggle="dropdown" href="#" aria-haspopup="true" aria-expanded="false">
						${loggedUser.user.firstName}&nbsp;${loggedUser.user.lastName}<img src="<c:url value="/resources/icons/user.svg"/>"/>
					</a>
					<div class="dropdown-menu" aria-labelledby="userMenuDropdown">
						<a class="dropdown-item" href="#"><spring:message code="change.password"/></a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/logoff"><img src="<c:url value="/resources/icons/logoff.svg"/>"/><spring:message code="app.logoff"/></a>
					</div>
				</li>
			</ul>
		</div>
	</nav>
    
    <div class="container-fluid">
		<div class="row">
      		<nav class="col-md-2 d-none d-md-block bg-light sidebar">
				<div class="sidebar-sticky">
					<ul class="nav flex-column">
					
						<!-- USERS -->
						<li class="nav-item">
				  			<a class="nav-link" href="<c:url value="/user/list"/>"><img src="<c:url value="/resources/icons/user.svg"/>"/><spring:message code="users"/></a>				      			
				  		</li>
					
					</ul>
				</div>
			</nav>
	      
			<main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
				<c:if test="${message ne null}">
					<c:if test="${message.type eq \"ERRO\"}">
						<div class="alert alert-danger">${message.text}</div>
					</c:if>
					<c:if test="${message.type eq \"WARNING\"}">
						<div class="alert alert-warning">${message.text}</div>
					</c:if>
					<c:if test="${message.type eq \"INFORMATION\"}">
						<div class="alert alert-information">${message.text}</div>
					</c:if>
					<c:if test="${message.type eq \"SUCESS\"}">
						<div class="alert alert-success">${message.text}</div>
					</c:if>
				</c:if>