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
			ResultSet rs = null;
			rs = s.executeQuery("SELECT * FROM disciplinas");
			System.out.println("**************");
			System.out.println("# - Nome");
			System.out.println("--------------");			
			while (rs.next()) {
				System.out.println(
					rs.getInt("dis_cod")+" - "+
					rs.getString("dis_nome")
				);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void inserir(int d_codigo, String d_nome, int d_ch){
		Connection connection = Conector.getConector("localhost", "a20sistEdu", "root", password);		
		PreparedStatement ps = null;		
		try {
			ps = (PreparedStatement) connection.prepareStatement(
				"INSERT INTO disciplinas " +
	    		"(dis_cod, dis_nome, dis_ch) "+
				"VALUES "+
				"(?, ?, ?);"
	    	);
			ps.setInt(1, d_codigo);
			ps.setString(2, d_nome);
			ps.setInt(3, d_ch);
			int updateCount = ps.executeUpdate();					
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}