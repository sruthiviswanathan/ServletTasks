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
<link rel="stylesheet" href="Pages/css/index.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
<title>LOGIN/SIGNUP</title>
</head>

<body>

<div class = container>
	<div class="container__bgimage bgimage--mod ">
		<div class="bgimage__text text--mod">
			<h3>HIRING AND GETTING HIRED JUST GOT EASIER WITH US!!!SIGN IN TO CONTINUE</h3>
				<div class="bgimage__text__nav nav--mod">
					<a href="${Config.BASE_PATH}LoginServlet">
					<button class="nav__button button--mod"type="submit">SIGN IN</button>
					</a>
				</div>
		<div class="bgimage__overlay">
						<h3>TESTIMONIALS</h3>
					<p>"We've hired several qualified applicants who report first seeing the position on JOBHUNT, and we'll definitely utilize your free services again in future recruiting efforts. It's been great working with you!"																																															
						-Tata Communications</p>
					<p>"We had great success using JOBHUNT. We not only got a lot of applicants, but we also got quality candidates and ended up hiring someone who applied as a result of the posting. It is a huge success story for us at Forrester, and I've shared this great resource with all of our recruiters for our future remote staffing needs."
					    -Forrester</p>	
					 <p>"JOBHUNT is the first place we go to post a job opening. It consistently delivers a quality applicant flow and we are very happy."
					      -VaVa Virtual Assistants</p>					
		</div>		
		</div>
		
	</div>
</div>

</body>
</html>