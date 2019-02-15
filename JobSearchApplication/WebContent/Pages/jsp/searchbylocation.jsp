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
        <title>Find Jobs</title>
        <link rel="stylesheet" href="${Config.BASE_PATH}Pages/css/mainpage.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
        <div id="main">
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
                               <a href="${Config.BASE_PATH}LogoutServlet">
					<li style="float: right"><i class="fa fa-user-circle"
						aria-hidden="true"></i>LOGOUT</li>
								</a>
                        </ul>
                </div>
                
               
                
                
                <div class="row">
                        <form action="${Config.BASE_PATH}SearchByLocation" onclick= "searchByLocation()" method="post">
                               <div id="parent">
                                <div class="col-20 col-xs-12 col-sm-12">
                                        <label for="job">SEARCH BY LOCATION</label>
                                </div>
                                <div class="col-60 col-xs-12 col-sm-12">
                                        <input type="text" name="location" placeholder="Enter a Location.."
                                                required><i class="icon fa fa-map-marker" aria-hidden="true"></i>
                                </div>
                                <div class="col-10 col-xs-12 col-sm-12">
                                        <input type="submit" class="col-xs-12 col-sm-12" value="SEARCH">
                                </div>
                                 <div>
                				 <c:out value = "${flag}"/>
                				</div>
                				</div>
                        </form>
                </div>
               <%--  <c:if test = "${flag != ''}">
                
                <c:out value = "${flag}"/>
                 				<div class="alert">
  								<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  								<p><c:out value = "${flag}"/><p>
								</div> 
         		
      			</c:if> --%>
                
                
                    		
               <%--  <form action="${Config.BASE_PATH}SearchByLocation" method="post">
                      
                        <div class="row">
                                <div class="col-25  col-sm-12 col-xs-12">
                                        <label for="lname">LOCATION</label>
                                </div>
                                <div class="col-75  col-sm-12 col-xs-12">
                                        <input type="text" id="location" name="location" placeholder="Enter a Location.."
                                                required><i class="icon fa fa-map-marker" aria-hidden="true"></i>
                                </div>
                        </div>
                        <div class="row">
                                <input type="submit" value="FIND JOBS">
                        </div>
                </form> --%>
                <div class="tit">
                        <h3>POPULAR COMPANIES</h3>
                </div>
                <div class="maincard">
                        <div class="card col-sm-6 col-xs-height">
                                <div class="container">
                                        <a href="companydetails.html"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoaW4BTgOUrtjclwmlgttyWsHv0ykHPDWgg_J0lCZHdNu5T4vY"
                                                        alt="Avatar" style="width:50%"></a>
                                        <h4><b>Company Name</b></h4>
                                        <p>Overall Rating</p>
                                </div>
                        </div>
                        <div class="card col-sm-6 col-xs-height">
                                <div class="container">
                                        <a href="companydetails.html"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoaW4BTgOUrtjclwmlgttyWsHv0ykHPDWgg_J0lCZHdNu5T4vY"
                                                        alt="Avatar" style="width:50%"></a>
                                        <h4><b>Company Name</b></h4>
                                        <p>Overall Rating</p>
                                </div>
                        </div>
                        <div class="card col-sm-6 col-xs-height">
                                <div class="container">
                                        <a href="companydetails.html"> <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoaW4BTgOUrtjclwmlgttyWsHv0ykHPDWgg_J0lCZHdNu5T4vY"
                                                        alt="Avatar" style="width:50%"></a>
                                        <h4><b>Company Name</b></h4>
                                        <p>Overall Rating</p>
                                </div>
                        </div>
                        <div class="card col-sm-6 col-xs-height">
                                <div class="container">
                                        <a href="companydetails.html"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoaW4BTgOUrtjclwmlgttyWsHv0ykHPDWgg_J0lCZHdNu5T4vY"
                                                        alt="Avatar" style="width:50%"></a>
                                        <h4><b>Company Name</b></h4>
                                        <p>Overall Rating</p>
                                </div>
                        </div>
                        <div class="card col-sm-6 col-xs-height">
                                <div class="container">
                                        <a href="companydetails.html"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoaW4BTgOUrtjclwmlgttyWsHv0ykHPDWgg_J0lCZHdNu5T4vY"
                                                        alt="Avatar" style="width:50%"></a>
                                        <h4><b>Company Name</b></h4>
                                        <p>Overall Rating</p>
                                </div>
                        </div>
                        <div class="card col-sm-6 col-xs-height">
                                <div class="container">
                                        <a href="#"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoaW4BTgOUrtjclwmlgttyWsHv0ykHPDWgg_J0lCZHdNu5T4vY"
                                                        alt="Avatar" style="width:50%"></a>
                                        <h4><b>Company Name</b></h4>
                                        <p>Overall Rating</p>
                                </div>
                        </div>
                        <div class="card col-sm-6 col-xs-height">
                                <div class="container">
                                        <a href="#"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoaW4BTgOUrtjclwmlgttyWsHv0ykHPDWgg_J0lCZHdNu5T4vY"
                                                        alt="Avatar" style="width:50%"></a>
                                        <h4><b>Company Name</b></h4>
                                        <p>Overall Rating</p>
                                </div>
                        </div>
                        <div class="card col-sm-6 col-xs-height">
                                <div class="container">
                                        <a href="#"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoaW4BTgOUrtjclwmlgttyWsHv0ykHPDWgg_J0lCZHdNu5T4vY"
                                                        alt="Avatar" style="width:50%"></a>
                                        <h4><b>Company Name</b></h4>
                                        <p>Overall Rating</p>
                                </div>
                        </div>
                </div>
        </div>
</body>
<script src="${Config.BASE_PATH}Pages/js/styles.js"></script>

</html>