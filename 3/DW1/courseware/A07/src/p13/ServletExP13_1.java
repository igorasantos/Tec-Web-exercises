package p13;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/ServletExP13_1")
public class ServletExP13_1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ServletExP13_1() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] filmes = {"Eu sou mais voce", "Tropa de elite", "Redentor", "O homem que copiava"};
		request.setAttribute("filmes",filmes);
		request.getRequestDispatcher("p13/1.jsp").forward(request,response);
	}
}
