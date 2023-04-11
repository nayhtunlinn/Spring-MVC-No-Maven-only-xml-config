<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="com.nay.springdemo.util.SortUtils"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href='<c:url value="/resources/css/bootstrap.min.css"/>'>
<script type="text/javascript"
	src='<c:url value="/resources/js/bootstrap.min.js"/>'></script>
<script type="text/javascript"
	src='<c:url value="/resources/js/popper.min.js"/>'></script>
<title>List Customers</title>
</head>
<body>
	<div class="container">
		<div class="bg-success">
			<h2 class=" m-2 p-4 text-white">CRM - Customer Realtionship
				Manager</h2>
		</div>
		<div>
			<button type="button" class="btn btn-outline-secondary m-3 ms-0"
				onClick="window.location.href='showFormForAdd';">Add
				Customer</button>

			<form:form action="search" method="GET" class="row g-3">
				<div class="col-auto">
					<input type="text" readonly class="form-control-plaintext"
						value="Search customer:">
				</div>
				<div class="col-auto">
					<input type="text" name="theSearchName" class="form-control mb-3" />
				</div>
				<div class="col-auto">
					<input type="submit" value="Search"
						class="btn btn-outline-secondary mb-3" />
				</div>
			</form:form>
		</div>
		<table class="table table-striped table-hover">
			<c:url var="sortLinkFirstName" value="/customer/list">
				<c:param name="sort"
					value="<%=Integer.toString(SortUtils.FIRST_NAME)%>" />
			</c:url>
			<c:url var="sortLinkLastName" value="/customer/list">
				<c:param name="sort"
					value="<%=Integer.toString(SortUtils.LAST_NAME)%>" />
			</c:url>
			<c:url var="sortLinkEmail" value="/customer/list">
					<c:param name="sort" value="<%= Integer.toString(SortUtils.EMAIL) %>" />
				</c:url>
			<thead class="table-success">
				<tr>
					<th scope="col">Id</th>
					<th scope="col"><a href="${sortLinkFirstName}">FirstName</a></th>
					<th scope="col"><a href="${sortLinkLastName}">LastName</a></th>
					<th scope="col"><a href="${sortLinkEmail}">Email</a></th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="customer" items="${list}">
					<c:url var="updateLink" value="/customer/showFormForUpdate">
						<c:param name="customerId" value="${customer.id}"></c:param>
					</c:url>
					<c:url var="deleteLink" value="/customer/deleteCustomer">
						<c:param name="customerId" value="${customer.id}"></c:param>
					</c:url>
					<tr>
						<td>${customer.id}</td>
						<td>${customer.firstName}</td>
						<td>${customer.lastName}</td>
						<td>${customer.email}</td>
						<td><a href="${updateLink}">Update</a>|<a
							href="${deleteLink}"
							onClick="if(!(confirm('Are you sure you want to delete this customer?')))return false">Delete</a></td>
						<!-- data-bs-toggle="modal" data-bs-target="#exampleModal" -->
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<form:form action="${pageContext.request.contextPath}/logout" method="POST">
		<input type="submit" value="logout" class="btn btn-outline-secondary float-end">
		</form:form>
	</div>
</body>
</html>
