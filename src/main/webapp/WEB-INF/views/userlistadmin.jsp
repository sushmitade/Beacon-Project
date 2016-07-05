<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home Page</title>
<link href="<c:url value='/static/css/bootstrap.css' />"
	rel="stylesheet"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>

<body>
	<div class="generic-container">
		<%@include file="authheader.jsp"%>
		<div class="panel panel-default">
			<div class="panel-heading">
				<span class="lead">List of Patients </span>
			</div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Patient ID</th>
						<th>SSO ID</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Password</th>
						<th>Email</th>
						<th>Address Line 1</th>
						<th>Address Line 2</th>
						<th>City</th>
						<th>State</th>
						<th>Zip Code</th>
						<th>Phone</th>
						<th>Description</th>
						<th>Actions</th>

						<sec:authorize access="hasRole('ADMIN')or hasRole('USER')">
							<th width="100"></th>
						</sec:authorize>
						<sec:authorize access="hasRole('ADMIN')">
							<th width="100"></th>
						</sec:authorize>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${users}" var="user">
						<tr>
							<td>${user.id}</td>
							<td>${user.sso_id}</td>
							<td>${user.patientFirstName}</td>
							<td>${user.patientLastName}</td>
							<td>${user.password}</td>
							<td>${user.patientEmail}</td>
							<td>${user.patientAddress1}</td>
							<td>${user.patientAddress2}</td>
							<td>${user.patientCity}</td>
							<td>${user.patientState}</td>
							<td>${user.patientZipCode}</td>
							<td>${user.patientPhone}</td>
							<td>${user.description}</td>
							<sec:authorize access="hasRole('ADMIN')">
								<td><a href="<c:url value='/edit-user-${user.sso_id}' />"
									class="btn btn-success custom-width">Edit</a></td>
							</sec:authorize>
							<sec:authorize access="hasRole('ADMIN')">
								<td><a href="<c:url value='/delete-user-${user.sso_id}' />"
									class="btn btn-danger custom-width">Delete</a></td>
							</sec:authorize>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<sec:authorize access="hasRole('ADMIN')">
			<div class="well">
				<a href="<c:url value='/newuser' />">Add New User</a>
			</div>
		</sec:authorize>
	</div>
</body>
</html>