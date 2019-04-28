package p02e03_locadora;
public class Main {
	public static void main (String args[]) {
		Clientes c = new Clientes();
		c.consultar();
		
		c.inserir();
		c.consultar();
		
		c.atualizar();
		c.consultar();
		
		c.remover();
		c.consultar();
	}	
}