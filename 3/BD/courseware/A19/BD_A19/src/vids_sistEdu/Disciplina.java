package vids_sistEdu;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import password.Pass;

public class Disciplina {
	public Disciplina() {
	}
	public void listarDisciplinas() {
		Statement s = null;		
		Pass p = new Pass();
    	String password = p.getPassword();		
		Connection connection = ConexaoBD.conecta("localhost", "a19sistEdu", "root", password);
		try {
			s = (Statement) connection.createStatement();			
		
			ResultSet r = null;
			r = s.executeQuery("SELECT * FROM disciplinas");
			System.out.println("**************");
			System.out.println("# - Nome");
			System.out.println("--------------");			
			while (r.next()) {
				System.out.println(r.getInt("dis_cod")+" - "+r.getString("dis_nome"));
			}
			r.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
// table: disciplinas
// bd: a19sistEdu