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
@WebServlet("/P6_ServletDataHora")
public class P6_ServletDataHora extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy - hh:mm:ss");
    javaClasses.P6_Cal_DayWeekNamePT diaSemana = new javaClasses.P6_Cal_DayWeekNamePT();
    String nomeDiaSemana = diaSemana.getNomeDiaSemana();
    public P6_ServletDataHora() {
        super();
    }
	@Override
	public void init() throws ServletException {
		super.init();
		log("ServletDataHora iniciado às "+format.format( new Date() )+", "+nomeDiaSemana);
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter saida = response.getWriter();
		saida.write("<html><body><p>Olá! A data/hora atual é: ");
		saida.write(format.format(new Date()));
		saida.write(", "+nomeDiaSemana);
		saida.write("</p></body></html>");
		saida.close();		
	}
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
	@Override
	public void destroy() {
		log("ServletDataHora finalizado às "+format.format(new Date())+", "+nomeDiaSemana);
		super.destroy();
	}
}
