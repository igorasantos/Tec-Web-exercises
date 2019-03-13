package p13b;
import java.io.IOException;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/P13bController")
public class P13bController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public P13bController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("array", new String[] {"Fulano", "Sicrano", "Beltrano"});
		request.getRequestDispatcher("p13/b.jsp").forward(request,response);
	}	
}
