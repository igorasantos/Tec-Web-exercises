package servlet;
import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.JspWriter;
//Vários outros imports foram omitidos aqui
@WebServlet("/P04")
public class P04 extends org.apache.jasper.runtime.HttpJspBase implements org.apache.jasper.runtime.JspSourceDependent {
	// Vários atributos foram omitidos aqui	
	private static final long serialVersionUID = 1L;
    public P04() {
        super();
    }
    public void _jspService(HttpServletRequest request, HttpServletResponse response) throws java.io.IOException, ServletException {
    	//Várias declarações de variáveis foram omitidos aqui
		HttpSession session = null;
		ServletContext application = null;
		ServletConfig config = null;
		JspWriter out = null;
		Object page = this;
		JspWriter _jspx_out = null;
		PageContext _jspx_page_context = null;
		JspFactory _jspxFactory = null;
		try {
			response.setContentType("text/html");
			PageContext pageContext = _jspxFactory.getPageContext(this, request, response, null, true, 8192, true);
			_jspx_page_context = pageContext;
			application = pageContext.getServletContext();
			config = pageContext.getServletConfig();
			session = pageContext.getSession();
			out = pageContext.getOut();
			_jspx_out = out;
			out.write("<html>\r\n");
			out.write("<head>\r\n");
			out.write("<title>Número aleatório</title>\r\n");
			out.write("</head>\r\n");
			out.write("<body>\r\n");
			out.write("Esta página gera um novo número aleatório\r\n");
			out.write("toda vez que é acessada: ");
			out.print(Math.random());
			out.write("\r\n");
			out.write("</body>\r\n");
			out.write("</html>");
		} catch (Throwable t) { 
			// Código de tratamento de exceção foi omitido aqui
		}
    }
	@Override
	public Map<String, Long> getDependants() {
		return null;
	}
}