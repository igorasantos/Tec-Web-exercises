package javaClass;

public class Contador {
	private static int contagem;
	public static void novoAcesso() {
		contagem++;
	}
	public static int getQuantidadeAcessos() {
		return contagem;
	}
}
