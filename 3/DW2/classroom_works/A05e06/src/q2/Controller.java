package q2;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/q2/Controller/receitas/html","/q2/Controller/receitas/todas","/q2/Controller/receitas/receita"})
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getServletPath();
		String resposta = "";
		switch (acao) {
			case "/q2/Controller/receitas/html":
				resposta = "/q2/q2.jsp";				
				request.getRequestDispatcher(resposta).forward(request, response);
				break;
			case "/q2/Controller/receitas/todas":
				request.setCharacterEncoding("UTF-8");
				resposta = "receitas.json";
				response.setContentType("application/json; charset=UTF-8");
				response.getWriter().write(resposta);
				response.flushBuffer();
				break;
			case "/q2/Controller/receitas/receita":
				request.setCharacterEncoding("UTF-8");
				String id = request.getParameter("id");
				resposta = "receita-"+id+".json";
				response.setContentType("application/json; charset=UTF-8");
				response.getWriter().write(resposta);
			 	response.flushBuffer();			 	
				break;				
		}		
	}	
}