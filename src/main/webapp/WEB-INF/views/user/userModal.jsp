<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
			<div class="modal fade" id="userModal">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
				      
				        <!-- Modal Header -->
				        <div class="modal-header">
							<h1 class="h2"><spring:message code="new" />&nbsp;<spring:message code="user" /></h1>
						</div>
					
						<div class="modal-body">
							<form action="${spring:mvcUrl('addUser').build()}" method="post">
								<div class="form-group row">
									<label for="email" class="col-sm-3 col-form-label"><spring:message code="email" />: </label>
									<div class="col-sm-9">
									    <input type="email" class="form-control" name="email" value="${user.email}" ${otherfields_readonly}>
										<form:errors path="user.email" />
									</div>
								</div>
								<div class="form-group row">
									<label for="password" class="col-sm-3 col-form-label"><spring:message code="password" />: </label>
								    <div class="col-sm-9">
									    <input type="password" class="form-control" name="password" value="${user.password}" ${otherfields_readonly}>
										<form:errors path="user.password" />
									</div>
								</div>
								<div class="form-group row">
									<label for="firstName" class="col-sm-3 col-form-label"> <spring:message code="first_name" />: </label>
								    <div class="col-sm-9">
									    <input type="text" class="form-control" name="firstName" value="${user.firstName}" ${otherfields_readonly}>
										<form:errors path="user.firstName" />
									</div>
								</div>
								<div class="form-group row">
									<label for="lastName" class="col-sm-3 col-form-label"> <spring:message code="last_name" />: </label>
								    <div class="col-sm-9">
									    <input type="text" class="form-control" name="lastName" value="${user.lastName}" ${otherfields_readonly}>
										<form:errors path="user.lastName" />
									</div>
								</div>
								<div class="form-group row">
									<label for="phoneNumber" class="col-sm-3 col-form-label"> <spring:message code="phone_number" />: </label>
								    <div class="col-sm-9">
									    <input type="tel" class="form-control" name="phoneNumber" value="${user.phoneNumber}" ${otherfields_readonly}>
										<form:errors path="user.phoneNumber" />
									</div>
								</div>
								<div class="form-group row">
									<label for="address" class="col-sm-3 col-form-label"> <spring:message code="address" />: </label>
								    <div class="col-sm-9">
									    <input type="text" class="form-control" name="address" value="${user.address}" ${otherfields_readonly}>
										<form:errors path="user.address" />
									</div>
								</div>
								<div class="form-group row">
									<label for="city" class="col-sm-3 col-form-label"> <spring:message code="city" />: </label>
								    <div class="col-sm-9">
									    <input type="text" class="form-control" name="city" value="${user.city}" ${otherfields_readonly}>
										<form:errors path="user.city" />
									</div>
								</div>
								<div class="form-group row">
									<label for="country" class="col-sm-3 col-form-label"> <spring:message code="country" />: </label>
								    <div class="col-sm-9">
									    <input type="text" class="form-control" name="country" value="${user.country}" ${otherfields_readonly}>
										<form:errors path="user.country" />
									</div>
								</div>
								<div class="form-group row">
									<label for="postalCode" class="col-sm-3 col-form-label"> <spring:message code="postal_code" />: </label>
								    <div class="col-sm-9">
									    <input type="text" class="form-control" name="postalCode" value="${user.postalCode}" ${otherfields_readonly}>
										<form:errors path="user.postalCode" />
									</div>
								</div>
								<div class="form-group row">
									<label for="birthday" class="col-sm-3 col-form-label"> <spring:message code="birthday" />: </label>
								    <div class="col-sm-9">
									    <input type="text" class="form-control" name="birthday" value="${user.birthday}" ${otherfields_readonly}>
										<form:errors path="user.birthday" />
									</div>
								</div>
								
								<div class="modal-footer">
							        <button type="button" class="btn btn-danger" data-dismiss="modal"><spring:message code="cancel"/></button>
									<input type="submit" class="btn btn-success" value="<spring:message code="save"/>">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>