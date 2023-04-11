<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css"/>'>
<title>Add Customer</title>
</head>
<body>
<div class="container">
<div class="bg-success">
<h2 class=" m-2 p-4 text-white">CRM - Customer Realtionship Manager</h2>
</div>
<h3>Save Customer</h3>
<div class="row">
<div class="col-4">
<form:form method="POST" modelAttribute="customer" action="saveCustomer">
<form:hidden path="id"/>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">First Name</label>
    <!-- <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"> -->
    <form:input path="firstName" class="form-control" id="exampleInputEmail1"/>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Last Name</label>
    <!-- <input type="password" class="form-control" id="exampleInputPassword1"> -->
    <form:input path="lastName" class="form-control" id="exampleInputPassword1"/>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword2" class="form-label">Email</label>
    <!-- <input type="password" class="form-control" id="exampleInputPassword1"> -->
    <form:input path="email" class="form-control" id="exampleInputPassword2"/>
  </div>
  <button type="submit" class="btn btn-primary">Save</button>
</form:form>
</div>
</div>
<br>
<a href="<c:url value='/customer/list'/>">Back To List</a>
</div>
</body>
</html>