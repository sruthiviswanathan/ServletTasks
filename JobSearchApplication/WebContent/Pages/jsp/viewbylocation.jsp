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
<title>View Jobs</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${Config.BASE_PATH}Pages/css/viewjobs.css">


</head>

<body>
	 <div class="container"> 
		 		<div id="mySidenav" class="container__sidenav">
		 	 		<div class="sidenav__items">
                        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                        <a href="${Config.BASE_PATH}Pages/jsp/findjob.jsp">FIND JOB</a>
                        <a href="${Config.BASE_PATH}Pages/jsp/findcompany.jsp">FIND COMPANY</a>
                         <a href="${Config.BASE_PATH}Pages/jsp/searchbylocation.jsp">SEARCH BY LOCATION</a>                  
                        <a href="${Config.BASE_PATH}UserProfileServlet">YOUR PROFILE</a>
                        <a href="${Config.BASE_PATH}Pages/jsp/requestvacancy.jsp">REQUEST A VACANCY</a>
                 	</div>
                </div>
			
			<div class="container__navbar">
			<ul class="navbar__list">
				<li><button onmouseover="openNav()" class="hambug"><i class="fa fa-bars" aria-hidden="true"></i></button></li>			
					<li>JOB HUNT</li>
					 <li  style="float: right"><a href="${Config.BASE_PATH}LogoutServlet">
					 <i class="fa fa-user-circle" aria-hidden="true"></i>LOGOUT</a></li>
				    <li><button class="arrow" id="btn" onclick="displaymenu(this.id)">
					<i class="fa fa-arrow-left" aria-hidden="true"></i></button></li>
			</ul>
		</div>
		
		
		<div class="container__split split--left">
			
			<div class="left__jobs">
				
				<div class="jobs__row jobs--row1">
			
					<c:forEach var="location" items="${retrieveByLocation}" varStatus="loop">
					
						<div class="row__card col-sm-6 col-xs-height">
							<h4>
								<b><c:out value="${location.getJobRole()}" /></b>
							</h4>
							<p>
								<c:out value="${location.getCompanyName()}" />
							</p>
							<p>
								<c:out value="${location.getLocation()}" />
							</p>
							<button class="btn${loop.count}" id="button"
								onclick="displayjobs(this.getAttribute('class'))">VIEW
								MORE</button>
						</div>
					</c:forEach>
					
				</div>
			</div>
		</div>
		
		<c:forEach var="location" items="${retrieveByLocation}" varStatus="loop">
			
				<div class="container__split split--right rightside btn${loop.count}">


					<div class="right__header" id="myHeader">

						<div class="right__row">

							<div class="col-60 col-xs-12 col-md-12">
							<img
									src="data:image/jpeg;base64,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"alt="gethired" />

							</div>
							
							<div class="col-60 col-xs-12 col-md-12">
								<h3>
									<c:out value="${location.getCompanyName()}" />
									/
									<c:out value="${location.getJobRole()}" />
									/
									<c:out value="${location.getLocation()}" />
								</h3>
							</div>
							
							<div class="col-60 col-xs-12 col-md-12">
								
									<form action="${Config.BASE_PATH}ApplyForJobServlet" method="post">
								
									<input type="hidden" name="companyName" value="${location.getCompanyName()}">
									<input type="hidden" name="jobDesignation" value="${location.getJobRole()}">
									<button class="col-xs-12" id ="button" type="submit">
										APPLY FOR JOB<i class="dir fa fa-chevron-circle-right"
											aria-hidden="true"></i>
									</button>
								
								</form>
							</div>

						</div>

					</div>
					<div class="right__content">
								
								<p>	JOB DESIGNATION:
								<c:out value="${location.getJobRole()}" />
								</p>
								<p>COMPANY NAME:
								<c:out value="${location.getCompanyName()}" />
								</p>
								<p>JOB DESCRIPTION:
								<c:out value="${location.getJobDescription()}" />
								</p>		
								<p>LOCATION:
								<c:out value="${location.getLocation()}" />
								</p>
								<p>	SALARY:
								<c:out value="${location.getSalary()}" />
								</p>
								<p>	VACANCY COUNT:
								<c:out value="${location.getVacancyCount()}" />
								</p>
					</div>
				</div>

			
		</c:forEach>
		</div>

</body>
<script src="${Config.BASE_PATH}Pages/js/styles.js"></script>

</html>