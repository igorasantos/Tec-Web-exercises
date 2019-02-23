package sys;
import java.util.ArrayList;
import java.util.List;
public class SistemaEncontros {
	private List <Encontro> encontros = new ArrayList<Encontro>();
	public void adicionar(Encontro e) {
        encontros.add(e);
	}
	public List<Encontro> listarEncontros() {
        return encontros;
	}
	public void remover(Encontro e) {
        encontros.remove(e);
	}
	public void remover(int i) {
        encontros.remove(i);
        int j = 0;
        for (Encontro e : encontros) {
			e.setId(j++);			
        }
    }
	public List<Encontro> consultaEncontroComUmaPessoa(String pessoa){
		List <Encontro> listResult = new ArrayList<Encontro>();
		for (Encontro enc: encontros) {
			if(enc.getNomePessoa() == pessoa) {
				listResult.add(enc);
			}
		}				
		return listResult;
	}	
}
