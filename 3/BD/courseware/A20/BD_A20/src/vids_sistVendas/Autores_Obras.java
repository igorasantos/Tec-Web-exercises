package vids_sistVendas;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import password.Pass;
import vids_sistEdu.Conector;
public class Autores_Obras {
	Pass p = new Pass();
    String password = p.getPassword();
    public void listarAutoresObras() {
		Statement s = null;		
		Connection connection = Conector.getConector("localhost", "a20vids", "root", password);
		try {
			s = (Statement) connection.createStatement();		
			ResultSet rs = null;
			rs = s.executeQuery("SELECT * FROM vw_aut_obras_inner_join");
			System.out.println("**************");
			System.out.println("Título da Obra - Nome do Autor");
			System.out.println("--------------");			
			while (rs.next()) {
				System.out.println(
					rs.getString("obr_titulo")+" - "+
					rs.getString("aut_nome")
				);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
//    public void spExcluiAOComParam(int e_cod)
//		try {
//		} catch (SQLException e) {
//		   e.printStackTrace();
//		}
//	}
    public void spExcluiAOComParam(int e_cod){		
		String query = "{CALL sp_exclui_ao(?)}";
		CallableStatement cs = null;
		Connection connection = Conector.getConector("localhost", "a20vids", "root", password);
		try {
			cs = (CallableStatement) connection.prepareCall(query);
			cs.setInt(1, e_cod);
			cs.executeQuery();
			cs.close();			
		} catch (SQLException e) {
		   e.printStackTrace();
		}
	}
}