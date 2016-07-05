<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Patient Registration Form</title>
<link href="<c:url value='/static/css/bootstrap.css' />"
	rel="stylesheet"></link>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>
<body>
	<div class="generic-container">
		<%@include file="authheader.jsp"%>

		<div class="well lead">Patient Registration Form</div>
		<form:form method="POST" modelAttribute="user" class="form-horizontal">
			<form:input type="hidden" path="id" id="id" />

			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="sso_id">SSO ID</label>
					<div class="col-md-7">
						<c:choose>
							<c:when test="${edit}">
								<form:input type="text" path="sso_id" id="sso_id"
									class="form-control input-sm" disabled="true" />
							</c:when>
							<c:otherwise>
								<form:input type="text" path="sso_id" id="sso_id"
									class="form-control input-sm" />
								<div class="has-error">
									<form:errors path="sso_id" class="help-inline" />
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>


			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="patientFirstName">First
						Name</label>
					<div class="col-md-7">
						<form:input type="text" path="patientFirstName"
							id="patientFirstName" class="form-control input-sm" />
						<div class="has-error">
							<form:errors path="patientFirstName" class="help-inline" />
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="patientLastName">Last
						Name</label>
					<div class="col-md-7">
						<form:input type="text" path="patientLastName"
							id="patientLastName" class="form-control input-sm" />
						<div class="has-error">
							<form:errors path="patientLastName" class="help-inline" />
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="password">Password</label>
					<div class="col-md-7">
						<form:input type="password" path="password" id="password"
							class="form-control input-sm" />
						<div class="has-error">
							<form:errors path="password" class="help-inline" />
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="patientEmail">Email</label>
					<div class="col-md-7">
						<form:input type="text" path="patientEmail" id="patientEmail"
							class="form-control input-sm" />
						<div class="has-error">
							<form:errors path="patientEmail" class="help-inline" />
						</div>
					</div>
				</div>
			</div>


			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="patientAddress1">Address Line 1</label>
					<div class="col-md-7">
						<form:input type="text" path="patientAddress1"
							id="patientAddress1" class="form-control input-sm" />
						<div class="has-error">
							<form:errors path="patientAddress1" class="help-inline" />
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="patientAddress2">Address Line 2 (optional)</label>
					<div class="col-md-7">
						<form:input type="text" path="patientAddress2"
							id="patientAddress2" class="form-control input-sm" />
						<div class="has-error">
							<form:errors path="patientAddress2" class="help-inline" />
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="patientCity">City</label>
					<div class="col-md-7">
						<form:input type="text" path="patientCity"
							id="patientCity" class="form-control input-sm" />
						<div class="has-error">
							<form:errors path="patientCity" class="help-inline" />
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="patientState">State</label>
					<div class="col-md-7">
						<form:input type="text" path="patientState"
							id="patientState" class="form-control input-sm" />
						<div class="has-error">
							<form:errors path="patientState" class="help-inline" />
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="patientZipCode">Zip Code</label>
					<div class="col-md-7">
						<form:input type="text" path="patientZipCode"
							id="patientZipCode" class="form-control input-sm" />
						<div class="has-error">
							<form:errors path="patientZipCode" class="help-inline" />
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="patientPhone">Phone</label>
					<div class="col-md-7">
						<form:input type="text" path="patientPhone"
							id="patientPhone" class="form-control input-sm" />
						<div class="has-error">
							<form:errors path="patientPhone" class="help-inline" />
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="description">Description of Patient History</label>
					<div class="col-md-7">
						<form:input type="text" path="description"
							id="description" class="form-control input-sm" />
						<div class="has-error">
							<form:errors path="description" class="help-inline" />
						</div>
					</div>
				</div>
			</div>


			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="userRoles">Roles</label>
					<div class="col-md-7">
						<form:select path="userRoles" items="${roles}" multiple="true"
							itemValue="id" itemLabel="role" class="form-control input-sm" />
						<div class="has-error">
							<form:errors path="userRoles" class="help-inline" />
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-actions floatRight">
					<c:choose>
						<c:when test="${edit}">
							<input type="submit" value="Update"
								class="btn btn-primary btn-sm" /> or <a
								href="<c:url value='/userlistadmin' />">Cancel</a>
						</c:when>
						<c:otherwise>
							<input type="submit" value="Register"
								class="btn btn-primary btn-sm" /> or <a
								href="<c:url value='/userlistadmin' />">Cancel</a>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>