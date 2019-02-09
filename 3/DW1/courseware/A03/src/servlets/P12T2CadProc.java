package servlets;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/P12T2CadProc")
public class P12T2CadProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public P12T2CadProc() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter resposta = response.getWriter();
        resposta.write("<html>");
        resposta.write("<head>");
        resposta.write("<title>Confirmação de registro</title>");
        resposta.write("</head>");
        resposta.write("<body>");
        resposta.write("<h3>Registro realizado com sucesso!</h3>");
        resposta.write("<p><strong>Seus dados pessoais:</strong></p>");
        resposta.write("<p>"+request.getParameter("nome") + " " + request.getParameter("sobrenome")+"</p>");
        resposta.write("<p>"+request.getParameter("rua")+"</p>");        
        resposta.write("<p>"+request.getParameter("complemento")+"</p>");        
        resposta.write("<p>"+request.getParameter("cidade"));
        resposta.write(", ");
        resposta.write(request.getParameter("cep"));
        resposta.write(", ");
        resposta.write(request.getParameter("estado")+"</p>");
        resposta.write("<p><strong>Seus dados profissionais:</strong></p>");
        resposta.write("<p>"+request.getParameter("empresa")+"</p>");
        resposta.write("<p>"+request.getParameter("ruaEmpresa")+"</p>");
        resposta.write("<p>"+request.getParameter("complementoEmpresa")+"</p>");
        resposta.write("<p>"+request.getParameter("cidadeEmpresa"));
        resposta.write(", ");
        resposta.write(request.getParameter("cepEmpresa"));
        resposta.write(", ");
        resposta.write(request.getParameter("estadoEmpresa")+"</p>");
        resposta.write("</body></html>");
        resposta.close();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}	
}
