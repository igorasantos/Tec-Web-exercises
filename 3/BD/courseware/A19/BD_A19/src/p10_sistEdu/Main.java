package p10_sistEdu;
public class Main {
	public static void main (String args[]) {
		System.out.println("::::::p10q3a::::::");
		Alunos a = new Alunos(); 
		a.listarAlunos();
		
		System.out.println("::::::p10q3b::::::");
		Disciplinas d = new Disciplinas(); 
		d.listarDisciplinaPorCodigo("1");
		d.listarDisciplinaPorCodigo("5");
		d.listarDisciplinaPorCodigo("6");
		d.listarDisciplinaPorCodigo("7");
	}	
}