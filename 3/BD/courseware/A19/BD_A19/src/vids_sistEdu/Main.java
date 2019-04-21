package vids_sistEdu;
//import password.Pass;

public class Main {
	/* Test 1
	public static void main (String args[]) {
		Pass p = new Pass();
	    String password = p.getPassword();
		ConexaoBD.conecta("localhost", "a19sistEdu", "root", password);
	}
	*/
	/* Test 2 (wrong password)
	public static void main (String args[]) {
		ConexaoBD.conecta("localhost", "a19sistEdu", "root", "111");
	}
	*/
	// Test 3
	public static void main (String args[]) {
		Disciplina d = new Disciplina();
		// o próprio método listarDisciplinas faz a conexão com o BD 
		d.listarDisciplinas();		
	}	
}