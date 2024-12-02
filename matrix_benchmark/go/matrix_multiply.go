package main

import "fmt"

const N = 1000

func matrixMultiply(a [N][N]int, b [N][N]int, c *[N][N]int) {
    for i := 0; i < N; i++ {
        for j := 0; j < N; j++ {
            c[i][j] = 0
            for k := 0; k < N; k++ {
                c[i][j] += a[i][k] * b[k][j]
            }
        }
    }
}

func main() {
    var a, b [N][N]int
    var c [N][N]int

    // Initialize matrices
    for i := 0; i < N; i++ {
        for j := 0; j < N; j++ {
            a[i][j] = i + j
            b[i][j] = i - j
        }
    }

    matrixMultiply(a, b, &c)
    fmt.Println(c[0][0])
}