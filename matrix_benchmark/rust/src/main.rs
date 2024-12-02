const N: usize = 1000;

fn matrix_multiply(a: &[[i32; N]; N], b: &[[i32; N]; N], c: &mut [[i32; N]; N]) {
    for i in 0..N {
        for j in 0..N {
            c[i][j] = 0;
            for k in 0..N {
                c[i][j] += a[i][k] * b[k][j];
            }
        }
    }
}

fn main() {
    let mut a = [[0; N]; N];
    let mut b = [[0; N]; N];
    let mut c = [[0; N]; N];

    // Initialize matrices
    for i in 0..N {
        for j in 0..N {
            a[i][j] = (i + j) as i32;
            b[i][j] = (i - j) as i32;
        }
    }

    matrix_multiply(&a, &b, &mut c);
    println!("{}", c[0][0]);
}