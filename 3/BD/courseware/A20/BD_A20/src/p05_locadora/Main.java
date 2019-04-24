package p05_locadora;
public class Main {
	public static void main (String args[]) {
		Clientes c = new Clientes();
		c.consultar();
		
//		c.consultarComParam("*"); //it's not working here
				
		c.inserir();
		c.consultar();
//		c.consultarComParam("*"); //it's not working here
		
		c.atualizar();
		c.consultar();
//		c.consultarComParam("*"); //it's not working here
		
		c.atualizarComParam(2500,30);
		c.consultar();
//		c.consultarComParam("*"); //it's not working here
		
		c.remover();
		c.consultar();
//		c.consultarComParam("*"); //it's not working here
		
		c.removerComParam(30);
		c.consultar();
//		c.consultarComParam("*"); //it's not working here		
	}	
}