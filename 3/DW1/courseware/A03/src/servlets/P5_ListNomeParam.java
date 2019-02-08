package servlets;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/P5_ListNomeParam")
public class P5_ListNomeParam extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public P5_ListNomeParam() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter resposta = response.getWriter();
        resposta.write("<html><body>");
        resposta.write("<p>Olá, os parâmetros recebidos por essa requisição são:</p>");
        resposta.write("<p>(solução com toString():)</p>");
        Enumeration<String> nomesParametros = request.getParameterNames();
        while (nomesParametros.hasMoreElements()) {
             resposta.write(nomesParametros.nextElement().toString());
             resposta.write(", ");
        }                
        resposta.write("</html></body>");
        resposta.close();
	}
}
