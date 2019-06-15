package p08q3_locadora;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import password.Pass;
//import vids_sistEdu.Conector;
public class Clientes {
	Pass p = new Pass();
    String password = p.getPassword();
    
    public void consultar() {	    
	    Connection connection = Conector.getConector("localhost", "a20locadora", "root", password);
	    PreparedStatement ps = null;	    
		try {
			ps = (PreparedStatement) connection.prepareStatement(
				"SELECT * FROM clientes"
			);
	    	ResultSet rs = null;
		    rs = ps.executeQuery();
		    System.out.println("----------");
		    System.out.println("ID - NOME - SALÁRIO");
			while (rs.next()){
				System.out.println(
					rs.getInt("cli_codigo")+" - "+
					rs.getString("cli_nome")+" - "+
					rs.getInt("cli_salario")
				);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// p08q3a
    public void removerTodos(){
		Connection connection = Conector.getConector("localhost", "a20locadora", "root", password);		
		PreparedStatement ps = null;
		try {
	    	ps = (PreparedStatement) connection.prepareStatement(
	    		"DELETE FROM clientes"
	    	);    
	    	int updateCount = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// p08q3b
	public void spListaResumida(){		
		String query = "{CALL sp_cl_dados_resumidos()}";
		ResultSet rs = null;		
		CallableStatement cs = null;
		Connection connection = Conector.getConector("localhost", "a20locadora", "root", password);
		try {
			cs = (CallableStatement) connection.prepareCall(query);
			rs = cs.executeQuery();
			System.out.println("----------");
		    System.out.println("NOME - CPF - SEXO - PROFISSÃO");
			while (rs.next()){
				System.out.println(
					rs.getString("Nome")+" - "+
					rs.getString("CPF")+" - "+
					rs.getString("Sexo")+" - "+
					rs.getString("Profissão")
				);
			}
			rs.close();			
		} catch (SQLException e) {
		   e.printStackTrace();
		}
	}
}