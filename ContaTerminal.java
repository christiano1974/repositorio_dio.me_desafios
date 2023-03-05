import java.util.Scanner;
class Main {
  public static void main(String[] args) {

    Scanner leitor = new Scanner(System.in);
    int numero = 12135;
    String agencia;
    String nomeCliente = "Juarez Fernades";
    float saldo = 50000;

    System.out.println("");
    System.out.print("Digite o numero da agencia, por favor: ");
    agencia = leitor.nextLine();
    System.out.println("");
    System.out.println("Olá " + nomeCliente +", obrigado por criar uma conta em nosso banco, sua agencia é " + agencia + ", conta " + numero +" e seu saldo é "+ saldo +" já disponível para saque.");    
  }
}