package vids_sistEdu;
public class Main {
	public static void main (String args[]) {
		Disciplina d = new Disciplina();
		d.listarDisciplinas();	
		
		d.inserir(4, "Filosofia", 90);
		d.listarDisciplinas();
	}	
}