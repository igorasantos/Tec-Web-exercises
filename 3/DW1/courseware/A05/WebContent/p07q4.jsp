<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%! String mensagens = ""; %>
	<%!
		public String gravar(String message){
			mensagens = mensagens + message + "<br>";
			return mensagens;
		}	
	%>	
	<% String email = request.getParameter("email"); %>
	<% String mensagem = request.getParameter("msg"); %>	
	<% gravar(mensagem); %>
	<% session.setAttribute("mail", email); %>	
	<% session.setAttribute("msgs", mensagens); %>            
</body>
</html>