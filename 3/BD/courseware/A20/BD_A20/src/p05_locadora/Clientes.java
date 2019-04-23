package p05_locadora;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;

import password.Pass;
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
	// p05q3
	public void consultarComParam(String q) {	    
	    Connection connection = Conector.getConector("localhost", "a20locadora", "root", password);
	    PreparedStatement s = null;	    
		try {
			s = (PreparedStatement) connection.prepareStatement(
				"SELECT ? FROM clientes"
			);
			s.setString(1, q);
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
	public void inserir(){
		Connection connection = Conector.getConector("localhost", "a20locadora", "root", password);		
		PreparedStatement s = null;		
		try {
			s = (PreparedStatement) connection.prepareStatement(
				"INSERT INTO clientes" +
	    		"(cli_codigo, cli_salario, cli_nome, cli_cpf, cli_profissao,cli_sexo)"+
				"VALUES"+
				"(?, ?, ?, ?, ?, ?);"
	    	);
			s.setInt(1, 11);
			s.setInt(2, 12000);
			s.setString(3, "Ricardo");
			s.setString(4, "030585484-20");
			
			Calendar d1 = Calendar.getInstance();
			d1.set(1970,5,5);
			s.setDate(5, (Date) d1.getTime());
			
			s.setString(6, "M");
			int updateCount = s.executeUpdate();
					
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// p03q1
	public void atualizar(){		
		Connection connection = Conector.getConector("localhost", "a20locadora", "root", password);		
		PreparedStatement s = null;
		try {
	    	s = (PreparedStatement) connection.prepareStatement(    	
	    		"UPDATE clientes" +
	    		"SET cli_salario = ?"+
				"WHERE cli_codigo = ?;"
	    	);
	    	s.setInt(1, 1400);
	    	s.setInt(2, 11);
	    	int updateCount = s.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// p05q1
	public void atualizarComParam(int c_sal, int cl_cod){		
		Connection connection = Conector.getConector("localhost", "a20locadora", "root", password);		
		PreparedStatement s = null;
		try {
	    	s = (PreparedStatement) connection.prepareStatement(    	
	    		"UPDATE clientes" +
	    		"SET cli_salario = ?"+
				"WHERE cli_codigo = ?;"
	    	);
	    	s.setInt(1, c_sal);
	    	s.setInt(2, cl_cod);
	    	int updateCount = s.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// p03q2
	public void remover(){
		Connection connection = Conector.getConector("localhost", "a20locadora", "root", password);		
		PreparedStatement s = null;
		try {
	    	s = (PreparedStatement) connection.prepareStatement(
	    		"DELETE FROM clientes" +
				"WHERE cli_codigo = ?;"
	    	);
	    	s.setInt(1, 11);	    
	    	int updateCount = s.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// p05q2
	public void removerComParam(int cl_cod){
		Connection connection = Conector.getConector("localhost", "a20locadora", "root", password);		
		PreparedStatement s = null;
		try {
	    	s = (PreparedStatement) connection.prepareStatement(
	    		"DELETE FROM clientes" +
				"WHERE cli_codigo = ?;"
	    	);
	    	s.setInt(1, cl_cod);	    
	    	int updateCount = s.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}