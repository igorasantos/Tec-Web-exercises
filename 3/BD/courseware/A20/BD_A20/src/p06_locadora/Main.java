package p06_locadora;
public class Main {
	public static void main (String args[]) {
		Clientes c = new Clientes();
		c.consultar();
		c.consultarComParam("*");
		c.inserir();
		c.atualizar();
		c.atualizarComParam(30,2500);
		c.remover();
		c.removerComParam(30);
	}	
}