package servlet;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.jasper.runtime.HttpJspBase;
@WebServlet("/P09_1")
public class P09_1 extends HttpJspBase {
	private static final long serialVersionUID = 1L;
    public P09_1() {
        super();
    }
    public void _jspService(HttpServletRequest request, HttpServletResponse response) throws java.io.IOException, ServletException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		out.write("<html><body>");
		int cont = 1;
		out.write("Este é o acesso de número: ");
		out.print(cont);
		cont++;
		out.write("</body></html>");
   }
}