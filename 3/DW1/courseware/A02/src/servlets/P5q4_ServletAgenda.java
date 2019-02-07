package servlets;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/P5q4_ServletAgenda")
public class P5q4_ServletAgenda extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public P5q4_ServletAgenda() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		//recebe os parâmetros do request
		String name = request.getParameter("nome");
		String phone = request.getParameter("telefone");
		String bdate = request.getParameter("nascimento");
		
		//especifica a data nas devidas variáveis referentes aos seus componentes
		String[] dateArray = bdate.split("[^0-9]");
		int dia = Integer.parseInt(dateArray[2]);
		int mes = Integer.parseInt(dateArray[1]);
		int ano = Integer.parseInt(dateArray[0]);		
		
		//converte a data
		Calendar cal = Calendar.getInstance();
		cal.set(ano, mes, dia);
		
		//monta uma instância de contato
		javaClasses.P5q4_Contato contatoRecebido = new javaClasses.P5q4_Contato();
		contatoRecebido.setNome(name);
		contatoRecebido.setTelefone(phone);
		contatoRecebido.setNascimento(cal);
		
        out.write(
				  "<html>"
				+ "<body>"
				+ "<p>"
					+ "Contato: <strong>"+contatoRecebido.getNome() + "</strong> adicionado com sucesso!</p>"
				+ "<p>Dados completos:</p>"
				+ "<p>Nome: "+contatoRecebido.getNome() + "</p>"
				+ "<p>Telefone: "+contatoRecebido.getTelefone() + "</p>"
				+ "<p>Data de nascimento: "
					+ contatoRecebido.getNascimento().get(Calendar.DAY_OF_MONTH)
					+ "/"
					+ contatoRecebido.getNascimento().get(Calendar.MONTH)
					+ "/"
					+ contatoRecebido.getNascimento().get(Calendar.YEAR)
				+"</p>"
				+ "</body>"
				+ "</html>");
        out.close();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}