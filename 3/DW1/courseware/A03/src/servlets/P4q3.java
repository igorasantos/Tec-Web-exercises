package servlets;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/P4q3")
public class P4q3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public P4q3() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter resposta = response.getWriter();
        resposta.write("<html><body>");
        resposta.write("<p>O resultado da <strong>operação matemática</strong> é:</p>");
        
        //lê a operação
        String op = request.getParameter("action");        
        
        //lê os operandos
        String numString1 = request.getParameter("n1");
        int numInt1 = Integer.parseInt(numString1);
        String numString2 = request.getParameter("n2");
        int numInt2 = Integer.parseInt(numString2);
        
        //calc
        int result;
        switch (op) {
        	case "sum":
        		result = numInt1 + numInt2;
        		break;
        	case "sub":
        		result = numInt1 - numInt2;
        		break;
        	case "mult":
        		result = numInt1 * numInt2;
        		break;
    		default:
        		result = numInt1 / numInt2;        		
        }
        
        //continua a escrita da page de resposta
        resposta.write("<p>"+result+"</p>");
        resposta.write("</body></html>");
        resposta.close();
	}
}
