package sys;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

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
		doPost(request, response);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		SistemaEncontros sistema = (SistemaEncontros) getServletContext().getAttribute("sistemaEncontros");
		String pessoa = request.getParameter("nomePessoa");
		String resposta = "index.jsp";
		switch (acao) {
			case "cadastrar":
				resposta = "cadastrar.jsp";
				break;
			case "confirmarCadastro":
				Encontro e = new Encontro();				
				e.setNomePessoa(pessoa);
				e.setMotivo(request.getParameter("motivo"));
				e.setLocal(request.getParameter("local"));
				e.setData(Calendar.getInstance());
				e.setId(sistema.listarEncontros().size());
				sistema.adicionar(e);
				
				request.setAttribute("lista", sistema.listarEncontros());
				resposta = "listar.jsp";
				break;
			case "listar":
				request.removeAttribute("listaConsultada");
				request.setAttribute("lista", sistema.listarEncontros());
				resposta = "listar.jsp";
				break;
			case "remover":
				int indexARetirar = Integer.parseInt(request.getParameter("ind"));
				sistema.remover(indexARetirar);
				
				request.setAttribute("lista", sistema.listarEncontros());
				resposta = "listar.jsp";
				break;
			case "callLocalEdit":
				int indexEditLocToPass = Integer.parseInt(request.getParameter("ind"));
				request.setAttribute("lista", sistema.listarEncontros());
				request.setAttribute("ind", indexEditLocToPass);
				resposta = "cadastro_editLocal.jsp";
				break;
			case "editLocal":
				int indexAEditLoc = Integer.parseInt(request.getParameter("indEdit"));
				String localNovo = request.getParameter("novoLocal");
				sistema.listarEncontros().get(indexAEditLoc).setLocal(localNovo);
				request.removeAttribute("ind");
				request.setAttribute("lista", sistema.listarEncontros());
				resposta = "listar.jsp";				
				break;
			case "callQueryMeetByName":				
				resposta = "queryByName.jsp";
				break;
			case "queryMeetingByName":
				String nameToQuery = request.getParameter("nameConsult");
				request.setAttribute("listaConsultada", sistema.consultaEncontroComUmaPessoa(nameToQuery)); // tá sendo passado
				resposta = "listar.jsp";
				break;
			case "index":
				break;
		}		
		request.getRequestDispatcher(resposta).forward(request, response);
	}
}