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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${Config.BASE_PATH}Pages/css/viewjobs.css">
<link rel="stylesheet" href="${Config.BASE_PATH}Pages/css/navbar.css">

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
				<li>JOB HUNT</li>
				<a href="#">
					<li style="float: right"><i class="fa fa-user-circle"
						aria-hidden="true"></i>LOGOUT</li>
				</a>
				<button class="arrow" id="btn" onclick="displaymenu(this.id)">
					<i class="fa fa-arrow-left" aria-hidden="true"></i>
				</button>
			</ul>
		</div>
		<%@ page import="com.zilker.onlinejobsearch.beans.Company"%>
		<%@page import="java.util.ArrayList"%>
		<div class="split left">
			<div class="jobs">
				
				<div class="row row1">
			<c:forEach var="location" items="${retrieveByLocation}" varStatus="loop">
					
						<div class="card col-sm-6 col-xs-height">
							<h4>
								<b><c:out value="${location.getJobRole()}" /></b>
							</h4>
							<p>
								<c:out value="${location.getCompanyName()}" />
							</p>
							<p>
								<c:out value="${location.getLocation()}" />
							</p>
							<button class="btn${loop.count}" id="button"
								onclick="displayjobs(this.getAttribute('class'))">VIEW
								MORE</button>
						</div>
			</c:forEach>
					
				</div>
			</div>
		</div>
		<c:forEach var="location" items="${retrieveByLocation}" varStatus="loop">
		
			
				<div class="split right rightside btn${loop.count}">


					<div class="header" id="myHeader">

						<div class="row">

							<div class="col-60 col-xs-12 col-md-12">
								<img
									src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAw1BMVEU4ccgnT4z///8dSYkmTYgMQoYvbMfd5Ozc4eyEpNk5cssxbsfy9fgSRIcXR4iXpsKtuc5wlNPBy9pwha7L0uCos8svXqV6kLU2bL5yiq+hrcfm6PBUc6MAP4Ts7/NifKje5vW6xdVMaZw2a7/O2u5BYpgAMn6Yp8I1WZIvVpEAOIGOn74zaLYUWK9QbZ1ljc+Gmbu0x+chZcUdVaKlvuNHfMvC0epXhc+Yst7U3vJRgc2Xr9Vnf6hHbq5piL8qZbsYTJTaLOeBAAAIA0lEQVR4nO3bC1vaOhgHcENoYbSNDKrIpTB1DJUdhnrc5cxz3Pf/VKdt0tJCgr2kSdze/575sFY0v71pkl44OYFAIBAIBAKBQCAQCAQCgUAgEAgEAoFAIBAIBAKBQCAQCAQCgUAgEAgEAoFAIBAIBAKBQCAQCAQCgUDi9E56Pd1taC6ObdtOmOhrfutBHP7maIe5cexv3+9/fAjz8f7dU9pU5/07Xp7+4W4Od2hFHIljv//Q2sX9+s2mO+zs5l1m77ibW63FtV6IKM7Jx/2mfn+I9wiEm7FIiC9MPJDtb+5hW+/jKgqEVyOhEF2bR3S+cBv7MyKKaigWtpFxVXRO5qx53clw8bz1k9b+20uF/iAXf7lItkzj/Z1kxwYjZBzR/kpB05nlYYyJtezQDZePqXAZWLkgzF58msT713fJjjCmVTHpo34Q/fdHwRYjkvOTByq8QoJ4Z/H+U5LfbBTxgZZwnmkf3lDhDJ/blYSGVZFqRtk2eoNuf7u5CZv6WK2GJlXRoXP3FOcbbnkk3uJ1qgnb5kwa9j0dVSyBoMsbaQrU0JwqsqFkzWliRtjNpXNbQGjMsWjTyXCY9FIvUyqSCvdy2y5QQ2OIc7YWoc1aXmYyIQIhKiIMY8ax6OaEV1lIN6gnNKSKtIbPVIiLCYschzQGEB/ownJ7XDjczLJBhYUGEB/omeHEow3a8IVLnEtxoQEd1f47bqLP5ribbZTR2Z6w/JpmF93DjfM+bqK7ZO3BJIz1LFGovYo2HUzPsosaPJQp1E1ky7bWVebowlJrqJvoPFHh/MZLm418uULNRDbWtNyRF57jE8+6nRyOpZaXSwoqJtQ9ojrJ1aZ5fzseTdLrNK1OKvT30vdKCXVX0Xmat7hZi9alUXVLCvVOGs7TlKOYP3uic4sqQs1VfDk78K29aHCVKNR8LL4s+5mu6vojQo80dhVjP5094aqAUPdwc22hxerS73b9wWR4s7uyuBjyskgnz804+rdwNslH7wLuIlywRfNA+Dd7VQrzs/cNxYC6O+pF0WbWiVZi7/q3J6qooubh5g+oYu8PqOLvP9ycqOmoDQKcOPwt9FVUxfzcR8I5kuymPPEMuf8mD7cFxMamfudL9MDMhx+fM9s+xpv+c8LzxPjVzxdE+p38jQr/cjK8ZSdMxO/yMiCIbHNvixZHyOMCmzsWk8tO+HP6Cxy6HB0/JrdK+78uPJ+zFHUndO1pcZ7bCDO1EDk92Do/Q9z1TmPEREhQSnSSOzPnidA7f+EJwxOK8sLQuBEsypsh7oTthJgK24+JsP3r4PkhGt8rL2y1FiqJO2FKTIXIGjAhsvg1bLVGWCiceyKheyVYmDcx3GSECfGI8HI8irNdX7LGRqeFTLga5RP+ACbsjOP3TAbpYzr8+8uNHItZISMeEU6CaNSPH7G5YYW7TYUL72C2YEL/jhASXbMj20zpFXXUnJASjwl3Qz2hF8Gjm3BW/oZjJokwOf9H1oy+axocfG9TVcwLUTSiFhOim7QaJYTIW9G3zYSnyLKPxX1hWMWCwlu3ihCx3j0RX8aRXMV9YUi0CwmTp6Q2JYUB/ZldQTeVT0yEd+njMcFfRYT4ju5rkXSkmQUeif6wL5gvZJvmHNmO2IAw93hMSyhcfQriWGjGgNFzRUw4n+YSXebnCDF9DjW9O9k4MREehid053Hc3RQfNZQ/4w8svnCR9u4jkTjclBMeZExKC9l8wTlqc1WURqwljO9jlBWyEer5lSuq0og1hJ01Ow/iC/3jNXxNKK2jJsJ1Jm4RoY+DZIZhwtPcVf7xAh89DsVTflpFqUI3IGmsI7MFulkOGXY62xPur0sRX8g+l1Hgvoacjnow44dtOD4f4oAtvNzkNK/UjE/W9M2vAyURywvDZUmf9dRl7jgsJrToeVdH8HyufGIVIQrYDeJ57jpNMSGiP/2Mf0EqHylnGpWE+IoVsR+UFRJ2GL4+0NDUJ1YSpudAVFVCiAktv+j8sAFiNSEibPE6zQqPnOPTS8Je+uEb4Tn+fup31IpCvGRFPLMy8+E4n6v0Os1z/O9t+mCO4DpNI1WsKETemjV2KbzW1loTwbW2V5bdcqtYVYgC1k/DU1mRcCsSPhd5EiVDrLWAqyxM++naKykUXvMWp04VKwvTfuouA1EvxWR1sHG6Kv6chhSi86UTpZv9rX68KRz8vX70YnpKkle5z9GQQfx900nQ7fAyHWG8nWY2dP3BaoGLTPVSib3Hg8dfds/H7N8IzP9Wkk4KwvuHuRuIXu6mo0LiueimJYtwd/uV/TJTa0R9lWhI6nyu/40Q/4Aq1jjr753rbnyxVBe+lSrWEL4RYh3h2yDWEr4JYj3hWyDWFL4BYl2h+cTaQuNXNxKEhhNlCM3uqDKEZhOlCI0myhGaTJQkNJgoS2guUZrQ2ElDotDQKkoUGkqUKTSTKFVoJFGu0ESiZKGBRNlC84jShcYR5QtNIzYgNIzYhNCsBVwzQpOq2IzQJGJDQoOITQnNITYmNIbYnNAUYoNCQ4hNCs0gNio0gtis0ARiw0IDFnCNC7VXsXGhdmLzQt1EBULNRBVCvUQlQq1ENUKdk4Yqob4qqhLqIyoTaiOqE+oiKhRqIqoU6iEqFWohqhXqICoWaiCqFqonKhcqX8BpECquogah4ipqESqtohah0ipqEiqsoiahQqIuobqOqk+oqor6hKqIGoWKOqpWoRKiXqGKjqpXqIKoWaigo+oGNv+h9/8BGynv7LIgbMcAAAAASUVORK5CYII="
									alt="gethired" />

							</div>
							<div class="col-60 col-xs-12 col-md-12">
								<h3>
									<c:out value="${location.getCompanyName()}" />
									/
									<c:out value="${location.getJobRole()}" />
									/
									<c:out value="${location.getLocation()}" />
								</h3>
							</div>
							<div class="col-60 col-xs-12 col-md-12">
								<a href="#"><button class="col-xs-12" id="button"
										type="submit">
										APPLY FOR JOB<i class="fa fa-chevron-circle-right"
											aria-hidden="true"></i>
									</button></a>
							</div>

						</div>

					</div>
					<div class="content">
								
								<p>	JOB DESIGNATION:
								<c:out value="${location.getJobRole()}" />
								</p>
								<p>COMPANY NAME:
								<c:out value="${location.getCompanyName()}" />
								</p>
								<p>JOB DESCRIPTION:
								<c:out value="${location.getJobDescription()}" />
								</p>	
								<p>LOCATION:
								<c:out value="${location.getLocation()}" />
								</p>
								<p>	SALARY:
								<c:out value="${location.getSalary()}" />
								</p>
								<p>	VACANCY COUNT:
								<c:out value="${location.getVacancyCount()}" />
								</p>
					</div>
				</div>

			
		</c:forEach>
	
	</div>
</body>
<script src="${Config.BASE_PATH}Pages/js/styles.js"></script>

</html>