<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Our Users</title>
</head>
<body>
<h1>welcome</h1>

<table border="1px">
<%@ page import="com.zilker.onlinejobsearch.beans.Company"%>  
<%@page import="java.util.ArrayList" %>

<%  
ArrayList<Company> list = new ArrayList<Company>();
list = (ArrayList<Company>) request.getAttribute("displayVacancy");
String jobrole = (String)session.getAttribute("jobrole");
%>

<%-- <c:out value = "${'<tag> , &'}"/> --%>
<%
for(Company comp : list) {
%>	

	<tr>
	<td><%= jobrole %></td>
    <td><%= comp.getCompanyName() %></td>
    <td><%= comp.getLocation()  %></td>
    <td><%= comp.getCompanyWebsiteUrl() %></td>
    <td><%= comp.getAverageRating() %></td>
    <td><%= comp.getSalary() %></td>
    <td><%= comp.getVacancyCount() %></td>
     <td><%= comp.getJobDescription() %></td>
	</tr>
<%  
}
%>
</table>


</body>
</html>