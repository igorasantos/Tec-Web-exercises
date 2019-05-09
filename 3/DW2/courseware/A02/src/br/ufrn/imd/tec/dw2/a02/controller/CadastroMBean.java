package br.ufrn.imd.tec.dw2.a02.controller;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import br.ufrn.imd.tec.dw2.a02.model.Pessoa;

@ManagedBean
@SessionScoped
public class CadastroMBean {
	private Pessoa pessoa;
	public CadastroMBean() {
		pessoa = new Pessoa();
	}
	public Pessoa getPessoa() {
		return pessoa;
	}
	public void setPessoa(Pessoa pessoa) {
		this.pessoa = pessoa;
	}	
	public String cadastrar() {
		return "/sucesso.jsf";
	}
}
