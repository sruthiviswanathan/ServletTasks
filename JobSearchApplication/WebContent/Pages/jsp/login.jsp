<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<jsp:include page="/RegisterServlet"/>  
<%@ page import="com.zilker.onlinejobsearch.config.Config"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="${Config.BASE_PATH}Pages/css/login.css">
<link rel="stylesheet" href="${Config.BASE_PATH}Pages/css/navbar.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>LOGIN/SIGNUP</title>
</head>

<body onload="viewlogin()">

	<div class="container">
 		
		<div class="navbar">
			<ul>
				
				<li style="float: left"><i class="fa fa-search" aria-hidden="true"></i></li>
				
				<li style="float: left">JOB HUNT</li>
			</ul>
		</div> 

	<div class="formcontainer">

		<div id="myDIV" class="nav" class="row col-25">
			<button class="btn active" type="submit" onclick="viewlogin()">LOGIN</button><button class="btn" type="submit" onclick="viewsignup()">SIGNUP</button>
		</div>
		<div class="forms">
			<form action="${Config.BASE_PATH}LoginServlet"id="login" name="login" onsubmit="return loginForm()"	method="post">
				<div class="login">
					<label for="email" class="row col-25"><b>EMAIL*</b></label> <input
						 class="row col-75" type="email"
						placeholder="Your Email ID.." name="email"> 
						 <span class="error"><p id="log_em_error"></p></span> 
						<label for="psw" class="row col-25"><b>PASSWORD*</b></label> <input
						 class="row col-75" type="password"
						placeholder="Enter Password" name="psw"> 
						 <span class="error"><p id="log_psw_error"></p></span> 
						<label class="col-25"><input type="checkbox" checked="checked"
						name="remember"> Remember me</label>
				</div>
				<div class="nav">
					<button type="submit">LOGIN</button>
					<button type="reset"  class="cancelbtn">CANCEL</button>
				</div>
			</form>
		<div id="hideonlogin">
			<form action="${Config.BASE_PATH}RegisterServlet" id="signup" name="signup" onsubmit="return registerForm()"
				method="post">
				<div class="signup">

					<div id="defaultfields">
						<label for="uname" class="row col-25"><b>USERNAME*</b></label>
						 <input	type="text" class="row col-75" name="userName" 
							placeholder="Your name.."> 
							 <span class="error"><p id="reg_name_error"></p></span> 
							<label for="email"
							class="row col-25"><b>EMAIL*</b></label> <input type="email"
							class="row col-75" name="email"
							placeholder="Your email id..">
							 <span class="error"><p id="reg_email_error"></p></span> 
							 <label for="psw"
							class="row col-25"><b>PASSWORD*</b></label> <input
							class="row col-75" type="password" placeholder="Enter Password"
							name="psw"> 
							 <span class="error"><p id="reg_psw_error"></p></span> 
							<label for="cpsw" class="row col-25"><b>RETYPE
								PASSWORD*</b></label> <input class="row col-75" type="password"
							placeholder="Reenter Password" name="cpsw">
							 <span class="error"><p id="reg_cpsw_error"></p></span> 
						<div class="nav">
							<div id="admin">
								<button type="button" onclick="viewadminfields()">REGISTER
									AS ADMIN OF A COMPANY?</button>
							</div>
						</div>
						<label for="cname" class="row col-25"><b>COMPANY NAME*</b></label>
						<input type="text" class="row col-75" name="companyName" placeholder="Company name..">
							 <span class="error"><p id="reg_comp_error"></p></span> 
						<label for="designation" class="row col-25"><b>DESIGNATION*</b></label>
						<input type="text" class="row col-75" name="designation" placeholder="Your designation..">
							 <span class="error"><p id="reg_des_error"></p></span> 
						<label for="skills" class="row col-25"><b>ADD SKILLS
								TO YOUR PROFILE</b></label>

						<div class="checkbox col-25">
							
							<c:forEach var="tech" items="${technologies}">
							<input type="checkbox" name="tech" value="${tech.getTechnologyId()}"><c:out
											value="${tech.getTechnology()}" />
							</c:forEach>
							
						</div>
						<div class="nav">
							<button type="submit">REGISTER</button>
							<button type="reset"  class="cancelbtn">CANCEL</button>
						</div>
					</div>
				</div>
			</form>
		<%-- 	${Config.BASE_PATH}RegisterAdminServlet --%>
			<div id="adminoptional">
				<form action="${Config.BASE_PATH}RegisterAdminServlet"  name="admin" id="signupadmin" onsubmit="return validateForm()" method="post">
					<!--  <div class="signup">
                    <form name="admin" action="login.html" id="signupadmin"  onsubmit="return validateForm()" method="post"> -->
					<div class="signupadmin">
						<label for="uname" class="row col-25"><b>USERNAME*</b></label> 
						<input type="text" class="row col-75" name="userName"placeholder="Your name.."> 
						 <span class="error"><p id="name_error"></p></span> 
							<label for="email"class="row col-25"><b>EMAIL*</b></label> 
							<input type="email"class="row col-75" name="email" placeholder="Your email id..">
						 	 <span class="error"><p id="email_error"></p></span> 
							<label for="psw" class="row col-25"><b>PASSWORD*</b></label> 
							<input class="row col-75" type="password" placeholder="Enter Password" name="psw">
							  <span class="error"><p id="psw_error"></p></span>
							 <label for="psw" class="row col-25"><b>RETYPE PASSWORD*</b></label>
							  <input class="row col-75" type="password" placeholder="Reenter Password" name="cpsw">
 								<span class="error"><p id="cpsw_error"></p></span>
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
								 <option value=" ">Select a Company Name</option>
								<c:forEach var="comp" items="${companies}">
									<option value="${comp.getCompanyId()}"><c:out
											value="${comp.getCompanyName()}" /></option>
								</c:forEach>
								
							</select>
							<span class="error"><p id="select_error"></p></span>
						</div>
						<div class="nav">
							<button type="button" id="add" onclick="openForm()">NEW</button>
						</div>
						<div class="nav">
							
							<input type="submit" value="REGISTER" name="Submit">
							<button type="reset"  class="cancelbtn">CANCEL</button>
						</div>
					</div>
				</form>
			</div>
			<br>

</div>
		</div>
	</div>
</div>
	<div class="form-popup" id="myForm">
		<form action="${Config.BASE_PATH}AddNewCompany" class="form-container" method="post">
			<h3>ADD NEW COMPANY</h3>
			<input type="text" placeholder="Enter new Company" name="companyName"
				required>
				<input type="text" placeholder="Enter Company Website URL" name="websiteUrl"
				required>
			<button type="submit" id="addcomp" class="btn">ADD COMPANY</button>
			<button type="button" class="cancel btn" onclick="closeForm()">CLOSE</button>
		</form>
	</div>
</body>
<script src="${Config.BASE_PATH}Pages/js/form.js"></script>
<script src="${Config.BASE_PATH}Pages/js/styles.js"></script>
<script src="${Config.BASE_PATH}Pages/js/validate.js"></script>

</html>