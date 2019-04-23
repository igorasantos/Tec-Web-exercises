package p08q3_locadora;
public class Main {
	public static void main (String args[]) {
		Clientes c = new Clientes();
		c.consultar();
		c.spListResumida();
		c.removerTodos();
		c.consultar();
		c.spListResumida();
	}	
}