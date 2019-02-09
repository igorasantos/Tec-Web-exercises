package servlets;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/P3_2_v3_VisualizaCookie")
public class P3_2_v3_VisualizaCookie extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public P3_2_v3_VisualizaCookie() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie listaCookies[] = request.getCookies();
		Cookie nome = null;
		if (listaCookies != null) {
			for (int i = 0; i < listaCookies.length; i++) {
				if (listaCookies[i].getName().equals("MeuCookie")) {
					nome = listaCookies[i];
					break;
				}
				
			}
		}
		String html = "<html>"
						+ "<head>"
							+ "<title>Visualizando um Cookie</title>"
						+ "</head>"
						+ "<body>"
							+"<p>O cookie chamado <strong>MeuCookie</strong> tem o valor:</p>"
							+"<p><strong>"+nome.getValue()+"</strong></p>"
						+ "</body>"
					+ "</html>";
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.print(html);
		out.close();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
}
