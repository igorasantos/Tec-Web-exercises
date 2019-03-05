package p05_3;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/ServletExemplo1")
public class ServletExemplo1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ServletExemplo1() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] filmes = {"Eu sou mais \"voce\"", "Tropa de elite", "Redentor", "O homem que copiava"};
		request.setAttribute("filmes",filmes);
		request.getRequestDispatcher("p05/3_exemplo1.jsp").forward(request,response);
	}
}
