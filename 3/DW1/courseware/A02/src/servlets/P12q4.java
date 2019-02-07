package servlets;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/P12q4")
public class P12q4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public P12q4() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		//recebe os parâmetros do request
		String numString = request.getParameter("num");
		
		//converte o número recebido como String
		int n = Integer.parseInt(numString);	

		//monta uma instância da classe de cálculo de fatorial
		javaClasses.P12q4_FatorialRecurs calcFat = new javaClasses.P12q4_FatorialRecurs();
		calcFat.setNumero(n);			
		int resp = calcFat.getResult();
		
		//monta response com result
		out.write(
				  "<html>"
				+ "<body>"
				+ "<p>"
					+ "O fatorial de <strong>"+ n + "</strong> é: " + resp +".</p>"				
				+ "</body>"
				+ "</html>");
      out.close();
	}
}