package servlets;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/P3_2_v3_CriaCookie")
public class P3_2_v3_CriaCookie extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public P3_2_v3_CriaCookie() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie meuCookie = new Cookie("MeuCookie","Andre");//nome do cookie e valor do cookie - sem acentos
		meuCookie.setMaxAge(60); //em segundos... -1 é cookie deletado quando o navegador é encerrado
		meuCookie.setSecure(false); 
		meuCookie.setComment("Primeiro Cookie");
		response.addCookie(meuCookie);
		String html = "<html>"
						+ "<head>"
							+ "<title>Criando um Cookie</title>"
						+ "</head>"
						+ "<body>"
							+"<h2>Seu cookie foi criado com sucesso!</h2>"
							+"<p><a href=\"P3_2_v3_VisualizaCookie\">Clique aqui para ver o cookie criado</a></p>"
						+ "</body>"
					+ "</html>";
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.print(html);
		out.close();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
}
