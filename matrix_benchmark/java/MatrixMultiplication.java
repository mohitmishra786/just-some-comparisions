public class MatrixMultiplication {
    static final int N = 1000;

    public static void matrixMultiply(int[][] a, int[][] b, int[][] c) {
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < N; j++) {
                c[i][j] = 0;
                for (int k = 0; k < N; k++) {
                    c[i][j] += a[i][k] * b[k][j];
                }
            }
        }
    }

    public static void main(String[] args) {
        int[][] a = new int[N][N];
        int[][] b = new int[N][N];
        int[][] c = new int[N][N];

        // Initialize matrices
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < N; j++) {
                a[i][j] = i + j;
                b[i][j] = i - j;
            }
        }

        matrixMultiply(a, b, c);
        System.out.println(c[0][0]);
    }
}