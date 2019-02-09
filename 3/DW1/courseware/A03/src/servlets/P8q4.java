package servlets;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/P8q4")
public class P8q4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public P8q4() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter resposta = response.getWriter();
        resposta.write("<html><body>");
        resposta.write("<p>Olá, os nomes dos cabeçalhos da requisição recebida são:</p>");
        Enumeration<String> nomesHeaders = request.getHeaderNames();
        while (nomesHeaders.hasMoreElements()) {
        	resposta.write(nomesHeaders.nextElement().toString());            
            resposta.write(", ");
        }               
        resposta.write("</html></body>");
        resposta.close();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}	
}
