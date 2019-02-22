package sys;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
@WebListener
public class ContextListener implements ServletContextListener {
    public static final String SISTEMA_ENCONTROS = "sistemaEncontros";
    
    public void contextInitialized(ServletContextEvent event) {
          ServletContext context = event.getServletContext();
          context.setAttribute(SISTEMA_ENCONTROS, new SistemaEncontros());
    }
    
    public void contextDestroyed(ServletContextEvent event) {
          ServletContext context = event.getServletContext();
          context.removeAttribute(SISTEMA_ENCONTROS);
    }
}
//https://pt.wikipedia.org/wiki/Contexto_(computa%C3%A7%C3%A3o)