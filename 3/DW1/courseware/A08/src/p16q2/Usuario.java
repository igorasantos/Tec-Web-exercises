package p16q2;
public class Usuario {
	private int id;
	private String nome;	
	public Usuario() {
		super();
		this.id=0;
		this.nome="";
	}
	public Usuario(int id,String nome) {
		this.id=id;
		this.nome=nome;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String teste() {
		return "deu certo";
	}
}