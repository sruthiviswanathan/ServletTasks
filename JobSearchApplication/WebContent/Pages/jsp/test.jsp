<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.zilker.onlinejobsearch.config.Config"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Our Users</title>
</head>
<body>
<%@ page import="com.zilker.onlinejobsearch.beans.Company"%>
		<%@page import="java.util.ArrayList"%>
<h1>welcome</h1>
	<table>
					<c:forEach var="vac" items="${allDetails}">
					<tr>
							<td>	<c:out value="${vac.getJobRole()}" /> </td>
							
							<td>	<c:out value="${vac.getCompanyName()}" /> </td>
							<td> <c:out value="${vac.getLocation()}" /></td>
									
								<td>	<c:out value="${vac.getSalary()}" /></td>
							
							<%-- <td>	<c:out value="${location.getLocation()}" /> <td> --%>
						</tr>	
					</c:forEach>
			
	</table>	
		<%-- <c:forEach var="location" items="${retrieveByLocation}" varStatus="loop">
			<c:forEach var="comp" items="${displayCompany}">
		
									<c:out value="${comp.getCompanyName()}" />
									
									<c:out value="${vacancydetails.getJobRole()}" />
									
									<c:out value="${location.getLocation()}" />
									
									<c:out value="${location.getSalary()}" />
						
							
							<c:out value="${location.getJobDescription()}" />

			
		</c:forEach>
		</c:forEach> --%>


</body>
</html>