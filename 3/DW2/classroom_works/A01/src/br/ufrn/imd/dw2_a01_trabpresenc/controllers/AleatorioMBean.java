package br.ufrn.imd.dw2_a01_trabpresenc.controllers;
import java.util.Random;

import javax.faces.bean.ManagedBean;
@ManagedBean
public class AleatorioMBean {
	public int getAleatorio() {
		Random sorteador = new Random();
		return sorteador.nextInt(7);
	}
}