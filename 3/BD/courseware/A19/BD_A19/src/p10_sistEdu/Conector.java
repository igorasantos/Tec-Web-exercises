package p10_sistEdu;

import java.sql.Connection; 
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conector {
	public static Connection getConector
	(String server, String db,
	String user, String password)
	{
		Connection connection = null;
        
        String driverName = "com.mysql.cj.jdbc.Driver";        
    	try {
			//carrega o driver
			Class.forName(driverName);    		
    	} catch (ClassNotFoundException e) {
    		e.printStackTrace();    		
    	}
    	    	
    	// String da URL de Conexão
    	String url = "jdbc:mysql://" + server + "/" + db;
    	
    	// realiza a conexão
    	try {
			connection = DriverManager.getConnection(url, user, password);
			// teste
			System.out.println("Conexão ok.");
    	} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("Erro na conexão.");
    	}    	
    	return connection;
	}
	
}