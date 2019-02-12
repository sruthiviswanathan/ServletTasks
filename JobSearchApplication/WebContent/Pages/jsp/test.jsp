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
<h1>welcome</h1>
<table>
 <c:forEach items="${displayCompanyReviews}" var="rev">
				
					<tr>
							<td><c:out value="${rev.getUserName()}" /></td>
					
					
						
							<td><c:out value="${rev.getReview()}" /></td>
					
					
							<td><c:out value="${rev.getRating()}" /></td>
			
			</tr>
				</c:forEach>


</table>
</body>
</html>