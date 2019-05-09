package br.ufrn.imd.dw2.a04.controller;

import java.util.ArrayList;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

import br.ufrn.imd.dw2.a04.model.Linha;


@ManagedBean
@SessionScoped
public class LinhaMBean {
	private Linha linha;	 
	private List<Linha> linhas;
	// construtor
	public LinhaMBean() {
		linha = new Linha();
		linhas = new ArrayList<Linha>();
	}
	// navegação
	public String entrarCadastro() {
		return "/form_linha.jsf";
	}
	// navegação
	public String voltar() {
		return "/index.jsf";
	}
	// navegação: listar (se fosse necessária)
	// operação
	public String cadastrar() {
		linhas.add(linha);
		linha = new Linha();
		FacesMessage msg = new FacesMessage("Linha cadastrada com sucesso!");
		msg.setSeverity(FacesMessage.SEVERITY_INFO);
		FacesContext.getCurrentInstance().addMessage("", msg);
		return "/form_linha.jsf";
	}
	// getters and setters
	public Linha getLinha() {
		return linha;
	}
	public void setLinha(Linha linha) {
		this.linha = linha;
	}
	public List<Linha> getLinhas() {
		return linhas;
	}
	public void setLinhas(List<Linha> linhas) {
		this.linhas = linhas;
	}	
}