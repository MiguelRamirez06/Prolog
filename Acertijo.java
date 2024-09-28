public class Acertijo {

    // Definir las constantes para los lados
    private static final String INICIO = "Inicio";
    private static final String OTRO_LADO = "Otro lado";

    // Método principal
    public static void main(String[] args) {
        System.out.println("Solución del acertijo del pastor:");
        resolverAcertijo(INICIO, INICIO, INICIO, INICIO, "");
    }

    // Método recursivo para resolver el acertijo
    public static void resolverAcertijo(String pastor, String lobo, String oveja, String lechuga, String paso) {
        // Caso base: si todos están al otro lado
        if (lobo.equals(OTRO_LADO) && oveja.equals(OTRO_LADO) && lechuga.equals(OTRO_LADO) && pastor.equals(OTRO_LADO)) {
            System.out.println(paso + " ¡Acertijo resuelto!");
            return;
        }

        // Movimiento del pastor con la oveja
        if (pastor.equals(oveja) && esValidoMover(cambiarLado(pastor), lobo, cambiarLado(oveja), lechuga)) {
            resolverAcertijo(cambiarLado(pastor), lobo, cambiarLado(oveja), lechuga, paso + " -> Pastor cruza con Oveja\n");
        }

        // Movimiento del pastor con el lobo
        if (pastor.equals(lobo) && esValidoMover(cambiarLado(pastor), cambiarLado(lobo), oveja, lechuga)) {
            resolverAcertijo(cambiarLado(pastor), cambiarLado(lobo), oveja, lechuga, paso + " -> Pastor cruza con Lobo\n");
        }

        // Movimiento del pastor con la lechuga
        if (pastor.equals(lechuga) && esValidoMover(cambiarLado(pastor), lobo, oveja, cambiarLado(lechuga))) {
            resolverAcertijo(cambiarLado(pastor), lobo, oveja, cambiarLado(lechuga), paso + " -> Pastor cruza con Lechuga\n");
        }

        // Movimiento del pastor solo
        if (esValidoMover(cambiarLado(pastor), lobo, oveja, lechuga)) {
            resolverAcertijo(cambiarLado(pastor), lobo, oveja, lechuga, paso + " -> Pastor cruza solo\n");
        }
    }

    // Método que valida si el movimiento es seguro
    public static boolean esValidoMover(String pastor, String lobo, String oveja, String lechuga) {
        // La oveja no puede quedarse sola con el lobo si el pastor no está
        if (lobo.equals(oveja) && !pastor.equals(oveja)) {
            return false;
        }
        // La oveja no puede quedarse sola con la lechuga si el pastor no está
        if (oveja.equals(lechuga) && !pastor.equals(oveja)) {
            return false;
        }
        return true;
    }

    // Método para cambiar el lado (de "Inicio" a "Otro lado" y viceversa)
    public static String cambiarLado(String ladoActual) {
        return ladoActual.equals(INICIO) ? OTRO_LADO : INICIO;
    }
}
