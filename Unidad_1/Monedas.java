import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Monedas {

    // Método principal para encontrar todas las combinaciones
    public static void encontrarCombinaciones(int cantidad, List<Integer> combinacionActual, int indice) {
        int[] monedas = {1, 5, 10, 20};

        // Caso base: Si la cantidad llega a cero, hemos encontrado una combinación válida
        if (cantidad == 0) {
            System.out.println(combinacionActual);
            return;
        }

        // Si la cantidad es menor a cero, no es una combinación válida, así que retornamos
        if (cantidad < 0) {
            return;
        }

        // Iteramos sobre las monedas, comenzando desde el índice actual para evitar duplicados de combinaciones
        for (int i = indice; i < monedas.length; i++) {
            combinacionActual.add(monedas[i]);
            encontrarCombinaciones(cantidad - monedas[i], combinacionActual, i); // llamada recursiva
            combinacionActual.remove(combinacionActual.size() - 1); // retrocedemos (backtrack)
        }
    }

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.print("Ingrese la cantidad: ");
        int cantidad = scan.nextInt();
        List<Integer> combinacionActual = new ArrayList<>();
        System.out.println("\nCombinaciones para alcanzar " + cantidad + ":");
        encontrarCombinaciones(cantidad, combinacionActual, 0);
    }
}
