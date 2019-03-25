package servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import negocio.CarrinhoCompras;
import negocio.Livraria;
import negocio.Livro;
@WebServlet(name ="Controlador",urlPatterns = { "/livraria","/catalogo" })
public class ServletControladorLivraria extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idLivro = null;
		String limpar = null;
		Livro livro = null;
		Livraria livraria = (Livraria) getServletContext().getAttribute(LivrariaContextListener.SISTEMA_LIVRARIA);
		HttpSession session = request.getSession();
		CarrinhoCompras carrinho = (CarrinhoCompras) session.getAttribute("cart");
		if (carrinho == null) {
			carrinho = new CarrinhoCompras();
			session.setAttribute("cart", carrinho);
		}
		String acaoSelecionada = request.getServletPath();
		// aqui entram as operações do sistema
		String tela = acaoSelecionada + ".jsp";
		try {
			request.getRequestDispatcher(tela).forward(request, response);
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}