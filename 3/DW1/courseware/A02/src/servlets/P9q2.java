package servlets;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/P9q2")
public class P9q2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SimpleDateFormat data = new SimpleDateFormat("dd/MM/yyyy");
	private SimpleDateFormat hora = new SimpleDateFormat("hh:mm:ss");
	public P9q2() {
        super();        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter saida = response.getWriter();
		saida.write("<HTML><BODY><p>Olá! A data atual é: ");
		saida.write(data.format(new Date())+"</p>");
		saida.write("</BODY></HTML>");
		saida.close();		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter saida = response.getWriter();
		saida.write("<HTML><BODY><p>Olá! A hora atual é: ");
		saida.write(hora.format(new Date())+"</p>");
		saida.write("</BODY></HTML>");
		saida.close();
	}
}
