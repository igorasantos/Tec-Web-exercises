package servlets;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/P5q2")
public class P5q2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String USUARIO = "usuario";
    public P5q2() {
        super();
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
            resposta.write("<p>Bem vindo, " + nomeUsuario+"</p>");
        } else {
        	resposta.write("<p>Usuário e senha inválidos.</p>");
        }
        resposta.write("</body></html>");
        resposta.close();
	}
	private boolean autenticar(String nomeUser, String senhaUser) {
        return !("".equals(nomeUser) || "".equals(senhaUser) || nomeUser == null || senhaUser == null || !"jose".equals(nomeUser) || !"12345".equals(senhaUser));
	}
}
