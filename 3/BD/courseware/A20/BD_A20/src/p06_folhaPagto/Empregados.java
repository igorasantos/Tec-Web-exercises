package p06_folhaPagto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import password.Pass;
public class Empregados {
	Pass p = new Pass();
    String password = p.getPassword();	
	public void invocaSPComParam(int e_cod){
		PreparedStatement s = null;
		Connection connection = Conector.getConector("localhost", "a20folhaPagto", "root", password);
		try {
			s = (PreparedStatement) connection.prepareCall("{CALL sp_consulta_remunera_empreg(?);}");
			s.setInt(1, e_cod);
			s.executeQuery();
		} catch (SQLException e) {
		   e.printStackTrace();
		}
	}
}