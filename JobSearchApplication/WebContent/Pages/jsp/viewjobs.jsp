<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>View Jobs</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${Config.BASE_PATH}Pages/css/viewjobs.css">
<link rel="stylesheet" href="${Config.BASE_PATH}Pages/css/navbar.css">

</head>

<body>
	<div class="container">
		<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<a href="mainpage.html">FIND JOB</a> <a href="findcompany.html">FIND
				COMPANY</a> <a href="searchbylocation.html">SEARCH BY LOCATION</a> <a
				href="postjob.html">POST JOB</a> <a href="viewprofile.html">YOUR
				PROFILE</a> <a href="requestvacancy.html">REQUEST A VACANCY</a> <a
				href="viewpublishedjobs.html">VIEW PUBLISHED JOBS</a>
		</div>
		<div class="navbar">
			<ul>
				<button onmouseover="openNav()" class="hambug">
					<i class="fa fa-bars" aria-hidden="true"></i>
				</button>
				<li>JOB HUNT</li>
				<button class="arrow" id="btn" onclick="displaymenu(this.id)">
					<i class="fa fa-arrow-left" aria-hidden="true"></i>
				</button>
			</ul>
		</div>
		<%@ page import="com.zilker.onlinejobsearch.beans.Company"%>
		<%@page import="java.util.ArrayList"%>
		<div class="split left">
			<div class="jobs">
				<div class="row row1">

					<c:forEach var="comp" items="${displayVacancy}" varStatus="loop">

						<div class="card col-sm-6 col-xs-height">
							<h4>
								<b><c:out value="${job.get(0)}" /></b>
							</h4>
							<p>
								<c:out value="${comp.getCompanyName()}" />
							</p>
							<p>
								<c:out value="${comp.getLocation()}" />
							</p>
							<button class="btn${loop.count}" id="button"
								onclick="displayjobs(this.class)">VIEW MORE</button>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<c:forEach var="comp" items="${displayVacancy}" varStatus="loop">
			<div class="split right btn${loop.count}" id="rightside" >

				
					<div class="header" id="myHeader">

						<div class="row">

							<div class="col-20 col-xs-12 col-md-12">
								<img
									src="data:image/png;base64,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"
									alt="zilker" />

							</div>
							<div class="col-60 col-xs-12 col-md-12">
								<h3>
									<c:out value="${comp.getCompanyName()}" />
									/
									<c:out value="${job.get(0)}" />
									/
									<c:out value="${comp.getLocation()}" />
									/
									<c:out value="${comp.getSalary()}" />
								</h3>
							</div>
							<div class="col-60 col-xs-12 col-md-12">
								<a href="#"><button class="col-xs-12" id="button"
										type="submit">
										APPLY FOR JOB<i class="fa fa-chevron-circle-right"
											aria-hidden="true"></i>
									</button></a>
							</div>

						</div>

					</div>
					<div class="content">
						<p>
							<c:out value="${comp.getJobDescription()}" />
						</p>

					</div>
				</div>
				

		</c:forEach>
	</div>
</body>
<script src="${Config.BASE_PATH}Pages/js/styles.js"></script>

</html>