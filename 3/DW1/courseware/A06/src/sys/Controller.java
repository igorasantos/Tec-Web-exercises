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
	protected int informaIndex (List<Encontro> lista) {
		int index = 0;
		for (Encontro m : lista) {
			index = lista.indexOf(m);			
		}
		return index;		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		SistemaEncontros sistema = (SistemaEncontros) getServletContext().getAttribute("sistemaEncontros");
		String resposta = "index.jsp";
		if ("cadastrar".equals(acao)) {
			resposta = "cadastrar.jsp";
		} else if ("confirmarCadastro".equals(acao)) {
			Encontro e = new Encontro();
			
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
		} else if ("remover".equals(acao)) {
			resposta = "listarPraRemover.jsp";
		} else if ("removerEncontro".equals(acao)){
			int indexARetirar = Integer.parseInt(request.getParameter("ind"));
			sistema.remover(indexARetirar);
			// pra quê isso?
			request.setAttribute("lista", sistema.listarEncontros());
			resposta = "listar.jsp";
		} else if ("alterarLocalEncontro".equals(acao)) {//essa ação poderia ser selecionada pelo index tb
			String nome = request.getParameter("nomePessoa");
			String localAntigo = request.getParameter("localAntigo");
			String localNovo = request.getParameter("localNovo");
			String data = request.getParameter("data");
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			Calendar cal = Calendar.getInstance();
			try {				
				cal.setTime(sdf.parse(data));
			} catch (ParseException e) {
				e.printStackTrace();
			}			
			for (Encontro i: sistema.listarEncontros()) {
				if (i.getNomePessoa()==nome &&
						i.getData().get(Calendar.YEAR)==cal.get(Calendar.YEAR) &&
						i.getData().get(Calendar.MONTH)==cal.get(Calendar.MONTH) &&
						i.getData().get(Calendar.DAY_OF_MONTH)==cal.get(Calendar.DAY_OF_MONTH) &&
						i.getLocal()==localAntigo
					) {
					i.setLocal(localNovo);					
				}
			}
			// pra quê isso?
			request.setAttribute("lista", sistema.listarEncontros());
			resposta = "listar.jsp";
		} else if("consultarEncontro".equals(acao)) {
			String nome = request.getParameter("nomePessoa");
			// pra quê isso?
			request.setAttribute("lista", sistema.consultaEncontroComUmaPessoa(nome));
			resposta = "listar.jsp"; //é isso?
		}		
		request.getRequestDispatcher(resposta).forward(request, response);
	}
}