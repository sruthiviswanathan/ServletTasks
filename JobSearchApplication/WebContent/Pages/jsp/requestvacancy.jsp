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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${Config.BASE_PATH}Pages/css/forms.css">
    <link rel="stylesheet" href="${Config.BASE_PATH}Pages/css/navbar.css">
</head>
<body>
    <div class="container">
             
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
        <div class="container__title">
                <h3>REQUEST FOR A VACANCY!! GET NOTIFIED!!</h3>
        </div>
        
      <div class="container__requestvacancy">  
    <form action="${Config.BASE_PATH}RequestVacancyServlet" id="requestvacancy" name="requestvacancy"onsubmit="return validateRequestVacancy()" method="post" >
        
        
        		<div class="requestvacancy__field col-xs-12 col-md-12">
                <label for="select-job" class="field__entry row col-75"><b>JOB DESIGNATION</b></label>
                            
                       <select id="job" name="job" class="field__entry row col-75">
					 	<option value="">Select a Job Designation</option>
						<c:forEach var="job" items="${jobs}">
							<option value="${job.getJobId()}"><c:out value="${job.getJobRole()}" /></option>
						</c:forEach>
					</select>
					 <span class="error"><p id="job_error"></p></span>
                
                </div>
            
                <div class="requestvacancy__field col-xs-12 col-md-12">
                <label for="location" class="field__entry row col-75"><b>LOCATION</b></label>
                <input type="text" class=" field__entry row col-75" id="location" name="location" placeholder="Enter Job Location..">
                <span class="error"><p id="location_error"></p></span>
                </div>
               
                <div class="requestvacancy__field col-xs-12 col-md-12">
                <label for="salary" class="field__entry row col-75"><b>SALARY</b></label>
                <input type="number" class="field__entry row col-75" id="salary" name="salary" placeholder="Enter Salary.." step=".01">
                <span class="error"><p id="salary_error"></p></span>
       			</div>
       			
				<div class="requestvacancy__nav">
        		<input type="submit" class="button col-xs-12 col-md-12" value="SAVE JOB" name="Submit">  
        		<button type="reset" id="cancel" class="button cancelbtn col-xs-12 col-md-12">CANCEL</button>
        		</div>
        	
    </form>   	
    </div>
</div>

</body>
<script src="${Config.BASE_PATH}Pages/js/styles.js"></script>
<script src="${Config.BASE_PATH}Pages/js/validate.js"></script>
</html>