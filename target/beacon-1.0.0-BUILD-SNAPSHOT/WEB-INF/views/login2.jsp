<%-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<head>
<title>Patient Login Page</title>
</head>
<body onload='document.loginForm.username.focus();'>

	<div align="center">
		<h1>Welcome to the patient login page!</h1>
	<h2>Please log in with your credentials below:</h2>

		
		<div id="login-box">

			<h3>Login with Patient ID and Password</h3>

			<c:if test="${not empty error}">
				<div class="error">${error}</div>
			</c:if>

			<form name='loginForm'
				action="<c:url value='/j_spring_security_check'/>" method='POST'>
				<table>
					<tr>
						<td>Patient ID:</td>
						<td><input type='text' name='patientId'></td>
					</tr>
					<tr>
						<td>Password:</td>
						<td><input type='password' name='password' /></td>
					</tr>
					<tr>
						<td colspan='2'><input name="submit" type="submit"
							value="submit" /></td>
					</tr>
				</table>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />

			</form>
		</div>
</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Patient Login page</title>
</head>

<body>
	<div align="right">
		<h4>
			<a href="home">Home</a>
		</h4>
		<div align="center">
			<h1>Welcome to the Patient login page!</h1>
			<h2>Please log in with your credentials below</h2>
			<h3>Login with Patient ID and Password</h3>
			<div id="mainWrapper">
				<div class="login-container">
					<div class="login-card">
						<div class="login-form">
							<c:url var="loginUrl" value="/login" />
							<form action="${loginUrl}" method="post" class="form-horizontal">
								<c:if test="${param.error != null}">
									<div class="alert alert-danger">
										<p>Invalid login ID and password.</p>
									</div>
								</c:if>
								<c:if test="${param.logout != null}">
									<div class="alert alert-success">
										<p>You have been logged out successfully.</p>
									</div>
								</c:if>


								<div class="input-group input-sm">
									<label class="input-group-addon" for="id"><i
										class="fa fa-user"></i></label> <input type="text"
										class="form-control" id="id" name="ssoId"
										placeholder="Enter Login ID" required>
								</div>
								<div class="input-group input-sm">
									<label class="input-group-addon" for="password"><i
										class="fa fa-lock"></i></label> <input type="password"
										class="form-control" id="password" name="password"
										placeholder="Enter Password" required>
								</div>
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />

								<div class="form-actions">
									<input type="submit"
										class="btn btn-block btn-primary btn-default" value="Log in">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
</body>
</html>