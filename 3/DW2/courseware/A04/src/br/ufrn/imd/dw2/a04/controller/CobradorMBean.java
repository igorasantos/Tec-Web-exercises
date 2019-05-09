package br.ufrn.imd.dw2.a04.controller;

import java.util.ArrayList;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

import br.ufrn.imd.dw2.a04.model.Cobrador;


@ManagedBean
@SessionScoped
public class CobradorMBean {
	private Cobrador cobrador;    
    private List<Cobrador> cobradores;
	// construtor
	public CobradorMBean() {
		cobrador = new Cobrador();
        cobradores = new ArrayList<Cobrador>();
	}
	// navegação
	public String entrarCadastro() {
		return "/form_cobrador.jsf";
	}
	// navegação
	public String voltar() {
		return "/index.jsf";
	}
	// navegação: listar (se fosse necessária)
	// operação
	public String cadastrar() {
		cobradores.add(cobrador);
        cobrador = new Cobrador();
        FacesMessage msg = new FacesMessage("Cobrador cadastrado com sucesso!");
        msg.setSeverity(FacesMessage.SEVERITY_INFO);
        FacesContext.getCurrentInstance().addMessage("", msg);
        return "/form_cobrador.jsf";
	}
	// getters and setters
	public Cobrador getCobrador() {
		return cobrador;
	}
	public void setCobrador(Cobrador cobrador) {
		this.cobrador = cobrador;
	}
	public List<Cobrador> getCobradores() {
		return cobradores;
	}
	public void setCobradores(List<Cobrador> cobradores) {
		this.cobradores = cobradores;
	}		
}