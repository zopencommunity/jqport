all: zotsample
clean:
	rm -f *.o zotsample

check:
	./check.sh

install:
	./install.sh

zotsample: main.o fn.o
	cxx -ozotsample main.o fn.o
