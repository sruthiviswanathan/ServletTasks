<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.zilker.onlinejobsearch.config.Config"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file = "usernavbar.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" type="text/css"
	href="${Config.BASE_PATH}Pages/css/company.css ">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>company details</title>
</head>

<body>
		<%
			if(session.getAttribute("email")==null){
				response.sendRedirect("http://localhost:8080/JobSearchApplication/index.jsp");
			}
		%> 
	<div id="maincontainer">
		
		<%--  <div id="mySidenav" class="container__sidenav">
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
					 <li style="float: right"><a href="${Config.BASE_PATH}LogoutServlet">
					<i class="fa fa-user-circle" aria-hidden="true"></i>LOGOUT</a></li>
                        </ul>
		</div> --%>
		
		<div class="container__searchbar">
			<form action="${Config.BASE_PATH}FindCompanyServlet" method="post">
				<div class="searchbar__row">
				
				<div class="col-20 col-xs-12 col-sm-12">
					<label for="job" class="row__label">SEARCH FOR COMPANY</label>
				</div>
				
				<div class="col-60 col-xs-12 col-sm-12">
					<input type="text" name="companyName" class="row__input"
						placeholder="Search for Company.." required><i
						class="icon fa fa-search" aria-hidden="true"></i>
				</div>
				
				<div class="col-10 col-xs-12 col-sm-12">
					<input type="submit" class="row__button col-xs-12 col-sm-12" value="SEARCH">
				</div>
				
				</div>
			</form>
		</div>

	<div class="container__display">
		<form action="${Config.BASE_PATH}ReviewServlet" method="post">
			<c:forEach items="${displayCompany}" var="comp">
				<div class="display__row">
						<input type="hidden" name="company" value="${comp.getCompanyName()}">
					
					<div class="col-20 col-xs-12 col-sm-12">
						<label for="company" class="display__row__label">COMPANY NAME</label>
					</div>
					
					<div class="row__content col-60 col-xs-12 col-sm-12">
						
						<div class="content__value">
							<c:out value="${comp.getCompanyName()}" />
						</div>
					</div>
					
					 <div class="col-10 col-xs-12 col-sm-12">
						     <a href="<c:out value="${comp.getCompanyWebsiteUrl()}" />"><button
								class="row__button col-xs-12 col-sm-12" type="button" value="WEBSITE URL"> WEBSITE URL <i class="dir fa fa-chevron-circle-right"> </i>
							</button></a>

					</div>
				</div>
				<div class="display__row">
					
					<div class="col-20 col-xs-12 col-sm-12">
						<label for="rating" class="display__row__label">OVERALL RATING</label>
					</div>
					
					<div class="row__content col-20 col-xs-12 col-sm-12">
						<div class="content__value">
							<c:out value="${comp.getAverageRating()}" />
						</div>
					</div>
				
				</div>
				
			</c:forEach>
			
			<div class="display__row">
			
			<div class="col-20 col-xs-12 col-sm-12">
				<label for="company" class="display__row__label">WANT TO KNOW WHAT
					OTHERS THINK ABOUT THIS COMPANY?</label>
			</div>
			
			</div>
			
			<div class="display__reviews">
					
					<div class="content__value col-20 col-xs-12 col-sm-12">
						<label for="companyname">NAME :</label>	
							<c:out value="${displayCompanyReviews[0].getUserName()}" />
						
					</div>
					
					<div class="content__value col-20 col-xs-12 col-sm-12">
					
						<label for="review">REVIEW :</label>
							<c:out value="${displayCompanyReviews[0].getReview()}" />
					
					</div>
					
					<div class="content__value col-10 col-xs-12 col-sm-12">
					
						<label for="rating">RATING :</label>
							<c:out value="${displayCompanyReviews[0].getRating()}" />
					
					</div>
					
					<div class="col-20 col-xs-12 col-sm-12">
							<input type="submit" class="row__button col-xs-12 col-sm-12" value="VIEW ALL REVIEWS">
						<!-- <button class="row__button" type="submit" value="VIEW ALL REVIEWS"></button></a> -->
					</div>
			</div>
				
		</form>
	</div>
		
		
	<div class="container__title">
			<h3>JOBS AVAILABLE</h3>
	</div>
	
		<div class="container__maincard">
			 <span class="error col-40 col-xs-12 col-sm-12" id="companyError">
                                       <c:if test="${noVacancy == 'yes'}">
                                       <c:out value="There is no Vacancy in this Company as of now"></c:out>
                                       </c:if>
              </span>
			
			<c:forEach items="${displayVacancies}" var="vac" varStatus="loop">
			  
			  	<div class="maincard__card col-sm-6 col-xs-height">
					<div class="card__container">
						<p>
							<b><c:out value="${vac.getJobRole()}" /></b>
						</p>
						<p>
							<c:out value="${vac.getLocation()}" />
						</p>
						
						<button class="row__button" id="btn${loop.count}"onclick="displaymodal(this.id)">VIEW MORE</button>
					</div>
				</div>

		<div class="container__modal">
				<div class=" modal btn${loop.count}">

					<div class="modal-content">
						
						<span class="close" onclick="closeModal(this.getAttribute('class'))">&times;</span>
						<div class="modal__row">
							
							<div class="col-60 col-xs-12 col-sm-12">
								<label for="job" class="modal__label">JOB DESIGNATION</label>
							</div>
							
							<div class="col-20 col-xs-12 col-sm-12">
								<p>
									<c:out value="${vac.getJobRole()}" />
								</p>
							</div>
							
							<div class="col-20 col-xs-12 col-sm-12">
								<form action="${Config.BASE_PATH}ApplyForJobServlet" method="post">
								<input type="hidden" name="companyName" value="${vac.getCompanyName()}">
								<input type="hidden" name="jobDesignation" value="${vac.getJobRole()}">
								<button class="row__button" type="submit">
										APPLY FOR JOB<i class="dir fa fa-chevron-circle-right"
											aria-hidden="true"></i></button>
								</form>
									
							</div>
							
							<div class="col-60 col-xs-12 col-sm-12">
								<label for="jobdesc" class="modal__label">JOB DESCRIPTION</label>
							</div>
							
							<div class="col-60 col-xs-12 col-sm-12">
								<p>
									<c:out value="${vac.getJobDescription()}" />
								</p>
							</div>
							
							<div class="col-60 col-xs-12 col-sm-12">
								<label for="salary" class="modal__label">SALARY(per annum)</label>
							</div>
							
							<div class="col-20 col-xs-12 col-sm-12">
								<p>
									<c:out value="${vac.getSalary()}" />
									Lakhs per annum
								</p>
							</div>
							
							<div class="col-60 col-xs-12 col-sm-12">
								<label for="location" class="modal__label">JOB LOCATION</label>
							</div>
							
							<div class="col-20 col-xs-12 col-sm-12">
								<p>
									<c:out value="${vac.getLocation()}" />
								</p>
							</div>
						
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
</body>
<script src="${Config.BASE_PATH}Pages/js/styles.js"></script>

</html>