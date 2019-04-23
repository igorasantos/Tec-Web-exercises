package p08q3_locadora;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class Conector {
	public static Connection getConector (String server, String db,	String user, String password) {
		Connection connection = null;        
        String driverName = "com.mysql.cj.jdbc.Driver";        
    	try {
			Class.forName(driverName);    		
    	} catch (ClassNotFoundException e) {
    		e.printStackTrace();    		
    	}
    	String url = "jdbc:mysql://" + server + "/" + db;
    	try {
			connection = DriverManager.getConnection(url, user, password);
			System.out.println("Conexão ok.");
    	} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("Erro na conexão.");
    	}    	
    	return connection;
	}	
}