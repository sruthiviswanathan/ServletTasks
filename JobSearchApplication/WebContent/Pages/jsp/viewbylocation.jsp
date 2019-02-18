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
<%
			if(session.getAttribute("email")==null){
				response.sendRedirect("http://localhost:8080/JobSearchApplication/index.jsp");
			}
		%> 
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
									src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgM9iV2vxu6hjLHVBHx2YccOI2YzoFiR8-ErdjC35zdwsTiFgW"/>
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
								
								<p>	<b>JOB DESIGNATION:</b>
								<c:out value="${location.getJobRole()}" />
								</p>
								<p><b>COMPANY NAME:</b>
								<c:out value="${location.getCompanyName()}" />
								</p>
								<p><b>JOB DESCRIPTION:</b>
								<c:out value="${location.getJobDescription()}" />
								</p>		
								<p><b>LOCATION:</b>
								<c:out value="${location.getLocation()}" />
								</p>
								<p><b>SALARY:</b>
								<c:out value="${location.getSalary()}" />
								</p>
								<p><b>VACANCY COUNT:</b>
								<c:out value="${location.getVacancyCount()}" />
								</p>
					</div>
				</div>

			
		</c:forEach>
		</div>

</body>
<script src="${Config.BASE_PATH}Pages/js/styles.js"></script>

</html>