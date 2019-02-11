package servlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/SenhaServlet")
public class SenhaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SenhaServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//pegar
		PrintWriter out = response.getWriter();		
		
		String nomeUsuario = request.getParameter("nome");
		String emailUsuario = request.getParameter("email");
		
		//mostrar
		out.print("<html><body>");
		out.print("<h1>Dados do usuário</h1>");
		out.print("<p><strong>Nome: </strong>"+nomeUsuario+"</p>");
		out.print("<p style=\"border-bottom:3px solid grey;padding-bottom:10px;\"><strong>E-mail: </strong>"+emailUsuario+"</p>");
		//direcionar
		out.print("Cadastrar senha:");
		
		out.print("<form action=\"AutenticaServlet\" method=\"POST\">");
			out.write("<input type=\"password\" name=\"senha\">");
			out.write("<input type=\"hidden\" name=\"nome\" + value=\"" + nomeUsuario + "\">");
			out.write("<input type=\"submit\" value=\"Enviar\">");
		out.write("</form>");
		out.write("</body></html>");
		out.close();
	}	
}