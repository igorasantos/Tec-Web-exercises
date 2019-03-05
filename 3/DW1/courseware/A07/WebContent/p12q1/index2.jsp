<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<style>	
			* {
				  box-sizing: border-box;
			}
			header {
				background-color: red;
				/*background-color: #666;*/
				padding: 30px;
				text-align: center;
				font-size: 35px;
				color: white; 
			}	
			nav {
				background-color: yellow;
				/*background: #ccc;*/
				float: left;
			  	width: 30%;			  	
			  	padding: 20px;
			  	height: 200px; 
			}	
			section { 
				background-color: blue;
				/*background-color: #f1f1f1;*/
				float: left;
			  	padding: 20px;
			  	width: 70%;
			  	color: white;
			  	height: 200px;			  	
			}	
			footer { 
				background-color: green;
				padding: 10px;
			  	text-align: center;
			  	color: white;
			  	clear: both;
			}			
		</style>
	</head>
<body>
	<c:import var="headerData" url="/p12q1/header.jsp"/>
	<c:import var="navData" url="/p12q1/nav.jsp" />
	<c:import var="footerData" url="/p12q1/footer.jsp" />	
	<header>
		<c:out value="${headerData}" />
	</header>
	<nav>
		<c:out value="${navData}" />
	</nav>
	<section>
		Conteúdo principal - página 2.
	</section>
	<footer>
		<c:out value="${footerData}" />
	</footer>	
</body>
</html>