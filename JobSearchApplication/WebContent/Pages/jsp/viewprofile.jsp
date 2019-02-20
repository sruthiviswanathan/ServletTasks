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
<%
			if(session.getAttribute("email")==null){
				response.sendRedirect("http://localhost:8080/JobSearchApplication/index.jsp");
			}
		%> 
    <div class="container">
        <div id="mySidenav" class="container__sidenav">
          	<div class="sidenav__items">
                        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                        <a href="${Config.BASE_PATH}Pages/jsp/findjob.jsp">FIND JOB</a>
                        <a href="${Config.BASE_PATH}Pages/jsp/findcompany.jsp">FIND COMPANY</a>
                         <a href="${Config.BASE_PATH}Pages/jsp/searchbylocation.jsp">SEARCH BY LOCATION</a>
                        <a href="${Config.BASE_PATH}UserProfileServlet">YOUR PROFILE</a>
                        <a href="${Config.BASE_PATH}Pages/jsp/requestvacancy.jsp">REQUEST A VACANCY</a>
                        <a href="${Config.BASE_PATH}ViewAppliedJobsServlet">VIEW APPLIED JOBS</a>
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
			<h3>YOUR PROFILE!!!</h3>
		</div>						

        <div class="container__profile">
            <form action="${Config.BASE_PATH}UserProfileServlet" name ="update" id="update"  onsubmit="return updateUser()" method="post">
               
             
          
                <c:forEach var="data" items="${userData}">
             <div class="profile__field col-xs-12 col-md-12">     
                    <label for="uname" class="field__entry row col-25"><b>USERNAME*</b></label>
                    <input type="text" class="field__input row col-75" id="uname" name="username" value="${data.getUserName()}">  
                     <span class="error"><p id="name_error"></p></span>                     
                    </div>
                    
             <div class="profile__field col-xs-12 col-md-12">          
                        <label for="cname" class="field__entry row col-25"><b>COMPANY NAME*</b></label>
                        <input type="text" class="field__input row col-75" id="cname" name="cname" value="${data.getCompany()}" >
                         <span class="error"><p id="comp_error"></p></span> 
                    </div>
                    
                       <div class="profile__field col-xs-12 col-md-12">
                        <label for="designation" class="field__entry row col-25"><b>DESIGNATION*</b></label>
                        <input type="text" class="field__input row col-75" id="desig" name="designation" value="${data.getDesignation()}">
                        <span class="error"><p id="des_error"></p></span> 
                   	 </div>
                       <div class="profile__field col-xs-12 col-md-12">
                        <label for="skills" class="field__entry row col-25"><b>SKILLS SAVED IN YOUR PROFILE</b></label>
                       
                        <div class="field__entry checkbox col-75">
							
							
							<%-- <c:forEach var="tech" items="${technologies}">	
																				
							<input type="checkbox" name="tech" value="${tech.getTechnologyId()}"><c:out
											value="${tech.getTechnology()}" />	
							</c:forEach> --%>
								<%-- <%@ page import="com.zilker.onlinejobsearch.beans.UserTechnologyMapping"%>  
								<%@page import="java.util.ArrayList" %>

									<%  
									ArrayList<UserTechnologyMapping> list = new ArrayList<UserTechnologyMapping>();
									list = (ArrayList<UserTechnologyMapping>) request.getAttribute("userTech");
									%>  --%>
								
									
						
							 
								<c:forEach var="tech" items="${technologies}">
						
									<c:forEach var="user" items="${userTech}"> 		
									
									<c:set var="tech1" value="${user.getTechnologyId()}" />	
									<c:set var="tech2" value="${tech.getTechnologyId()}" />
									
									<c:choose>
									<c:when test="${tech1 == tech2}">
										<input type="checkbox" name="tech"
											value="${tech.getTechnologyId()}" checked="checked">
										<c:out value="${tech.getTechnology()}" />
									</c:when>
									</c:choose>
									</c:forEach>
									
									
									<c:set var="tech1" value="${user.getTechnologyId()}" />	
									<c:set var="tech2" value="${tech.getTechnologyId()}" />
									
									<c:choose>
									<c:when test="${tech1 != tech2}">
										<input type="checkbox" name="tech"
											value="${tech.getTechnologyId()}">
										<c:out value="${tech.getTechnology()}" />
									</c:when>
									</c:choose>
								
								
							</c:forEach>


						</div>
						</div>
					</c:forEach>
             
                <div class="profile__nav">
                    <input type="submit" class="button col-xs-12 col-md-12" value="UPDATE" name="Submit">  
                    <button type="reset" id="cancel" class="button cancelbtn col-xs-12 col-md-12">CANCEL</button>
                </div>
            </form>
        </div>
    </div>
</body>
<script src="${Config.BASE_PATH}Pages/js/styles.js"></script>
<script src="${Config.BASE_PATH}Pages/js/validate.js"></script>
</html>