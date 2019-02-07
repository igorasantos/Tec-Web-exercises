package servlets;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/P8_ServletGetPost")
public class P8_ServletGetPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public P8_ServletGetPost() {
        super();        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter saida = response.getWriter();
		saida.write("<HTML><BODY><p>Olá! ");
		saida.write("Resposta para o método GET.</p>");
		saida.write("</BODY></HTML>");
		saida.close();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter saida = response.getWriter();
		saida.write("<HTML><BODY><p>Olá! ");
		saida.write("Resposta para o método POST.</p>");
		saida.write("</BODY></HTML>");
		saida.close();
	}
}
