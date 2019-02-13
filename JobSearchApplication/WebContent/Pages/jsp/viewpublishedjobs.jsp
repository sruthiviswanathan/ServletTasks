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
        <title>View Jobs</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="${Config.BASE_PATH}/Pages/css/updatejobs.css">
        <link rel="stylesheet" href="${Config.BASE_PATH}/Pages/css/navbar.css">
        <link rel="stylesheet" href="${Config.BASE_PATH}/Pages/css/forms.css">
</head>

<body>
        <div class="container">
               <div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<a href="${Config.BASE_PATH}PostJobServlet">POST JOB</a>
			  <a href="#">VIEW INTERESTED USERS</a> 
			  <a href="${Config.BASE_PATH}ViewPublishedJobsServlet">VIEW PUBLISHED JOBS</a>
		</div>
                        <div class="navbar">
                                <ul>
                                        <button onmouseover="openNav()" class="hambug"><i class="fa fa-bars" aria-hidden="true"></i></button>
                                        <li>JOB HUNT</li>
                                        <button class="arrow" id="btn" onclick="displaymenu(this.id)"><i class="fa fa-arrow-left" aria-hidden="true"></i></button>
                                </ul>
                        </div>
      
              
                        <div class="split left" id="leftside">
                                <div class="jobs">
                                <div class="row row1">
                                	 <c:forEach var="vac" items="${vacancyDetails}" varStatus="loop">
                                        <div class="card col-sm-6 col-xs-height">
                                                <h4><b><c:out value="${vac.getJobRole()}" /></b></h4>
                                                <p><c:out value="${vac.getLocation()}" /></p>
                                                <div class="button">
                                               <button class="btn${loop.count}" onclick="displayjobs(this.getAttribute('class'))">VIEW MORE</button>
                                               </div>
                                        </div>
                                        </c:forEach>                                  
                                </div>
                        </div>
                    </div>

                        
                               <c:forEach var="vac" items="${vacancyDetails}" varStatus="loop">  
                            	   <div class="split right rightside btn${loop.count}">
                           				 <div class="content">
                                <form action="#" id="postjob" name="postjob" onsubmit="return validatePostJob()" method="post">
                                        <div class="form">
                                                <label for="select-job" class="row col-25"><b>JOB DESIGNATION</b></label>
                                                <div class="select-job">
                                                        <select id="job"name="job">
                                                      
                                                               <option value="${vac.getJobRole()}"><c:out value="${vac.getJobRole()}" /></option> 
                                                               <c:forEach var="job" items="${jobs}">
																	<option value="${job.getJobRole()}"><c:out value="${job.getJobRole()}" /></option>
																</c:forEach> 
                                                        </select>
                                                </div>
                                                <div class="nav">
                                                        <button type="button" id="add" onclick="openForm()">NEW</button>
                                                </div>
                                                <label  for="location" class="row col-25"><b>LOCATION</b></label>
                                                <input type="text" class="row col-75" id="location" name="location" value="${vac.getLocation()}">
                                                <label  for="salary" class="row col-25"><b>SALARY</b></label>
                                                <input type="number" class="row col-75" id="salary" name="salary" value="${vac.getSalary()}"
                                                        step=".01">
                                                <label  for="count" class="row col-25"><b>COUNT</b></label>
                                                <input type="number" class="row col-75" id="count" name="count" value="${vac.getVacancyCount()}"">
                                                <label for="description" class="row col-25"><b>JOB DESCRIPTION</b></label>
                                                <textarea rows="4" cols="50" name="description">${vac.getJobDescription()}</textarea>
                                        </div><br>
                                        <div class="nav">
                                                <input type="submit" value="UPDATE" name="Submit">  
                                                <button type="reset" id="cancel" class="cancelbtn">DISCARD</button>
                                        </div>
                                </form>
                              </div>
                            </div>
                               </c:forEach>
                            <div class="form-popup" id="myForm">
                                    <form action="login.html" class="form-container">
                                            <h3>ADD NEW JOB DESIGNATION</h3>
                                            <input type="text" placeholder="Enter new Job designation" name="newjob" required>
                                            <button type="submit" id="addjob" class="btn">ADD DESIGNATION</button>
                                            <button type="button" class="cancel btn" onclick="closeForm()">CLOSE</button>
                                    </form>
                            </div> 
                        </div>
                   
</body>
<script src="${Config.BASE_PATH}/Pages/js/styles.js"></script>
<script src="${Config.BASE_PATH}/Pages/js/validate.js"></script>

</html>