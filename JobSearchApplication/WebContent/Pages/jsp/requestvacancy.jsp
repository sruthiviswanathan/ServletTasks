<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/RequestVacancyServlet"/>  
    	<%@ page import="com.zilker.onlinejobsearch.config.Config"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>REQUEST VACANCY</title>
    <link rel="stylesheet" href="../css/navbar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${Config.BASE_PATH}Pages/css/forms.css">
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
                                    <button onmouseover="openNav()" class="hambug"><i class="fa fa-bars" aria-hidden="true"></i></button>
                                    <li>JOB HUNT</li>
                                    <a href="#">
                                            <li style="float:right"><i class="fa fa-user-circle" aria-hidden="true"></i>LOGOUT</li>
                                    </a>
                            </ul>
                    </div>
        <div class="tit">
                <h3>REQUEST FOR A VACANCY!! GET NOTIFIED!!</h3>
                </div>
    <form action="${Config.BASE_PATH}RequestVacancyServlet" id="requestvacancy" name="requestvacancy"onsubmit="return validateRequestVacancy()" method="post" >
        <div class="form">
                <label for="select-job" class="row col-25"><b>JOB DESIGNATION</b></label>
                <div class="select-job" style="width:75%;">
                      
                       <select id="job" name="job" oninput="this.className = ''">
					 <option value="">Select a Job Designation</option>
						<c:forEach var="job" items="${jobs}">
							<option value="${job.getJobRole()}"><c:out
									value="${job.getJobRole()}" /></option>
						</c:forEach>
					</select>
                </div>
                
               <!--  <div class="nav">
                <button type="button" id="add" onclick="openForm()">NEW</button>  
                </div> -->
                <label for="location" class="row col-25"><b>LOCATION</b></label>
                <input type="text" class="row col-75" id="location" name="location" placeholder="Enter Job Location..">
                <label for="salary" class="row col-25"><b>SALARY</b></label>
                <input type="number" class="row col-75" id="salary" name="salary" placeholder="Enter Salary.." step=".01">
        </div><br>
        <div class="nav">
        <input type="submit" value="SAVE JOB" name="Submit">  
        <button type="reset" id="cancel" class="cancelbtn">CANCEL</button>
        </div>
    </form>   
</div>
<!-- <div class="form-popup" id="myForm">
    <form action="login.html" class="form-container">
      <h3>ADD NEW JOB DESIGNATION</h3>
      <input type="text" placeholder="Enter new Job designation" name="newjob" required>
      <button type="submit" id="addjob" class="btn">ADD DESIGNATION</button>
      <button type="button" class="cancel btn" onclick="closeForm()">CLOSE</button>
    </form>
</div> -->
</body>
<script src="${Config.BASE_PATH}Pages/js/styles.js"></script>
<script src="${Config.BASE_PATH}Pages/js/validate.js"></script>
</html>