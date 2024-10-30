/**
 *
 * @author migue
 */

public class Prolog {
    // Función principal
    public static void main(String[] args) {
        int[][] matrix = {
            {0, 0, 0, 0, 0, 0},
            {0, 0, 0, 0, 1, 1},
            {0, 1, 1, 0, 1, 1},
            {0, 1, 1, 0, 1, 1},
            {0, 0, 0, 0, 0, 0},
            {0, 1, 1, 1, 0, 0},
            {0, 0, 0, 1, 0, 0}
        };

        int numberOfRegions = countRegions(matrix);
        System.out.println("Número de regiones marcadas: " + numberOfRegions);
    }

    // Función para contar las regiones marcadas
    public static int countRegions(int[][] matrix) {
        if (matrix == null || matrix.length == 0) return 0;
        
        int rows = matrix.length;
        int cols = matrix[0].length;
        boolean[][] visited = new boolean[rows][cols];
        int regionCount = 0;

        // Recorrer cada celda de la matriz
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                // Si encontramos una region marcada no visitada, iniciamos una nueva región
                if (matrix[i][j] == 1 && !visited[i][j]) {
                    dfs(matrix, visited, i, j);
                    regionCount++;
                }
            }
        }
        return regionCount;
    }

    // Función para hacer la búsqueda en profundidad (DFS) para marcar una región
    private static void dfs(int[][] matrix, boolean[][] visited, int x, int y) {
        // Verificar los límites de la matriz
        if (x < 0 || y < 0 || x >= matrix.length || y >= matrix[0].length) return;

        // Si la celda ya está visitada o esta vacía, detener la búsqueda
        if (visited[x][y] || matrix[x][y] == 0) return;

        // Marcar la celda como visitada
        visited[x][y] = true;

        // Buscar en las 4 direcciones (arriba, abajo, izquierda, derecha)
        dfs(matrix, visited, x + 1, y); // Abajo
        dfs(matrix, visited, x - 1, y); // Arriba
        dfs(matrix, visited, x, y + 1); // Derecha
        dfs(matrix, visited, x, y - 1); // Izquierda
    }
}