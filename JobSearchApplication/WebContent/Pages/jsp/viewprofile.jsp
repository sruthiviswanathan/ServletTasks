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
    <link rel="stylesheet" href="${Config.BASE_PATH}Pages/css/forms.css">
    <link rel="stylesheet" href="${Config.BASE_PATH}Pages/css/navbar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>LOGIN/SIGNUP</title>
</head>

<body>

    <div class="container">
          <div id="mySidenav" class="sidenav">
                        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                        <a href="${Config.BASE_PATH}Pages/jsp/findjob.jsp">FIND JOB</a>
                        <a href="${Config.BASE_PATH}Pages/jsp/findcompany.jsp">FIND COMPANY</a>
                         <a href="${Config.BASE_PATH}Pages/jsp/searchbylocation.jsp">SEARCH BY LOCATION</a>
                        <a href="${Config.BASE_PATH}UserProfileServlet">YOUR PROFILE</a>
                        <a href="${Config.BASE_PATH}Pages/jsp/requestvacancy.jsp">REQUEST A VACANCY</a>
           </div> 
        <div class="navbar">
            <ul>
            <button onmouseover="openNav()" class="hambug">
					<i class="fa fa-bars" aria-hidden="true"></i>
				</button>
                <li style="float:left">JOB HUNT</li>
                <a href="#">
                        <li style="float:right"><i class="fa fa-user-circle" aria-hidden="true"></i>LOGOUT</li>
                </a>
            </ul>
        </div>
						
		<div class="tit">
			<h3>YOUR PROFILE!!!</h3>
		</div>						

        <div class="forms">
            <form action="${Config.BASE_PATH}UserProfileServlet" name ="update" id="update"  onsubmit="return updateUser()" method="post">
                <div class="update">
                <c:forEach var="data" items="${userData}">
               
                    <label for="uname" class="row col-25"><b>USERNAME*</b></label>
                    <input type="text" class="row col-75" id="uname" name="username" value="${data.getUserName()}">                      
                        <label for="cname" class="row col-25"><b>COMPANY NAME*</b></label>
                        <input type="text" class="row col-75" id="cname" name="cname" value="${data.getCompany()}" >
                        <label for="designation" class="row col-25"><b>DESIGNATION*</b></label>
                        <input type="text" class="row col-75" id="cname" name="designation" value="${data.getDesignation()}">
                        <label for="skills" class="row col-25"><b>SKILLS SAVED IN YOUR PROFILE</b></label>
                       
                        <div class="checkbox col-25">
							
							<c:forEach var="tech" items="${technologies}">
							<input type="checkbox" name="tech" value="${tech.getTechnologyId()}"><c:out
											value="${tech.getTechnology()}" />
						</c:forEach>
							
						</div>
					</c:forEach>
                </div><br>
                <div class="nav">
                        <input type="submit" value="UPDATE" name="Submit">  
                    <button type="reset" id="cancel" class="cancelbtn">CANCEL</button>
                </div>
            </form>
        </div>
    </div>
</body>
<script src="${Config.BASE_PATH}Pages/js/styles.js"></script>
<script src="${Config.BASE_PATH}Pages/js/validate.js"></script>
</html>