package servlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/HTMLServlet")
public class HTMLServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public HTMLServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.print("<html><body>");
		out.print("<h1>Instituto Metrópole Digital</h1>");
		out.print("<p><strong>Disciplina:</strong> Desenvolvimento Web 1</p>");
		out.write("<form action=\"SenhaServlet\" method=\"get\">");
		out.write("Nome: <input type=\"text\" name=\"nome\">");
		out.write("E-mail: <input type=\"text\" name=\"email\">");
		out.write("<input type=\"submit\" value=\"Enviar\">");
		out.write("</form>");
		out.write("</body></html>");
		out.close();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
