package servlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/MenuLogadoServlet")
public class MenuLogadoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MenuLogadoServlet() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request,response);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter(); 
		out.write("<html><body>");
		HttpSession sessao = request.getSession(false);
		if (sessao == null || sessao.getAttribute("nome") == null) {
            out.write("<p><a href=\"HTMLServlet\">Faça primeiro o seu login.</a></p>");
        } else {
        	String nomeU = sessao.getAttribute(AutenticaServlet.NOME).toString();
        	out.write("<h1 style=\"color:green;\">Bem vindo(a), " + nomeU +"!</h1>");
        	out.write("<p>Você está autenticado(a).</p>");
            out.write("<p style=\"margin-top:35px;\">And...");
            out.write("<h2 style=\"color:gold;\">That's all Folks!</h2");
        }
        out.write("</body></html>");
        out.close();
	}		
}