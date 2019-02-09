package servlets;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/P8q2")
public class P8q2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public P8q2() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter resposta = response.getWriter();
        resposta.write("<html><body>");
        resposta.write("<p>Olá, os parâmetros recebidos por essa requisição são:</p>");
        Enumeration<String> nomesParametros = request.getParameterNames();
        while (nomesParametros.hasMoreElements()) {
            String nameParam = nomesParametros.nextElement().toString();
            String valorParam = request.getParameter(nameParam); 
            if (valorParam.isEmpty()) {
            	continue;
            }else {
            	resposta.write(nameParam);
                resposta.write(" = ");
                resposta.write(valorParam);
                resposta.write(", ");
            }            
        }                
        resposta.write("</html></body>");
        resposta.close();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}	
}
