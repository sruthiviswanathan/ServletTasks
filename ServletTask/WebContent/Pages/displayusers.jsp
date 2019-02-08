<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Our Users</title>
</head>
<body>
<h1>welcome</h1>
 
<table border="1px">
<%@ page import="com.zilker.servlet.bean.Student"%>  
<%@page import="java.util.ArrayList" %>
<%  
ArrayList<Student> list = new ArrayList<Student>();
list = (ArrayList<Student>) request.getAttribute("studentList");
%>
<tr>
<th>NAME</th>
<th>EMAIL</th>
<th>COUNTRY</th>
</tr>

<%
for(Student stud : list) {
%>	
	<tr>
    <td><%= stud.getName() %></td>
    <td><%= stud.getEmail() %></td>
    <td><%= stud.getCountry() %></td>
	</tr>
<%  
}
%>
</table>


</body>
</html>