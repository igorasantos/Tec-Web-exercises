package txt_locadora;

import java.sql.Connection; 
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import password.Pass;

public class ConexaoMySQL {
	//public static String status = "Não conectou...";
	public ConexaoMySQL() {
	}
	public static Connection getConexaoMySQL() {
		Connection connection = null;
        
        String driverName = "com.mysql.cj.jdbc.Driver";        
    	try {
			//carrega o driver
			//sobre isso: https://www.guj.com.br/t/jdbc-class-forname-pq/40408/3
			Class.forName(driverName);
    		
    	} catch (ClassNotFoundException e) {
    		e.printStackTrace();    		
    	}
    	
    	// Endereço servidor BD
    	String serverName = "localhost";
    	
    	// Nome do banco de dados escolhido para o teste
    	String mydatabase = "a19locadora";
    	
    	// String da URL de Conexão
    	String url = "jdbc:mysql://" + serverName + "/" + mydatabase;
    	
    	// usuário do DB para conexão
    	String username = "root"; 
    	
    	// Senha do usuário indicado
    	Pass p = new Pass();
    	String password = p.getPassword(); 

    	// realiza a conexão
    	try {
			connection = DriverManager.getConnection(url, username, password);
			// teste
			System.out.println("Conexão ok.");
    	} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("Erro na conexão.");
    	}
    	
    	return connection;
	}
	public void consultar(){
		Statement s = null;
		Connection connection = ConexaoMySQL.getConexaoMySQL();
		
	    try {
	    	// instanciação de objeto da classe Statement - executará instruções SQL ao BD
			// sobre isso: https://www.devmedia.com.br/aprendendo-java-com-jdbc/29116	    
	    	s = (Statement) connection.createStatement();
	    	
		    // objeto de resultado (com estruturas próprias pra isso)
		    ResultSet r = null;
		    
		    // execução da instrução SQL
			r = s.executeQuery("SELECT * FROM clientes");
			
			// leitura do retorno da instrução SQL
			System.out.println("ID NOME");
			while (r.next()){
				System.out.println(r.getInt("cli_codigo") + "  " + r.getString("cli_nome"));
			}
			
			// fechamento da instância da classe ResultSet (isso sempre deve ser feito)		
			r.close();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/* Test 1
	public static void main (String args[]) {
		ConexaoMySQL.getConexaoMySQL();
	}
	*/
	// Test 2
	public static void main (String args[]) {
		ConexaoMySQL cmysql = new ConexaoMySQL();
		cmysql.consultar();
	}
}