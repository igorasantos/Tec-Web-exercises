package servlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/AutenticaServlet")
public class AutenticaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String NOME = "nome";
    public AutenticaServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nomeUsuario = request.getParameter(NOME);
        String senhaUsuario = request.getParameter("senha");    	
        // valida se login e senha são válidos
        if (autenticar(nomeUsuario, senhaUsuario)) {
        	//se autenticar, esse servlet não gera html (só cria e mapeia atributos numa nova sessão, caso ela n exista ainda), repassa para o próximo
        	HttpSession sessao = request.getSession();
            sessao.setAttribute(NOME, nomeUsuario);
            request.getRequestDispatcher("MenuLogadoServlet").forward(request, response);
        } else {        	
        	PrintWriter out = response.getWriter();
        	out.write("<html><body>");
        	out.write("<p>Usuário e senha inválidos.</p>");
        	out.write("</body></html>");
        	out.close();
        }        
	}
	private boolean autenticar(String nomeUser, String senhaUser) { 
        return !("".equals(nomeUser) || "".equals(senhaUser) || nomeUser == null || senhaUser == null);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
    	out.write("<html><body>");
    	out.write("<h1 style=\"color:red;\">Pare!</h1>");
    	out.write("<h2>Espere aí</h2>");
    	out.write("<h3>Onde é que você pensa que vai?</h3>");
    	out.write("<pre>");
    	out.println("Plunct Plact Zum");
    	out.println("Não vai a lugar nenhum!!");
    	out.println("Plunct Plact Zum");
    	out.println("Não vai a lugar nenhum!!");
    	out.println();
    	out.println("Tem que ser iniciado, registrado, autenticado");
    	out.println("Avaliado, 'sessionado' se quiser voar!");
    	out.println("Se quiser voar");
    	out.println();
    	out.println(";P");
    	out.println();
    	out.write("</pre>");
    	out.write("<p><em>(Adaptado de \"Carimbador Maluco\", em homenagem ao eterno Raul)</em></p>");
    	out.write("<p style=\"color:red;\">Não tente acessar a aplicação no servidor diretamente pelo URL.</p>");
    	out.write("<p><a href=\"HTMLServlet\">É necessário autenticar-se.</a></p>");
    	out.write("</body></html>");
    	out.close();
	}
}