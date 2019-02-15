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
		</div>
	</div>
</div>

</body>
</html>