package p08q3_locadora;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import password.Pass;
import vids_sistEdu.Conector;
public class Clientes {
	Pass p = new Pass();
    String password = p.getPassword();
    
	public void consultar() {	    
	    Connection connection = Conector.getConector("localhost", "a20locadora", "root", password);
	    PreparedStatement s = null;	    
		try {
			s = (PreparedStatement) connection.prepareStatement(
				"SELECT * FROM clientes"
			);
	    	ResultSet r = null;
		    r = s.executeQuery();
			System.out.println("ID NOME");
			while (r.next()){
				System.out.println(r.getInt("cli_codigo") + "  " + r.getString("cli_nome"));
			}
			r.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// p08q3a
	public void removerTodos(){
		Connection connection = Conector.getConector("localhost", "a20locadora", "root", password);		
		PreparedStatement s = null;
		try {
	    	s = (PreparedStatement) connection.prepareStatement(
	    		"DELETE FROM clientes;"
	    	);
	    	int updateCount = s.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// p08q3b
	public void spListResumida(){
		PreparedStatement s = null;
		Connection connection = Conector.getConector("localhost", "a20locadora", "root", password);
		try {
			s = (PreparedStatement) connection.prepareCall("{CALL sp_cl_dados_resumidos();}");
			s.executeQuery();
		} catch (SQLException e) {
		   e.printStackTrace();
		}
	}
}