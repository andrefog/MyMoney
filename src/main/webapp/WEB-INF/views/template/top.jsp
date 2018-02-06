<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html>
<head>
	<title><spring:message code="app.title"/></title>
	<link rel="shortcut icon" type="image/svg" href="<c:url value="/resources/icons/favicon.svg"/>"/>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap-reboot.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<meta charset="UTF-8"/>
</head>
<body>
	<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
		<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="/"><spring:message code="app.title"/></a>
		<!-- <input class="form-control form-control-dark w-100" placeholder="Search" aria-label="Search" type="text"> -->
		<ul class="navbar-nav px-3">
			<li class="nav-item text-nowrap">
				<a class="nav-link" href="#"><img src="<c:url value="/resources/icons/logoff.svg"/>"/><spring:message code="app.logoff"/></a>
			</li>
		</ul>
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