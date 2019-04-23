package vids_sistEdu;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import password.Pass;
public class Disciplina {
	Pass p = new Pass();
	String password = p.getPassword();
	public void listarDisciplinas() {
		Statement s = null;		
		Connection connection = Conector.getConector("localhost", "a20sistEdu", "root", password);
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
	public void inserir(int d_codigo, String d_nome, int d_ch){
		Connection connection = Conector.getConector("localhost", "a20sistEdu", "root", password);		
		PreparedStatement s = null;		
		try {
			s = (PreparedStatement) connection.prepareStatement(
				"INSERT INTO disciplinas" +
	    		"(dis_cod, dis_nome, dis_ch)"+
				"VALUES"+
				"(?, ?, ?);"
	    	);
			s.setInt(1, d_codigo);
			s.setString(2, d_nome);
			s.setInt(3, d_ch);
			int updateCount = s.executeUpdate();					
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}