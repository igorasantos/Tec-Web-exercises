package p07;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/p07/Controller/infos/info"})
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getServletPath();
		String resposta = "";
		if (acao.equals("/p07/Controller/infos/info")) {
			request.setCharacterEncoding("UTF-8");
			String method = request.getParameter("method");
			resposta = "info-"+method+".json";
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().write(resposta);
		 	response.flushBuffer();
		}
	}		
}