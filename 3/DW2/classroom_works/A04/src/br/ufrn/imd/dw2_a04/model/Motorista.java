package br.ufrn.imd.dw2_a04.model;
public class Motorista {
	private String nome;
	private String endereco;
	private Veiculo veiculo;
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEndereco() {
		return endereco;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	public Veiculo getVeiculo() {
		return veiculo;
	}
	public void setVeiculo(Veiculo veiculo) {
		this.veiculo = veiculo;
	}
	public Motorista() {
		this.veiculo = new Veiculo();
	}	
}
