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
<title>company details</title>
<link rel="stylesheet" type="text/css" href="${Config.BASE_PATH}Pages/css/company.css ">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
<%
			if(session.getAttribute("email")==null){
				response.sendRedirect("http://localhost:8080/JobSearchApplication/index.jsp");
			}
		%> 
<div class="maincontainer">

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
					<li style="float: right"><a href="${Config.BASE_PATH}LogoutServlet">
					<i class="fa fa-user-circle" aria-hidden="true"></i>LOGOUT</a></li>
             </ul>
	</div>
			
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
	<form action="${Config.BASE_PATH}RateServlet" method="get">
	
	<c:forEach items="${displayCompany}" var="comp">
	<input type="hidden" name="companyname" value="${comp.getCompanyName()}">
		<div class="display__row">

			<div class="col-20 col-xs-12 col-sm-12">
				<label for="company" class="display__row__label">COMPANY NAME</label>
			</div>
			
			<div class="row__content col-60 col-xs-12 col-sm-12">
				<div class="content__value">
							<c:out value="${comp.getCompanyName()}" />
				</div>
			</div>
			
			<div class="col-20 col-xs-12 col-sm-12">
					<a href="<c:out value="${comp.getCompanyWebsiteUrl()}" />">
					<button class="row__button" type="button" value="WEBSITE URL"> WEBSITE URL <i class="dir fa fa-chevron-circle-right"> </i></button></a>
			</div>
		</div>
		
		<div class="display__row">
		
			<div class="col-20 col-xs-12 col-sm-12">
						<label for="rating" class="display__row__label">OVERALL RATING</label>
			</div>
		
			<div class="row__content col-60 col-xs-12 col-sm-12">
						<div class="content__value">
							<c:out value="${comp.getAverageRating()}" />
						</div>
			</div>
		
			<div class="col-20 col-xs-12 col-sm-12">
				<button class="row__button" type="submit" value="RATE THIS COMPANY">RATE THIS COMPANY</button>
			</div>
			
		</div>
		
		</c:forEach>
		
		<div class="display__row">
			<div class="col-20 col-xs-12 col-sm-12">
				<label for="company" class="display__row__label">KNOW WHAT OTHERS THINK ABOUT THIS COMPANY!!!!</label>
			</div>
		</div>
			
		<div class="display__reviews">
			<c:forEach items="${displayCompanyReviews}" var="rev"> 
			
				<div class="content__value col-60 col-xs-12 col-sm-12">
						<label for="companyname">NAME :</label>	
						<c:out value="${rev.getUserName()}" />
				</div>
			
				<div class="content__value col-60 col-xs-12 col-sm-12">
					
						  <label for="review">REVIEW :</label>
							<c:out value="${rev.getReview()}" />
					
			   </div>
			
			   <div class="content__value col-10 col-xs-12 col-sm-12">
						<label for="rating">RATING :</label>
							<c:out value="${rev.getRating()}" />	
				</div>	
			</c:forEach> 
		</div>
	</form>
	</div>
</div>
</body>
<script src="${Config.BASE_PATH}Pages/js/styles.js"></script>

</html>