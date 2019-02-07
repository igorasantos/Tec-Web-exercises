package javaClasses;
public class P12q4_FatorialRecurs {	
	private int numero;
	private int result;	
//	public P12q4_FatorialRecurs(int num) {
//		super();
//		this.numero = num;
//	}	
	public void setNumero(int numero) {
		this.numero = numero;
	}	
	public int getResult() {
		this.result = fatorial(this.numero);
		return result;
	}
	public int fatorial(int n) {
        int fat;
        if (n < 0) {
            fat = -1;
        } else if (n == 0) {
            fat = 1; //caso base
        } else {
            fat = fatorial(n - 1) * n; //recursão
        }
        return fat;
    }	        
}