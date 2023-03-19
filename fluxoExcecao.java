import java.io.EOFException;
import java.util.*;

import org.junit.rules.ExpectedException;
class Main {
  public static void main(final String[] args) {
    final Scanner terminal = new Scanner(System.in);
		System.out.println("Digite o primeiro parâmetro");
		final int parametroUm = terminal.nextInt();
    System.out.println("");
		System.out.println("Digite o segundo parâmetro");
		final int parametroDois = terminal.nextInt();
    System.out.println("");		
		try {
			//chamando o método contendo a lógica de contagem
			contar(parametroUm, parametroDois);
		
		}catch (EOFException e) {
			//imprimir a mensagem: O segundo parâmetro deve ser maior que o primeiro
      System.out.println("O 2º parâmetro dever ser maior que o 1º parâmetro.");
		}
		
	}

	@Override
public String toString() {
	return "Main []";
}
	static void contar(final int parametroUm, final int parametroDois) throws EOFException{
		//validar se parametroUm é MAIOR que parametroDois e lançar a exceção
    int contagem;
    if (parametroUm < parametroDois){  	
		        contagem = parametroDois - parametroUm;}
    else{
            throw new EOFException();
    }
    for(int k = 0; k <= contagem; k++){
        System.out.println("parametro 1: " + parametroUm);
        System.out.println("parametro 2: " + parametroDois);
		//realizar o for para imprimir os números com base na variável contagem
    }
	}
}