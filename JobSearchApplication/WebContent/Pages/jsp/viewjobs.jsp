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
<link rel="stylesheet" href="${Config.BASE_PATH}Pages/css/mainpage.css">
<script src="${Config.BASE_PATH}Pages/js/jquery-3.3.1.min.js"></script>

</head>

<body>
<%
			if(session.getAttribute("email")==null){
				response.sendRedirect("http://localhost:8080/JobSearchApplication/index.jsp");
			}else {
				System.out.println("session attribute "+session.getAttribute("email"));
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
                        <a href="${Config.BASE_PATH}ViewAppliedJobsServlet">VIEW APPLIED JOBS</a>
                 </div>
                </div>
		
		<div class="container__navbar">
		<ul class="navbar__list">
				<li><button onmouseover="openNav()" class="hambug"><i class="fa fa-bars" aria-hidden="true"></i></button></li>			
					<li>JOB HUNT</li>
					 <li  style="float: right"><a href="${Config.BASE_PATH}LogoutServlet">
					 <i class="fa fa-user-circle" aria-hidden="true"></i>LOGOUT</a></li>
					<li style="float: right" ><button class="arrow" id="btn" onclick="displaymenu(this.id)">
					<i class="fa fa-arrow-left" aria-hidden="true"></i></button></li>
			</ul>
		</div> 
		
                
                <div class="container__searchbar">
                        <form action="${Config.BASE_PATH}ViewByJob" id="findJob" onsubmit="submitFindJob()" method="post">
                  <div class="searchbar__row">               
                                <div class="col-20 col-xs-12 col-sm-12">
                                        <label for="job" class="row__label">SEARCH FOR JOB</label>
                                </div>
                                <div class="col-60 col-xs-12 col-sm-12">
                                        <input type="text" class="row__input"  oninput ="return removeErrors();" name="job" placeholder="Search for Job.."
                                                required><i class="icon fa fa-search" aria-hidden="true"></i>
                                </div>
                                <div class="col-10 col-xs-12 col-sm-12">
                                        <input type="submit" class=" row__button col-xs-12 col-sm-12" value="SEARCH">
                                </div>
                   </div>
                        </form>
                </div>
	
	
	    <c:choose>
		
		
		
						<c:when test="${noJobDesignation == 'yes'}">
                       <div class="container__noresults">
                        <c:out value="PLEASE ENTER A VALID JOB DESIGNATION!!!"></c:out>
                        </div>
                        </c:when>
                        <c:when test="${noVacancy == 'yes'}">
                        <div class="container__noresults">
                        <c:out value="THERE IS NO VACANCY IN THIS DESIGNATION AS OF NOW!!!"></c:out>
                        </div>
                        </c:when>
		
	
		
		<c:otherwise>
						
                       	<div id="snackbar">
                        
                        </div>
                        
		
		<div class="container__split split--left">
			<div class="left__jobs">
				<div class="jobs__row jobs--row1">

					<c:forEach var="comp" items="${displayVacancy}" varStatus="loop">

						<div class="row__card col-sm-6 col-xs-height">
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
								onclick="displayjobs(this.getAttribute('class'))">VIEW MORE</button>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

		<c:forEach var="comp" items="${displayVacancy}" varStatus="loop">
			
				<div class="container__split split--right rightside btn${loop.count}">


					<div class="right__header" id="myHeader">

						<div class="right__row">
							 <div class="col-60 col-xs-12 col-md-12">
							<img
									src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgM9iV2vxu6hjLHVBHx2YccOI2YzoFiR8-ErdjC35zdwsTiFgW"/>
							</div> 
							<div class="col-60 col-xs-12 col-md-12">
								<h3>
								
								<c:out value="${comp.getCompanyName()}" />
								/
								<c:out value="${job.get(0)}" />
								/
								<c:out value="${comp.getLocation()}" />
								
								</h3>
							</div>
							<div class="col-60 col-xs-12 col-md-12">
								<form action="${Config.BASE_PATH}ApplyForJobServlet" id="apply${loop.count}" onsubmit="event.preventDefault(); apply(this,'button${loop.count}');" method="post">
								<input type="hidden" name="location" value="${comp.getLocation()}">
								<input type="hidden" name="companyName" value="${comp.getCompanyName()}">
								<input type="hidden" name="jobDesignation" value="${job.get(0)}">
								<input class="button col-xs-12" id="button${loop.count}" type="submit" value="APPLY FOR JOB"/>
								</form> 
								
							</div>

						</div>

					</div>
					<div class="right__content">
								<p>	<b>JOB DESIGNATION:</b>
								<c:out value="${job.get(0)}" />
								</p>
								<p><b>COMPANY NAME:</b>
								<c:out value="${comp.getCompanyName()}" />
								</p>
								<p><b>JOB DESCRIPTION:</b>
								<c:out value="${comp.getJobDescription()}" />
								</p>	
								<p><b>LOCATION:</b>
								<c:out value="${comp.getLocation()}" />
								</p>
								<p><b>SALARY:</b>
								<c:out value="${comp.getSalary()}" />
								</p>
								<p><b>VACANCY COUNT:</b>
								<c:out value="${comp.getVacancyCount()}" />
								</p>
					</div>
				</div>

			
		</c:forEach>
		</c:otherwise>
		</c:choose>
		
		
		
		</div>

</body>
<script src="${Config.BASE_PATH}Pages/js/styles.js"></script>

</html>