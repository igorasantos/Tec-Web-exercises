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

/**
 * Servlet implementation class P6_ServletDataHora
 */
@WebServlet("/P6_ServletDataHora")
public class P6_ServletDataHora extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy - hh:mm:ss");
    /**
     * @see HttpServlet#HttpServlet()
     */
    public P6_ServletDataHora() {
        super();
        // TODO Auto-generated constructor stub
    }

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		log("ServletDataHora iniciado às "+format.format( new Date() ) );
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter saida = response.getWriter();
		saida.write("<html><body>Olá! A data/hora atual é: ");
		saida.write(format.format(new Date()));
		saida.write("</body></html>");
		saida.close();		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		log("ServletDataHora finalizado às "+format.format(new Date()));
		super.destroy();
	}
}
