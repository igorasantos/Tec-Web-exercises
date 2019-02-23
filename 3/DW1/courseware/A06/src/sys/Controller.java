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
				request.setAttribute("lista", sistema.listarEncontros());
				resposta = "listar.jsp";
				break;
			case "remover":
				int indexARetirar = Integer.parseInt(request.getParameter("ind"));
				sistema.remover(indexARetirar);
				
				request.setAttribute("lista", sistema.listarEncontros());
				resposta = "listar.jsp";
				break;
//			case "alterarLocalEncontro": // implementar pelo index tb.
////				String nome = request.getParameter("nomePessoa");
//				String localAntigo = request.getParameter("localAntigo");
//				String localNovo = request.getParameter("localNovo");
//				String data = request.getParameter("data");
//				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
//				Calendar cal = Calendar.getInstance();
//				try {				
//					cal.setTime(sdf.parse(data));
//				} catch (ParseException e) {
//					e.printStackTrace();
//				}			
//				for (Encontro i: sistema.listarEncontros()) {
//					if (i.getNomePessoa()==pessoa &&
//							i.getData().get(Calendar.YEAR)==cal.get(Calendar.YEAR) &&
//							i.getData().get(Calendar.MONTH)==cal.get(Calendar.MONTH) &&
//							i.getData().get(Calendar.DAY_OF_MONTH)==cal.get(Calendar.DAY_OF_MONTH) &&
//							i.getLocal()==localAntigo
//						) {
//						i.setLocal(localNovo);					
//					}
//				}
//				request.setAttribute("lista", sistema.listarEncontros());
//				resposta = "listar.jsp";
//				break;				
			case "consultarEncontro":
				String nome = request.getParameter("nomePessoa");
				request.setAttribute("lista", sistema.consultaEncontroComUmaPessoa(nome));
				resposta = "listar.jsp"; //é isso?
				break;
			case "index":
				break;
		}		
		request.getRequestDispatcher(resposta).forward(request, response);
	}
}