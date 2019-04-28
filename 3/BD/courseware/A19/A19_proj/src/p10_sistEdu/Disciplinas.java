package p10_sistEdu;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import password.Pass;
public class Disciplinas {
	public void listarDisciplinaPorCodigo(String cod) {
		Statement s = null;
		Pass p = new Pass();
    	String password = p.getPassword();
		Connection connection = Conector.getConector("localhost", "a19sistEdu", "root", password);
		try {
			s = (Statement) connection.createStatement();	
			ResultSet r = null;
			r = s.executeQuery("SELECT * FROM disciplinas WHERE dis_cod = "+cod);
			System.out.println("**************");
			System.out.println("ID - Nome");
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