package servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import exc.LivroNaoEncontradoException;
import negocio.CarrinhoCompras;
import negocio.Livraria;
import negocio.Livro;
@WebServlet(name ="Controlador",urlPatterns = { "/loja/livraria","/loja/catalogo","/loja/detalhesLivro","/loja/mostrarCarrinho", "/loja/comprar","/loja/recibo" })
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
		if (acaoSelecionada.equals("/loja/catalogo")) {
			idLivro = request.getParameter("Add");
			if(!idLivro.equals("")) {
				try {
					livro = livraria.getLivro(idLivro);
					carrinho.adicionar(livro);
				} catch (LivroNaoEncontradoException ex) {
					// not good
				}
			}
		} else if (acaoSelecionada.equals("/loja/mostrarCarrinho")) {
			idLivro = request.getParameter("remover");
			if (idLivro != null) {
				carrinho.remover(idLivro);
			}
			limpar = request.getParameter("limpar");
			if ((limpar != null) && limpar.equals("limpar")) {
				carrinho.limpar();
			}
		}


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