package p02e03_locadora;
import java.sql.Connection;
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
		Statement s = null;		
		try {
			s = (Statement) connection.createStatement();			
	    	int updateCount = s.executeUpdate(
	    		"INSERT INTO clientes " +
	    		"(cli_codigo, cli_salario, cli_nome, cli_cpf, cli_profissao,cli_sexo) "+
				"VALUES "+
	    		"(9, 6000 , 'Nelio', '012345678-20', 'Professor', 'M');"
	    	);					
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// p03q1
	public void atualizar(){		
		Connection connection = Conector.getConector("localhost", "a20locadora", "root", password);		
		Statement s = null;
		try {
	    	s = (Statement) connection.createStatement();		    
	    	int updateCount = s.executeUpdate(
	    		"UPDATE clientes " +
	    		"SET cli_salario = 600 "+
				"WHERE cli_codigo = 9;"
	    	);		
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// p03q2
	public void remover(){
		Connection connection = Conector.getConector("localhost", "a20locadora", "root", password);		
		Statement s = null;
		try {
	    	s = (Statement) connection.createStatement();		    
	    	int updateCount = s.executeUpdate(
	    		"DELETE FROM clientes " +
				"WHERE cli_codigo = 9;"
	    	);		
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}