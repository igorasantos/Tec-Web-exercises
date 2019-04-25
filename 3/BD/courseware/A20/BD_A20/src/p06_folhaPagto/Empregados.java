package p06_folhaPagto;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import password.Pass;
public class Empregados {
	Pass p = new Pass();
    String password = p.getPassword();	
	public void invocaSPComParam(int e_cod){		
		String query = "{CALL sp_consulta_remunera_empreg(?)}";
		ResultSet rs = null;		
		CallableStatement cs = null;
		Connection connection = Conector.getConector("localhost", "a20folhaPagto", "root", password);
		try {
			cs = (CallableStatement) connection.prepareCall(query);
			cs.setInt(1, e_cod);
			rs = cs.executeQuery();
			System.out.println("----------");
		    System.out.println("NOME - SAL. BRUTO - SAL. LÍQUIDO");
			while (rs.next()){
				System.out.println(
					rs.getString("empreg_nome")+" - "+
					rs.getFloat("salario_bruto")+" - "+
					rs.getFloat("salario_liquido")
				);
			}
			rs.close();			
		} catch (SQLException e) {
		   e.printStackTrace();
		}
	}
}