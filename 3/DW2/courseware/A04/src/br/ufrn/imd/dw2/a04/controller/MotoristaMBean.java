package br.ufrn.imd.dw2.a04.controller;

import java.util.ArrayList;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

import br.ufrn.imd.dw2.a04.model.Motorista;

@ManagedBean
@SessionScoped
public class MotoristaMBean {
	private Motorista motorista;	 
	private List<Motorista> motoristas;
	// construtor
	public MotoristaMBean() {
		motorista = new Motorista();
		motoristas = new ArrayList<Motorista>();
	}
	// navegação
	public String entrarCadastro() {
		return "/form_motorista.jsf";
	}
	// navegação
	public String voltar() {
		return "/index.jsf";
	}
	// navegação: listar (se fosse necessária)
	// operação
	public String cadastrar() {
		motoristas.add(motorista);
		motorista = new Motorista();
		FacesMessage msg = new FacesMessage("Motorista cadastrado com sucesso!");
		msg.setSeverity(FacesMessage.SEVERITY_INFO);
		FacesContext.getCurrentInstance().addMessage("", msg);
		return "/form_motorista.jsf";
	}
	// getters and setters
	public Motorista getMotorista() {
		return motorista;
	}
	public void setMotorista(Motorista motorista) {
		this.motorista = motorista;
	}
	public List<Motorista> getMotoristas() {
		return motoristas;
	}
	public void setMotoristas(List<Motorista> motoristas) {
		this.motoristas = motoristas;
	}
	
}