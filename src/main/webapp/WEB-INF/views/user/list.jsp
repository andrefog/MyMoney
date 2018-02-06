<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<c:import url="../template/top.jsp" />
<div class="container">
	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
		<h1 class="h2"><spring:message code="users" /></h1>
		<div class="btn-toolbar mb-2 mb-md-0">
 				<div class="btn-group mr-2">
 					<ul class="nav flex-column">
  					<li class="nav-item">
	    				<a href="<c:url value="/user/new"/>" class="nav-link active">
							<img src="<c:url value="/resources/icons/add.svg"/>" class="feather feather-plus-circle"/>
		    				<spring:message code="add"/>&nbsp;<spring:message code="new"/>
		    			</a>
	    			</li>
    			</ul>
 				</div>
			</div>
	</div>

	<div class="table-responsive">
		<table class="table table-striped table-hover">
			<thead class="thead-dark">
				<tr>
					<th scope="col"><spring:message code="email"/></th>
					<th scope="col"><spring:message code="last_name"/></th>
					<th scope="col"><spring:message code="first_name"/></th>
					<th scope="col"><spring:message code="last_login"/></th>
					<th scope="col">&nbsp;</th>
					<th scope="col">&nbsp;</th>
    			</tr>
  			</thead>
  			
  			<tbody>
  			
				<c:if test="${users eq null or users.isEmpty() }">
					<tr><td>
						<spring:message code="msg.users.empty.list" />
					</td></tr>
				</c:if>
				
				<c:forEach items="${users}" var="user">
					<tr>
    						<th scope="row"><a href="<c:url value="/user/${user.id}" />">${user.email}</a></th>
						<td><a href="<c:url value="/user/${user.id}" />">${user.lastName}</a></td>
						<td><a href="<c:url value="/user/${user.id}" />">${user.firstName}</a></td>
						<td><a href="<c:url value="/user/${user.id}" />">${user.lastLogin}</a></td>
						<td>
							<a class="btn btn-default" href="<c:url value="/user/edit/'${user.id}'" />" >
								<img src="<c:url value="/resources/icons/edit.svg"/>"/>
								<spring:message code="edit" />
							</a>
						</td>
						<td>
							<a class="btn btn-default" href="<c:url value="/user/delete/'${user.id}'" />" >
								<img src="<c:url value="/resources/icons/delete.svg"/>"/>
								<spring:message code="delete" />
							</a>
						</td>
					</tr>
				</c:forEach>
  			</tbody>
		</table>
	</div>
</div>	
<c:import url="../template/down.jsp" />
