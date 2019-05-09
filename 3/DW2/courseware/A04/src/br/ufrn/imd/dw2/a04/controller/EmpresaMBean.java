package br.ufrn.imd.dw2.a04.controller;

import java.util.ArrayList;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

import br.ufrn.imd.dw2.a04.model.Empresa;

@ManagedBean
@SessionScoped
public class EmpresaMBean {
	private Empresa empresa;    
    private List<Empresa> empresas;
	// construtor
	public EmpresaMBean() {
		empresa = new Empresa();
        empresas = new ArrayList<Empresa>();
	}
	// navegação
	public String entrarCadastro() {
		return "/form_empresa.jsf";
	}
	// navegação
	public String voltar() {
		return "/index.jsf";
	}
	// navegação: listar (se fosse necessária)
	// operação
	public String cadastrar() {
		empresas.add(empresa);
        empresa = new Empresa();
        FacesMessage msg = new FacesMessage("Empresa cadastrada com sucesso!");
        msg.setSeverity(FacesMessage.SEVERITY_INFO);
        FacesContext.getCurrentInstance().addMessage("", msg);
        return "/form_empresa.jsf";
	}
	// getters and setters
	public Empresa getEmpresa() {
		return empresa;
	}
	public void setEmpresa(Empresa empresa) {
		this.empresa = empresa;
	}
	public List<Empresa> getEmpresas() {
		return empresas;
	}
	public void setEmpresas(List<Empresa> empresas) {
		this.empresas = empresas;
	}
		
}
