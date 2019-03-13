package p14;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/P14Controller")
public class P14Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public P14Controller() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessao = request.getSession();
		Usuario user = new Usuario(0,"John");
		sessao.setAttribute("usuarioLogado", user);		
		request.getRequestDispatcher("p14/1.jsp").forward(request,response);
	}		
}