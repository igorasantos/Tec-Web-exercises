package negocio;
import java.util.List;

import exc.CompraException;
import exc.LivroNaoEncontradoException;
public class LivrariaBean {
	private Livraria sistema = null;
	private String idLivro = "0";
	public LivrariaBean() {		
	}
	public void setIdLivro(String id) {
		this.idLivro = id;
	}
	public void setSistema(Livraria livraria) {
		this.sistema = livraria;
	}
	public Livro getLivro() throws LivroNaoEncontradoException{
		return (Livro) sistema.getLivro(idLivro);
	}
	public List<Livro> getLivros(){
		return sistema.getLivros();
	}
	public void comprarLivros(CarrinhoCompras cart) throws CompraException {
		sistema.comprarLivros(cart);
	}
}
