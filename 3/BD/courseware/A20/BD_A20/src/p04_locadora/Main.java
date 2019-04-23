package p04_locadora;
public class Main {
	public static void main (String args[]) {
		Clientes c = new Clientes();
		c.consultar();
		c.inserir();
		c.atualizar();
		c.remover();
	}	
}