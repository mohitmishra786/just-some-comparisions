import numpy as np

N = 1000

def matrix_multiply():
    A = np.random.randint(0, 100, size=(N, N))
    B = np.random.randint(0, 100, size=(N, N))
    C = np.dot(A, B)
    print(C[0][0])

if __name__ == "__main__":
    matrix_multiply()