CC = gcc
CFLAGS = -O3

.PHONY: all clean c go java javascript python rust

all: c go java javascript python rust

c:
  $(CC) $(CFLAGS) -o c/matrix_multiply c/matrix_multiply.c

go:
  @echo "Go program ready"

java:
  javac java/MatrixMultiplication.java

javascript:
  @echo "JavaScript program ready"

python:
  @echo "Python program ready"

rust:
  cd rust && cargo build --release

clean:
  rm -f c/matrix_multiply
  rm -f java/*.class
  rm -rf rust/target
  @echo "Clean complete"
