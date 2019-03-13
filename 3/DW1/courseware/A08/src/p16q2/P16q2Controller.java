package p16q2;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/P16q2Controller")
public class P16q2Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public P16q2Controller() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessao = request.getSession();
		Usuario user = new Usuario(0,"John");
		sessao.setAttribute("usuarioLogado", user);		
		request.getRequestDispatcher("p16q2/test.jsp").forward(request,response);
	}		
}