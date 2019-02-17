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
         <div class="maincontainer">
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
                
               
                
                 <div class="container__searchbar">
               
                        <form action="${Config.BASE_PATH}SearchByLocation" method="post">
                                <div id="parent">
                                 <div class="searchbar__row">   
                                 
                                <div class="col-20 col-xs-12 col-sm-12">
                                        <label for="job" class="row__label">SEARCH BY LOCATION</label>
                                </div>
 
                                <div class="col-60 col-xs-12 col-sm-12">
                                        <input type="text" class="row__input" name="location" placeholder="Enter a Location.."
                                                required><i class="icon fa fa-map-marker" aria-hidden="true"></i>
                                </div>
 
                                <div class="col-10 col-xs-12 col-sm-12">
                                        <input type="submit" class="row__button col-xs-12 col-sm-12" value="SEARCH">
                                </div>
                                 
                                <div>
                				 <c:out value = "${flag}"/>
                				</div>
                				
                				</div>
                				</div>
                			
                        </form>
                </div>
              
                <div class="container__title">
                        <h3>POPULAR COMPANIES</h3>
                </div>
                <div class="container__maincard">
                        <div class="maincard__card col-sm-6 col-xs-height">
                                <div class="card__container">
                                        <a href="companydetails.html"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoaW4BTgOUrtjclwmlgttyWsHv0ykHPDWgg_J0lCZHdNu5T4vY"
                                                        alt="Avatar" style="width:50%"></a>
                                        <h4><b>Company Name</b></h4>
                                        <p>Overall Rating</p>
                                </div>
                        </div>
                        <div class="maincard__card col-sm-6 col-xs-height">
                                <div class="card__container">
                                        <a href="companydetails.html"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoaW4BTgOUrtjclwmlgttyWsHv0ykHPDWgg_J0lCZHdNu5T4vY"
                                                        alt="Avatar" style="width:50%"></a>
                                        <h4><b>Company Name</b></h4>
                                        <p>Overall Rating</p>
                                </div>
                        </div>
                        <div class="maincard__card col-sm-6 col-xs-height">
                                <div class="card__container">
                                        <a href="companydetails.html"> <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoaW4BTgOUrtjclwmlgttyWsHv0ykHPDWgg_J0lCZHdNu5T4vY"
                                                        alt="Avatar" style="width:50%"></a>
                                        <h4><b>Company Name</b></h4>
                                        <p>Overall Rating</p>
                                </div>
                        </div>
                        <div class="maincard__card col-sm-6 col-xs-height">
                                <div class="card__container">
                                        <a href="companydetails.html"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoaW4BTgOUrtjclwmlgttyWsHv0ykHPDWgg_J0lCZHdNu5T4vY"
                                                        alt="Avatar" style="width:50%"></a>
                                        <h4><b>Company Name</b></h4>
                                        <p>Overall Rating</p>
                                </div>
                        </div>
                        <div class="maincard__card col-sm-6 col-xs-height">
                                <div class="card__container">
                                        <a href="companydetails.html"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoaW4BTgOUrtjclwmlgttyWsHv0ykHPDWgg_J0lCZHdNu5T4vY"
                                                        alt="Avatar" style="width:50%"></a>
                                        <h4><b>Company Name</b></h4>
                                        <p>Overall Rating</p>
                                </div>
                        </div>
                        <div class="maincard__card col-sm-6 col-xs-height">
                                <div class="card__container">
                                        <a href="#"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoaW4BTgOUrtjclwmlgttyWsHv0ykHPDWgg_J0lCZHdNu5T4vY"
                                                        alt="Avatar" style="width:50%"></a>
                                        <h4><b>Company Name</b></h4>
                                        <p>Overall Rating</p>
                                </div>
                        </div>
                        <div class="maincard__card col-sm-6 col-xs-height">
                                <div class="card__container">
                                        <a href="#"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoaW4BTgOUrtjclwmlgttyWsHv0ykHPDWgg_J0lCZHdNu5T4vY"
                                                        alt="Avatar" style="width:50%"></a>
                                        <h4><b>Company Name</b></h4>
                                        <p>Overall Rating</p>
                                </div>
                        </div>
                        <div class="maincard__card col-sm-6 col-xs-height">
                                <div class="card__container">
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