<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 	
	<%@ page import="com.zilker.onlinejobsearch.config.Config"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${Config.BASE_PATH}Pages/css/forms.css">
<link rel="stylesheet" href="${Config.BASE_PATH}Pages/css/navbar.css">
<title>POST JOB</title>
</head>

<body>
	<div class="container">
	
		 <div id="mySidenav" class="container__sidenav">
                        <div class="sidenav__items">
                        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                        <a href="${Config.BASE_PATH}PostJobServlet">POST JOB</a>
                        <a href="${Config.BASE_PATH}ViewPublishedJobsServlet">VIEW PUBLISHED JOBS</a>
                        <a href="${Config.BASE_PATH}ViewAppliedUsersServlet">VIEW INTERESTED PEOPLE</a>
                </div>
		</div>
	
		<div class="container__navbar">
			<ul class="navbar__list">
				<li><button onmouseover="openNav()" class="hambug"><i class="fa fa-bars" aria-hidden="true"></i></button></li>			
				<li>JOB HUNT</li>
				<li style="float: right"><a href="${Config.BASE_PATH}LogoutServlet"><i class="fa fa-user-circle" aria-hidden="true"></i>LOGOUT</a></li>
			</ul>
		</div>

		<div class="container__title">
			<h3>YOUR NEXT HIRE IS HERE!!!</h3>
		</div>
		
		<div class="container__postjob">
		<form action="${Config.BASE_PATH}PostJobServlet" id="postjob"
			name="postjob" onsubmit="return validatePostJob()" method="post">
		
		
				
				<div class="postjob__field col-xs-12 col-md-12">
				<label for="select-job" class="field__entry row col-75"><b>JOB DESIGNATION*</b></label>
			
					 <select id="job" class="field__entry row col-75" name="job" oninput="this.className = ''">
					 <option value="">Select a Job Designation</option>
						<c:forEach var="job" items="${jobs}">
							<option value="${job.getJobId()}"><c:out
									value="${job.getJobRole()}" /></option>
						</c:forEach>
					</select>
					 <span class="error"><p id="job_error"></p></span>
				
				</div>
				<div class="postjob__nav">
					<button type="button" class="button" id="add" onclick="openForm()">NEW</button>
				</div>
				
				<div class="postjob__field col-xs-12 col-md-12">
				<label for="location" class="field__entry row col-25"><b>LOCATION</b></label>
				<input type="text" class="field__entry row col-75" id="location" name="location" placeholder="Enter Job Location.."> 
				<span class="error"><p id="location_error"></p></span>
				</div>
				
				<div class="postjob__field col-xs-12 col-md-12">
				<label for="salary" class="field__entry row col-25"><b>SALARY*</b></label> 
				<input type="number" class="field__entry row col-75" id="salary" name="salary" placeholder="Enter Salary.." step=".01"> 
				<span class="error"><p id="salary_error"></p></span>
				</div>
				
				<div class="postjob__field col-xs-12 col-md-12">
				<label for="count" class="field__entry row col-25"><b>COUNT*</b></label>
				<input type="number" class="field__entry row col-75" id="count" name="count" placeholder="Enter Vacancy Count..">
				<span class="error"><p id="count_error"></p></span>
				</div>
					
				<div class="postjob__field col-xs-12 col-md-12">	
				<label for="description" class="field__entry row col-75"><b>JOB DESCRIPTION*</b></label>
				<textarea rows="4" cols="50" name="description" class="field__entry row col-75" placeholder="Enter Job Description"></textarea>
				<span class="error"><p id="desc_error"></p></span>
				</div>
			
			<br>
			
			<div class="postjob__nav">
				<input type="submit" class="button col-xs-12 col-md-12" value="PUBLISH" name="Submit">
				<button type="reset" id="cancel" class="button cancelbtn col-xs-12 col-md-12">CANCEL</button>
			</div>
		
		</form>
	</div>
	
	<div class="container__form-popup" id="myForm">
	<form action="${Config.BASE_PATH}AddNewJobDesignationServlet" class="form-container" method="post">
		<!-- <form action="login.html" class="form-container"> -->
			<h3>ADD NEW JOB DESIGNATION</h3>
			<input type="text" placeholder="Enter new Job designation"
				name="newjob" required>
			<button type="submit" id="addjob" class="btn">ADD
				DESIGNATION</button>
			<button type="button" class="cancel btn" onclick="closeForm()">CLOSE</button>
		</form>
	</div>
</div>
</body>
<script src="${Config.BASE_PATH}Pages/js/styles.js"></script>
<script src="${Config.BASE_PATH}Pages/js/validate.js"></script>
</html>