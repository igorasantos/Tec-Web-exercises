package br.ufrn.imd.dw2_a04.controller;
import java.util.ArrayList;
import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

import br.ufrn.imd.dw2_a04.model.Veiculo;
@ManagedBean
@SessionScoped
public class VeiculoMBean {
	private Veiculo veiculo;
	private List<Veiculo> veiculos;
	// construtor
	public VeiculoMBean() {
		veiculo = new Veiculo();
		veiculos = new ArrayList<Veiculo>();
	}
	// navegação
	// indicar qual pagina vai ser apresentada ao entrar n cadastro.
	public String entrarCadastro() {
		return "/form_veiculo.jsf";
	}
	// navegação
	public String voltar() {
		return "/index.jsf";
	}
	// navegação: listar (se fosse necessária)
	// operação
	public String cadastrar() {
		veiculos.add(veiculo); // se fosse armazenado num bd, seria nesse momento
		FacesMessage msg = new FacesMessage("Veiculo cadastrado com sucesso!");
		msg.setSeverity(FacesMessage.SEVERITY_INFO);
		FacesContext.getCurrentInstance().addMessage("", msg);
		return "form_veiculo.jsf"; //pagina q dps d cadastrar, sera apresentada ao user
	}
	// getters and setters
	public Veiculo getVeiculo() {
		return veiculo;
	}
	public List<Veiculo> getVeiculos() {
		return veiculos;
	}	
}
