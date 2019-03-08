<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<style>
			ul{
				list-style-type: none;
				padding: 0 0 0 20px;
			}
		</style>
	</head>
	<body>
		<h1>Call Multiplication Table</h1>					
		<form action="b.jsp">
			<label for="multFactor">Type a number: </label><input type="number" name="multFactor" placeholder="Type a number"/><br>
			<input type="submit" value="Make multiplication table"/><br>
		</form>
	</body>
</html>