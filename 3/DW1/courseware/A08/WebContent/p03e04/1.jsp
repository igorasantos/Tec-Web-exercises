<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="pt_BR" />
<!DOCTYPE html>
<html>
	<body>
		<fmt:setBundle basename="p03e04.messages1" scope="application"/>
		<p>
			<fmt:message key="message.helloWorld"/>
		</p>	
		<p>
			<%-- trecho em que o setBundle é substituído por um bundle específico --%>
			<fmt:bundle basename="p03e04.messages2">			
				<fmt:message key="message.helloWorld"/>				
			</fmt:bundle>
			<%-- fim trecho --%>
		</p>	
		<p>
			<fmt:message key="message.goodMorning">
				<fmt:param value="professor"/>
				<fmt:param value="Francisco"/>
			</fmt:message>
		</p>
	</body>
</html>