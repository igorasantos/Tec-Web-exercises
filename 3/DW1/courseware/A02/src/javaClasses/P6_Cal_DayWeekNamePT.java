package javaClasses;
import java.util.Calendar;
public class P6_Cal_DayWeekNamePT {
	private String nomeDiaSemana;
	private Calendar agora;
	
	public P6_Cal_DayWeekNamePT() {
		super();
		this.agora = Calendar.getInstance();
		this.nomeDiaSemana = nomeDiaSem(this.agora);
	}
	private String nomeDiaSem(Calendar calend) {
		int numDiaSem = calend.get(Calendar.DAY_OF_WEEK);
		String nomeDia;
		switch (numDiaSem) {
			case 1:
				nomeDia = "Domingo";
				break;
			case 2:
				nomeDia = "Segunda-feira";
				break;
			case 3:
				nomeDia = "Terça-feira";
				break;
			case 4:
				nomeDia = "Quarta-feira";
				break;
			case 5:
				nomeDia = "Quinta-feira";
				break;
			case 6:
				nomeDia = "Sexta-feira";
				break;
			default:
				nomeDia = "Sábado";
		}
		return nomeDia;
	}
	
	public String getNomeDiaSemana() {
		return nomeDiaSemana;
	}
}
