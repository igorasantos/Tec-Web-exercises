package br.ufrn.imd.dw2.a04.controller;

import java.util.ArrayList;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

import br.ufrn.imd.dw2.a04.model.Cobrador;
import br.ufrn.imd.dw2.a04.model.Empresa;
import br.ufrn.imd.dw2.a04.model.Linha;
import br.ufrn.imd.dw2.a04.model.Motorista;
import br.ufrn.imd.dw2.a04.model.Onibus;

@ManagedBean
@SessionScoped
public class OnibusMBean {
	private Onibus onibus;	 
	private List<Onibus> listagem;
	// construtor
	public OnibusMBean() {
		iniciarValores();
		listagem = new ArrayList<Onibus>();
	}
	// operação
	private void iniciarValores() {
		onibus = new Onibus();
		onibus.setMotorista(new Motorista());
		onibus.setLinha(new Linha());
		onibus.setEmpresa(new Empresa());
		onibus.setCobrador(new Cobrador());
	}
	// navegação
	public String entrarCadastro() {
		return "/form_onibus.jsf";
	}
	// navegação
	public String voltar() {
		return "/index.jsf";
	}
	// navegação
	public String listar(){
		return "/list_onibus.jsf";
	}
	// operação
	public String cadastrar() {
		listagem.add(onibus);
		iniciarValores();
		FacesMessage msg = new FacesMessage("Ônibus cadastrado com sucesso!");
		msg.setSeverity(FacesMessage.SEVERITY_INFO);
		FacesContext.getCurrentInstance().addMessage("", msg);
		return "/form_onibus.jsf";
	}
	// getters and setters
	public Onibus getOnibus() {
		return onibus;
	}
	public void setOnibus(Onibus onibus) {
		this.onibus = onibus;
	}
	public List<Onibus> getListagem() {
		return listagem;
	}
	public void setListagem(List<Onibus> listagem) {
		this.listagem = listagem;
	}
		
}