GCC    = gcc
FLAGS  = -lm
EXE    = des
OBJ    = $(EXE).o

default: $(EXE)

$(EXE): $(EXE).c
	$(GCC) $(EXE).c -o $(EXE) $(FLAGS)

clean:
	rm -rf *.o $(EXE)
