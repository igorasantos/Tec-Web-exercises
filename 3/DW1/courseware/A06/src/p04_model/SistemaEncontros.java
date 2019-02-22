package p04_model;
import java.util.ArrayList;
import java.util.List;
public class SistemaEncontros {
	private List <p03_model.Encontro> encontros = new ArrayList<p03_model.Encontro>();
	public void adicionar(p03_model.Encontro e) {
        encontros.add(e);
	}
	public List<p03_model.Encontro> listarEncontros() {
        return encontros;
	}
	public void remover(p03_model.Encontro e) {
        encontros.remove(e);
	}
	public List<p03_model.Encontro> consultaEncontroComUmaPessoa(String pessoa){
		List <p03_model.Encontro> listResult = new ArrayList<p03_model.Encontro>();
		for (p03_model.Encontro enc: encontros) {
			if(enc.getNomePessoa() == pessoa) {
				listResult.add(enc);
			}
		}				
		return listResult;
	}
}
