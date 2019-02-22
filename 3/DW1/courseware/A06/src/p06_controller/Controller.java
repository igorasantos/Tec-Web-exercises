package p06_controller;
import java.io.IOException;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/P06_Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Controller() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
    }	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		p04_model.SistemaEncontros sistema = (p04_model.SistemaEncontros) getServletContext().getAttribute("sistemaEncontros");
		String resposta = "index.jsp";
		if ("cadastrar".equals(acao)) {
			resposta = "cadastrar.jsp";
		} else if ("confirmarCadastro".equals(acao)) {
			p03_model.Encontro e = new p03_model.Encontro();
			e.setNomePessoa(request.getParameter("nomePessoa"));
			e.setMotivo(request.getParameter("motivo"));
			e.setLocal(request.getParameter("local"));
			e.setData(Calendar.getInstance());
			sistema.adicionar(e);
			
			// pra quê isso?
			request.setAttribute("lista", sistema.listarEncontros());
			resposta = "listar.jsp";
			
		} else if ("listar".equals(acao)) {
			request.setAttribute("lista", sistema.listarEncontros());
			resposta = "listar.jsp";
		}
		request.getRequestDispatcher(resposta).forward(request, response);
	}
}