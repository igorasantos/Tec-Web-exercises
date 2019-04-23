package vids_sistVendas;
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
			ResultSet r = null;
			r = s.executeQuery("SELECT * FROM vw_aut_obras_inner_join");
			System.out.println("**************");
			System.out.println("Título da Obra - Nome do Autor");
			System.out.println("--------------");			
			while (r.next()) {
				System.out.println(r.getString("obr_titulo")+" - "+r.getString("aut_nome"));
			}
			r.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
    public void spExcluiAOComParam(int e_cod){
		PreparedStatement s = null;
		Connection connection = Conector.getConector("localhost", "a20vids", "root", password);
		try {
			s = (PreparedStatement) connection.prepareCall("{CALL sp_exclui_ao(?);}");
			s.setInt(1, e_cod);
			s.executeQuery();
		} catch (SQLException e) {
		   e.printStackTrace();
		}
	}
}