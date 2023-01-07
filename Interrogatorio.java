import java.util.Scanner;
import java.util.List;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Collections;
import java.util.Iterator;

class Main {
  public static void main(String[] args) {
    List <String> respostas = new ArrayList<>();
    System.out.println("");
    System.out.println("Resposta o seguinte questionário");
    System.out.println("");
    String resposta;
    int contador = 0;
    Scanner scan = new Scanner(System.in);
    System.out.println("Você telefonou para a vítima neste mês? S - Sim ou N - Não");  
    resposta = scan.next();
    respostas.add(resposta);
    System.out.println("");
    System.out.println("Você esteve no local do crime? S - sim ou N - Não");
    resposta = scan.next();
    respostas.add(resposta);
    System.out.println("");
    System.out.println("Você mora perto da vítima? S - sim ou N - não");
    resposta = scan.next();
    respostas.add(resposta);
    System.out.println("");
    System.out.println("Você devia algum dinheiro para a vítima? S - sim ou N - não");
    resposta = scan.next();
    respostas.add(resposta);
    System.out.println("");
    System.out.println("Já trabalhou com a vítima");
    resposta = scan.next();
    respostas.add(resposta);
    System.out.println("");
    System.out.println(respostas);
    Iterator <String> iterator = respostas.iterator();
    while(iterator.hasNext()){
      String next = iterator.next();
      if(next.equals("S")) contador += 1;
    }
    System.out.println("");
    if(contador == 2){
      System.out.println("Pessoa Suspeita!");
    } else if(contador == 3 || contador == 4){
      System.out.println("Pessoa Cúmplice!");
    } else if(contador == 5){
      System.out.println("Pessoa Assassina!");
    } else {
      System.out.println("Pessoa Inocente!");
    }      
  }
}