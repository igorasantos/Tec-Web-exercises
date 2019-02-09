package servlets;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/P7q3_Menu")
public class P7q3_Menu extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public P7q3_Menu() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request,response);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter resposta = response.getWriter();
        resposta.write("<html><body>");
        HttpSession sessao = request.getSession(false);
        if (sessao == null || sessao.getAttribute(P6_1_Login.USUARIO) == null) {
            resposta.write("<p><a href=\"p6login.html\">Faça primeiro o seu login</a></p>");
        } else {
        	resposta.write("<p>Bem vindo! Você está autenticado.</p>");
            resposta.write("<p><strong>Operações disponíveis:</strong></p>");
            resposta.write("<ul><li><a href=\"A03_p10.html\">1. Cadastro (link vai quebrar)</a></li>");
            // Novas opções de funcionalidades entram aqui!
            resposta.write("</ul>");
        }
        resposta.write("</body></html>");
        resposta.close();
	}	
}
