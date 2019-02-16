<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%! String email = request.getParameter("email"); %>
	<%! String mensagem = request.getParameter("msg")+"\n"; %>
	<%! String mensagens; %>
	<%! mensagens = mensagem + mensagens;%>
	<%! sessao.setAttribute("mail", email); %>
	<%! sessao.setAttribute("msgs", mensagens); %>
            
            
</body>
</html>