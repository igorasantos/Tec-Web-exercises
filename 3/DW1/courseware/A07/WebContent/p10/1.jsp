<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<body>
		<c:url value="/editProfile.do" var="profileLnk">
			<c:param name="id" value="${user.id}"/>
		</c:url>
		<a href='<c:out value="${profileLnk}"/>'>
			Edit Profile
		</a>		
	</body>
</html>