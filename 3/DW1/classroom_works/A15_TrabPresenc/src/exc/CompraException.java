package exc;
public class CompraException extends Exception {
	private static final long serialVersionUID = 1L;
	public CompraException() {		
	}
	public CompraException(String msg) {
		super(msg);
	}
}
