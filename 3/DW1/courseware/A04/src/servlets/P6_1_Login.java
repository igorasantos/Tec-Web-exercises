package servlets;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/P6_1_Login")
public class P6_1_Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String USUARIO = "usuario";
    public P6_1_Login() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request,response);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter resposta = response.getWriter();
        resposta.write("<html><body>");
        String nomeUsuario = request.getParameter(USUARIO);
        String senhaUsuario = request.getParameter("senha");
        // valida se login e senha são válidos
        if (autenticar(nomeUsuario, senhaUsuario)) {
        	HttpSession sessao = request.getSession();
            sessao.setAttribute(USUARIO, nomeUsuario);
            request.getRequestDispatcher("P6_2_Menu").forward(request, response);
        } else {
        	resposta.write("<p>Usuário e senha inválidos.</p>");
        }
        resposta.write("</body></html>");
        resposta.close();
	}
	private boolean autenticar(String nomeUser, String senhaUser) {
        // Aqui seria implementado o código de autenticação.
        // Nesse bloco atual, verifica-se apenas se é diferente de nulo ou vazio
        return !("".equals(nomeUser) || "".equals(senhaUser) || nomeUser == null || senhaUser == null);
	}
}
