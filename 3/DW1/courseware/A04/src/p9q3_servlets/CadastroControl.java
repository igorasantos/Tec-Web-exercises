package p9q3_servlets;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/p9/CadastroControl")
public class CadastroControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public CadastroControl() {
        super();        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter resposta = response.getWriter();
        resposta.write("<html><body>");
		HttpSession sessao = request.getSession(false);
        if (sessao == null || sessao.getAttribute(Login.USUARIO) == null) {
            resposta.write("<p><a href=\"login.html\">Faça primeiro o seu login</a></p>");
        } else {
        	resposta.write(
        		"<p>Preencha seus dados pessoais:</p>"
        	+	"<form action=\"CadastroSessao_Tela1\" method=\"post\">"
        	+		"Nome: <input type=\"text\" name=\"nome\">"
        	+		"Sobrenome: <input type=\"text\" name=\"sobrenome\"><br>"
        	+		"Endereço residencial:<br>"
        	+		"Rua: <input type=\"text\" name=\"rua\">"
        	+		"Complemento: <input type=\"text\" name=\"complemento\"><br>"
        	+		"Cidade: <input type=\"text\" name=\"cidade\">"
        	+		"CEP: <input type=\"text\" name=\"cep\">"
        	+		"Estado: <input type=\"text\" name=\"estado\"><br>"
        	+		"<input type=\"submit\" value=\"Próxima tela\"><br>"
        	+	"</form>");        	
        }
        resposta.write("</body></html>");
        resposta.close();
    }
}