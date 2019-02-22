<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.zilker.onlinejobsearch.config.Config"%>
 <%@ include file = "adminnavbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>INTERESTED USERS</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="${Config.BASE_PATH}Pages/css/viewinterested.css">

</head>
<body>
<%
			if(session.getAttribute("email")==null){
				response.sendRedirect("http://localhost:8080/JobSearchApplication/index.jsp");
			}
		%> 
    <div class="container">
    
		<div class="container__title">
			<h3>YOUR NEXT HIRE IS HERE!!!</h3>
		</div>
					<c:choose>
						<c:when test="${noInterestedUsers == 'yes'}">
						<div class="success">
						<c:out value="NO INTERESTED CANDIDATES!!"/>
						</div>
						</c:when>
		<c:otherwise>
		<table class="container__customers">
			
  				<tr>
    				<th>USERNAME</th>
    				<th>EMAIL</th>
    				<th>JOB DESIGNATION</th>
    				<th>LOCATION</th>
  			    </tr>
  			 
					 <c:forEach var="user" items="${appliedUsers}">
						<tr>
							<td>	<c:out value="${user.getUserName()}" /> </td>
							<td>	<c:out value="${user.getEmail()}" /> </td>  
							<td>	<c:out value="${user.getJobRole()}" /> </td> 
							<td>	<c:out value="${user.getLocation()}" /> </td> 
						</tr>	
					</c:forEach>
		</table>
		</c:otherwise>
		</c:choose>
</div>
</body>
<script src="${Config.BASE_PATH}Pages/js/styles.js"></script>
</html>
    