package p04_locadora;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import password.Pass;
public class Clientes {
	Pass p = new Pass();
    String password = p.getPassword();
    
	public void consultar() {	    
	    Connection connection = Conector.getConector("localhost", "a20locadora", "root", password);
	    Statement s = null;	    
		try {
			s = (Statement) connection.createStatement();
	    	ResultSet r = null;
		    r = s.executeQuery("SELECT * FROM clientes");
		    System.out.println("----------");
		    System.out.println("ID - NOME - SALÁRIO");
			while (r.next()){
				System.out.println(
					r.getInt("cli_codigo")+" - "+
					r.getString("cli_nome")+" - "+
					r.getInt("cli_salario")
				);
			}
			r.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void inserir(){
		Connection connection = Conector.getConector("localhost", "a20locadora", "root", password);		
		PreparedStatement ps = null;		
		try {
			ps = (PreparedStatement) connection.prepareStatement(
				"INSERT INTO clientes " +
	    		"(cli_codigo, cli_salario, cli_nome, cli_cpf, cli_profissao,cli_sexo) "+
				"VALUES "+
				"(?, ?, ?, ?, ?, ?);"
	    	);
			ps.setInt(1, 11);
			ps.setInt(2, 12000);
			ps.setString(3, "Ricardo");
			ps.setString(4, "030585484-20");
			ps.setString(5, "Escultor");			
			ps.setString(6, "M");
			int updateCount = ps.executeUpdate();					
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// p03q1
	public void atualizar(){		
		Connection connection = Conector.getConector("localhost", "a20locadora", "root", password);		
		PreparedStatement ps = null;
		try {
	    	ps = (PreparedStatement) connection.prepareStatement(    	
	    		"UPDATE clientes " +
	    		"SET cli_salario = ? "+
				"WHERE cli_codigo = ?;"
	    	);
	    	ps.setInt(1, 1400);
	    	ps.setInt(2, 11);
	    	int updateCount = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// p03q2
	public void remover(){
		Connection connection = Conector.getConector("localhost", "a20locadora", "root", password);		
		PreparedStatement ps = null;
		try {
	    	ps = (PreparedStatement) connection.prepareStatement(
	    		"DELETE FROM clientes " +
				"WHERE cli_codigo = ?;"
	    	);
	    	ps.setInt(1, 11);	    
	    	int updateCount = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}