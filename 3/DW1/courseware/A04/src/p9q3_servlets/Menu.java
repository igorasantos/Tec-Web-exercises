package p9q3_servlets;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/p9/Menu")
public class Menu extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Menu() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request,response);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter resposta = response.getWriter();
        resposta.write("<html><body>");
        HttpSession sessao = request.getSession(false);
        if (sessao == null || sessao.getAttribute(Login.USUARIO) == null) {
            resposta.write("<p><a href=\"login.html\">Faça primeiro o seu login</a></p>");
        } else {
        	resposta.write("<p>Bem vindo! Você está autenticado.</p>");
            resposta.write("<p><strong>Operações disponíveis:</strong></p>");
            resposta.write("<ol>");
            resposta.write("<li><a href=\"CadastroControl\">Cadastro</a></li>");
//            request.getRequestDispatcher("CadastroControl").forward(request, response);
            // Novas opções de funcionalidades entram aqui!
            resposta.write("</ol>");
        }
        resposta.write("</body></html>");
        resposta.close();
	}	
}
