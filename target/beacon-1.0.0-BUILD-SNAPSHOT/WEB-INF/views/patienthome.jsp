<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Patient Home Page</title>
</head>
<body>
	<div align="right">
		<h4>
			<a href="logout2">Sign Out</a>
		</h4>
		<div align="center">
			<h1>Welcome to your home page</h1>
			<h2>Here you can update your address, email and/or telephone
				number</h2>

			<table border="1">
				<th>Patient ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
				<th>Address Line 1</th>
				<th>Address Line 2</th>
				<th>City</th>
				<th>State</th>
				<th>Zip Code</th>
				<th>Phone</th>
				<th>Description</th>
				<th>Actions</th>

				<c:forEach var="user" items="${userList}" varStatus="status">
					<tr>
						<td>${user.id}</td>
						<td>${user.patientFirstName}</td>
						<td>${user.patientLastName}</td>
						<td>${user.patientEmail}</td>
						<td>${user.patientAddress1}</td>
						<td>${user.patientAddress2}</td>
						<td>${user.patientCity}</td>
						<td>${user.patientState}</td>
						<td>${user.patientZipCode}</td>
						<td>${user.patientPhone}</td>
						<td>${user.description}</td>
						<td><a href="editpatient?id=${user.id}">Edit</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
</body>
</html>