package vids_sistVendas;
public class Main {
	public static void main (String args[]) {
		Autores_Obras ao = new Autores_Obras();
		ao.listarAutoresObras();
		ao.spExcluiAOComParam(20);
		ao.listarAutoresObras();
	}	
}