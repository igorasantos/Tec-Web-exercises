<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
	<body>
		<%
			HttpSession sessao = request.getSession();
		
			List<String> listaEmails;	
			if (session.getAttribute("listMails") != null) {
				listaEmails = (List<String>) sessao.getAttribute("listMails");
			} else{
				listaEmails = new ArrayList<String>();				
			}
			listaEmails.add(request.getParameter("email"));
			sessao.removeAttribute("listMails");
			sessao.setAttribute("listMails", listaEmails);
			
			List<String> listaMensagens;
			if (sessao.getAttribute("listMsgs") != null) {
				listaMensagens = (List<String>) sessao.getAttribute("listMsgs");
			} else{
				listaMensagens = new ArrayList<String>();				
			}
			listaMensagens.add(request.getParameter("message"));
			sessao.removeAttribute("listMsgs");
			sessao.setAttribute("listMsgs", listaMensagens);
		 %>	
		 <p><a href="listarMensagens.jsp">Listar Mensagens.</a></p>	
	</body>
</html>