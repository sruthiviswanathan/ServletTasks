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
	<div id="main">
		<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<a href="${Config.BASE_PATH}PostJobServlet">POST JOB</a> <a
				href="viewprofile.html">YOUR PROFILE</a> <a href="#">VIEW
				INTERESTED USERS</a> <a href="viewpublishedjobs.html">VIEW PUBLISHED
				JOBS</a>
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
			<h1>YOUR NEXT HIRE IS HERE!!!</h1>
		</div>
		<div id="hireimage" class="image">
		</div>
</body>
<script src="${Config.BASE_PATH}Pages/js/styles.js"></script>

</html>