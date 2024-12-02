const N = 1000;

function matrixMultiply(a, b, c) {
    for (let i = 0; i < N; i++) {
        for (let j = 0; j < N; j++) {
            c[i][j] = 0;
            for (let k = 0; k < N; k++) {
                c[i][j] += a[i][k] * b[k][j];
            }
        }
    }
}

function main() {
    const a = Array(N).fill().map(() => Array(N).fill(0));
    const b = Array(N).fill().map(() => Array(N).fill(0));
    const c = Array(N).fill().map(() => Array(N).fill(0));

    // Initialize matrices
    for (let i = 0; i < N; i++) {
        for (let j = 0; j < N; j++) {
            a[i][j] = i + j;
            b[i][j] = i - j;
        }
    }

    matrixMultiply(a, b, c);
    console.log(c[0][0]);
}

main();