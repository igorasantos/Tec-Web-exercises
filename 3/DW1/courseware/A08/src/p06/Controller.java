package p06;
import java.io.IOException;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Controller() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("pessoas", getPessoas());
		request.getRequestDispatcher("p06/1.jsp").forward(request,response);
	}
	private Pessoa[] getPessoas() {
		Pessoa[] pessoas = new Pessoa[3];
		
		Pessoa pessoa = new Pessoa();
		pessoa.setNome("Fulano");
		Calendar c1 = Calendar.getInstance();
		c1.set(1990,11,1);
		pessoa.setDataNascimento(c1);
		pessoas[0] = pessoa;
		
		pessoa = new Pessoa();
		pessoa.setNome("Sicrano");
		Calendar c2 = Calendar.getInstance();
		c2.set(1995,0,1);
		pessoa.setDataNascimento(c2);
		pessoas[1] = pessoa;
		
		pessoa = new Pessoa();
		pessoa.setNome("Beltrano");
		Calendar c3 = Calendar.getInstance();
		c3.set(2000,5,1);
		pessoa.setDataNascimento(c3);
		pessoas[2] = pessoa;
				
		return pessoas;
	}
}
