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
							<c:if test="${comp.getAverageRating() != 0}">
							<c:out value="${comp.getAverageRating()}" />
							</c:if>
							<c:if test="${comp.getAverageRating() == 0}">
							<c:out value="No Rating For This Company!Be The First to Rate This Company" />
							</c:if>
						</div>
			</div>
		
			<div class="col-20 col-xs-12 col-sm-12">
				<button class="row__button" type="submit" value="RATE THIS COMPANY">RATE THIS COMPANY</button>
			</div>
			
		</div>
		
		</c:forEach>
		
		<div class="display__row">
			<div class="col-20 col-xs-12 col-sm-12">
				<label for="company" class="display__row__label">KNOW WHAT OTHERS SAY ABOUT THE INTERVIEW PROCESS!!</label>
			</div>
		</div>
			
		<div class="display__reviews">
		
		 	<c:choose>
		 	<c:when test="${noReviews == 'yes'}">
    		<div class="error col-60 col-xs-12 col-sm-12">
                 <c:out value="***No Reviews have been given yet***"></c:out>
             </div>
             </c:when>
		
			<c:otherwise>
			<c:forEach items="${displayInterviewProcess}" var="rev"> 
			
			   <div class="content__value col-20 col-xs-12 col-sm-12">
						<label for="rating">JOB DESIGNATION :</label>
							<c:out value="${rev.getJobRole()}" />	
				</div>	
				<div class="content__value col-20 col-xs-12 col-sm-12">
						<label for="companyname">NAME :</label>	
						<c:out value="${rev.getUserName()}" />
				</div>
				<div class="content__value col-60 col-xs-12 col-sm-12">
					
						  <label for="review">REVIEW :</label>
							<c:out value="${rev.getInterviewProcess()}" />
					
			   </div>
			</c:forEach> 
			</c:otherwise>
			
			</c:choose>
			
		</div>
	</form>
	</div>
</div>
</body>
<script src="${Config.BASE_PATH}Pages/js/styles.js"></script>

</html>