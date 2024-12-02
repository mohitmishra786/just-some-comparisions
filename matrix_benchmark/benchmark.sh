#!/bin/bash

# Debug mode
set -x
set -e

# Directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "Script directory: $SCRIPT_DIR"

# Function to run benchmarks
run_benchmark() {
    local lang="\$1"
    local iterations=5

    echo "Running benchmark for ${lang}..."

    case "${lang}" in
        "c")
            executable="$SCRIPT_DIR/c/matrix_multiply"
            if [ ! -f "$executable" ]; then
                echo "Compiling C program..."
                gcc -O3 "$SCRIPT_DIR/c/matrix_multiply.c" -o "$executable"
            fi
            for i in $(seq 1 $iterations); do
                echo "Run $i:"
                time "$executable"
            done
            ;;

        "go")
            echo "Running Go program..."
            for i in $(seq 1 $iterations); do
                echo "Run $i:"
                time go run "$SCRIPT_DIR/go/matrix_multiply.go"
            done
            ;;

        "java")
            echo "Running Java program..."
            if [ ! -f "$SCRIPT_DIR/java/MatrixMultiplication.class" ]; then
                echo "Compiling Java program..."
                javac "$SCRIPT_DIR/java/MatrixMultiplication.java"
            fi
            for i in $(seq 1 $iterations); do
                echo "Run $i:"
                time java -cp "$SCRIPT_DIR/java" MatrixMultiplication
            done
            ;;

        "javascript")
            echo "Running JavaScript program..."
            for i in $(seq 1 $iterations); do
                echo "Run $i:"
                time node "$SCRIPT_DIR/javascript/matrix_multiply.js"
            done
            ;;

        "python")
            echo "Running Python program..."
            for i in $(seq 1 $iterations); do
                echo "Run $i:"
                time python3 "$SCRIPT_DIR/python/matrix_multiply.py"
            done
            ;;

        "rust")
            echo "Running Rust program..."
            if [ ! -f "$SCRIPT_DIR/rust/target/release/matrix_multiply" ]; then
                echo "Building Rust program..."
                (cd "$SCRIPT_DIR/rust" && cargo build --release)
            fi
            for i in $(seq 1 $iterations); do
                echo "Run $i:"
                time "$SCRIPT_DIR/rust/target/release/matrix_multiply"
            done
            ;;

        *)
            echo "Unsupported language: ${lang}"
            echo "Supported languages: c, go, java, javascript, python, rust"
            exit 1
            ;;
    esac
}

# Main execution
if [ "$#" -eq 0 ]; then
    echo "Running benchmarks for all languages..."
    for lang in c go java javascript python rust; do
        run_benchmark "${lang}"
        echo "----------------------------------------"
    done
else
    for lang in "$@"; do
        run_benchmark "${lang}"
        echo "----------------------------------------"
    done
fi