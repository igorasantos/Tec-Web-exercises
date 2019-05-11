package p11;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({"/p11/Controller/Ajax","/p11/Controller/Ajax/Categoria","/p11/Controller/Ajax/LivroInfo"})
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String CATEGORIA_FICCAO = "ficcao";
	private static final String CATEGORIA_NAO_FICCAO = "nao-ficcao";
	private static final String CATEGORIA_INFORMATICA = "informatica";
	private static final String CATEGORIA_AUTO_AJUDA = "auto-ajuda";
	
	private static final String[] CATEGORIAS = {
		CATEGORIA_FICCAO,
		CATEGORIA_NAO_FICCAO,
		CATEGORIA_INFORMATICA,
		CATEGORIA_AUTO_AJUDA
	};
	
	private static final String[] LIVROS_FICCAO = {
		"A cabana",
		"A Ilha sob o mar",
		"Querido John",
		"Fallen",
		"A ultima música",
		"Caminhos da lei",
		"Os homens que não amavam as mulheres",
		"A ilusão da alma",
		"Amante desperto",
		"O castelo dos Pirineus"
	};
	private static final String[] LIVROS_NAO_FICCAO = {
		"1822",
		"Comprometida",
		"Comer, Rezar, Amar",
		"Agape",
		"Incríveis passatempos matemáticos",
		"Brasil - uma historia",
		"Nosso lar",
		"O Aleph",
		"Aforismos"
	};
	private static final String[] LIVROS_INFORMATICA = {
		"VBA e macros para Microsoft Office Excel 2007",
		"Java como programar",
		"Apresentação Zen",
		"UML2 - Uma abordagem pratica",
		"O mítico homem-mês",
		"Revis architecture 2010",
		"JQuery - A biblioteca do programador Javascript",
		"CCENT/CCNA ICND1",
		"Analise de pontos de função",
		"Formulas e funções com Microsoft Office Excel 2007"
	};
	private static final String[] LIVROS_AUTO_AJUDA = {
		"O que se passa na cabeça dos cachorros",
		"Transformando suor em ouro",
		"O monge e o executivo",
		"O verdadeiro poder",
		"Qual é a tua obra? - Inquietações propositivas",
		"Fora de série - Outliers",
		"O futuro hoje",
		"PMBOK - Guia do conjunto de conhecimentos",
		"Os 7 hábitos das pessoas altamente eficazes",
		"Faça como Steve Jobs"
	};
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// baseado na URL chamada (request.getServletPath()), define a acaoSelecionada.
		String acaoSelecionada = request.getServletPath();
		switch (acaoSelecionada) {
			case "/p11/Controller/Ajax":
				enviarPaginaPadrao(request, response);
				break;
			case "/p11/Controller/Ajax/Categoria":
				enviarNomeLivros(request, response);
				break;
			case "/p11/Controller/Ajax/LivroInfo":
				enviarInformacoesLivro(request, response);
				break;				
		}
	}	
	
	// Redireciona o navegador para a página "/p11/modelo_padrao.jsp"
	private void enviarPaginaPadrao(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    salvarCategoriasReq(request);
	    salvarLivrosReq(request);	
	    request.getRequestDispatcher("/p11/view_livros.jsp").forward(request,response);
    }	
	
	// Retorna os nomes dos livros da categoria selecionada através do parâmetro categoria (utilizado pela página modelo_ajax.jsp).
	private void enviarNomeLivros(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("categoria");
		String[] livros = null;
		if (category != null) {
			switch (category) {
				case CATEGORIA_FICCAO:
					livros = LIVROS_FICCAO;
					break;
				case CATEGORIA_NAO_FICCAO:
					livros = LIVROS_NAO_FICCAO;
					break;
				case CATEGORIA_INFORMATICA:
					livros = LIVROS_INFORMATICA;
					break;
				case CATEGORIA_AUTO_AJUDA:
					livros = LIVROS_AUTO_AJUDA;
					break;
			}
		}
		String resp = "";
		for (int i = 0; i < livros.length; i++) {
			resp += livros[i] + ";";
		}
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().write(resp);
		response.flushBuffer();
   }	

	// Retorna informações do livro informado através do parâmetro "livro" (utilizado pela página modelo_ajax.jsp).
	private void enviarInformacoesLivro(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		String livro = request.getParameter("livro");
	 	if (livro == null) {
	 		livro = "null";
	 	}	
	 	response.setContentType("text/html; charset=UTF-8");
	 	response.getWriter().write("Essas são as informações sobre o livro: " + livro);
	 	response.flushBuffer();
	}
	
	// Salva a variável "categorias", contendo as categorias pré-definidas, no escopo da requisição (variável utilizada em todas as páginas para popular a lista de categorias).
	private void salvarCategoriasReq(HttpServletRequest request) {
		request.setAttribute("categorias", CATEGORIAS);
	}
	
	// Salva a variável "livros", contendo os livros da categoria selecionada, no escopo da requisição (variável utilizada pela página modelo_padrao.jsp para popular a lista de livros).
	private void salvarLivrosReq(HttpServletRequest request) {
		String category = request.getParameter("categoria");
		if (category != null) {
			switch (category) {
				case CATEGORIA_FICCAO:
					request.setAttribute("livros", LIVROS_FICCAO);
					break;
				case CATEGORIA_NAO_FICCAO:
					request.setAttribute("livros", LIVROS_NAO_FICCAO);
					break;
				case CATEGORIA_INFORMATICA:
					request.setAttribute("livros", LIVROS_INFORMATICA);
					break;
				case CATEGORIA_AUTO_AJUDA:
					request.setAttribute("livros", LIVROS_AUTO_AJUDA);
					break;
			}			
		}
	}	
}