package p8_servlets;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/p8/CadastroSessao_Tela2")
public class CadastroSessao_Tela2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public CadastroSessao_Tela2() {
		super();        
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter resposta = response.getWriter();
		resposta.write("<html>");
		resposta.write("<head>");
		resposta.write("<title>Confirmação de registro</title>");
		resposta.write("</head>");
		resposta.write("<body>");
		HttpSession sessao = request.getSession(false);
		if (sessao == null || sessao.getAttribute(Login.USUARIO) == null) {
			resposta.write("<p><a href=\"login.html\">Faça primeiro o seu login</a></p>");
		} else {						
			javaClasses.DadosPessoais dados = (javaClasses.DadosPessoais) sessao.getAttribute("dadosPessoais");
			if (dados == null) {
				resposta.write("<p><a href=\"Login\">Dados incompletos. Inicie o sistema novamente.</a></p>");
			} else {
				resposta.write("<h3>Registro realizado com sucesso!</h3>");
				resposta.write("<p><strong>Seus dados pessoais:</strong></p>");
				resposta.write("<p>"+dados.getNome() + " " + dados.getSobrenome()+"</p>");
				resposta.write("<p>"+dados.getRua()+"</p>");
				resposta.write("<p>"+dados.getComplemento()+"</p>");
				resposta.write("<p>"+dados.getCidade());
				resposta.write(", ");
				resposta.write(dados.getCep());
				resposta.write(", ");
				resposta.write(dados.getEstado()+"</p>");				
				resposta.write("<p><strong>Seus dados profissionais:</strong></p>");
				resposta.write("<p>"+request.getParameter("empresa")+"</p>");
				resposta.write("<p>"+request.getParameter("ruaEmpresa")+"</p>");
				resposta.write("<p>"+request.getParameter("complementoEmpresa")+"</p>");
				resposta.write("<p>"+request.getParameter("cidadeEmpresa"));
				resposta.write(", ");
				resposta.write(request.getParameter("cepEmpresa"));
				resposta.write(", ");
				resposta.write(request.getParameter("estadoEmpresa")+"</p>");
			}
		}
		resposta.write("</body></html>");
		resposta.close();
	}
}