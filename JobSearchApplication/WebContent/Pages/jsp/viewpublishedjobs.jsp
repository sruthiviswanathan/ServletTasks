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
        <link rel="stylesheet" href="${Config.BASE_PATH}/Pages/css/viewjobs.css">
       <%--  <link rel="stylesheet" href="${Config.BASE_PATH}/Pages/css/navbar.css"> --%>
        <link rel="stylesheet" href="${Config.BASE_PATH}/Pages/css/forms.css">
</head>

<body>
        <div class="container">
            
            <div id="mySidenav" class="container__sidenav">
				<div class="sidenav__items">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<a href="${Config.BASE_PATH}PostJobServlet">POST JOB</a>
			<a href="${Config.BASE_PATH}ViewAppliedUsersServlet">VIEW INTERESTED USERS</a> 
			<a href="${Config.BASE_PATH}ViewPublishedJobsServlet">VIEW PUBLISHED JOBS</a>
			</div>
			</div>
                        <div class="container__navbar">
							<ul class="navbar__list">
								<li><button onmouseover="openNav()" class="hambug">
										<i class="fa fa-bars" aria-hidden="true"></i>
									</button></li>
								<li>JOB HUNT</li>
								<li style="float: right"><a href="${Config.BASE_PATH}LogoutServlet">
										<i class="fa fa-user-circle"
											aria-hidden="true"></i>LOGOUT
								</a></li>
								<li style="float: right" ><button class="arrow" id="btn" onclick="displaymenu(this.id)">
								<i class="fa fa-arrow-left" aria-hidden="true"></i></button></li>
				
							</ul>
						</div>
      
     		 <div class="container__split split--left">        
                       
                                <div class="left__jobs">
                                <div class="jobs__row jobs__row1">
                                	 
                                	 <c:forEach var="vac" items="${vacancyDetails}" varStatus="loop">
                                      
                                        <div class="row__card col-sm-6 col-xs-height">
                                                <h4><b><c:out value="${vac.getJobRole()}" /></b></h4>
                                                <p><c:out value="${vac.getLocation()}" /></p>
                                               
                                               <button class="btn${loop.count}" id="button" onclick="displayjobs(this.getAttribute('class'))">VIEW MORE</button>
                                               
                                        </div>
                                      
                                      </c:forEach>                                  
                                </div>
                        </div>
                    </div>

                        
                               <c:forEach var="vac" items="${vacancyDetails}" varStatus="loop">  
                            	
                            	    <div class="container__split split--right rightside btn${loop.count}">
                           				 <div class="right__form">
                                			
                                			<form action="${Config.BASE_PATH}UpdateVacancyServlet" id="postjob" name="postjob" onsubmit="return validatePostJob()" method="post">
                                    		<input type="hidden" name="jobdesignation" value="${vac.getJobRole()}">
                                        		
                                        		<div class="content__updatejobs">
                                                
                                                <div class="updatejobs__field col-xs-12 col-md-12">
                                                <label for="select-job" class="field__entry row col-75"><b>JOB DESIGNATION</b></label>
                                               
                                                        <select id="job" name="job" class="field__entry row col-75">
                                                      		
                                                               <option value="${vac.getJobRole()}">${vac.getJobRole()}</option> 
                                                               <c:forEach var="job" items="${jobs}">
																	<option value="${job.getJobId()}"><c:out value="${job.getJobRole()}" /></option>
																</c:forEach> 
                                                        </select>
                                               			 <span class="error"><p id="job_error"></p></span>
                                               </div>
                                               
                                                <div class="updatejobs__nav">
                                                        <button type="button" id="add" onclick="openForm()">NEW</button>
                                                </div>
                                               
                                                <div class="updatejobs__field col-xs-12 col-md-12">
                                                <label  for="location" class="field__entry row col-25"><b>LOCATION</b></label>
                                                <input type="text" class="field__entry row col-75" id="location" name="location" value="${vac.getLocation()}">
                                               <span class="error"><p id="location_error"></p></span>
                                               </div>
                                               
                                                <div class="updatejobs__field col-xs-12 col-md-12">
                                                <label  for="salary" class="field__entry row col-25"><b>SALARY</b></label>
                                                <input type="number" class="field__entry row col-75" id="salary" name="salary" value="${vac.getSalary()}"
                                                        step=".01">
                                                 <span class="error"><p id="salary_error"></p></span>
                                                 </div>
                                                    
                                                 <div class="updatejobs__field col-xs-12 col-md-12">
                                                <label  for="count" class="field__entry row col-25"><b>COUNT</b></label>
                                                <input type="number" class="field__entry row col-75" id="count" name="count" value="${vac.getVacancyCount()}"">
                                               <span class="error"><p id="count_error"></p></span>
                                               </div>
                                               
                                                <div class="updatejobs__field col-xs-12 col-md-12">
                                                <label for="description" class="field__entry row col-75"><b>JOB DESCRIPTION</b></label>
                                                <textarea rows="4" cols="50" class="field__entry row col-75" name="description">${vac.getJobDescription()}</textarea>
                                       			<span class="error"><p id="desc_error"></p></span>
                                       			</div>


                                        <div class="updatejobs__nav">
                                           
                                               	<input type="submit" class="button col-xs-12 col-md-12" name="action" value="UPDATE">
    											<input type="submit" class="button col-xs-12 col-md-12" name="action" value="DELETE">
                                                <button type="reset" id="cancel" class="cancelbtn button col-xs-12 col-md-12">DISCARD</button>
                                        </div>

                                        
                                     </div>
                                </form>
                              </div>
                            </div>

						</c:forEach>
                            <div class="container__form-popup" id="myForm">
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