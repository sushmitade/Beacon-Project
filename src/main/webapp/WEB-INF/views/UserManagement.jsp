<html>
<head>
<title>Project Beacon</title>
<style>
.username.ng-valid {
	background-color: lightgreen;
}

.username.ng-dirty.ng-invalid-required {
	background-color: red;
}

.username.ng-dirty.ng-invalid-minlength {
	background-color: yellow;
}

.email.ng-valid {
	background-color: lightgreen;
}

.email.ng-dirty.ng-invalid-required {
	background-color: red;
}

.email.ng-dirty.ng-invalid-email {
	background-color: yellow;
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="app.css">
</head>
<body ng-app="myApp" class="ng-cloak">
	<div class="generic-container" ng-controller="AppController as ctrl">
		<div class="panel panel-default">
			<div class="panel-heading">
				<span class="lead">Patient Registration Form </span>
			</div>
			<div class="formcontainer">
				<form ng-submit="ctrl.submit()" name="myForm"
					class="form-horizontal">
					<input type="hidden" ng-model="ctrl.user.id" />

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="patientFirstName">First
								Name</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.patientFirstName"
									id="patientFirstName"
									class="patientFirstName form-control input-sm"
									placeholder="Enter first name" required ng-minlength="3" />
								<div class="has-error" ng-show="myForm.$dirty">
									<span ng-show="myForm.patientFirstName.$error.required">This
										is a required field</span> <span
										ng-show="myForm.patientFirstName.$error.minlength">Minimum
										length required is 3</span> <span
										ng-show="myForm.patientFirstName.$invalid">This field
										is invalid </span>
								</div>
							</div>
						</div>
					</div>





					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="patientLastName">Last
								Name</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.patientLastName"
									id="patientLastName"
									class="patientLastName form-control input-sm"
									placeholder="Enter last name" required ng-minlength="1" />
								<div class="has-error" ng-show="myForm.$dirty">
									<span ng-show="myForm.patientLastName.$error.required">This
										is a required field</span> <span
										ng-show="myForm.patientLastName.$error.minlength">Minimum
										length required is 1</span> <span
										ng-show="myForm.patientLastName.$invalid">This field is
										invalid </span>
								</div>
							</div>
						</div>
					</div>





					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="sso_id">SSO_ID</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.sso_id" id="sso_id"
									class="sso_id form-control input-sm"
									placeholder="Enter username" required ng-minlength="4" />
								<div class="has-error" ng-show="myForm.$dirty">
									<span ng-show="myForm.sso_id.$error.required">This is a
										required field</span> <span ng-show="myForm.sso_id.$error.minlength">Minimum
										length required is 4</span> <span ng-show="myForm.sso_id.$invalid">This
										field is invalid </span>
								</div>
							</div>
						</div>
					</div>




					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="password">Password</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.password" id="password"
									class="password form-control input-sm"
									placeholder="Enter password" required ng-minlength="3" />
								<div class="has-error" ng-show="myForm.$dirty">
									<span ng-show="myForm.password.$error.required">This is
										a required field</span> <span
										ng-show="myForm.password.$error.minlength">Minimum
										length required is 3</span> <span ng-show="myForm.password.$invalid">This
										field is invalid </span>
								</div>
							</div>
						</div>
					</div>


					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="patientEmail">Email</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.patientEmail"
									id="patientEmail" class="patientEmail form-control input-sm"
									placeholder="Enter email" required ng-minlength="3" />
								<div class="has-error" ng-show="myForm.$dirty">
									<span ng-show="myForm.patientEmail.$error.required">This
										is a required field</span> <span
										ng-show="myForm.patientEmail.$error.minlength">Minimum
										length required is 3</span> <span
										ng-show="myForm.patientEmail.$invalid">This field is
										invalid </span>
								</div>
							</div>
						</div>
					</div>



					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="patientAddress1">Address
								Line 1</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.patientAddress1"
									id="patientAddress1"
									class="patientAddress1 form-control input-sm"
									placeholder="Enter address line 1" required ng-minlength="3" />
								<div class="has-error" ng-show="myForm.$dirty">
									<span ng-show="myForm.patientAddress1.$error.required">This
										is a required field</span> <span
										ng-show="myForm.patientAddress1.$error.minlength">Minimum
										length required is 3</span> <span
										ng-show="myForm.patientAddress1.$invalid">This field is
										invalid </span>
								</div>
							</div>
						</div>
					</div>




					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="patientAddress2">Address
								Line 2 (optional)</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.user.patientAddress2"
									id="patientAddress1" class="form-control input-sm"
									placeholder="Enter address line 2" />
							</div>
						</div>
					</div>
			</div>




			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-2 control-lable" for="patientCity">City</label>
					<div class="col-md-7">
						<input type="text" ng-model="ctrl.user.patientCity"
							id="patientCity" class="patientCity form-control input-sm"
							placeholder="Enter city" required ng-minlength="3" />
						<div class="has-error" ng-show="myForm.$dirty">
							<span ng-show="myForm.patientCity.$error.required">This is
								a required field</span> <span
								ng-show="myForm.patientCity.$error.minlength">Minimum
								length required is 3</span> <span ng-show="myForm.patientCity.$invalid">This
								field is invalid </span>
						</div>
					</div>
				</div>
			</div>




			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-2 control-lable" for="patientState">State</label>
					<div class="col-md-7">
						<input type="text" ng-model="ctrl.user.patientState"
							id="patientState" class="patientState form-control input-sm"
							placeholder="Enter state" required ng-minlength="3" />
						<div class="has-error" ng-show="myForm.$dirty">
							<span ng-show="myForm.patientState.$error.required">This
								is a required field</span> <span
								ng-show="myForm.patientState.$error.minlength">Minimum
								length required is 3</span> <span
								ng-show="myForm.patientState.$invalid">This field is
								invalid </span>
						</div>
					</div>
				</div>
			</div>



			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-2 control-lable" for="patientZipCode">Zip
						Code</label>
					<div class="col-md-7">
						<input type="text" ng-model="ctrl.user.patientZipCode"
							id="patientZipCode" class="patientZipCode form-control input-sm"
							placeholder="Enter zip code" required ng-minlength="5" />
						<div class="has-error" ng-show="myForm.$dirty">
							<span ng-show="myForm.patientZipCode.$error.required">This
								is a required field</span> <span
								ng-show="myForm.patientZipCode.$error.minlength">Minimum
								length required is 5</span> <span
								ng-show="myForm.patientZipCode.$invalid">This field is
								invalid </span>
						</div>
					</div>
				</div>
			</div>


			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-2 control-lable" for="patientPhone">Phone</label>
					<div class="col-md-7">
						<input type="text" ng-model="ctrl.user.patientPhone"
							id="patientPhone" class="patientPhone form-control input-sm"
							placeholder="Enter phone number" required ng-minlength="10" />
						<div class="has-error" ng-show="myForm.$dirty">
							<span ng-show="myForm.patientPhone.$error.required">This
								is a required field</span> <span
								ng-show="myForm.patientPhone.$error.minlength">Minimum
								length required is 10</span> <span
								ng-show="myForm.patientPhone.$invalid">This field is
								invalid </span>
						</div>
					</div>
				</div>
			</div>



			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-2 control-lable" for="description">Patient
						History</label>
					<div class="col-md-7">
						<input type="text" ng-model="ctrl.user.description"
							id="description" class="description form-control input-sm"
							placeholder="Enter description" required ng-minlength="5" />
						<div class="has-error" ng-show="myForm.$dirty">
							<span ng-show="myForm.description.$error.required">This is
								a required field</span> <span
								ng-show="myForm.description.$error.minlength">Minimum
								length required is 5</span> <span ng-show="myForm.description.$invalid">This
								field is invalid </span>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-actions floatRight">
					<input type="submit" value="{{!ctrl.user.id ? 'Add' : 'Update'}}"
						class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
					<button type="button" ng-click="ctrl.reset()"
						class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset
						Form</button>
				</div>
			</div>
			</form>
		</div>
	</div>
	<div class="panel panel-default">
		<!-- Default panel contents -->
		<div class="panel-heading">
			<span class="lead">List of Users </span>
		</div>
		<div class="tablecontainer">
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
						<th>Description</th>s
						<th width="100"></th>
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="u in ctrl.users">
						<td><span ng-bind="u.id"></span></td>
						<td><span ng-bind="u.sso_id"></span></td>
						<td><span ng-bind="u.patientFirstName"></span></td>
						<td><span ng-bind="u.patientLastName"></span></td>
						<td><span ng-bind="u.password"></span></td>
						<td><span ng-bind="u.patientEmail"></span></td>
						<td><span ng-bind="u.patientAddress1"></span></td>
						<td><span ng-bind="u.patientAddress2"></span></td>
						<td><span ng-bind="u.patientCity"></span></td>
						<td><span ng-bind="u.patientState"></span></td>
						<td><span ng-bind="u.patientZipCode"></span></td>
						<td><span ng-bind="u.patientPhone"></span></td>
						<td><span ng-bind="u.description"></span></td>s
						<td>
							<button type="button" ng-click="ctrl.edit(u.id)"
								class="btn btn-success custom-width">Edit</button>
							<button type="button" ng-click="ctrl.remove(u.id)"
								class="btn btn-danger custom-width">Remove</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js">
		
	</script>
	<script src="app.js"></script>
	<script src="user_service.js"></script>
	<script src="app_controller.js"></script>
</body>
</html>