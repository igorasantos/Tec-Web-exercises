package javaClass;

public class Contador {
private static int contagem;
	public static void novoAcesso() {
		contagem = contagem + 1;
	}
	public static int getQuantidadeAcessos() {
		return contagem;
	}
}
