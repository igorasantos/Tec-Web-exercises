package p10_sistEdu;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import password.Pass;
public class Alunos {
	public void listarAlunos() {
		Statement s = null;
		Pass p = new Pass();
	    String password = p.getPassword();
		Connection connection = Conector.getConector("localhost", "a19sistEdu", "root", password);
		try {
			s = (Statement) connection.createStatement();			
			ResultSet r = null;
			r = s.executeQuery("SELECT * FROM alunos");
			System.out.println("**************");
			System.out.println("ID - Nome");
			System.out.println("--------------");			
			while (r.next()) {
				System.out.println(r.getInt("aluno_cod")+" - "+r.getString("aluno_nome"));
			}
			r.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}