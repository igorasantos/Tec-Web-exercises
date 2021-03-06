package p07q3_controller;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/P07q3_Controller")
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
		} else if ("removerEncontro".equals(acao)){
			String nomePessoaRetiraEncontro = request.getParameter("nomePessoa");
			//https://www.guj.com.br/t/duvida-converter-string-para-calendar/46886
			String dataEncontroARetirar = request.getParameter("data");				
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			Calendar cal = Calendar.getInstance();
			try {				
				cal.setTime(sdf.parse(dataEncontroARetirar));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			for (p03_model.Encontro i: sistema.listarEncontros()) {
				if (i.getNomePessoa()==nomePessoaRetiraEncontro &&
						i.getData().get(Calendar.YEAR)==cal.get(Calendar.YEAR) &&
						i.getData().get(Calendar.MONTH)==cal.get(Calendar.MONTH) &&
						i.getData().get(Calendar.DAY_OF_MONTH)==cal.get(Calendar.DAY_OF_MONTH)
					) {
					sistema.remover(i);					
				}
			}
			// pra quê isso?
			request.setAttribute("lista", sistema.listarEncontros());
			resposta = "listar.jsp";
		} else if ("alterarLocalEncontro".equals(acao)) {
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
			for (p03_model.Encontro i: sistema.listarEncontros()) {
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
		}		
		request.getRequestDispatcher(resposta).forward(request, response);
	}
}