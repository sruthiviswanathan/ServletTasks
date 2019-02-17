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
<title>Find Jobs</title>
<link rel="stylesheet" href="${Config.BASE_PATH}Pages/css/mainpage.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
	<div class="maincontainer">
		
		<div id="mySidenav" class="container__sidenav">
			<div class="sidenav__items">
			  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			  <a href="${Config.BASE_PATH}PostJobServlet">POST JOB</a>
			  <a href="${Config.BASE_PATH}ViewAppliedUsersServlet">VIEW INTERESTED USERS</a> 
			  <a href="${Config.BASE_PATH}ViewPublishedJobsServlet">VIEW PUBLISHED JOBS</a>
			  </div>
		</div>
		<div class="container__navbar">
			<ul class="navbar__list">
				<li><button onmouseover="openNav()" class="hambug"><i class="fa fa-bars" aria-hidden="true"></i></button></li>			
				<li>JOB HUNT</li>
				 <li style="float: right"><a href="${Config.BASE_PATH}LogoutServlet">
				<i class="fa fa-user-circle" aria-hidden="true"></i>LOGOUT</a></li>

			</ul>
		</div>
		<div class="container__title">
			<h1>YOUR NEXT HIRE IS HERE!!!</h1>
		</div>
		<div class="container__image"></div>
	</div>
</body>
<script src="${Config.BASE_PATH}Pages/js/styles.js"></script>
</html>