package vids_sistEdu;

import java.sql.Connection; 
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoBD {
	public static Connection conecta
		(String server, String db,
		String user, String password)
	{
		Connection conn = null;
        
        String driverName = "com.mysql.cj.jdbc.Driver";        
    	try {
			Class.forName(driverName);
    		
    	} catch (ClassNotFoundException e) {
    		e.printStackTrace();    		
    	}    	
    	
    	String url = "jdbc:mysql://"+server+"/"+db;
    	
    	try {
			conn = DriverManager.getConnection(url, user, password);
			// teste
			System.out.println("Conexão estabelecida com sucesso.");
    	} catch (SQLException e) {
			System.err.println("Erro na conexão.");
    	}
    	
    	return conn;
	}	
}