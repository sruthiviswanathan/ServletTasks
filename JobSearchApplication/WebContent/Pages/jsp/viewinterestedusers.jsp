<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.zilker.onlinejobsearch.config.Config"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>INTERESTED USERS</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="${Config.BASE_PATH}Pages/css/viewinterested.css">
  <link rel="stylesheet" href="${Config.BASE_PATH}Pages/css/navbar.css">
</head>
<body>

    <div class="container">
       <div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<a href="${Config.BASE_PATH}PostJobServlet">POST JOB</a>
			  <a href="${Config.BASE_PATH}ViewAppliedUsersServlet">VIEW INTERESTED USERS</a> 
			  <a href="${Config.BASE_PATH}ViewPublishedJobsServlet">VIEW PUBLISHED JOBS</a>
		</div>
		<div class="navbar">
			<ul>
				<button onmouseover="openNav()" class="hambug">
					<i class="fa fa-bars" aria-hidden="true"></i>
				</button>
				<li>JOB HUNT</li>
				<a href="#">
					<li style="float: right"><i class="fa fa-user-circle"
						aria-hidden="true"></i>LOGOUT</li>
				</a>


			</ul>
		</div>
		<div class="tit">
			<h3>YOUR NEXT HIRE IS HERE!!!</h3>
		</div>
<table class="customers">
  				<tr>
    				<th>USERNAME</th>
    				<th>EMAIL</th>
    				<th>JOB DESIGNATION</th>
  			    </tr>
					 <c:forEach var="user" items="${appliedUsers}">
						<tr>
							<td>	<c:out value="${user.getUserName()}" /> </td>
							<td>	<c:out value="${user.getEmail()}" /> </td>  
							<td>	<c:out value="${user.getJobRole()}" /> </td> 
						</tr>	
					</c:forEach>
</table>
</div>
</body>
<script src="${Config.BASE_PATH}Pages/js/styles.js"></script>
</html>
    