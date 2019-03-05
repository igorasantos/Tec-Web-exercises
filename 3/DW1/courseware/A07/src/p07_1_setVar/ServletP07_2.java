package p07_1_setVar;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/ServletP07_2")
public class ServletP07_2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ServletP07_2() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("pessoas", getPessoas());
		request.getRequestDispatcher("p07/2.jsp").forward(request,response);
	}
	private Pessoa[] getPessoas() {
		Pessoa[] pessoas = new Pessoa[3];
		
		Pessoa pessoa = new Pessoa();
		pessoa.setNome("Fulano");
		pessoas[0] = pessoa;
		
		pessoa = new Pessoa();
		pessoa.setNome("Sicrano");
		pessoas[1] = pessoa;
		
		pessoa = new Pessoa();
		pessoa.setNome("Beltrano");
		pessoas[2] = pessoa;
				
		return pessoas;
	}
}
