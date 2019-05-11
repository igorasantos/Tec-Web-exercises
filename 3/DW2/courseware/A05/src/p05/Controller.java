package p05;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/p05/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String selected = request.getParameter("categoria");
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		if (selected.equals("auto-ajuda")) {
			out.println(
				"<!DOCTYPE html>"+
				"<html>"+
					"<head>"+
						"<meta charset=\"UTF-8\">"+
						"<title>DW2 a05 p05</title>"+
					"</head>"+
					"<body>"+
					    "<form action=\"Controller\">"+
					       "<p>"+
					       "<select name=\"categoria\" size=\"5\" onchange=\"submit()\">"+
					         "<option value=\"ficcao\">Ficção</option>"+
					         "<option value=\"nao-ficcao\">Não-ficção</option>"+
					         "<option value=\"informatica\">Informática</option>"+
					         "<option value=\"auto-ajuda\">Auto-ajuda</option>"+
					       "</select>"+
					       "<select name=\"livro\" size=\"5\" style=\"width: 200px;\">"+
						       "<option value=\"O que se passa na cabeca dos cachorros\">O que se passa na cabeça dos cachorros</option>"+
						       "<option value=\"Transformando suor em ouro\">Transformando suor em ouro</option>"+
						       "<option value=\"O monge e o executivo\">O monge e o executivo</option>"+
						       "<option value=\"O verdadeiro poder\">O verdadeiro poder</option>"+
						       "<option value=\"Qual e a tua obra? - Inquietacoes propositivas\">Qual é a tua obra? - Inquietações propositivas</option>"+
						       "<option value=\"Fora de serie - Outliers\">Fora de série - Outliers</option>"+
						       "<option value=\"O futuro hoje\">O futuro hoje</option>"+
						       "<option value=\"PMBOK - Guia do conjunto de conhecimentos\">PMBOK - Guia do conjunto de conhecimentos</option>"+
						       "<option value=\"Os 7 habitos das pessoas altamente eficazes\">Os 7 hábitos das pessoas altamente eficazes</option>"+
						       "<option value=\"Faca como Steve Jobs\">Faça como Steve Jobs</option>"+
					       "</select>"+
					       "</p>"+
					    "</form>"+    
				    "</body>"+
				"</html>");
			out.close();
		} else {
			out.write(
				"<!DOCTYPE html>"+
				"<html>"+
					"<head>"+
						"<meta charset=\"UTF-8\">"+
						"<title>DW2 a05 p05</title>"+
					"</head>"+
					"<body>"+
					    "<h1>Este gênero não tem livros disponíveis</h1>"+
					    "<p>Valor de selected: "+selected+"</p>"+
				    "</body>"+
				"</html>"
		    );
			out.close();
		}
	}
}