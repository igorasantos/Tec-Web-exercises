package p05_locadora;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import password.Pass;
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
	// p05q3 - it's not working
//	public void consultarComParam(String q) { //maybe the problem is here...	    
//	    Connection connection = Conector.getConector("localhost", "a20locadora", "root", password);
//	    PreparedStatement ps = null;	    
//		try {
//			ps = (PreparedStatement) connection.prepareStatement(
//				"SELECT ? FROM clientes" // here...
//			);
//			ps.setString(1, q); // and here.
//	    	ResultSet rs = null;
//		    rs = ps.executeQuery();
//		    System.out.println("----------");
//		    System.out.println("ID - NOME - SALÁRIO");
//			while (rs.next()){
//				System.out.println(
//					rs.getInt("cli_codigo")+" - "+
//					rs.getString("cli_nome")+" - "+
//					rs.getInt("cli_salario")
//				);
//			}
//			rs.close();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}
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
			ps.setString(5, "Vendedor");			
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
	// p05q1
	public void atualizarComParam(int c_sal, int cl_cod){		
		Connection connection = Conector.getConector("localhost", "a20locadora", "root", password);		
		PreparedStatement ps = null;
		try {
	    	ps = (PreparedStatement) connection.prepareStatement(    	
	    		"UPDATE clientes " +
	    		"SET cli_salario = ? "+
				"WHERE cli_codigo = ?;"
	    	);
	    	ps.setInt(1, c_sal);
	    	ps.setInt(2, cl_cod);
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
	// p05q2
	public void removerComParam(int cl_cod){
		Connection connection = Conector.getConector("localhost", "a20locadora", "root", password);		
		PreparedStatement ps = null;
		try {
	    	ps = (PreparedStatement) connection.prepareStatement(
	    		"DELETE FROM clientes " +
				"WHERE cli_codigo = ?;"
	    	);
	    	ps.setInt(1, cl_cod);	    
	    	int updateCount = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}