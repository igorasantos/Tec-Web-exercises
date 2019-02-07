package servlets;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/P9q5_ServletPaginaAgenda")
public class P9q5_ServletPaginaAgenda extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public P9q5_ServletPaginaAgenda() {
        super();        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.write(
				  "<html>"
				+ "<body>"
				+ "<p>Formulário GET</p>"
				+ "<form action='P9q5_ServletAgenda' method='get'>"
					+ "Nome: <input type='text' name='nome'><br>"
					+ "Telefone: <input type='text' name='telefone'><br>"
					+ "Data nascimento: <input type='date' name='nascimento' pattern='(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))' placeholder='YYYY-MM-DD'><br>" 
					+ "<input type='submit' value='Salvar GET'>"
				+ "</form>"
				+ "<p>Formulário POST</p>"
				+ "<form action='P9q5_ServletAgenda' method='post'>"
					+ "Nome: <input type='text' name='nome'><br>"
					+ "Telefone: <input type='text' name='telefone'><br>"
					+ "Data nascimento: <input type='date' name='nascimento' pattern='(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))' placeholder='YYYY-MM-DD'><br>" 
					+ "<input type='submit' value='Salvar POST'>"
				+ "</form>"
				+ "</body>"
				+ "</html>");
		out.close();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}