import java.util.Stack;
import java.util.Scanner;

/**
 *
 * @author migue
 */

public class Parentesis {

    public static boolean areParenthesesBalanced(String expression) {
        // Si la expresión comienza con un paréntesis de cierre, no está balanceada
        if (expression.length() > 0 && expression.charAt(0) == ')') {
            return false;
        }
        // Función recursiva para procesar la cadena
        return checkParentheses(expression, 0, new Stack<>());
    }

    private static boolean checkParentheses(String expression, int index, Stack<Character> stack) {
        // Caso base: si llegamos al final de la expresión y la pila está vacía, está balanceado
        if (index == expression.length()) {
            return stack.isEmpty();
        }

        char currentChar = expression.charAt(index);

        // Si es un paréntesis de apertura, lo agregamos a la pila
        if (currentChar == '(') {
            stack.push(currentChar);
        }
        // Si es un paréntesis de cierre, verificamos si hay un paréntesis de apertura correspondiente en la pila
        else if (currentChar == ')') {
            if (stack.isEmpty() || stack.peek() != '(') {
                return false; // No está balanceado
            }
            stack.pop(); // Eliminamos el paréntesis de apertura correspondiente
        }

        // Llamada recursiva con el siguiente carácter
        return checkParentheses(expression, index + 1, stack);
    }

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.println("Ingrese la expresion con parentesis: ");
        String expression =  scan.next();
        //String expression = ")()()";
        if (areParenthesesBalanced(expression)) {
            System.out.println("Los parentesis estan correctamente balanceados.");
        } else {
            System.out.println("Los parentesis NO estan correctamente balanceados.");
        }
    }
}