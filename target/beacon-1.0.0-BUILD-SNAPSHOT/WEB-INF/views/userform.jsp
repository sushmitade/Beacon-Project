<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New or Edit Patient</title>
</head>
<body>
	<div align="center">
		<h1>New/Edit Patient</h1>
		<table>
			<form:form action="save1" method="post" modelAttribute="user">
				<form:hidden path="id" />
				<tr>
					<td>Patient First Name:</td>
					<td><form:input path="patientFirstName" /></td>
				</tr>
				<tr>
					<td>Patient Last Name:</td>
					<td><form:input path="patientLastName" /></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><form:input path="patientEmail" /></td>
				</tr>
				<tr>
					<td>Address Line 1:</td>
					<td><form:input path="patientAddress1" /></td>
				</tr>
				<tr>
					<td>Address Line 2:</td>
					<td><form:input path="patientAddress2" /></td>
				</tr>
				<tr>
					<td>City:</td>
					<td><form:input path="patientCity" /></td>
				</tr>
				<tr>
					<td>State:</td>
					<td><form:input path="patientState" /></td>
				</tr>
				<tr>
					<td>Zip Code:</td>
					<td><form:input path="patientZipCode" /></td>
				</tr>
				<tr>
					<td>Phone:</td>
					<td><form:input path="patientPhone" /></td>
				</tr>
				<tr>
					<td>Description:</td>
					<td><form:input path="description" /></td>
				</tr>
				<tr>
					<td colspan="3" align="center"><input type="submit"
						value="Save"></td>
				</tr>
			</form:form>
		</table>
	</div>
</body>
</html>