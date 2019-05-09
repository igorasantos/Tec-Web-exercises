package br.ufrn.imd.dw2_a04.controller;
import java.util.ArrayList;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

import br.ufrn.imd.dw2_a04.model.Motorista;
import br.ufrn.imd.dw2_a04.model.PontoTaxi;
@ManagedBean
@SessionScoped
public class PontoTaxiMBean {
	private PontoTaxi pontoTaxi;
	private List<PontoTaxi> pontosTaxi;
	// construtor
	public PontoTaxiMBean() {
		iniciarValoresComposicao();
		pontosTaxi = new ArrayList<PontoTaxi>();
	}
	// navegação
	public String entrarCadastro() {
		return "/form_pontoTaxi.jsf";
	}
	// navegação
	public String voltar() {
		return "/index.jsf";
	}
	// navegação	
	public String listar(){
		return "/list_pontoTaxi.jsf";
	}
	// operação
	private void iniciarValoresComposicao() {
		pontoTaxi = new PontoTaxi();
		pontoTaxi.setMotorista(new Motorista());
	}
	// operação
	public String cadastrar() {
		pontosTaxi.add(pontoTaxi);
		iniciarValoresComposicao();
		FacesMessage msg = new FacesMessage("Ponto de Táxi cadastrado com sucesso!");
		msg.setSeverity(FacesMessage.SEVERITY_INFO);
		FacesContext.getCurrentInstance().addMessage("", msg);
		return "form_pontoTaxi.jsf";
	}
	// getters and setters
	public PontoTaxi getPontoTaxi() {
		return pontoTaxi;
	}
	public List<PontoTaxi> getPontosTaxi() {
		return pontosTaxi;
	}	
}
