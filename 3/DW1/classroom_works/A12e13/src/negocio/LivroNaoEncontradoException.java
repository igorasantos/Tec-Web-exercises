package negocio;
public class LivroNaoEncontradoException extends Exception {
	private static final long serialVersionUID = 1L;
	public LivroNaoEncontradoException() {		
	}
	public LivroNaoEncontradoException(String msg) {
		super(msg);
	}
}
