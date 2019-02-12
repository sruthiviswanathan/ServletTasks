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
<link rel="stylesheet" href="${Config.BASE_PATH}Pages/css/forms.css">
<link rel="stylesheet" href="${Config.BASE_PATH}Pages/css/navbar.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>LOGIN/SIGNUP</title>
</head>

<body onload="viewsignup()">

	<div class="container">
		 <div id="mySidenav" class="sidenav">
                        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                        <a href="${Config.BASE_PATH}index.jsp">FIND JOB</a>
                        <a href="${Config.BASE_PATH}Pages/jsp/findcompany.jsp">FIND COMPANY</a>
                         <a href="searchbylocation.html">SEARCH BY LOCATION</a>
                        <a href="${Config.BASE_PATH}PostJobServlet">POST JOB</a>
                        <a href="viewprofile.html">YOUR PROFILE</a>
                        <a href="requestvacancy.html">REQUEST A VACANCY</a>
                        <a href="viewpublishedjobs.html">VIEW PUBLISHED JOBS</a>
                </div>
		<div class="navbar">
			<ul>
				<button onmouseover="openNav()" class="hambug">
					<i class="fa fa-bars" aria-hidden="true"></i>
				</button>
				<li style="float: left">JOB HUNT</li>
			</ul>
		</div>



		<div id="myDIV" class="nav" class="row col-25">
			<button class="btn" type="submit" onclick="viewlogin()">LOGIN</button>
			<button class="btn active" type="submit" onclick="viewsignup()">SIGNUP</button>
		</div>
		<div class="forms">
			<form action="${Config.BASE_PATH}LoginServlet" id="login"
				method="post">
				<div class="login">
					<label for="email" class="row col-25"><b>EMAIL*</b></label> <input
						id="email" class="row col-75" type="email"
						placeholder="Your Email ID.." name="email" required> <label
						for="psw" class="row col-25"><b>PASSWORD*</b></label> <input
						id="pwd" class="row col-75" type="password"
						placeholder="Enter Password" name="psw" required> <label
						class="col-25"><input type="checkbox" checked="checked"
						name="remember"> Remember me</label>
				</div>
				<div class="nav">
					<button type="submit" id="login">LOGIN</button>
					<button type="reset" id="cancel" class="cancelbtn">CANCEL</button>
				</div>
			</form>

			<!--<form action="login.html" id="signup"> -->

			<form action="${Config.BASE_PATH}RegisterServlet" id="signup"
				method="post">
				<div class="signup">

					<div id="defaultfields">
						<label for="uname" class="row col-25"><b>USERNAME*</b></label> <input
							type="text" class="row col-75" id="uname" name="userName"
							placeholder="Your name.." required> <label for="email"
							class="row col-25"><b>EMAIL*</b></label> <input type="email"
							class="row col-75" id="email" name="email"
							placeholder="Your email id.." required> <label for="psw"
							class="row col-25"><b>PASSWORD*</b></label> <input id="pwd"
							class="row col-75" type="password" placeholder="Enter Password"
							name="psw" required> <label for="psw" class="row col-25"><b>RETYPE
								PASSWORD*</b></label> <input id="pwd" class="row col-75" type="password"
							placeholder="Reenter Password" name="cpsw" required>
						<div class="nav">
							<div id="admin">
								<button type="button" onclick="viewadminfields()">REGISTER
									AS ADMIN OF A COMPANY?</button>
							</div>
						</div>
						<label for="cname" class="row col-25"><b>COMPANY NAME*</b></label>
						<input type="text" class="row col-75" id="cname"
							name="companyName" placeholder="Company name.." required>
						<label for="designation" class="row col-25"><b>DESIGNATION*</b></label>
						<input type="text" class="row col-75" id="cname"
							name="designation" placeholder="Your designation.." required>
						<label for="skills" class="row col-25"><b>ADD SKILLS
								TO YOUR PROFILE</b></label>

						<div class="checkbox col-25">
							<span> <input type="checkbox" name="tech" value="1">
								C <input type="checkbox" name="tech" value="2"> C++ <input
								type="checkbox" name="tech" value="3"> Java
							</span>
						</div>
						<div class="nav">
							<button type="submit" id="register">REGISTER</button>
							<button type="reset" id="cancel" class="cancelbtn">CANCEL</button>
						</div>
					</div>
				</div>
			</form>
			<div id="adminoptional">
				<form action="${Config.BASE_PATH}RegisterAdminServlet" name="admin"
					id="signupadmin" onsubmit="return validateForm()" method="post">
					<!--  <div class="signup">
                    <form name="admin" action="login.html" id="signupadmin"  onsubmit="return validateForm()" method="post"> -->
					<div class="signupadmin">
						<label for="uname" class="row col-25"><b>USERNAME*</b></label> <input
							type="text" class="row col-75" id="uname" name="userName"
							placeholder="Your name.."> <label for="email"
							class="row col-25"><b>EMAIL*</b></label> <input type="email"
							class="row col-75" id="email" name="email"
							placeholder="Your email id.."> <label for="psw"
							class="row col-25"><b>PASSWORD*</b></label> <input id="pwd"
							class="row col-75" type="password" placeholder="Enter Password"
							name="psw"> <label for="psw" class="row col-25"><b>RETYPE
								PASSWORD*</b></label> <input id="pwd" class="row col-75" type="password"
							placeholder="Reenter Password" name="cpsw">

						<div class="nav">
							<div id="user">
								<button type="button" onclick="viewuserfields()">REGISTER
									AS USER?</button>
							</div>
						</div>
						<label for="select-company" class="row col-25"><b>COMPANY
								NAME*</b></label>
						<div class="tab" style="width: 75%;">
							<select id="select" name="companyName"
								oninput="this.className = ''">
								<c:forEach var="comp" items="${companies}">
									<option value="${comp.getCompanyName()}"><c:out
											value="${comp.getCompanyName()}" /></option>
								</c:forEach>
							</select>
						</div>
						<div class="nav">
							<button type="button" id="add" onclick="openForm()">NEW</button>
						</div>
						<div class="nav">
							<input type="submit" value="REGISTER" name="Submit">
							<button type="reset" id="cancel" class="cancelbtn">CANCEL</button>
						</div>
					</div>
				</form>
			</div>
			<br>


		</div>
	</div>
	<div class="form-popup" id="myForm">
		<form action="${Config.BASE_PATH}AddNewCompany" class="form-container"
			method="post">
			<h3>ADD NEW COMPANY</h3>
			<input type="text" placeholder="Enter new Company" name="companyName"
				required> <input type="text"
				placeholder="Enter Company Website URL" name="websiteUrl" required>
			<button type="submit" id="addcomp" class="btn">ADD COMPANY</button>
			<button type="button" class="cancel btn" onclick="closeForm()">CLOSE</button>
		</form>
	</div>
</body>
<script src="${Config.BASE_PATH}Pages/js/form.js"></script>
<script src="${Config.BASE_PATH}Pages/js/styles.js"></script>
<script src="${Config.BASE_PATH}Pages/js/validate.js"></script>

</html>